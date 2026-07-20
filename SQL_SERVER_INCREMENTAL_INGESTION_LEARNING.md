# SQL Server Incremental Ingestion Learning Notes

This is a working learning note for moving read-only Oracle ERP data into SQL
Server in small, reliable batches. It describes a proposed pattern; it is not a
deployment script and must be validated in an approved internal environment.

## The Plain-English Model

Oracle remains the operational source system. SQL Server becomes the analytics
landing and transformation system. An incremental load asks Oracle only for rows
that changed since the last successful load, writes those rows to SQL Server,
then records the new checkpoint.

```text
Oracle table
  -> changed rows only
  -> SQL Server landing batch
  -> SQL Server Bronze table
  -> dbt Silver and Gold models
```

This is not a full daily copy. The source table is loaded independently using a
source-specific key, change column, schedule, and validation rule.

## SQL Server Objects

An *object* is a named building block stored in SQL Server. The proposed pattern
uses these objects:

| Object | Purpose |
|---|---|
| Schema | Namespace that groups objects, for example `etl` or `bronze`. |
| Table | Stores rows, such as `bronze.oracle_apps_wip_move_transactions`. |
| Stored procedure | Named, reusable T-SQL program, such as `etl.usp_LoadOracleDelta`. |
| Index | Data structure that speeds lookups, uniqueness checks, and merges. |
| SQL Server Agent job | Scheduled runner that calls a stored procedure or SSIS package. |

`etl.usp_LoadOracleDelta` means: schema `etl`; `usp_` is the common convention
for a user stored procedure; `LoadOracleDelta` describes the work. It is not a
special built-in SQL Server command.

## Source Registry

A source registry is a SQL Server configuration table. It tells a shared loader
how each Oracle table behaves. It is not the data itself.

```text
apps.wip_move_transactions
  business key: transaction_id
  change column: last_update_date
  lookback: 48 hours
  schedule: every 15 minutes or daily
  destination: bronze.oracle_apps_wip_move_transactions
```

This lets every source have its own contract without creating one giant query.
At first, it is acceptable to write one stored procedure per important source;
generalize into a shared runner only after two or three patterns are proven.

## WIP Move Transactions as the First Pilot

The dbt source model `src_wip_move_transactions_45days.sql` identifies a useful
contract: `transaction_id` is the transaction identifier and `last_update_date`
is a candidate change column. It currently limits reports to 45 transaction
days. Bronze ingestion should use `last_update_date` for change capture, then
apply a 45-day reporting filter later in Silver or Gold. Otherwise, a correction
to an older transaction can be missed.

Before implementation, confirm with the Oracle DBA that the Oracle predicate
uses an appropriate source index and check the plan. Do not wrap the change
column in functions such as `TRUNC(last_update_date)` in the incremental
predicate, because that can prevent efficient index use.

## Minimal Control Tables

```sql
CREATE SCHEMA etl;
GO
CREATE SCHEMA ingest;
GO
CREATE SCHEMA bronze;
GO

CREATE TABLE etl.SourceWatermark (
    SourceName sysname NOT NULL PRIMARY KEY,
    LastSuccessfulWatermark datetime2(0) NOT NULL,
    LastSuccessfulKeyAtWatermark bigint NULL,
    LastLoadRunId bigint NULL,
    UpdatedAt datetime2(0) NOT NULL
        CONSTRAINT DF_SourceWatermark_UpdatedAt DEFAULT SYSUTCDATETIME()
);

CREATE TABLE etl.LoadRun (
    LoadRunId bigint IDENTITY(1,1) NOT NULL PRIMARY KEY,
    SourceName sysname NOT NULL,
    StartedAt datetime2(0) NOT NULL,
    CompletedAt datetime2(0) NULL,
    LowerWatermark datetime2(0) NOT NULL,
    UpperWatermark datetime2(0) NOT NULL,
    RowsExtracted bigint NULL,
    RowsInserted bigint NULL,
    RowsUpdated bigint NULL,
    Status varchar(20) NOT NULL,
    ErrorMessage nvarchar(4000) NULL
);
```

The data types above are examples. Confirm the real Oracle data types and key
range before creating production tables.

## One Incremental Run

For one source, a run follows this sequence:

```text
1. Acquire an exclusive load lock so runs cannot overlap.
2. Read the source's last successful watermark from etl.SourceWatermark.
3. Capture an Oracle upper watermark before reading rows.
4. Set lower watermark = prior success minus a safety lookback.
5. Pull only rows changed between the lower and upper watermarks.
6. Land the batch in ingest.oracle_wip_move_transactions_delta.
7. Validate row count, duplicate key count, and maximum source timestamp.
8. Update existing Bronze rows and insert new Bronze rows.
9. Record success and advance the watermark only after the merge succeeds.
```

The safety lookback deliberately re-reads recent rows. That is how the loader
captures late-arriving updates and same-timestamp rows without missing data.

## Oracle Delta Query Shape

This is Oracle SQL conceptually executed through `OPENQUERY`:

```sql
SELECT
    transaction_id,
    last_update_date,
    creation_date,
    organization_id,
    wip_entity_id,
    transaction_date,
    transaction_quantity,
    transaction_uom
FROM apps.wip_move_transactions
WHERE organization_id = :approved_organization_id
  AND last_update_date > :lower_watermark
  AND last_update_date <= :upper_watermark;
```

