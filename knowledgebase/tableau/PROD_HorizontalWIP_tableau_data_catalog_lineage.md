# PROD_HorizontalWIP — Tableau Data Catalog & Calculation Lineage

## 1. Workbook Summary

This workbook appears to support horizontal WIP visibility across production jobs, operations, departments, planners, programs, part numbers, and scheduled dates. It connects to a published Tableau datasource named `PROD_HorizontalWIP`, exposed in the workbook XML as `sqlproxy`.

Primary analytical focus:
- Open operation quantity.
- Job and operation schedule context.
- WIP by department, operation sequence, job status, planner, program, and part number.
- Operational drill-down across job-level and operation-level records.

## 2. Inputs Reviewed

| Input | Purpose |
|---|---|
| Tableau XML | Workbook metadata, published datasource reference, field catalog, calculated fields, and connection type. |
| Project context | Repository search was used to look for matching project objects. |
| Confirmed source files | `knowledgebase/tableau/PROD_HorizontalWIP.xml`. |

## 3. Tableau Datasource Inputs

| Tableau Object | Value |
|---|---|
| Workbook | `PROD_HorizontalWIP` |
| Published datasource | `PROD_HorizontalWIP` |
| Connection class | `sqlproxy` |
| Datasource server | `tableauanalytics.us.baesystems.com` |
| Main worksheet(s) | Not fully enumerated in available excerpt |
| Update/freshness field or worksheet | Unknown from reviewed excerpt |

Source-like objects:

| Object | Role | Status |
|---|---|---|
| Published Tableau datasource `PROD_HorizontalWIP` | Primary workbook datasource | Confirmed |
| `sqlproxy` relation | Wrapper around published datasource | Confirmed |
| `Custom SQL Query` family | Job/order-level WIP fields | Inferred from XML field family names |
| `Custom SQL Query1` family | Operation-level WIP fields | Inferred from XML field family names |
| `Custom SQL Query2` family | Item/category/program enrichment | Inferred from XML field family names |

## 4. Project Context Inputs

| Project Object | Confirmed Fields / Purpose |
|---|---|
| `knowledgebase/tableau/PROD_HorizontalWIP.xml` | Confirmed workbook XML source. |
| Published datasource export | Not available in reviewed context; needed for full upstream SQL lineage. |
| Matching dbt model | Not confirmed from available search results. |

## 5. Core Lineage Map

| Layer | Object | Role | Status |
|---|---|---|---|
| Tableau published datasource | `PROD_HorizontalWIP` | Provides WIP dataset to workbook | Confirmed |
| Tableau connection wrapper | `sqlproxy` | Published datasource access layer | Confirmed |
| Tableau field family | `Custom SQL Query` | Job/customer/order/date fields | Inferred |
| Tableau field family | `Custom SQL Query1` | Operation-level fields and quantities | Inferred |
| Tableau field family | `Custom SQL Query2` | Item/category/program fields | Inferred |
| Tableau workbook | `PROD_HorizontalWIP` | Visualization layer | Confirmed |

Relationship logic:

| Relationship | Meaning | Risk |
|---|---|---|
| Published datasource encapsulates upstream SQL | Workbook XML does not expose full joins or source SQL | Cannot prove database lineage without datasource export or project SQL |
| `OP QTY OPEN = OP SCHEDULED QUANTITY - OP QUANTITY COMPLETED - OP QUANTITY REJECTED - OP QUANTITY SCRAPPED` | Open quantity remaining at operation level | Null handling not explicit; negative quantities may need business review |

## 6. Calculated Field Catalog

| Caption | Raw XML Field | Formula | Fully Expanded Logic | Inputs | Source / Lineage | Business Meaning | Risk / Note | Confidence |
|---|---|---|---|---|---|---|---|---|
| OP QTY OPEN | `[Calculation_1294221990502227968]` | `[OP SCHEDULED QUANTITY]-[OP QUANTITY COMPLETED]-[OP QUANTITY REJECTED]-[OP QUANTITY SCRAPPED]` | Operation open quantity equals scheduled operation quantity minus completed, rejected, and scrapped quantities. | `OP SCHEDULED QUANTITY`, `OP QUANTITY COMPLETED`, `OP QUANTITY REJECTED`, `OP QUANTITY SCRAPPED` | Tableau calculation on published datasource fields | Estimates remaining open quantity at an operation step. | No explicit `ZN` or null handling; if any input is null, Tableau result may become null. Validate whether rejected/scrapped should reduce open quantity. | High |
| ToolTip | `[Calculation_916201071712772096]` | `'Tooltip'` | Static text value. | None | Tableau workbook/published datasource calc | Helper value for tooltip or mark interaction. | Low business value; may be only UI scaffolding. | High |

Key source fields visible in the XML:

| Field | Role | Business Use | Status |
|---|---|---|---|
| `JOB NAME` | Dimension | WIP job identifier | Confirmed |
| `JOB STATUS` | Dimension | Job lifecycle status | Confirmed |
| `JOB SCHED START DATE` | Date | Scheduled job start | Confirmed |
| `JOB SCHED COMPLETION DATE` | Date | Scheduled job completion | Confirmed |
| `SCHEDULED DELIVERY DATE` | Date | Delivery commitment date | Confirmed |
| `OP SEQ NUM` | Dimension/ordinal | Operation sequence | Confirmed |
| `OP DESC` | Dimension | Operation description | Confirmed |
| `DEPARTMENT CODE` | Dimension | Manufacturing department | Confirmed |
| `OP QUANTITY IN QUEUE` | Measure | Quantity waiting at operation | Confirmed |
| `OP QUANTITY COMPLETED` | Measure | Completed operation quantity | Confirmed |
| `OP QUANTITY REJECTED` | Measure | Rejected operation quantity | Confirmed |
| `OP QUANTITY SCRAPPED` | Measure | Scrapped operation quantity | Confirmed |
| `PART NUMBER` | Dimension | Item identifier | Confirmed |
| `PLANNER` | Dimension | Planner ownership | Confirmed |
| `PROGRAM` | Dimension | Program/category enrichment | Confirmed |

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
| Full published datasource SQL | Required to confirm upstream database lineage. |
| Exact worksheet/dashboard dependencies | Needed to prove active field usage across all sheets. |
| Null-handling rules for open quantity | Needed to confirm metric behavior when quantity fields are missing. |
| Refresh schedule and owner | Needed for production governance. |

## 9. Recommendations

| Recommendation | Reason | Priority |
|---|---|---|
| Export or inspect the published datasource `PROD_HorizontalWIP` | Required to prove full lineage beyond `sqlproxy`. | High |
| Add null-safe handling to `OP QTY OPEN` if source fields can be null | Prevents unexpected null open quantities. | High |
| Confirm rejected and scrapped quantity treatment with operations owner | Ensures metric aligns to shop-floor definition of open WIP. | Medium |
| Map `Custom SQL Query`, `Custom SQL Query1`, and `Custom SQL Query2` to project models | Improves governance and maintainability. | High |
