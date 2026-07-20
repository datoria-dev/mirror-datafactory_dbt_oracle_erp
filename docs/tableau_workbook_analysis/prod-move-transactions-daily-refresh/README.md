# Move Transac. by Op Desc

## Tabular Report

| Attribute | Value |
| --- | --- |
| Source workbook | `tableau/my-tableau-dashboards/PROD_MoveTransactionsDailyRefresh.twbx` |
| Embedded TWB | `PROD_MoveTransactionsDailyRefresh.twb` |
| Primary dashboard | `Move Transac. by Op Desc` |
| Dashboard count | 1 |
| Worksheet count | 5 |
| Datasource count | 1 |
| Calculated field count | 5 |
| LOD calculation count | 0 |
| Table calculation count | 1 |
| Screenshot | `docs/tableau_workbook_analysis/prod-move-transactions-daily-refresh/Move-Transac-by-Op-Desc.jpeg` |

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
| `PROD_MoveTransactions__DailyRefresh` | `sqlproxy.0q7p7ro0izhwv31cl6l2q056rr4d` | [sqlproxy], [Extract].[Extract], [sqlproxy], [Extract].[Extract] |

### Likely dbt / SQL or Seed Lineage Guess

| Likely file | Match score | Static reason |
| --- | ---: | --- |
| `models/9_optimized_compiled_sql/PROD_MoveTransactions.sql` | 106.0 | normalized substring; shared tokens: move, transactions |
| `analyses/recommend_me_columns_initial/wip/rmc_wip_move_transactions.sql` | 16.0 | shared tokens: move, transactions |
| `knowledgebase/tableau/PROD_MoveTransactions_tableau_data_catalog_lineage.md` | 16.0 | shared tokens: move, transactions |
| `models/1_sources/wip/src_wip_move_transactions_14days.sql` | 16.0 | shared tokens: move, transactions |
| `models/1_sources/wip/src_wip_move_transactions_30days.sql` | 16.0 | shared tokens: move, transactions |
| `models/1_sources/wip/src_wip_move_transactions_365days.sql` | 16.0 | shared tokens: move, transactions |
| `models/1_sources/wip/src_wip_move_transactions_45days.sql` | 16.0 | shared tokens: move, transactions |
| `models/3_intermediate/int_move_trxns_dynamic_daily_rate.sql` | 16.0 | shared tokens: daily, move |
| `models/3_intermediate/int_move_trxns_dynamic_daily_rate_part2.sql` | 16.0 | shared tokens: daily, move |
| `models/3_intermediate/int_wip_nettable_credit_op_step_for_queue_to_move_types.sql` | 16.0 | shared tokens: move, op |

## Sheet Inventory

| Worksheet | Datasources | Field count | Filter count | Marks |
| --- | --- | ---: | ---: | --- |
| `Move Transactions by Op Desc` | sqlproxy.0q7p7ro0izhwv31cl6l2q056rr4d | 10 | 8 | Square |
| `Sheet 2` | - | 0 | 0 | Automatic |
| `zz.Data Refresh Caption` | sqlproxy.0q7p7ro0izhwv31cl6l2q056rr4d | 1 | 1 | Automatic |
| `zz.EmailMe` | sqlproxy.0q7p7ro0izhwv31cl6l2q056rr4d | 1 | 0 | Shape |
| `zz.TeamsMsg` | sqlproxy.0q7p7ro0izhwv31cl6l2q056rr4d | 1 | 0 | Shape |

### Filter Cards and Visible Controls

| Type | Parameter / field | Mode |
| --- | --- | --- |
| `filters` | `-` | - |

### Primary Worksheet Shelves and Marks

