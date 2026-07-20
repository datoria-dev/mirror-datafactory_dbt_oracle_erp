# Dynamic Daily Rates_PROD — Tableau Data Catalog & Calculation Lineage

## 1. Workbook Summary

This workbook appears to track dynamic daily production rates by product group using move transaction quantities and user-adjustable Tableau parameters. It compares transaction quantity against target daily rates and derives remaining quantity, remaining percentage, and color-coded status bands.

Primary analytical focus:
- Daily production/move rate tracking.
- Product-group-specific target rates.
- Remaining quantity versus configured target.
- Remaining quantity percentage bands.
- Color coding for rate performance risk.

## 2. Inputs Reviewed

| Input | Purpose |
|---|---|
| Tableau XML | Workbook metadata, parameters, published datasource reference, calculations, fields, and business rules. |
| Project context | Repository search confirmed matching marts and optimized SQL files for the datasource name. |
| Confirmed source files | `knowledgebase/tableau/Dynamic Daily Rates_PROD.xml`; `models/4_marts/move_trxns_dynamic_daily_rate.sql`; `models/4_marts/move_trxns_dynamic_daily_rate_part_2.sql`; `models/9_optimized_compiled_sql/move_trxns_dynamic_daily_rate_prod.sql`; `models/9_optimized_compiled_sql/move_trxns_dynamic_daily_rate_dev.sql`. |

## 3. Tableau Datasource Inputs

| Tableau Object | Value |
|---|---|
| Workbook | `DynamicDailyRates_PROD` |
| Published datasource | `move_trxns_dynamic_daily_rate` |
| Connection class | `sqlproxy` |
| Datasource server | `tableauanalytics.us.baesystems.com` |
| Parameter datasource | `Parameters` |
| Main worksheet(s) | Not fully enumerated in reviewed excerpt |
| Update/freshness field or worksheet | Unknown from reviewed excerpt |

Source-like objects:

| Object | Role | Status |
|---|---|---|
| Published Tableau datasource `move_trxns_dynamic_daily_rate` | Primary production-rate datasource | Confirmed |
| `sqlproxy` relation | Wrapper around published datasource | Confirmed |
| Project mart `move_trxns_dynamic_daily_rate.sql` | Likely dbt mart supporting published datasource | Confirmed by repository search |
| Project mart `move_trxns_dynamic_daily_rate_part_2.sql` | Supporting mart logic | Confirmed by repository search |
| Optimized compiled SQL `move_trxns_dynamic_daily_rate_prod.sql` | Production SQL version | Confirmed by repository search |
| Parameters datasource | Target rates by product group | Confirmed |

## 4. Project Context Inputs

| Project Object | Confirmed Fields / Purpose |
|---|---|
| `models/4_marts/move_trxns_dynamic_daily_rate.sql` | Matching datasource/model name; likely upstream mart logic. |
| `models/4_marts/move_trxns_dynamic_daily_rate_part_2.sql` | Supporting mart logic for daily rates. |
| `models/9_optimized_compiled_sql/move_trxns_dynamic_daily_rate_prod.sql` | Production compiled SQL artifact. |
| `models/9_optimized_compiled_sql/move_trxns_dynamic_daily_rate_dev.sql` | Development compiled SQL artifact. |
| `knowledgebase/tableau/Dynamic Daily Rates_PROD.xml` | Confirmed workbook XML source. |

## 5. Core Lineage Map

| Layer | Object | Role | Status |
|---|---|---|---|
| Project mart | `move_trxns_dynamic_daily_rate.sql` | Likely source model for daily rate datasource | Confirmed name match |
| Project mart | `move_trxns_dynamic_daily_rate_part_2.sql` | Supporting daily rate model | Confirmed name match |
| Project compiled SQL | `move_trxns_dynamic_daily_rate_prod.sql` | Production SQL artifact | Confirmed name match |
| Tableau published datasource | `move_trxns_dynamic_daily_rate` | Provides transaction quantity, date, part number group, and operation fields | Confirmed |
| Tableau parameters | `NavStorm`, `NavStrike`, `NavFire`, `ASR 3.7`, `NavStrike M`, `DAGR`, `DIGAR` | User-configurable daily rate targets | Confirmed |
| Tableau workbook | `DynamicDailyRates_PROD` | Visualization and calculation layer | Confirmed |

