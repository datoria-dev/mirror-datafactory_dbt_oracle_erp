# PROD_MoveTransactions — Tableau Data Catalog & Calculation Lineage

## 1. Workbook Summary

This workbook documents recent production WIP move transactions by operation step. It appears to support shop-floor visibility into material movement between operation sequences, departments, WIP jobs, and part numbers.

Primary analytical focus:
- Transaction quantity by transaction date.
- From-operation and to-operation movement detail.
- WIP job, part number, department, and operation sequence filtering.
- A seven-day rolling average over transaction quantity.
- Dashboard action links for email and Microsoft Teams follow-up.

## 2. Inputs Reviewed

| Input | Purpose |
|---|---|
| Tableau XML | Workbook structure, datasource references, custom SQL, fields, calculations, worksheet dependencies, filters, actions, dashboard layout references. |
| Project context | Repository context used to identify matching report SQL where visible. |
| Confirmed source files | `knowledgebase/tableau/PROD_MoveTransactions.xml`; matching project object `models/9_optimized_compiled_sql/PROD_MoveTransactions.sql` was visible in project search results. |

## 3. Tableau Datasource Inputs

| Tableau Object | Value |
|---|---|
| Workbook | `PROD_MoveTransactions` |
| Published datasource | Not primarily a published datasource in this XML; datasource is an inline local copy named `PROD_MoveTransactions (local copy)` |
| Connection class | Federated connection over Oracle, plus local Hyper extract |
| Oracle server/service | Server `nhnaexaracpr04`, service `USCEBSPR` |
| Main worksheet(s) | `Move Transactions by Op Desc` |
| Dashboard | `Move Transac. by Op Desc` |
| Update/freshness field or worksheet | `zz.Data Refresh Caption`; extract update time visible in XML as `05/20/2026 05:50:19 PM` |

Source-like objects:

| Object | Role | Status |
|---|---|---|
| Custom SQL relation `MoveTransactions` | Primary WIP move transaction source query | Confirmed |
| Oracle `WIP.WIP_MOVE_TRANSACTIONS` | Base transaction fact table | Confirmed |
| Oracle `WIP.WIP_OPERATIONS` | Operation sequence context | Confirmed |
| Oracle `BOM.BOM_OPERATION_SEQUENCES` | Operation descriptions | Confirmed |
| Oracle `APPS.BOM_DEPARTMENTS` | From/to department labels | Confirmed |
| Oracle `WIP.WIP_ENTITIES` | WIP job / entity name | Confirmed |
| Oracle `INV.MTL_SYSTEM_ITEMS_B` | Part number and part description | Confirmed |
| Hyper extract | Local extract copy used by workbook | Confirmed |

## 4. Project Context Inputs

| Project Object | Confirmed Fields / Purpose |
|---|---|
| `models/9_optimized_compiled_sql/PROD_MoveTransactions.sql` | Matching project SQL object found by repository search. Likely documents or reproduces the workbook custom SQL. |
| `knowledgebase/tableau/PROD_MoveTransactions.xml` | Confirmed workbook XML source. |

## 5. Core Lineage Map

| Layer | Object | Role | Status |
|---|---|---|---|
| Oracle source | `WIP.WIP_MOVE_TRANSACTIONS` | Transaction-level WIP movement records | Confirmed |
| Oracle source | `WIP.WIP_OPERATIONS` | Operation context joined by WIP entity, operation sequence, and organization | Confirmed |
| Oracle source | `BOM.BOM_OPERATION_SEQUENCES` | Operation description enrichment | Confirmed |
| Oracle source | `APPS.BOM_DEPARTMENTS` | Department description/code enrichment | Confirmed |
| Oracle source | `WIP.WIP_ENTITIES` | WIP entity/job name enrichment | Confirmed |
| Oracle source | `INV.MTL_SYSTEM_ITEMS_B` | Part number and item description enrichment | Confirmed |
| Tableau custom SQL | `MoveTransactions` | Produces workbook datasource fields | Confirmed |
| Tableau extract | Hyper extract | Cached workbook data | Confirmed |
| Tableau worksheet | `Move Transactions by Op Desc` | Main visualization of move transactions by operation step | Confirmed |
| Tableau dashboard | `Move Transac. by Op Desc` | Published dashboard container | Confirmed |

