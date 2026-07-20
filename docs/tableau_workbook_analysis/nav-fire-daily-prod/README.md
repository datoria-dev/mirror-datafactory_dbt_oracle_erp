# NavFire Daily Transactions

## Tabular Report

| Attribute | Value |
| --- | --- |
| Source workbook | `tableau/my-tableau-dashboards/NavFireDaily_PROD.twbx` |
| Embedded TWB | `NavFireDaily_PROD.twb` |
| Primary dashboard | `NavFire Daily Transactions` |
| Dashboard count | 4 |
| Worksheet count | 11 |
| Datasource count | 2 |
| Calculated field count | 9 |
| LOD calculation count | 1 |
| Table calculation count | 0 |
| Screenshot | `docs/tableau_workbook_analysis/nav-fire-daily-prod/NavFire-Daily-Transactions.jpeg` |

## Table of Contents

- [Tabular Report](#tabular-report)
- [Datasources and Relations](#datasources-and-relations)
- [Likely dbt / SQL or Seed Lineage Guess](#likely-dbt--sql-or-seed-lineage-guess)
- [Sheet Inventory](#sheet-inventory)
- [Filter Cards and Visible Controls](#filter-cards-and-visible-controls)
- [Primary Worksheet Shelves and Marks](#primary-worksheet-shelves-and-marks)
- [Worksheet Filters and Selections](#worksheet-filters-and-selections)
- [Fields Used by Primary Worksheet](#fields-used-by-primary-worksheet)
- [Calculations](#calculations)
- [Calculated Fields](#calculated-fields)
- [Calculation Field Dependencies](#calculation-field-dependencies)
- [Calculation Lineage Notes](#calculation-lineage-notes)
- [LOD and Table Calculation Summary](#lod-and-table-calculation-summary)
- [Color and Legend Notes](#color-and-legend-notes)

## Datasources and Relations

| Datasource | Internal name | Relations found |
| --- | --- | --- |
| `Parameters` | `Parameters` | - |
| `PROD_MoveTransactions_ValueStream (NavFire)` | `sqlproxy.1rxvn8u0wahj4c10txghv153cvxp` | [sqlproxy], [sqlproxy] |

### Likely dbt / SQL or Seed Lineage Guess

| Likely file | Match score | Static reason |
| --- | ---: | --- |
| `models/9_optimized_compiled_sql/PROD_MoveTransactions.sql` | 61.0 | normalized substring; shared tokens: move, transactions |
| `analyses/recommend_me_columns_initial/wip/rmc_wip_move_transactions.sql` | 16.0 | shared tokens: move, transactions |
| `analyses/supporting_tools/data_quality/AddNavStrikePNs_move_trxns_dynamic.sql` | 16.0 | shared tokens: move, nav |
| `knowledgebase/tableau/PROD_MoveTransactions_tableau_data_catalog_lineage.md` | 16.0 | shared tokens: move, transactions |
| `models/1_sources/wip/src_wip_move_transactions_14days.sql` | 16.0 | shared tokens: move, transactions |
| `models/1_sources/wip/src_wip_move_transactions_30days.sql` | 16.0 | shared tokens: move, transactions |
| `models/1_sources/wip/src_wip_move_transactions_365days.sql` | 16.0 | shared tokens: move, transactions |
| `models/1_sources/wip/src_wip_move_transactions_45days.sql` | 16.0 | shared tokens: move, transactions |
| `models/3_intermediate/int_move_trxns_dynamic_daily_rate.sql` | 16.0 | shared tokens: daily, move |
| `models/3_intermediate/int_move_trxns_dynamic_daily_rate_part2.sql` | 16.0 | shared tokens: daily, move |

## Sheet Inventory

| Worksheet | Datasources | Field count | Filter count | Marks |
| --- | --- | ---: | ---: | --- |
| `Avgs Legend Label` | sqlproxy.1rxvn8u0wahj4c10txghv153cvxp | 1 | 1 | Bar |
| `DAGR Move Transactions Value Stream Avgs` | sqlproxy.1rxvn8u0wahj4c10txghv153cvxp | 11 | 5 | Bar |
| `NavFire Move Transactions Value Stream Avgs` | sqlproxy.1rxvn8u0wahj4c10txghv153cvxp | 11 | 5 | Bar |
| `Roll Over Monday Validation` | sqlproxy.1rxvn8u0wahj4c10txghv153cvxp | 8 | 3 | Automatic |
| `Sheet 11` | - | 0 | 0 | Automatic |
| `With Grand Totals and Avg` | sqlproxy.1rxvn8u0wahj4c10txghv153cvxp | 7 | 2 | Bar |
| `With Grand Totals and Avg (2)` | sqlproxy.1rxvn8u0wahj4c10txghv153cvxp | 8 | 2 | Bar |
| `zz.Data Refresh Caption` | sqlproxy.1rxvn8u0wahj4c10txghv153cvxp | 1 | 1 | Automatic |
| `zz.EmailMe` | sqlproxy.1rxvn8u0wahj4c10txghv153cvxp | 1 | 0 | Shape |
| `zz.TeamsMsg` | sqlproxy.1rxvn8u0wahj4c10txghv153cvxp | 1 | 0 | Shape |
| `zz.deprecarted_NavStorm Move Transactions Value Stream Avg` | sqlproxy.1rxvn8u0wahj4c10txghv153cvxp | 11 | 5 | Bar |

### Filter Cards and Visible Controls

| Type | Parameter / field | Mode |
| --- | --- | --- |
| `filters` | `-` | - |
| `filter` | `[none:TRANSACTION DATE WORKDAYS:qk]` | - |
| `filter` | `[none:PART NUMBER GROUP:nk]` | - |
| `filter` | `[none:FM DEPARTMENT:nk]` | checkdropdown |
| `filter` | `[none:Calculation_596445500805165074:nk]` | checkdropdown |
| `color` | `[usr:Calculation_596445500775444480:vtnone:nk]` | - |
| `filter` | `[none:DAY:nk]` | - |
| `filter` | `[none:TRANSACTION DATE WORKDAYS:ok]` | checkdropdown |
| `filter` | `[:Measure Names]` | - |
| `filter` | `[none:TRANSACTION DATE:qk]` | - |
| `color` | `[sum:TRANSACTION QUANTITY:vtavg:qk]` | - |
| `color` | `[sum:TRANSACTION QUANTITY:vtsum:qk]` | - |
| `color` | `[usr:Calculation_596445500799389713:vtsum:qk]` | - |

### Primary Worksheet Shelves and Marks

| Worksheet | Rows | Columns | Marks | Color fields |
| --- | --- | --- | --- | --- |
| `Avgs Legend Label` | - | - | Bar | - |
| `DAGR Move Transactions Value Stream Avgs` | ([sqlproxy.1rxvn8u0wahj4c10txghv153cvxp].[none:PART NUMBER GROUP:nk] / [sqlproxy.1rxvn8u0wahj4c10txghv153cvxp].[none:FM OP SEQ NUM:ok]) | ([sqlproxy.1rxvn8u0wahj4c10txghv153cvxp].[none:FISCAL_WEEK:nk] / ([sqlproxy.1rxvn8u0wahj4c10txghv153cvxp].[none:FISCAL_MONTH:nk] / ([sqlproxy.1rxvn8u0wahj4c10txghv153cvxp].[none:TRANSACTION DATE WORKDAYS:ok] / [sqlproxy.1rxvn8u0wahj4c10txghv153cvxp].[:Measure Names]))) | Bar | - |
| `NavFire Move Transactions Value Stream Avgs` | ([sqlproxy.1rxvn8u0wahj4c10txghv153cvxp].[none:PART NUMBER GROUP:nk] / [sqlproxy.1rxvn8u0wahj4c10txghv153cvxp].[none:FM OP SEQ NUM:ok]) | ([sqlproxy.1rxvn8u0wahj4c10txghv153cvxp].[none:FISCAL_WEEK:nk] / ([sqlproxy.1rxvn8u0wahj4c10txghv153cvxp].[none:FISCAL_MONTH:nk] / ([sqlproxy.1rxvn8u0wahj4c10txghv153cvxp].[none:TRANSACTION DATE WORKDAYS:ok] / [sqlproxy.1rxvn8u0wahj4c10txghv153cvxp].[:Measure Names]))) | Bar | - |
| `Roll Over Monday Validation` | ([sqlproxy.1rxvn8u0wahj4c10txghv153cvxp].[none:TRANSACTION DATE WORKDAYS:ok] / ([sqlproxy.1rxvn8u0wahj4c10txghv153cvxp].[none:TRANSACTION DATE:ok] / ([sqlproxy.1rxvn8u0wahj4c10txghv153cvxp].[none:Calculation_2084040754188574720:ok] / [sqlproxy.1rxvn8u0wahj4c10txghv153cvxp].[none:DAY:nk]))) | ([sqlproxy.1rxvn8u0wahj4c10txghv153cvxp].[none:FM OP SEQ NUM:ok] / [sqlproxy.1rxvn8u0wahj4c10txghv153cvxp].[none:FM OP DESC:nk]) | Automatic | - |
| `Sheet 11` | - | - | Automatic | - |
| `With Grand Totals and Avg` | ([sqlproxy.1rxvn8u0wahj4c10txghv153cvxp].[none:PART NUMBER GROUP:nk] / [sqlproxy.1rxvn8u0wahj4c10txghv153cvxp].[none:FM OP SEQ NUM:ok]) | ([sqlproxy.1rxvn8u0wahj4c10txghv153cvxp].[none:FISCAL_MONTH:nk] / ([sqlproxy.1rxvn8u0wahj4c10txghv153cvxp].[none:FISCAL_WEEK:nk] / ([sqlproxy.1rxvn8u0wahj4c10txghv153cvxp].[none:TRANSACTION DATE:ok] / [sqlproxy.1rxvn8u0wahj4c10txghv153cvxp].[:Measure Names]))) | Bar | - |
| `With Grand Totals and Avg (2)` | ([sqlproxy.1rxvn8u0wahj4c10txghv153cvxp].[none:PART NUMBER GROUP:nk] / [sqlproxy.1rxvn8u0wahj4c10txghv153cvxp].[none:FM OP SEQ NUM:ok]) | ([sqlproxy.1rxvn8u0wahj4c10txghv153cvxp].[none:FISCAL_MONTH:nk] / ([sqlproxy.1rxvn8u0wahj4c10txghv153cvxp].[none:FISCAL_WEEK:nk] / ([sqlproxy.1rxvn8u0wahj4c10txghv153cvxp].[none:TRANSACTION DATE:ok] / [sqlproxy.1rxvn8u0wahj4c10txghv153cvxp].[:Measure Names]))) | Bar | - |
| `zz.Data Refresh Caption` | - | - | Automatic | - |
| `zz.EmailMe` | - | - | Shape | - |
| `zz.TeamsMsg` | - | - | Shape | - |
| `zz.deprecarted_NavStorm Move Transactions Value Stream Avg` | ([sqlproxy.1rxvn8u0wahj4c10txghv153cvxp].[none:PART NUMBER GROUP:nk] / [sqlproxy.1rxvn8u0wahj4c10txghv153cvxp].[none:FM OP SEQ NUM:ok]) | ([sqlproxy.1rxvn8u0wahj4c10txghv153cvxp].[none:FISCAL_MONTH:nk] / ([sqlproxy.1rxvn8u0wahj4c10txghv153cvxp].[none:FISCAL_WEEK:nk] / ([sqlproxy.1rxvn8u0wahj4c10txghv153cvxp].[none:TRANSACTION DATE:ok] / [sqlproxy.1rxvn8u0wahj4c10txghv153cvxp].[:Measure Names]))) | Bar | - |

### Worksheet Filters and Selections

| Worksheet | Filter class | Field | Selection / groupfilter |
| --- | --- | --- | --- |
| `Avgs Legend Label` | `categorical` | `[none:Calculation_976436696581128192:nk]` | - |
| `DAGR Move Transactions Value Stream Avgs` | `categorical` | `[:Measure Names]` | - |
| `DAGR Move Transactions Value Stream Avgs` | `categorical` | `[none:Calculation_596445500805165074:nk]` | - |
| `DAGR Move Transactions Value Stream Avgs` | `categorical` | `[none:FM DEPARTMENT:nk]` | - |
| `DAGR Move Transactions Value Stream Avgs` | `categorical` | `[none:PART NUMBER GROUP:nk]` | - |
| `DAGR Move Transactions Value Stream Avgs` | `relative-date` | `[none:TRANSACTION DATE WORKDAYS:qk]` | - |
| `NavFire Move Transactions Value Stream Avgs` | `categorical` | `[:Measure Names]` | - |
| `NavFire Move Transactions Value Stream Avgs` | `categorical` | `[none:Calculation_596445500805165074:nk]` | - |
| `NavFire Move Transactions Value Stream Avgs` | `categorical` | `[none:FM DEPARTMENT:nk]` | - |
| `NavFire Move Transactions Value Stream Avgs` | `categorical` | `[none:PART NUMBER GROUP:nk]` | - |
| `NavFire Move Transactions Value Stream Avgs` | `relative-date` | `[none:TRANSACTION DATE WORKDAYS:qk]` | - |
| `Roll Over Monday Validation` | `categorical` | `[none:DAY:nk]` | - |
| `Roll Over Monday Validation` | `categorical` | `[none:PART NUMBER:nk]` | - |
| `Roll Over Monday Validation` | `categorical` | `[none:TRANSACTION DATE WORKDAYS:ok]` | - |
| `With Grand Totals and Avg` | `categorical` | `[:Measure Names]` | - |
| `With Grand Totals and Avg` | `relative-date` | `[none:TRANSACTION DATE:qk]` | - |
| `With Grand Totals and Avg (2)` | `categorical` | `[:Measure Names]` | - |
| `With Grand Totals and Avg (2)` | `relative-date` | `[none:TRANSACTION DATE:qk]` | - |
| `zz.Data Refresh Caption` | `categorical` | `[none:Calculation_976436696581128192:nk]` | - |
| `zz.deprecarted_NavStorm Move Transactions Value Stream Avg` | `categorical` | `[:Measure Names]` | - |
| `zz.deprecarted_NavStorm Move Transactions Value Stream Avg` | `categorical` | `[none:Calculation_596445500805165074:nk]` | - |
| `zz.deprecarted_NavStorm Move Transactions Value Stream Avg` | `categorical` | `[none:FM DEPARTMENT:nk]` | - |
| `zz.deprecarted_NavStorm Move Transactions Value Stream Avg` | `categorical` | `[none:PART NUMBER GROUP:nk]` | - |
| `zz.deprecarted_NavStorm Move Transactions Value Stream Avg` | `relative-date` | `[none:TRANSACTION DATE:qk]` | - |

### Fields Used by Primary Worksheet

- `Avgs Legend Label`: `Blank`
- `DAGR Move Transactions Value Stream Avgs`: `Color Coding`, `MIN(1)`, `Op No + Desc`, `[FISCAL_MONTH]`, `[FISCAL_WEEK]`, `[FM DEPARTMENT]`, `[FM OP DESC]`, `[FM OP SEQ NUM]`, `[PART NUMBER GROUP]`, `[TRANSACTION DATE WORKDAYS]`, `[TRANSACTION QUANTITY]`
- `NavFire Move Transactions Value Stream Avgs`: `Color Coding`, `MIN(1)`, `Op No + Desc`, `[FISCAL_MONTH]`, `[FISCAL_WEEK]`, `[FM DEPARTMENT]`, `[FM OP DESC]`, `[FM OP SEQ NUM]`, `[PART NUMBER GROUP]`, `[TRANSACTION DATE WORKDAYS]`, `[TRANSACTION QUANTITY]`
- `Roll Over Monday Validation`: `TRANSACTION DATE WORKDAYS2`, `[DAY]`, `[FM OP DESC]`, `[FM OP SEQ NUM]`, `[PART NUMBER]`, `[TRANSACTION DATE WORKDAYS]`, `[TRANSACTION DATE]`, `[TRANSACTION QUANTITY]`
- `Sheet 11`: No datasource dependency fields recovered.
- `With Grand Totals and Avg`: `MIN(1)`, `[FISCAL_MONTH]`, `[FISCAL_WEEK]`, `[FM OP SEQ NUM]`, `[PART NUMBER GROUP]`, `[TRANSACTION DATE]`, `[TRANSACTION QUANTITY]`
- `With Grand Totals and Avg (2)`: `-SUM([TRANSACTION QUANTITY])`, `MIN(1)`, `[FISCAL_MONTH]`, `[FISCAL_WEEK]`, `[FM OP SEQ NUM]`, `[PART NUMBER GROUP]`, `[TRANSACTION DATE]`, `[TRANSACTION QUANTITY]`
- `zz.Data Refresh Caption`: `Blank`
- `zz.EmailMe`: `Email`
- `zz.TeamsMsg`: `Teams`
- `zz.deprecarted_NavStorm Move Transactions Value Stream Avg`: `Color Coding`, `MIN(1)`, `Op No + Desc`, `[FISCAL_MONTH]`, `[FISCAL_WEEK]`, `[FM DEPARTMENT]`, `[FM OP DESC]`, `[FM OP SEQ NUM]`, `[PART NUMBER GROUP]`, `[TRANSACTION DATE]`, `[TRANSACTION QUANTITY]`

## Calculations

Recovered `9` calculated field definitions from static workbook XML.

### Calculated Fields

| Calculated field | Datasource | Formula |
| --- | --- | --- |
| `Top Customers` | `Parameters` | `5` |
| `Profit Bin Size` | `Parameters` | `200` |
| `Email` | `PROD_MoveTransactions_ValueStream (NavFire)` | `"Email Me Here"` |
| `Teams` | `PROD_MoveTransactions_ValueStream (NavFire)` | `"Write a Teams Message"` |
| `Rollover Monday Sum` | `PROD_MoveTransactions_ValueStream (NavFire)` | `{FIXED [TRANSACTION DATE WORKDAYS]: SUM([TRANSACTION QUANTITY])}` |
| `TRANSACTION DATE WORKDAYS2` | `PROD_MoveTransactions_ValueStream (NavFire)` | `DATE([TRANSACTION DATE WORKDAYS]-(1/24))` |
| `Color Coding` | `PROD_MoveTransactions_ValueStream (NavFire)` | `IF SUM([TRANSACTION QUANTITY])<6 THEN '<6' ELSEIF SUM([TRANSACTION QUANTITY])>=6 AND SUM([TRANSACTION QUANTITY]) <8 THEN '>=6&<8' ELSEIF SUM([TRANSACTION QUANTITY])>=8 AND SUM([TRANSACTION QUANTITY]) <12 THEN'>=8&<12' ELSEIF SUM([TRANSACTION QUANTITY])>=12 THEN '>=12' END` |
| `Op No + Desc` | `PROD_MoveTransactions_ValueStream (NavFire)` | `STR([FM OP SEQ NUM])+'_'+[FM OP DESC]` |
| `Blank` | `PROD_MoveTransactions_ValueStream (NavFire)` | `""` |

### Calculation Field Dependencies

| Calculated field | Referenced fields |
| --- | --- |
| `Top Customers` | - |
| `Profit Bin Size` | - |
| `Email` | - |
| `Teams` | - |
| `Rollover Monday Sum` | `TRANSACTION DATE WORKDAYS`, `TRANSACTION QUANTITY` |
| `TRANSACTION DATE WORKDAYS2` | `TRANSACTION DATE WORKDAYS` |
| `Color Coding` | `TRANSACTION QUANTITY` |
| `Op No + Desc` | `FM OP DESC`, `FM OP SEQ NUM` |
| `Blank` | - |

### Calculation Lineage Notes

Calculation lineage should be read against the likely static repo matches above; these matches are inferred from naming convention and local files.

Calculated fields were recovered from: `PROD_MoveTransactions_ValueStream (NavFire)`, `Parameters`.

### LOD and Table Calculation Summary

| Metric | Count | Fields |
| --- | ---: | --- |
| LOD calculations | 1 | Rollover Monday Sum |
| Table calculations | 0 | - |

## Color and Legend Notes

| Source | Color / legend detail |
| --- | --- |
| Workbook card | `color` for `[usr:Calculation_596445500775444480:vtnone:nk]` |
| Workbook card | `color` for `[sum:TRANSACTION QUANTITY:vtavg:qk]` |
| Workbook card | `color` for `[sum:TRANSACTION QUANTITY:vtsum:qk]` |
| Workbook card | `color` for `[usr:Calculation_596445500799389713:vtsum:qk]` |