Relationship logic:

| Relationship | Meaning | Risk |
|---|---|---|
| `PART NUMBER GROUP` drives parameter selection | Each product group uses a different target rate | Product group labels in calculations must match source values exactly |
| `TRANSACTION QUANTITY` is compared to selected parameter | Determines remaining quantity and remaining percentage | Aggregation level matters; daily grouping must be correct |
| `REMAINING QTY %` drives color banding | Converts target achievement into percentage status | Divide-by-zero risk if parameter set to zero; current parameter minimums reduce but do not eliminate governance risk if parameter domain changes |

## 6. Calculated Field Catalog

| Caption | Raw XML Field | Formula | Fully Expanded Logic | Inputs | Source / Lineage | Business Meaning | Risk / Note | Confidence |
|---|---|---|---|---|---|---|---|---|
| Blank | `[Calculation_1328843370564071424]` | `""` | Empty string. | None | Tableau workbook | UI/layout helper. | Cosmetic helper only. | High |
| Email | `[Calculation_1448470236567126016]` | `"Email Me Here"` | Static text label. | None | Tableau workbook | Email action helper. | Hard-coded action text. | High |
| Teams | `[Calculation_1448470236580397057]` | `"Write a Teams Message"` | Static text label. | None | Tableau workbook | Teams action helper. | Hard-coded action text. | High |
| REMAINING QTY | `[Calculation_1645784251306131456]` | `INT(CASE [PART NUMBER GROUP] ... parameter - [TRANSACTION QUANTITY] END)` | For each product group, subtract transaction quantity from the configured target rate, then cast to integer. NavStorm uses parameter `NavStorm`; NavStrike uses `NavStrike`; NavFire uses `NavFire`; ASR 3.7 uses `ASR 3.7`; NavStrike M, DAGR, and DIGAR each use their matching integer parameter. | `PART NUMBER GROUP`, `TRANSACTION QUANTITY`, product rate parameters | Tableau calculation over published datasource plus parameter datasource | Remaining units needed to hit target daily rate. | Product labels must match exactly. Integer cast may hide fractional differences. No fallback for unmatched product group. | High |
| MIN1 | `[Calculation_1645784251313434635]` | `MIN(1)` | Returns the minimum of constant value 1 across the mark context. | None | Tableau workbook | Likely helper for sizing, axis, or Gantt/bar construction. | Context-dependent aggregate; business meaning is low. | Medium |
| Color Coding | `[Calculation_2039567746848796673]` | `IF [REMAINING QTY %] > .30 THEN '>30%' ELSEIF [REMAINING QTY %] >= .01 AND <= .30 THEN '1%-30%' ELSEIF [REMAINING QTY %] <= 0 THEN '0%' END` | Classifies remaining target percentage into three bands: above 30 percent remaining, between 1 and 30 percent remaining, or zero/negative percent remaining. | `REMAINING QTY %` | Tableau calculation | High-level target completion band. | Null result possible for unmatched/null percentage. Boundary logic excludes values between 0 and .01 except exactly <=0 and >=.01. | High |
| ZZ.Nested Color Coding | `[Nested Color Coding (copy)_1645784251311644678]` | Nested IF by product group and remaining quantity thresholds | For `NavStorm 10Digit` and `NavStorm+SA`: red if remaining quantity is at least 30, yellow if 10 through under 30, otherwise green. For `NavFire 10Digit` and `NavFire+SA`: red if remaining quantity is at least 6, yellow if 4 through under 6, otherwise green. | `PART NUMBER GROUP`, `REMAINING QTY` | Tableau calculation | Product-family-specific red/yellow/green thresholding. | Visible product group labels differ from `REMAINING QTY` case labels (`NavStorm` vs `NavStorm 10Digit`, `NavFire` vs `NavFire 10Digit`); validate source values. Hidden field. | Medium |
| REMAINING QTY % | `[REMAINING QTY (copy)_2039567746846916608]` | `CASE [PART NUMBER GROUP] WHEN ... THEN 1 - [TRANSACTION QUANTITY] / [parameter] END` | For each product group, compute percent remaining as one minus actual transaction quantity divided by configured target. | `PART NUMBER GROUP`, `TRANSACTION QUANTITY`, product rate parameters | Tableau calculation over published datasource plus parameter datasource | Percent of target still remaining. | No fallback for unmatched group. Division behavior depends on parameter values and aggregation grain. | High |

