# datafactory — dbt + Oracle ERP Analytics Engineering

> **Production-grade dbt project** targeting Oracle E-Business Suite (EBS).  
> Built since 2022 on Dimensional Design principles — modular, idempotent, and BI-ready.

**By the numbers:** 335 models · 82 analyses · 33 seeds · 86 data tests · 66 sources · 482 macros

---

## Table of Contents

- [datafactory — dbt + Oracle ERP Analytics Engineering](#datafactory--dbt--oracle-erp-analytics-engineering)
  - [Table of Contents](#table-of-contents)
  - [1. Project Overview](#1-project-overview)
  - [2. Why Analytics Engineering Matters](#2-why-analytics-engineering-matters)
    - [In a data-build-tools environment, analytics engineering delivers:](#in-a-data-build-tools-environment-analytics-engineering-delivers)
  - [3. Tech Stack](#3-tech-stack)
  - [4. Project Structure Index](#4-project-structure-index)
  - [5. Getting Started](#5-getting-started)
    - [Prerequisites](#prerequisites)
    - [Install dependencies with uv](#install-dependencies-with-uv)
    - [Configure your Oracle connection](#configure-your-oracle-connection)
    - [Run dbt](#run-dbt)
  - [6. Modeling Architecture](#6-modeling-architecture)
  - [7. CI/CD Pipeline](#7-cicd-pipeline)
  - [8. Data Domains Covered](#8-data-domains-covered)
  - [9. Key Business Use Cases](#9-key-business-use-cases)
  - [10. Useful dbt Commands](#10-useful-dbt-commands)
  - [11. Resources](#11-resources)

---

## 1. Project Overview

**datafactory** is an analytics engineering project that transforms raw Oracle EBS transactional data into clean, reliable, business-ready data marts.  
The project covers the full manufacturing intelligence lifecycle — from work-in-process (WIP) tracking and quality defect analysis to MRP planning, order management, inventory valuation, and supplier performance.

All transformations are written in SQL and orchestrated by **dbt (data build tool)**, with a strict layered modeling convention that makes the pipeline easy to maintain, test, and extend.

---

## 2. Why Analytics Engineering Matters

Analytics engineering sits at the intersection of data engineering and data analysis.  
Traditional BI teams relied on analysts writing one-off queries and engineers managing brittle ETL pipelines — analytics engineering unifies these disciplines using **software engineering best practices applied to data transformation**.

### In a data-build-tools environment, analytics engineering delivers:

| Benefit | Impact |
|---|---|
| **Modular SQL models** | Break complex transformations into composable, reusable building blocks instead of thousand-line monolithic queries |
| **Version control for data logic** | Every SQL transformation lives in Git — full history, code review, branching, and rollback |
| **Automated data testing** | Built-in schema tests (not-null, unique, accepted values, relationships) catch data quality regressions before they reach dashboards |
| **Self-documenting pipelines** | `dbt docs generate` produces a browsable data catalog with column descriptions and lineage graphs |
| **Idempotent pipelines** | Run your pipeline 10 times — you get the same result every time. No duplicate data, no side effects |
| **DAG-driven dependency management** | dbt resolves model dependencies automatically via the `ref()` function, eliminating manual execution ordering |
| **Separation of concerns** | Sources → Staging → Intermediate → Marts. Each layer has a clear purpose and blast radius for changes |
| **Enables self-service analytics** | Clean, well-named mart tables mean BI tools and analysts get data they can trust without bespoke SQL knowledge |
| **Reproducibility** | Any team member can spin up the full pipeline from scratch using the same `dbt run` command |

In this project specifically, analytics engineering turns hundreds of raw Oracle EBS tables (WIP, INV, BOM, QA, ONT, WSH, MRP, AP, AR, HR) into curated dimensional models (`dim_*`, `fct_*`) that power production dashboards and operational reports — while keeping the transformation logic transparent, tested, and maintainable.

---

## 3. Tech Stack

| Tool | Version | Purpose |
|---|---|---|
| [dbt-core](https://docs.getdbt.com) | `>=1.10,<1.11` | SQL transformation framework |
| [dbt-oracle](https://docs.getdbt.com/docs/core/connect-data-platform/oracle-setup) | `>=1.10,<1.11` | Oracle adapter for dbt |
| [uv](https://docs.astral.sh/uv/) | latest | Fast Python package and project manager |
| [black](https://black.readthedocs.io) | `>=25.12.0` | Python code formatter |
| [ruff](https://docs.astral.sh/ruff/) | `>=0.15.4` | Python linter |
| Oracle EBS | — | Source transactional system (ERP) |
| GitLab CI/CD | — | Automated docs deployment |

---

## 4. Project Structure Index

```
datafactory_dbt_oracle_erp/
├── pyproject.toml                          # Python project config & dependencies (uv)
├── dbt_project.yml                         # dbt project settings & model materialization config
├── profiles.yml                            # dbt Oracle connection profile (reads env vars)
├── packages.yml                            # dbt package registry references (commented starters)
├── .gitlab-ci.yml                          # GitLab CI/CD pipeline (builds & deploys dbt docs)
├── .gitignore
├── .vscode/                                # VS Code workspace settings
│
├── models/                                 # All dbt SQL transformation models (335 total)
│   ├── 1_sources/                          # Layer 1 — raw Oracle EBS source extracts
│   │   ├── __sources.yml                   # Source definitions & freshness checks
│   │   ├── ap/                             # Accounts Payable (suppliers)
│   │   ├── applsys/                        # Application System (lookups, users)
│   │   ├── ar/                             # Accounts Receivable (customers, parties)
│   │   ├── bae/                            # BAE custom tables (BOMs, serial numbers)
│   │   ├── bom/                            # Bills of Materials, routings, operations, costs
│   │   ├── gl/                             # General Ledger (fiscal periods)
│   │   ├── hr/                             # Human Resources (employees)
│   │   ├── inv/                            # Inventory (item master, transactions, on-hand)
│   │   ├── lookups/                        # Lookup/reference tables
│   │   ├── mrp/                            # Material Requirements Planning
│   │   ├── ont/                            # Order Management (sales orders, lines)
│   │   ├── qa/                             # Quality (inspection results, defect details)
│   │   ├── wip/                            # Work-in-Process (jobs, operations, moves)
│   │   └── wsh/                            # Warehouse Shipping (deliveries, details)
│   │
│   ├── 2_staging/                          # Layer 2 — cleaned & renamed source joins
│   │   ├── _stg__sources.yml
│   │   ├── stg_we_wdj*.sql                 # WIP entities + discrete jobs (many time-window variants)
│   │   ├── stg_oeh_oel*.sql                # Order headers + order lines joins
│   │   ├── stg_qa_*.sql                    # Quality staging models
│   │   ├── stg_bom*.sql                    # BOM & routing staging
│   │   ├── stg_msib_mp*.sql                # Item master + MRP staging
│   │   ├── stg_mrp_fiscal_*.sql            # MRP + fiscal calendar joins
│   │   └── stg_wsh_dd_da_nd.sql            # Warehouse shipping staging
│   │
│   ├── 3_intermediate/                     # Layer 3 — business logic & complex aggregations
│   │   ├── _int__sources.yml
│   │   ├── int_wip_*.sql                   # WIP actuals, completions, job analysis
│   │   ├── int_fiscal_calendar_*.sql       # Fiscal calendar scaffolding variants
│   │   ├── int_saasm_*.sql                 # SAASM program sales & material tracking
│   │   ├── int_mrp_monthly_snapshot_*.sql  # MRP monthly planning snapshots
│   │   ├── int_supplier_caused_defects.sql # Supplier defect attribution logic
│   │   ├── int_move_trxns_*.sql            # WIP move transaction analysis
│   │   ├── int_on_hand_qty_*.sql           # On-hand inventory aggregations
│   │   └── int_employee_wip_moves_*.sql    # Employee productivity tracking
│   │
│   ├── 4_marts/                            # Layer 4 — business-ready dimensional models
│   │   ├── _marts__sources.yml
│   │   ├── dimensions/                     # Dimension tables (dim_*)
│   │   │   ├── dim_item_master.sql
│   │   │   ├── dim_wip_jobs.sql
│   │   │   ├── dim_wip_jobs_and_operations.sql
│   │   │   ├── dim_wip_jobs_completions.sql
│   │   │   ├── dim_wip_jobs_batch_completions.sql
│   │   │   ├── dim_dates.sql
│   │   │   ├── dim_fiscal_and_calendar_dates.sql
│   │   │   ├── dim_departments.sql
│   │   │   ├── dim_users.sql
│   │   │   ├── dim_serial_numbers.sql
│   │   │   ├── dim_bill_of_materials_and_reference_designators.sql
│   │   │   ├── dim_bom_routings_and_operations.sql
│   │   │   ├── dim_operation_descriptions.sql
│   │   │   ├── dim_quality_defect_details_and_results_recording.sql
│   │   │   ├── dim_quality_defect_details_as_child.sql
│   │   │   ├── dim_quality_plans_and_columns.sql
│   │   │   ├── dim_quality_serialized_results_recording.sql
│   │   │   └── dim_wip_reservations_on_sales_orders.sql
│   │   ├── facts/                          # Fact tables (fct_*)
│   │   │   ├── fct_wip_jobs.sql
│   │   │   ├── fct_wip_assembly_completions.sql
│   │   │   ├── fct_wip_job_batch_completions.sql
│   │   │   ├── fct_wip_move_trxns_day_emp.sql
│   │   │   ├── fct_wip_move_trxns_month_emp.sql
│   │   │   ├── fct_wip_accounting.sql
│   │   │   ├── fct_on_hand_qty_per_subinventory_per_item.sql
│   │   │   ├── fct_lead_time_analysis.sql
│   │   │   ├── fct_supplier_caused_defects.sql
│   │   │   ├── fct_inspection_escapes_day.sql
│   │   │   └── fct_inspection_escapes_day_emp.sql
│   │   ├── agg/                            # Aggregated summary models
│   │   │   ├── agg_lead_time_analysis_median.sql
│   │   │   ├── agg_lead_time_analysis_percent_complete.sql
│   │   │   ├── agg_wip_valuation_conv_oh_monthly.sql
│   │   │   └── agg_wip_valuation_conv_oh_yearly.sql
│   │   └── scaffolding/                    # Date/item scaffolding for densification
│   │       ├── scf_wdj_item_id_fiscal_monthly.sql
│   │       └── scf_wt_item_id_unit_cost_rate_fiscal_monthly.sql
│   │
│   ├── 9_optimized_compiled_sql/           # Optimized/compiled SQL for production reports
│   │   ├── PROD_MoveTransactions.sql
│   │   ├── DefectConfirmations_PROD.sql
│   │   ├── Inspection_Escapes_Report_Modified.sql
│   │   ├── RTY.sql                         # Rolled Throughput Yield
│   │   ├── midas_*.sql                     # MIDAS system report queries
│   │   └── minus_*.sql                     # Regression / delta comparison queries
│   │
│   └── 99_oracle_sql_dev/                  # Development sandbox models (not for production)
│       └── dev_*.sql
│
├── analyses/                               # Ad-hoc SQL for exploration & profiling
│   ├── oracle_get_profile_initial/         # Initial Oracle column profiling queries
│   ├── recommend_me_columns_initial/       # Column recommendation queries per schema
│   │   ├── ap/, applsys/, ar/, bae/, bom/, hr/
│   │   ├── inv/, lookups/, mrp/, ont/, qa/, wip/, wsh/
│   └── supporting_tools/data_quality/     # Data quality investigation queries
│
├── macros/                                 # Reusable Jinja2 SQL macros (482 total)
│   ├── oracle_get_profile.sql              # Column profiling macro
│   ├── recommend_me_columns.sql            # Column recommendation helper
│   └── oracle_get_profile_old.sql
│
├── seeds/                                  # Static reference data loaded into the DB
│   ├── item_program_details__nss_ops_part_numbers_and_domains.csv
│   ├── nss_ops_part_numbers_and_domains.csv
│   ├── nss_mrp_2025_snapshot.csv
│   ├── mrp_planning_snapshot_current_month.csv
│   ├── mrp_planning_snapshot_historical.csv
│   ├── nss_part_numbers_adhoc_for_midas.csv
│   ├── tabular_index_for_inventory_value_report.csv
│   ├── wmt_source_code_job_examples.csv
│   └── connect_by_dense_dates.sql
│
├── tests/
│   └── generic/
│       └── test_is_null_2.sql              # Custom generic test
│
├── snapshots/                              # dbt snapshot definitions (SCD Type 2)
│
├── target/                                 # dbt compilation artifacts (git-ignored)
├── catalog.json                            # dbt docs catalog (auto-generated)
├── manifest.json                           # dbt project manifest (auto-generated)
├── graph.gpickle                           # Serialized DAG graph
├── graph_summary.json                      # DAG summary stats
└── docs/                                   # Generated dbt docs and teammate-facing markdown guides
```

---

## 5. Getting Started

### Prerequisites

- **Python 3.11** recommended for local development
- **[uv](https://docs.astral.sh/uv/getting-started/installation/)** — modern Python package manager
- **Oracle Database** access (Oracle EBS instance) and any required Oracle client or network access for your machine
- **Git**

---

### Install dependencies with uv

This project uses `pyproject.toml` as the single source of truth for Python and dbt dependencies, and **uv** is the standard way to create and sync the local environment.

```powershell
# 1. Install uv (Windows PowerShell)
powershell -ExecutionPolicy Bypass -c "irm https://astral.sh/uv/install.ps1 | iex"

# 2. Clone the repository
git clone <repo-url>
cd datafactory_dbt_oracle_erp

# 3. Install the recommended Python runtime
uv python install 3.11

# 4. Create the local virtual environment and install dependencies
uv sync --dev

# 5. Verify dbt is available
uv run dbt --version
```

> **Why uv?**  
> `uv` replaces `pip` + `venv` + `pip-tools` with a single, significantly faster tool.  
> The `pyproject.toml` file pins the Oracle dbt stack plus development tooling so every team member gets the same local environment.

If you prefer an activated shell after syncing:

```powershell
.\.venv\Scripts\Activate.ps1
dbt --version
```

**pyproject.toml summary:**

```toml
[project]
name = "esbi"
version = "0.1.0"
requires-python = ">=3.10"
dependencies = [
    "black>=25.12.0",
    "dbt-colibri>=0.3.5",
    "dbt-core>=1.10,<1.11",
    "dbt-oracle>=1.10,<1.11",
    "ruff>=0.15.4",
]
```

**Recommended onboarding command sequence:**

```powershell
uv sync --dev
uv run dbt debug --profiles-dir .
uv run dbt deps --profiles-dir .
uv run dbt parse --profiles-dir .
```

---

### Configure your Oracle connection

The connection is driven entirely by **environment variables** — no secrets are stored in the repository.

```powershell
$env:DBT_ORACLE_HOST="your-oracle-host"
$env:DBT_ORACLE_PORT="1521"
$env:DBT_ORACLE_USER="your_user"
$env:DBT_ORACLE_PASSWORD="your_password"
$env:DBT_ORACLE_SERVICE="your_service_name"
$env:DBT_ORACLE_SCHEMA="your_schema"
$env:DBT_ORACLE_DATABASE="your_database_tns_name"
```

The `profiles.yml` reads these automatically:

```yaml
datafactory:
  target: dev
  outputs:
    dev:
      type: oracle
      host: "{{ env_var('DBT_ORACLE_HOST', 'nbnaexaracpr04') }}"
      port: "{{ env_var('DBT_ORACLE_PORT', '1521') | int }}"
      user: "{{ env_var('DBT_ORACLE_USER', 'USC_EBS_OPS_SVC') }}"
      password: "{{ env_var('DBT_ORACLE_PASSWORD') }}"
      service: "{{ env_var('DBT_ORACLE_SERVICE', 'uscebspr') }}"
      schema: "{{ env_var('DBT_ORACLE_SCHEMA', 'apps') }}"
      database: "{{ env_var('DBT_ORACLE_DATABASE', 'USCEBSDG.WORLD') }}"
      threads: 4
```

> **Tip:** Keep `DBT_ORACLE_PASSWORD` local only. Put secrets in your shell profile, Windows Credential Manager, or CI/CD variables rather than in tracked files.

---

### Run dbt

```bash
# Verify your connection
uv run dbt debug --profiles-dir .

# Install any dbt packages (if packages.yml is active)
uv run dbt deps --profiles-dir .

# Run all models
uv run dbt run --profiles-dir .

# Run only a specific layer
uv run dbt run --select 4_marts --profiles-dir .

# Run a specific model and all its upstream dependencies
uv run dbt run --select +fct_wip_assembly_completions --profiles-dir .

# Run data quality tests
uv run dbt test --profiles-dir .

# Generate and view the data catalog (docs)
uv run dbt docs generate --profiles-dir .
uv run dbt docs serve --profiles-dir .
```

---

## 6. Modeling Architecture

This project follows the **[dbt Medallion / Layered Architecture](https://docs.getdbt.com/best-practices/how-we-structure/1-guide-overview)** pattern, adapted for Oracle EBS:

```
Oracle EBS Database
        │
        ▼
┌─────────────────────────────────────┐
│  Layer 1: Sources  (1_sources/)     │  Thin SQL wrappers over raw Oracle tables.
│  Prefix: src_*, lu_*                │  Minimal logic — select, filter, cast.
└─────────────────────────────────────┘
        │
        ▼
┌─────────────────────────────────────┐
│  Layer 2: Staging  (2_staging/)     │  Clean column names, join closely related
│  Prefix: stg_*                      │  source tables, standardize data types.
└─────────────────────────────────────┘
        │
        ▼
┌─────────────────────────────────────┐
│  Layer 3: Intermediate (3_int/)     │  Complex business logic, aggregations,
│  Prefix: int_*                      │  multi-table joins, fiscal calendar
└─────────────────────────────────────┘  scaffolding.
        │
        ▼
┌─────────────────────────────────────┐
│  Layer 4: Marts  (4_marts/)         │  Business-ready tables for BI tools.
│  Prefix: dim_*, fct_*, agg_*, scf_* │  Dimensional model: facts + dimensions.
└─────────────────────────────────────┘
        │
        ▼
  BI Tools / Dashboards / Reports
  (Tableau, Power BI, MIDAS, etc.)
```

**Materialization strategy:** All layers are set to `ephemeral` in `dbt_project.yml` — models compile into CTEs that are inlined at query time, avoiding unnecessary table creation overhead during development. Production deployments can override specific mart models to `table` or `view` as needed.

---

## 7. CI/CD Pipeline

GitHub Actions (`.github/workflows/dbt-parse.yml`) validates the dbt project on pushes to `main` and on pull requests:

1. Checks out the repository
2. Installs Python
3. Installs the dbt dependencies from `pyproject.toml`
4. Runs `dbt parse` to catch project, YAML, and dependency issues before merge

The parse job uses placeholder Oracle environment variables and does not connect to the production database. Real Oracle credentials should stay in local environment variables or GitHub Actions secrets, never in code.

---

## 8. dbt Colibri Pilot

`dbt-colibri` is a local dashboard for dbt column lineage. It reads the dbt artifacts you already generate, then builds a standalone lineage UI in `dist/`.

### Local run

```powershell
uv add dbt-colibri
$env:DBT_ORACLE_PASSWORD = "your_password"
.venv\Scripts\dbt.exe compile --profiles-dir .
.venv\Scripts\dbt.exe docs generate --profiles-dir .
.\scripts\generate_colibri.ps1
```

### Output

- `dist/index.html`
- `dist/colibri-manifest.json`

If `dbt compile` has not been run successfully against the live Oracle target, Colibri can still build a pilot dashboard from the checked-in artifacts, but some lineage will be thinner because the manifest does not include compiled SQL for every node.

### GitHub

There is also a GitHub Actions workflow at [`.github/workflows/colibri.yml`](</C:/Users/alfre/Documents/Codex/2026-05-20/where-is-my-esbi-github-local/.github/workflows/colibri.yml>) that builds the dashboard from the checked-in dbt artifacts.

---

## 9. Data Domains Covered

| Oracle EBS Module | Schema Prefix | Key Tables / Models |
|---|---|---|
| Work-in-Process | `wip` | Discrete jobs, operations, move transactions, assemblies |
| Inventory | `inv` | Item master (MSIB), on-hand quantities, material transactions |
| Bills of Material | `bom` | BOM structures, components, routings, operations, costs |
| Quality | `qa` | QA results, defect details, reject/reroute, stamp control |
| Order Management | `ont` | Order headers, order lines, extensions |
| Warehouse Shipping | `wsh` | Deliveries, delivery details, assignments |
| MRP / Planning | `mrp` | Plans, recommendations, pegging, gross requirements |
| Accounts Payable | `ap` | Suppliers |
| Accounts Receivable | `ar` | Customers, parties |
| Human Resources | `hr` | Employees |
| General Ledger | `gl` | Fiscal periods |
| App System | `applsys` | Lookup values, users |
| Custom / BAE | `bae` | Custom context tables, exploded BOMs, serial numbers |

---

## 10. Key Business Use Cases

| Report / Model | Business Question |
|---|---|
| `fct_wip_assembly_completions` | How many assemblies were completed per job per period? |
| `fct_wip_jobs` | What is the status of all open/released WIP jobs? |
| `fct_supplier_caused_defects` | Which suppliers are driving the most manufacturing defects? |
| `fct_inspection_escapes_day` | How many defects escaped quality inspection per day? |
| `fct_wip_accounting` / `agg_wip_valuation_*` | What is the WIP conversion overhead valuation by month/year? |
| `fct_lead_time_analysis` | What are actual vs. planned manufacturing lead times? |
| `fct_on_hand_qty_per_subinventory_per_item` | What is on-hand inventory by location and part number? |
| `horizontal_wip` | What is the queue depth at each operation step right now? |
| `mrp_monthly_build` / `mrp_monthly_delivery` | What does the MRP build and delivery plan look like by month? |
| `saasm_*` | SAASM program sales, shipment, and material transaction tracking |
| `employee_wip_moves_*` | How many WIP move transactions has each employee performed? |
| `build2plan` | How do actuals compare to the planned build schedule? |

---

## 11. Useful dbt Commands

```bash
# Run all models in the mart layer
dbt run --select 4_marts

# Run one specific model
dbt run --select fct_wip_jobs

# Run a model plus all ancestors (+) and descendants (model+)
dbt run --select +fct_wip_jobs+

# Run only models that have changed since the last run
dbt run --select state:modified+

# Test a specific model
dbt test --select fct_wip_jobs

# Compile SQL without running (useful for debugging)
dbt compile --select fct_wip_jobs

# Seed static CSV data into the database
dbt seed

# Generate the full data lineage catalog
dbt docs generate && dbt docs serve

# Clean compiled artifacts
dbt clean

# Show the dependency graph for a model
dbt ls --select +fct_supplier_caused_defects --output path
```

---

## 12. Resources

- [dbt Documentation](https://docs.getdbt.com/docs/introduction)
- [dbt-oracle Adapter](https://docs.getdbt.com/docs/core/connect-data-platform/oracle-setup)
- [uv — Python Package Manager](https://docs.astral.sh/uv/)
- [dbt Best Practices — How We Structure Our Projects](https://docs.getdbt.com/best-practices/how-we-structure/1-guide-overview)
- [Kimball Dimensional Modeling](https://www.kimballgroup.com/data-warehouse-business-intelligence-resources/kimball-techniques/dimensional-modeling-techniques/)
- [dbt Community Slack](https://community.getdbt.com/)
- [dbt Discourse](https://discourse.getdbt.com/)
- [dbt Blog](https://blog.getdbt.com/)
