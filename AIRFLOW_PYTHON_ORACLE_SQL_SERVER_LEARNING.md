# Airflow and Python: Oracle to SQL Server Learning Notes

This is a working architecture note for a private, approved environment. It
does not create a connection, run an extract, or replace company security
controls. The public dbt reference repository remains static-only.

## Straight Answer

Yes: a Python-based extractor can replace the SQL Server linked-server query
and much of the SSIS complexity. Airflow schedules, observes, retries, and
coordinates the work. SQL Server still needs to be the durable destination, so
it keeps a small number of tables, indexes, and stored procedures.

The recommended boundary is:

```text
Airflow: when and in what order work runs
Python: read Oracle deltas and batch them into SQL Server landing tables
SQL Server: Bronze storage, set-based merge, watermark, load audit, indexes
dbt: Silver and Gold transformations after Bronze succeeds
```

Do not put the entire data model or arbitrary SQL inside an Airflow DAG. A DAG
should describe the workflow, while testable Python modules and SQL scripts
contain the data behavior.

## Is a 32 GB Linux Host Enough?

For a personal learning environment and a small-to-medium, single-host Airflow
deployment, 32 GB RAM is more than adequate. Oracle and SQL Server do the data
processing; Airflow mainly manages metadata, schedules, logs, and task
processes. The important constraints are network access, approved credentials,
disk space for logs and temporary batches, and not overwhelming the Oracle
source.

For a real internal production service, establish an operations owner, backups
for Airflow's metadata database, log retention, monitoring, and an approved
credential store. The official Docker Compose quickstart is suitable for
learning, not automatically a production deployment.

## Preconditions to Prove Before Building

The Linux host must be explicitly approved to reach both systems:

```text
Linux host -- read-only service account --> Oracle ERP
Linux host -- insert/update service account --> analytics SQL Server database
```

Do not use a personal host to bypass corporate network boundaries. If direct
Oracle access from the Linux host cannot be authorized, keep the linked-server
or SSIS extraction within the corporate network instead.

Confirm these items with the database and security teams:

| Area | What to confirm |
|---|---|
| Oracle | Read-only account, network route, service name, allowed schemas, and a usable incremental column such as `last_update_date`. |
| SQL Server | Dedicated analytics database, write account, required schemas, and TLS/authentication method. |
| Source impact | Oracle DBA approval of predicates, indexes, fetch size, run frequency, and concurrent connection limit. |
| Secrets | Credentials live in an approved secret manager or Airflow Connections, never DAG source or Git. |
| Operations | Who owns alerts, failed-load recovery, and retention of task logs and raw batches. |

## Python Component Shape

Place this application in a separate private ingestion repository, not inside
the public dbt project. A maintainable layout could be:

```text
oracle-sqlserver-ingestion/
  dags/wip_incremental.py
  src/ingestion/config.py
  src/ingestion/oracle_extract.py
  src/ingestion/sqlserver_land.py
  src/ingestion/load_control.py
  sql/001_bronze_wip.sql
  sql/002_merge_wip.sql
  tests/
  pyproject.toml
  Dockerfile
```

The reusable Python function should receive a source contract and a bounded
time window. It should not receive free-form SQL from an Airflow variable.

```python
def load_wip_move_transactions(lower_bound, upper_bound, load_run_id):
    # Oracle query uses bind variables; no string-built timestamps.
    # Fetch bounded arrays, for example 5,000 rows at a time.
    # Insert each batch into the SQL Server ingest table.
    # Call one SQL Server stored procedure to validate and merge the batch.
    # Raise an exception on failure so Airflow retries the task.
    pass
```

Use Oracle's `python-oracledb` driver for Oracle access. It supports bind
variables, connection pooling, and streaming batches with `fetchmany()`. For
SQL Server, choose one approved driver and prove it with a small pilot:
`pyodbc` plus Microsoft's ODBC Driver, or Microsoft's newer `mssql-python`
driver. Do not introduce pandas as the mandatory transport layer for a large
table; stream row batches first, then profile.

## Extraction, Transformation, and Optimization Choices

Start with the simplest technique that eliminates a measured bottleneck. The
Oracle source and SQL Server target are more likely to be the limit than Python
CPU on the Linux host.

| Technique | Use it for | Decision in this architecture |
|---|---|---|
| Oracle predicate pushdown | Reduced source reads | Required: select only needed columns and use indexed delta predicates. |
| `fetchmany()` plus batched SQL Server inserts | Reliable medium-volume transport | Required starting pattern. Tune batch size from evidence. |
| SQL Server staging plus T-SQL merge | Upsert, concurrency, and recovery | Required: keep set-based updates near target indexes. |
| PyArrow / Parquet | Replayable large batches or file-oriented backfills | Add later when row-batch transport or audit retention becomes a bottleneck. |
| Polars | Local, in-memory batch reshaping before landing | Optional: use for a measured Python-only transform, not ordinary relational modeling. |
| dbt | Joined, reusable business transformations | Required downstream in Silver and Gold. |
| PySpark | Distributed processing across several workers | Not needed now. Adopt only with a real scale trigger. |