Relationship logic:

| Relationship | Meaning | Risk |
|---|---|---|
| `WMT.WIP_ENTITY_ID = FMWOP.WIP_ENTITY_ID` and `WMT.FM_OPERATION_SEQ_NUM = FMWOP.OPERATION_SEQ_NUM` | Connects move transaction to from-operation context | Duplicate or missing operation rows could distort movement detail |
| `WMT.WIP_ENTITY_ID = TOWOP.WIP_ENTITY_ID` and `WMT.FM_OPERATION_SEQ_NUM = TOWOP.OPERATION_SEQ_NUM` | Intended to connect to to-operation context, but XML shows `FM_OPERATION_SEQ_NUM` also used for the to-operation join | Review: this may be a logic defect if `TO_OPERATION_SEQ_NUM` should be used |
| `FMWOP.OPERATION_SEQUENCE_ID = FMBOS.OPERATION_SEQUENCE_ID` | Adds from-operation description | Confirm operation sequence uniqueness |
| `FMWOP.OPERATION_SEQUENCE_ID = TOBOS.OPERATION_SEQUENCE_ID` | Adds to-operation description, but uses `FMWOP` rather than `TOWOP` in visible SQL | Review: may cause from/to operation descriptions to mirror incorrectly |
| `WMT.FM_DEPARTMENT_ID = FMD.DEPARTMENT_ID` | Adds from department | Department code may change historically |
| `WMT.TO_DEPARTMENT_ID = TOD.DEPARTMENT_ID` | Adds to department | Department code may change historically |
| `WMT.PRIMARY_ITEM_ID = MS.INVENTORY_ITEM_ID` and `WMT.ORGANIZATION_ID = MS.ORGANIZATION_ID` | Adds part number and description | Correct organization join is essential |
| `WMT.ORGANIZATION_ID = 1213` | Limits dataset to one organization | Organization-specific dashboard; not enterprise-wide |
| `WMT.TRANSACTION_DATE >= SYSDATE - 90` | Limits source query to recent 90-day history | XML text shows encoded operator as `>>=`, likely XML/tool artifact or source typo; validate actual SQL |
| `WMT.SCRAP_ACCOUNT_ID IS NULL` | Excludes scrap-account transactions | Scrap movement visibility intentionally omitted |

## 6. Calculated Field Catalog

