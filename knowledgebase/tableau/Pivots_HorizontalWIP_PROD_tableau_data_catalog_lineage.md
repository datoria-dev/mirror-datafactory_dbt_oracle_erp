# Pivots_HorizontalWIP_PROD — Tableau Data Catalog & Calculation Lineage

## 1. Workbook Summary

This workbook appears to present a pivoted or simplified production horizontal WIP view. It uses a published datasource named `Pivots_HorizontalWIP_PROD` and focuses on job, planner, part, program, operation, department, and operation quantity metrics.

Primary analytical focus:
- Operation-level scheduled, queued, completed, rejected, scrapped, and open quantities.
- Job-level scheduled start/completion context.
- Planner, program, part number, job status, and operation sequence analysis.
- A simplified/pivoted version of the broader horizontal WIP logic.

## 2. Inputs Reviewed

| Input | Purpose |
|---|---|
| Tableau XML | Workbook metadata, published datasource reference, field catalog, and calculated fields. |
| Project context | Repository search was used to look for matching project objects. |
| Confirmed source files | `knowledgebase/tableau/Pivots_HorizontalWIP_PROD.xml`. |

## 3. Tableau Datasource Inputs

| Tableau Object | Value |
|---|---|
| Workbook | `Pivots_HorizontalWIP_PROD` |
| Published datasource | `Pivots_HorizontalWIP_PROD` |
| Connection class | `sqlproxy` |
| Datasource server | `tableauanalytics.us.baesystems.com` |
| Main worksheet(s) | Not fully enumerated in reviewed excerpt |
| Update/freshness field or worksheet | Unknown from reviewed excerpt |

Source-like objects:

| Object | Role | Status |
|---|---|---|
| Published Tableau datasource `Pivots_HorizontalWIP_PROD` | Primary workbook datasource | Confirmed |
| `sqlproxy` relation | Wrapper around published datasource | Confirmed |
| `Custom SQL Query` family | Job/planner/part/date fields | Inferred |
| `Custom SQL Query1` family | Operation and quantity fields | Inferred |
| `Custom SQL Query2` family | Program enrichment | Inferred |

## 4. Project Context Inputs

| Project Object | Confirmed Fields / Purpose |
|---|---|
| `knowledgebase/tableau/Pivots_HorizontalWIP_PROD.xml` | Confirmed workbook XML source. |
| Published datasource export | Not available in reviewed context; needed for full upstream SQL lineage. |
| Matching dbt model | Not confirmed from available search results. |

## 5. Core Lineage Map

| Layer | Object | Role | Status |
|---|---|---|---|
| Tableau published datasource | `Pivots_HorizontalWIP_PROD` | Provides pivoted horizontal WIP dataset | Confirmed |
| Tableau connection wrapper | `sqlproxy` | Published datasource access layer | Confirmed |
| Tableau field family | `Custom SQL Query` | Job, planner, part, and schedule fields | Inferred |
| Tableau field family | `Custom SQL Query1` | Operation-level WIP fields | Inferred |
| Tableau field family | `Custom SQL Query2` | Program fields | Inferred |
| Tableau workbook | `Pivots_HorizontalWIP_PROD` | Visualization layer | Confirmed |

Relationship logic:

| Relationship | Meaning | Risk |
|---|---|---|
| Published datasource encapsulates upstream logic | Workbook receives already-modeled datasource fields through `sqlproxy` | Full SQL/join lineage is not visible in workbook XML |
| `OP QTY OPEN = OP SCHEDULED QUANTITY - OP QUANTITY COMPLETED - OP QUANTITY REJECTED - OP QUANTITY SCRAPPED` | Computes remaining open operation quantity | Null and negative quantity handling should be validated |

## 6. Calculated Field Catalog