### Polars: Useful but Optional

Polars is a strong choice when a Python task must normalize a batch, perform
type-safe local calculations, or process extracted files. Its lazy API can
reduce unnecessary work through projection and predicate pushdown. Do not use
it merely to copy Oracle rows to SQL Server, and do not duplicate dbt models in
Polars. For the first WIP pilot, the extractor can stream rows directly to the
SQL Server landing table.

Use Polars when the task has a genuine in-Python shaping need, such as
normalizing a vendor file before landing, calculating a source-specific
technical checksum, or processing a replayable Parquet batch. Keep the
resulting transformation documented and tested.

### PySpark: Why It Is Not Needed Yet

PySpark is useful when a distributed compute cluster is available and the job
has sustained large-scale processing: multi-hundred-million-row backfills,
large file joins, many independent partitions, or processing that exceeds one
machine's memory and CPU. It uses JDBC connections to read/write databases and
can process partitions in parallel.

For this first architecture, Spark would run on one 32 GB host and add a JVM,
JDBC driver management, partition tuning, and another execution engine. It
would not make Oracle's indexed delta query or SQL Server's write capacity
faster. Worse, its parallel JDBC partitions can create too many Oracle
connections if misconfigured.

Adopt PySpark only after measurements show that one source extract or backfill
cannot meet its agreed run window with bounded Python batches, and after the
Oracle DBA approves a specific parallel partition strategy. Use it as a
separate backfill or large-file processing tool, not as the default for every
incremental ERP table.

### Other Useful Engineering Libraries

Keep the initial dependency set small. Add libraries for a specific operational
need, rather than building a large Python data stack in advance:

| Library type | Example role |
|---|---|
| Configuration validation | Pydantic validates the source contract before a task runs. |
| SQL connection abstraction | SQLAlchemy can manage connection configuration; retain driver-specific batch paths for performance. |
| Data-quality checks | Pandera or Great Expectations for technical batch checks; dbt tests for warehouse-model checks. |
| Structured logging | JSON logging with `run_id`, source name, row counts, and timings. |
| Retry behavior | Let Airflow own task retries; use driver-level retries only for brief, known transient connections. |

## Daily and Fifteen-Minute Operation

The code does not materially change. The workflow schedule and guardrails do.

| Concern | Daily | Every 15 minutes |
|---|---|---|
| Expected source query | One larger delta | Many small deltas |
| Lookback | Often 24--48 hours | Usually 60--120 minutes |
| Airflow retries | A few, with longer interval | Limited so the next run is not blocked indefinitely |
| Downstream dbt | Usually after each load | Start hourly; increase only when consumers need it |
| Key risk | Long recovery window | Overlap and unnecessary source pressure |

Use an application lock in SQL Server or Airflow's per-DAG concurrency limit so
two WIP loads cannot run at the same time. A 15-minute schedule is a reporting
service-level objective, not a promise of real-time Oracle replication.

## Airflow Is Worth It When

Airflow is a good next step if the process must coordinate Oracle extraction,
SQL Server landing, dbt, Tableau refreshes, quality checks, alerts, and
backfills in one visible graph. It is not useful merely because a stored
procedure needs to run nightly.

Start with one WIP DAG, one source, one Bronze target, and one failure alert.
Promote the pattern only after it has reliable run history, row-count checks,
watermark recovery, and measured Oracle impact.

## Proposed Learning Sequence

1. Build a Linux-only Airflow sandbox with fake/sample data and no corporate
   credentials.
2. Prove the Python Oracle and SQL Server drivers independently in an approved
   internal test environment.
3. Create the four SQL Server control/Bronze objects for WIP.
4. Run a bounded WIP backfill, then a manual incremental run.
5. Schedule the load daily, measure it, and only then trial 15-minute cadence.
6. Add dbt and BI tasks after Bronze is stable.

## References

- Apache Airflow architecture: <https://airflow.apache.org/docs/apache-airflow/stable/core-concepts/overview.html>
- Airflow production deployment guidance: <https://airflow.apache.org/docs/apache-airflow/stable/administration-and-deployment/production-deployment.html>
- Oracle `python-oracledb` tuning: <https://python-oracledb.readthedocs.io/en/latest/user_guide/tuning.html>
- Oracle batch fetching: <https://python-oracledb.readthedocs.io/en/latest/user_guide/sql_execution.html>
- Microsoft ODBC Driver for SQL Server: <https://learn.microsoft.com/en-us/sql/connect/odbc/microsoft-odbc-driver-for-sql-server?view=sql-server-ver17>