Parameter catalog:

| Parameter Caption | Raw Parameter | Default | Range / Domain | Business Meaning |
|---|---|---:|---|---|
| NavStrike | `[NavStorm 10 Digit Rate (copy)_1645784251307188225]` | 90 | 1 to 1000 | Target rate for NavStrike |
| NavStorm | `[Parameter 1]` | 28 | 1 to 1000 | Target rate for NavStorm |
| NavFire | `[Parameter 2]` | 18 | Any | Target rate for NavFire |
| ASR 3.7 | `[Parameter 3]` | 3 | Any | Target rate for ASR 3.7 |
| NavStrike M | `[Parameter 4]` | 10 | Any | Target rate for NavStrike M |
| DAGR | `[Parameter 5]` | 10 | Any | Target rate for DAGR |
| DIGAR | `[Parameter 6]` | 10 | Any | Target rate for DIGAR |

## 7. Calculation Dependency Graph

```text
Base fields:
  PART NUMBER GROUP
  TRANSACTION QUANTITY
  START DAILY RATE DATE
  FM OP DESC

Parameters:
  NavStorm target
  NavStrike target
  NavFire target
  ASR 3.7 target
  NavStrike M target
  DAGR target
  DIGAR target

REMAINING QTY:
  selected target parameter by PART NUMBER GROUP - TRANSACTION QUANTITY
  cast to integer
  -> REMAINING QTY

REMAINING QTY %:
  1 - TRANSACTION QUANTITY / selected target parameter
  -> REMAINING QTY %

Color Coding:
  REMAINING QTY %
    > 30% -> ">30%"
    1% to 30% -> "1%-30%"
    <= 0% -> "0%"
  -> Color Coding

ZZ.Nested Color Coding:
  PART NUMBER GROUP + REMAINING QTY
    NavStorm groups: red/yellow/green thresholds 30 and 10
    NavFire groups: red/yellow/green thresholds 6 and 4
  -> ZZ.Nested Color Coding

Helper fields:
  "" -> Blank
  "Email Me Here" -> Email
  "Write a Teams Message" -> Teams
  MIN(1) -> MIN1
```

Table calculations:

| Field | Tableau Function | Sensitivity |
|---|---|---|
| None identified in reviewed excerpt | Not applicable | Not applicable |

## 8. Unknowns / Missing Context

| Unknown | Why It Matters |
|---|---|
| Full worksheet grain | Needed to confirm whether `TRANSACTION QUANTITY` is daily, cumulative, or mark-level. |
| Full upstream SQL logic | Project files were found by name, but full SQL was not inspected in this pass. |
| Product group label standardization | Calculation branches depend on exact string matches. |
| Ownership of target parameter values | Needed to govern who can change target daily rates. |

## 9. Recommendations

| Recommendation | Reason | Priority |
|---|---|---|
| Standardize product group labels across source SQL and Tableau calculations | Prevent unmatched CASE branches and null results. | High |
| Move daily rate target table upstream if targets are production-governed | Parameters are flexible but less auditable than controlled reference data. | High |
| Add fallback `ELSE` handling to CASE calculations | Makes unmatched product groups visible instead of silently null. | High |
| Review threshold boundaries in `Color Coding` | Current logic may leave small positive values below 1 percent uncategorized. | Medium |
| Confirm aggregation grain for `TRANSACTION QUANTITY` | Remaining quantity only makes sense if the mark grain matches daily target logic. | High |
