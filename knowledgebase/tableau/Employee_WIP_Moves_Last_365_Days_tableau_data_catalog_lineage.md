# Employee WIP Moves Last 365 Days — Tableau Data Catalog & Calculation Lineage

## 1. Workbook Summary

This workbook appears to analyze WIP move transactions by employee over the last 365 days. It uses a published datasource named `employee_wip_moves_365days`, exposed through `sqlproxy`, and focuses on who performed WIP moves, when they occurred, which jobs/parts were affected, and from/to operation or department context.

Primary analytical focus:
- Employee-level WIP movement activity.
- Transaction date and transaction quantity.
- From/to department and operation movement path.
- Job, part, planner, and employee attribution.
- Dashboard action helpers for email and Teams.

## 2. Inputs Reviewed

| Input | Purpose |
|---|---|
| Tableau XML | Workbook metadata, parameters, published datasource reference, field catalog, and calculated helper fields. |
| Project context | Repository search confirmed matching mart model for `employee_wip_moves_365days`. |
| Confirmed source files | `knowledgebase/tableau/Employee WIP Moves Last 365 Days.xml`; `models/4_marts/employee_wip_moves_365days.sql`; related `employee_wip_moves_14days.sql` and dev SQL were visible in search results. |

## 3. Tableau Datasource Inputs

| Tableau Object | Value |
|---|---|
| Workbook | `EmployeeWIPMovesLast365Days` |
| Published datasource | `employee_wip_moves_365days` |
| Connection class | `sqlproxy` |
| Datasource server | `tableauanalytics.us.baesystems.com` |
| Parameter datasource | `Parameters` with `Top Customers` and `Profit Bin Size` parameters, likely template remnants unless actively used |
| Main worksheet(s) | Not fully enumerated in reviewed excerpt |
| Update/freshness field or worksheet | Unknown from reviewed excerpt |

Source-like objects:

| Object | Role | Status |
|---|---|---|
| Published Tableau datasource `employee_wip_moves_365days` | Primary workbook datasource | Confirmed |
| `sqlproxy` relation | Wrapper around published datasource | Confirmed |
| Project mart `employee_wip_moves_365days.sql` | Likely upstream mart supporting the published datasource | Confirmed by repository search |
| Project mart `employee_wip_moves_14days.sql` | Related shorter-window variant | Confirmed by repository search |
| `employee_wip_moves` field family | Employee WIP movement source family | Confirmed from XML field family |

## 4. Project Context Inputs

| Project Object | Confirmed Fields / Purpose |
|---|---|
| `models/4_marts/employee_wip_moves_365days.sql` | Matching mart model name for Tableau datasource. |
| `models/4_marts/employee_wip_moves_14days.sql` | Related time-window variant. |
| `models/99_oracle_sql_dev/dev_employee_wip_moves_14days.sql` | Development SQL variant visible in project search. |
| `knowledgebase/tableau/Employee WIP Moves Last 365 Days.xml` | Confirmed workbook XML source. |

## 5. Core Lineage Map

| Layer | Object | Role | Status |
|---|---|---|---|
| Project mart | `employee_wip_moves_365days.sql` | Likely source model for 365-day employee WIP move datasource | Confirmed name match |
| Tableau published datasource | `employee_wip_moves_365days` | Provides employee-attributed WIP move records | Confirmed |
| Tableau connection wrapper | `sqlproxy` | Published datasource access layer | Confirmed |
| Tableau field family | `employee_wip_moves` | Employee WIP move field grouping | Confirmed |
| Tableau workbook | `EmployeeWIPMovesLast365Days` | Visualization layer | Confirmed |

Relationship logic:

| Relationship | Meaning | Risk |
|---|---|---|
| Published datasource encapsulates upstream WIP move SQL | Workbook uses modeled fields rather than exposing database joins | Full source lineage requires dbt/model SQL inspection |
| Employee fields connect transactions to user/person attribution | Enables transaction accountability by employee | Employee names/usernames may be sensitive; apply governance and access controls |
| From/to operation fields represent movement path | Supports movement-path analysis by department and operation | Need upstream definitions for intraoperation step types and operation descriptions |

## 6. Calculated Field Catalog