| Worksheet | Rows | Columns | Marks | Color fields |
| --- | --- | --- | --- | --- |
| `Move Transactions by Op Desc` | [none:TRANSACTION DATE (copy)_128071114934075393:ok] | ([sqlproxy.0q7p7ro0izhwv31cl6l2q056rr4d].[none:FM OP SEQ NUM:ok] / [sqlproxy.0q7p7ro0izhwv31cl6l2q056rr4d].[none:FM OP DESC:nk]) | Square | - |
| `Sheet 2` | - | - | Automatic | - |
| `zz.Data Refresh Caption` | - | - | Automatic | - |
| `zz.EmailMe` | - | - | Shape | - |
| `zz.TeamsMsg` | - | - | Shape | - |

### Worksheet Filters and Selections

| Worksheet | Filter class | Field | Selection / groupfilter |
| --- | --- | --- | --- |
| `Move Transactions by Op Desc` | `categorical` | `[none:FM DEPARTMENT:nk]` | - |
| `Move Transactions by Op Desc` | `categorical` | `[none:FM OP DESC:nk]` | - |
| `Move Transactions by Op Desc` | `categorical` | `[none:FM OP SEQ NUM:ok]` | - |
| `Move Transactions by Op Desc` | `categorical` | `[none:PART NUMBER:nk]` | - |
| `Move Transactions by Op Desc` | `categorical` | `[none:TO DEPARTMENT:nk]` | - |
| `Move Transactions by Op Desc` | `categorical` | `[none:TO OP SEQ NUM:ok]` | - |
| `Move Transactions by Op Desc` | `quantitative` | `[none:TRANSACTION DATE (copy)_128071114934075393:qk]` | - |
| `Move Transactions by Op Desc` | `categorical` | `[none:WIP ENTITY NAME:nk]` | - |
| `zz.Data Refresh Caption` | `categorical` | `[none:Calculation_976436696581128192:nk]` | - |

### Fields Used by Primary Worksheet

- `Move Transactions by Op Desc`: `TRANSACTION DATE CST`, `TRANSACTION DATETIME`, `[FM DEPARTMENT]`, `[FM OP DESC]`, `[FM OP SEQ NUM]`, `[PART NUMBER]`, `[TO DEPARTMENT]`, `[TO OP SEQ NUM]`, `[TRANSACTION QUANTITY]`, `[WIP ENTITY NAME]`
- `Sheet 2`: No datasource dependency fields recovered.
- `zz.Data Refresh Caption`: `Blank`
- `zz.EmailMe`: `Email`
- `zz.TeamsMsg`: `Teams`

## Calculations

Recovered `5` calculated field definitions from static workbook XML.

### Calculated Fields

| Calculated field | Datasource | Formula |
| --- | --- | --- |
| `Transactions 7-Day Rolling Avg` | `PROD_MoveTransactions__DailyRefresh` | `WINDOW_AVG(SUM([TRANSACTION QUANTITY]),-6,0)` |
| `Email` | `PROD_MoveTransactions__DailyRefresh` | `"Email Me Here"` |
| `Teams` | `PROD_MoveTransactions__DailyRefresh` | `"Write a Teams Message"` |
| `Blank` | `PROD_MoveTransactions__DailyRefresh` | `' '` |
| `TRANSACTION DATE CST` | `PROD_MoveTransactions__DailyRefresh` | `DATE([TRANSACTION DATE]-(1/24))` |

### Calculation Field Dependencies

| Calculated field | Referenced fields |
| --- | --- |
| `Transactions 7-Day Rolling Avg` | `TRANSACTION QUANTITY` |
| `Email` | - |
| `Teams` | - |
| `Blank` | - |
| `TRANSACTION DATE CST` | `TRANSACTION DATE` |

### Calculation Lineage Notes

Calculation lineage should be read against the likely static repo matches above; these matches are inferred from naming convention and local files.

Calculated fields were recovered from: `PROD_MoveTransactions__DailyRefresh`.

### LOD and Table Calculation Summary

| Metric | Count | Fields |
| --- | ---: | --- |
| LOD calculations | 0 | - |
| Table calculations | 1 | Transactions 7-Day Rolling Avg |

## Color and Legend Notes

No explicit color encoding or legend card elements were recovered from static workbook XML.