| Caption | Raw XML Field | Formula | Fully Expanded Logic | Inputs | Source / Lineage | Business Meaning | Risk / Note | Confidence |
|---|---|---|---|---|---|---|---|---|
| OP QTY OPEN | `[Calculation_1294221990502227968]` | `[OP SCHEDULED QUANTITY]-[OP QUANTITY COMPLETED]-[OP QUANTITY REJECTED]-[OP QUANTITY SCRAPPED]` | Operation open quantity equals scheduled quantity minus completed, rejected, and scrapped quantities. | `OP SCHEDULED QUANTITY`, `OP QUANTITY COMPLETED`, `OP QUANTITY REJECTED`, `OP QUANTITY SCRAPPED` | Tableau calculation on published datasource fields | Measures remaining open quantity at the operation step. | No explicit null handling; verify if rejected and scrapped quantities should reduce open quantity. | High |
| ToolTip | `[Calculation_916201071712772096]` | `'Tooltip'` | Static text value. | None | Tableau workbook/published datasource calc | Tooltip helper or mark interaction field. | Cosmetic/helper field. | High |

Key source fields visible in the XML:

| Field | Role | Business Use | Status |
|---|---|---|---|
| `JOB NAME` | Dimension | WIP job identifier | Confirmed |
| `JOB STATUS` | Dimension | Job lifecycle status | Confirmed |
| `JOB SCHED START DATE` | Date | Scheduled job start | Confirmed |
| `JOB SCHED COMPLETION DATE` | Date | Scheduled job completion | Confirmed |
| `PART NUMBER` | Dimension | Item identifier | Confirmed |
| `PLANNER` | Dimension | Planner ownership | Confirmed |
| `PROGRAM` | Dimension | Program grouping | Confirmed |
| `OP SEQ NUM` | Dimension/ordinal | Operation sequence | Confirmed |
| `OP DESC` | Dimension | Operation description | Confirmed |
| `DEPARTMENT CODE` | Dimension | Shop-floor department | Confirmed |
| `OP SCHEDULED QTY` | Measure | Scheduled operation quantity | Confirmed |
| `OP QTY IN QUEUE` | Measure | Queue quantity at operation | Confirmed |
| `OP QTY COMPLETED` | Measure | Completed operation quantity | Confirmed |
| `OP QTY REJECTED` | Measure | Rejected operation quantity | Confirmed |
| `OP QTY SCRAPPED` | Measure | Scrapped operation quantity | Confirmed |

## 7. Calculation Dependency Graph

```text
Base fields:
  OP SCHEDULED QUANTITY
  OP QUANTITY COMPLETED
  OP QUANTITY REJECTED
  OP QUANTITY SCRAPPED

OP QTY OPEN:
  OP SCHEDULED QUANTITY
    - OP QUANTITY COMPLETED
    - OP QUANTITY REJECTED
    - OP QUANTITY SCRAPPED
  -> OP QTY OPEN

ToolTip:
  'Tooltip'
  -> ToolTip
```

Table calculations:

| Field | Tableau Function | Sensitivity |
|---|---|---|
| None identified in reviewed excerpt | Not applicable | Not applicable |

## 8. Unknowns / Missing Context

| Unknown | Why It Matters |
|---|---|
| Published datasource SQL/export | Required to confirm database and project-model lineage. |
| Reason for pivoted variant versus `PROD_HorizontalWIP` | Needed to document intended audience and metric differences. |
| Active worksheet/dashboard field usage | Needed to prove whether all visible fields are actively used. |
| Refresh cadence | Needed for production support documentation. |

## 9. Recommendations

| Recommendation | Reason | Priority |
|---|---|---|
| Compare this workbook to `PROD_HorizontalWIP` | Identify duplicate logic and governance overlap. | High |
| Inspect/export `Pivots_HorizontalWIP_PROD` published datasource | Required for full lineage. | High |
| Standardize `OP QTY OPEN` definition across WIP workbooks | Prevents conflicting open WIP metrics. | High |
| Document why pivoted dataset exists | Helps future maintainers decide which workbook/model to use. | Medium |