| Caption | Raw XML Field | Formula | Fully Expanded Logic | Inputs | Source / Lineage | Business Meaning | Risk / Note | Confidence |
|---|---|---|---|---|---|---|---|---|
| Blank | `[Calculation_1328843370564071424]` | `""` | Empty string. | None | Tableau workbook | UI/layout helper. | Cosmetic helper only. | High |
| Email | `[Calculation_1448470236567126016]` | `"Email Me Here"` | Static text label. | None | Tableau workbook | Email action helper. | Hard-coded helper text. | High |
| Teams | `[Calculation_1448470236580397057]` | `"Write a Teams Message"` | Static text label. | None | Tableau workbook | Teams action helper. | Hard-coded helper text. | High |

Key source fields visible in the XML:

| Field | Caption / Business Label | Role | Business Use | Status |
|---|---|---|---|---|
| `WMT_TRANSACTION_ID` | Transaction ID | Measure/key-like field | Unique WIP move transaction identifier | Confirmed |
| `Transaction Date CST` | Transaction Date CST | Date | Date bucket for WIP movement | Confirmed |
| `Transaction Datetime CST` | Transaction Datetime CST | Datetime | Timestamp for WIP movement | Confirmed |
| `Transaction Datetimezone CST` | Transaction Datetimezone CST | Datetime | Timezone-adjusted transaction timestamp | Confirmed |
| `Transaction Qty` | Transaction Qty | Measure | Quantity moved | Confirmed |
| `Employee Name` | Transacted By | Dimension | Person who performed transaction | Confirmed |
| `USER_NAME` | User name | Dimension | System username for transaction attribution | Confirmed |
| `Planner` | Planner | Dimension | Planner ownership | Confirmed |
| `Part Number` | Part Number | Dimension | Item identifier | Confirmed |
| `Part Description` | Part Description | Dimension | Item description | Confirmed |
| `Job Number` | Job Number | Dimension | WIP job identifier | Confirmed |
| `Fm Op Seq Num` | From operation sequence | Dimension/ordinal | Origin operation sequence | Confirmed |
| `Fm Op Description` | From operation description | Dimension | Origin operation description | Confirmed |
| `Fm Department` | From department | Dimension | Origin department | Confirmed |
| `To Op Seq Num` | To operation sequence | Dimension/ordinal | Destination operation sequence | Confirmed |
| `To Op Description` | To operation description | Dimension | Destination operation description | Confirmed |
| `To Department` | To department | Dimension | Destination department | Confirmed |
| `Fm Intraop Step Type` | From intraoperation step type | Dimension/ordinal | Origin intraoperation step | Confirmed |
| `To Intraop Step Type` | To intraoperation step type | Dimension/ordinal | Destination intraoperation step | Confirmed |

## 7. Calculation Dependency Graph

```text
Base fields:
  WMT_TRANSACTION_ID
  Transaction Date CST
  Transaction Datetime CST
  Transaction Qty
  Employee Name
  USER_NAME
  Planner
  Part Number
  Part Description
  Job Number
  From/To operation and department fields

Helper calculations:
  "" -> Blank
  "Email Me Here" -> Email
  "Write a Teams Message" -> Teams
```

Table calculations:

| Field | Tableau Function | Sensitivity |
|---|---|---|
| None identified in reviewed excerpt | Not applicable | Not applicable |

## 8. Unknowns / Missing Context

| Unknown | Why It Matters |
|---|---|
| Full dbt SQL for `employee_wip_moves_365days.sql` | Needed to prove source joins, filters, date window, and employee attribution logic. |
| Whether 365-day filter is enforced in project model or published datasource | Needed to verify workbook title and data scope. |
| Dashboard-level field usage | Needed to separate active fields from available datasource fields. |
| Employee data access/security requirements | Employee-level operational tracking can require governance controls. |

## 9. Recommendations

| Recommendation | Reason | Priority |
|---|---|---|
| Inspect `employee_wip_moves_365days.sql` and document source joins | Required for complete lineage. | High |
| Confirm where the 365-day filter is implemented | Prevent mismatch between workbook title and actual data. | High |
| Review employee-name and username visibility with governance owner | Employee-level reporting may require access controls. | High |
| Remove or document template parameters if unused | `Top Customers` and `Profit Bin Size` appear unrelated to WIP moves. | Medium |