| Caption | Raw XML Field | Formula | Fully Expanded Logic | Inputs | Source / Lineage | Business Meaning | Risk / Note | Confidence |
|---|---|---|---|---|---|---|---|---|
| Transactions 7-Day Rolling Avg | `[Calculation_128071114943107074]` | `WINDOW_AVG(SUM([TRANSACTION QUANTITY]),-6,0)` | For each mark, calculate the average of summed transaction quantity across the current row and prior six rows. | `TRANSACTION QUANTITY`; worksheet addressing/order | Tableau calculation over custom SQL field | Smooths daily/row-level transaction volume trend | Table calculation depends on worksheet partitioning, addressing, row order, and date granularity | High |
| Email | `[Calculation_1448470236567126016]` | `"Email Me Here"` | Static text label used as dashboard action trigger or tooltip. | None | Tableau workbook only | Creates a clickable/visible email action element | Hard-coded text; action target is separate from formula | High |
| Teams | `[Calculation_1448470236580397057]` | `"Write a Teams Message"` | Static text label used as dashboard action trigger or tooltip. | None | Tableau workbook only | Creates a clickable/visible Teams action element | Hard-coded Teams channel link in dashboard action; maintain if Teams URL changes | High |
| Blank | `[Calculation_976436696581128192]` | `' '` | Single blank-space string. | None | Tableau workbook only | Used for layout, caption, or blank worksheet placeholder. | Cosmetic/helper field; low business meaning | High |
| TRANSACTION DATE CST | `[TRANSACTION DATE (copy)_128071114934075393]` | `DATE([TRANSACTION DATE]-(1/24))` | Subtracts one hour from transaction datetime, then truncates/casts to date. | `TRANSACTION DATE` | Tableau calculation over custom SQL field | Converts transaction timestamp into CST-shifted date bucket. | Fixed one-hour offset does not handle daylight saving time; confirm intended timezone logic | High |
| TRANSACTION DATE | `[TRANSACTION DATE (copy)_807833251721117696]` | `DATE([TRANSACTION DATE])` | Converts transaction datetime to date. | `TRANSACTION DATE` | Tableau calculation over custom SQL field | Provides date-only version of transaction timestamp. | Hidden field; may be redundant with CST date | High |
| TRANSACTION DATETIME CST | `[TRANSACTION DATETIME (copy)_128071114932310016]` | `[TRANSACTION DATE]-(1/24)` | Subtracts one hour from transaction datetime. | `TRANSACTION DATE` | Tableau calculation over custom SQL field | Provides shifted datetime for CST reporting. | Fixed offset risk; DST not handled | High |

## 7. Calculation Dependency Graph

```text
Base fields:
  TRANSACTION DATE
  TRANSACTION QUANTITY

TRANSACTION DATETIME CST:
  TRANSACTION DATE - 1 hour
  -> TRANSACTION DATETIME CST

TRANSACTION DATE CST:
  DATE(TRANSACTION DATE - 1 hour)
  -> TRANSACTION DATE CST

TRANSACTION DATE:
  DATE(TRANSACTION DATE)
  -> TRANSACTION DATE

Transactions 7-Day Rolling Avg:
  WINDOW_AVG(SUM(TRANSACTION QUANTITY), prior 6 rows through current row)
  -> Transactions 7-Day Rolling Avg

Static helper fields:
  "Email Me Here" -> Email
  "Write a Teams Message" -> Teams
  " " -> Blank
```

Table calculations:

| Field | Tableau Function | Sensitivity |
|---|---|---|
| Transactions 7-Day Rolling Avg | `WINDOW_AVG` | Depends on partitioning, addressing, sort order, and worksheet layout. |

## 8. Unknowns / Missing Context

| Unknown | Why It Matters |
|---|---|
| Whether the visible SQL typo/operator is literal | `TRANSACTION_DATE >>= SYSDATE - 90` should be validated in the executable SQL. |
| Whether `TOWOP` / `TOBOS` joins should use to-operation fields | Current visible logic may incorrectly reuse from-operation keys. |
| Full production refresh schedule | XML shows extract update time, not schedule or ownership. |
| Whether project SQL exactly matches deployed Tableau datasource | Matching filename was found, but full file content was not inspected in this pass. |
| Table calculation addressing for rolling average | Needed to guarantee the seven-day rolling average behaves as intended. |

## 9. Recommendations

| Recommendation | Reason | Priority |
|---|---|---|
| Validate the custom SQL operator around `TRANSACTION_DATE` | Prevent SQL failure or incorrect date filtering. | High |
| Review `TOWOP` and `TOBOS` join logic | From/to operation logic may be incorrect if from-operation fields are reused. | High |
| Document table calculation addressing for rolling average | Prevent accidental changes when worksheet layout changes. | High |
| Move timezone conversion into upstream SQL/dbt model if standardized | Improves consistency and DST governance. | Medium |
| Confirm whether `PROD_MoveTransactions.sql` is the canonical source logic | Aligns Tableau documentation with project repository lineage. | Medium |