`OPENQUERY` does not accept T-SQL variables directly. The SQL Server procedure
therefore constructs the Oracle query string from trusted configuration and the
two timestamps, then executes it. Do not let callers supply arbitrary table
names or SQL text.

```sql
-- Illustrative shape only: quote handling and the approved linked-server name
-- must be reviewed by the DBA.
DECLARE @remote_sql nvarchar(max) = N'
SELECT transaction_id, last_update_date, creation_date,
       organization_id, wip_entity_id, transaction_date,
       transaction_quantity, transaction_uom
FROM apps.wip_move_transactions
WHERE last_update_date > TO_TIMESTAMP(''2026-07-01 00:00:00'', ''YYYY-MM-DD HH24:MI:SS'')
  AND last_update_date <= TO_TIMESTAMP(''2026-07-01 00:15:00'', ''YYYY-MM-DD HH24:MI:SS'')';

DECLARE @sql nvarchar(max) = N'
INSERT INTO ingest.oracle_wip_move_transactions_delta
    (transaction_id, last_update_date, creation_date, organization_id,
     wip_entity_id, transaction_date, transaction_quantity, transaction_uom)
SELECT transaction_id, last_update_date, creation_date, organization_id,
       wip_entity_id, transaction_date, transaction_quantity, transaction_uom
FROM OPENQUERY([ORACLE_EBS_LS], '''
    + REPLACE(@remote_sql, N'''', N'''''') + N''');';

EXEC sys.sp_executesql @sql;
```

## Bronze Table and Upsert Shape

The landing table contains one run's rows. The Bronze table is the persisted
source-shaped record used by later dbt models.

```sql
CREATE TABLE bronze.oracle_apps_wip_move_transactions (
    transaction_id bigint NOT NULL PRIMARY KEY,
    last_update_date datetime2(0) NOT NULL,
    creation_date datetime2(0) NULL,
    organization_id int NOT NULL,
    wip_entity_id bigint NULL,
    transaction_date datetime2(0) NULL,
    transaction_quantity decimal(18, 6) NULL,
    transaction_uom varchar(3) NULL,
    extracted_at datetime2(0) NOT NULL,
    load_run_id bigint NOT NULL
);
GO

-- Update only when the Oracle version is newer.
UPDATE bronze
SET
    last_update_date = delta.last_update_date,
    transaction_quantity = delta.transaction_quantity,
    transaction_uom = delta.transaction_uom,
    extracted_at = SYSUTCDATETIME(),
    load_run_id = @LoadRunId
FROM bronze.oracle_apps_wip_move_transactions AS bronze
JOIN ingest.oracle_wip_move_transactions_delta AS delta
  ON delta.transaction_id = bronze.transaction_id
WHERE delta.last_update_date >= bronze.last_update_date;

-- Add transactions that Bronze has never seen.
INSERT INTO bronze.oracle_apps_wip_move_transactions (
    transaction_id, last_update_date, creation_date, organization_id,
    wip_entity_id, transaction_date, transaction_quantity, transaction_uom,
    extracted_at, load_run_id
)
SELECT
    delta.transaction_id, delta.last_update_date, delta.creation_date,
    delta.organization_id, delta.wip_entity_id, delta.transaction_date,
    delta.transaction_quantity, delta.transaction_uom,
    SYSUTCDATETIME(), @LoadRunId
FROM ingest.oracle_wip_move_transactions_delta AS delta
WHERE NOT EXISTS (
    SELECT 1
    FROM bronze.oracle_apps_wip_move_transactions AS bronze
    WHERE bronze.transaction_id = delta.transaction_id
);
```

This is a current-state Bronze design. If full change history is required, add
an append-only batch-history table rather than overwriting the current row.

## Daily and Fifteen-Minute Runs

The code pattern is the same. Only the schedule, watermark interval, lookback,
and expected latency change.

| Concern | Daily refresh | Fifteen-minute refresh |
|---|---|---|
| Oracle query window | Usually 24 hours plus lookback | Usually 15 minutes plus 60–120 minute lookback |
| Bronze load frequency | Once per day | 96 times per day |
| Reporting promise | Usually next-day data | For example, “typically under 20 minutes after source commit” |
| Main guardrail | Backfill/recovery | No overlapping runs and bounded Oracle workload |

For a 15-minute schedule, Bronze can refresh every 15 minutes while Silver,
Gold, and dashboards refresh hourly until there is a demonstrated need for more
frequent transformations. This avoids unnecessarily rebuilding all reporting
models 96 times per day.

Use a SQL Server application lock in the loader so a slow run blocks the next
run instead of creating two concurrent Oracle extracts. Ask the Oracle DBA to
approve the source predicate and expected concurrency before increasing load
frequency.

## What Incremental Loading Does Not Solve

`LAST_UPDATE_DATE` usually finds inserts and updates. It does not reveal hard
deletes. Choose a delete strategy per source: a source status flag, periodic key
reconciliation, or a complete snapshot comparison. Also validate whether the
source timestamp is reliably populated and indexed before declaring a table safe
for frequent incremental loads.

## Next Learning Steps

1. Define the exact key, change column, and retention need for
   `apps.wip_move_transactions`.
2. Ask for an Oracle explain plan for the incremental predicate.
3. Design the destination table from real Oracle metadata rather than `SELECT *`.
4. Define the first-load backfill window and the daily/15-minute service-level
   expectation.
5. Implement the pilot in an internal non-production SQL Server database.
