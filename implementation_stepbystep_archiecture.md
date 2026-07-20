# Implementation Step by Step Architecture

Working tracker for first Airflow-driven Oracle to SQL Server pipeline.

## Current Position

**Step 1 — not started:** Create empty SQL Server database: `analytics_erp`.

No schemas, tables, procedures, or pipeline code yet.

## SQL Server Build Order

1. Create `analytics_erp` database.
2. Create schemas: `ingest`, `bronze`, `etl`.
   - Schema = named database namespace. Folder-like grouping for tables,
     procedures, permissions.
   - `ingest` = temporary rows landed from Python.
   - `bronze` = persisted, source-shaped Oracle rows.
   - `etl` = pipeline control objects.
3. Create `etl.LoadRun` and `etl.SourceWatermark` control tables. [Appendix: control tables](#3-control-tables)
4. Create `ingest.oracle_wip_move_transactions_delta` landing table.
5. Create `bronze.oracle_apps_wip_move_transactions` Bronze table.
6. Create `etl.usp_MergeWipMoveTransactions` merge procedure.
7. Prove one manual WIP incremental load.

## Then Build Python and Airflow

8. Create private Python ingestion project.
9. Create direct Oracle WIP extractor with bound timestamps and batch fetches.
10. Add SQL Server landing writer.
11. Add Airflow DAG: extract, land, merge, audit.
12. Add retries, load alert, and one-source concurrency limit.
13. Add downstream dbt only after Bronze load is stable.

## Rules

- Complete one numbered step before next.
- Mark validation evidence beside completed step.
- Do not advance watermark until Bronze merge succeeds.
- First source: `apps.wip_move_transactions`.

## Step Notes

Add decisions, SQL names, test results, and blockers here as implementation
progresses.

## Appendix

### 3. Control Tables

[Back to SQL Server build order](#sql-server-build-order)

Control tables are pipeline memory inside SQL Server. They do not hold WIP
transactions, costs, dates, or reporting data. They hold facts about load
process.

`etl.LoadRun` stores one row per load attempt:

```text
WIP load started 09:00
Read 4,200 Oracle rows
Loaded 4,200 Bronze rows
Succeeded 09:02
```

Failed load stores failure time, error, bounds, row counts.

`etl.SourceWatermark` stores one row per source table:

```text
Source: wip_move_transactions
Last successful change time: 2026-07-15 09:00
```

Next load reads checkpoint, asks Oracle for newer changed rows, advances
checkpoint only after Bronze merge succeeds. Retry can resume without forgetting
where pipeline stopped.
