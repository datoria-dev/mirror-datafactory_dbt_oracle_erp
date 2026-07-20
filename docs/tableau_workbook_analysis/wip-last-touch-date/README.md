# WIP Last Touch Date Dashboard

## Tabular Report

| Attribute | Value |
| --- | --- |
| Source workbook | `tableau/my-tableau-dashboards/WIP Last Touch Date.twb` |
| Embedded TWB | `WIP Last Touch Date.twb` |
| Primary dashboard | `WIP Last Touch Date Dashboard` |
| Dashboard count | 1 |
| Worksheet count | 2 |
| Datasource count | 1 |
| Calculated field count | 0 |
| LOD calculation count | 0 |
| Table calculation count | 0 |
| Screenshot | `No matching screenshot found` |

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
| `wip_open_qtys_date_last_moved` | `sqlproxy.1sbl1sn0o465mq1ctzzmw0doz1bb` | [sqlproxy], [sqlproxy] |

### Likely dbt / SQL or Seed Lineage Guess

| Likely file | Match score | Static reason |
| --- | ---: | --- |
| `models/4_marts/wip_open_qtys_date_last_moved.sql` | 148.0 | exact normalized name; shared tokens: date, last, moved, open, qtys, wip |
| `models/9_optimized_compiled_sql/minus_wip_open_qtys_date_last_moved.sql` | 93.0 | normalized substring; shared tokens: date, last, moved, open, qtys, wip |
| `knowledgebase/tableau/Employee_WIP_Moves_Last_365_Days_tableau_data_catalog_lineage.md` | 16.0 | shared tokens: last, wip |
| `analyses/recommend_me_columns_initial/wip/rmc_wip_discrete_jobs.sql` | 8.0 | shared tokens: wip |
| `analyses/recommend_me_columns_initial/wip/rmc_wip_move_transactions.sql` | 8.0 | shared tokens: wip |
| `analyses/recommend_me_columns_initial/wip/rmc_wip_operation_resources.sql` | 8.0 | shared tokens: wip |
| `analyses/recommend_me_columns_initial/wip/rmc_wip_operations.sql` | 8.0 | shared tokens: wip |
| `analyses/recommend_me_columns_initial/wip/rmc_wip_period_balances.sql` | 8.0 | shared tokens: wip |
| `analyses/recommend_me_columns_initial/wip/rmc_wip_requirement_operations.sql` | 8.0 | shared tokens: wip |
| `analyses/recommend_me_columns_initial/wip/rmc_wip_transaction_accounts.sql` | 8.0 | shared tokens: wip |

## Sheet Inventory

| Worksheet | Datasources | Field count | Filter count | Marks |
| --- | --- | ---: | ---: | --- |
| `Last Touch Date Data Details` | sqlproxy.1sbl1sn0o465mq1ctzzmw0doz1bb | 9 | 7 | Automatic |
| `Sum Op in Queue over Last Touch Date` | sqlproxy.1sbl1sn0o465mq1ctzzmw0doz1bb | 5 | 4 | Automatic |

### Filter Cards and Visible Controls

| Type | Parameter / field | Mode |
| --- | --- | --- |
| `filters` | `-` | - |

### Primary Worksheet Shelves and Marks

| Worksheet | Rows | Columns | Marks | Color fields |
| --- | --- | --- | --- | --- |
| `Last Touch Date Data Details` | ([sqlproxy.1sbl1sn0o465mq1ctzzmw0doz1bb].[none:Last Touch Date:ok] / ([sqlproxy.1sbl1sn0o465mq1ctzzmw0doz1bb].[none:Planner:nk] / ([sqlproxy.1sbl1sn0o465mq1ctzzmw0doz1bb].[none:Part Number:nk] / ([sqlproxy.1sbl1sn0o465mq1ctzzmw0doz1bb].[none:Fm Op Step:nk] / ([sqlproxy.1sbl1sn0o465mq1ctzzmw0doz1bb].[none:WIP Job Status:nk] / ([sqlproxy.1sbl1sn0o465mq1ctzzmw0doz1bb].[none:Job Number:nk] / ([sqlproxy.1sbl1sn0o465mq1ctzzmw0doz1bb].[none:Job Scheduled Start Date:ok] / [sqlproxy.1sbl1sn0o465mq1ctzzmw0doz1bb].[none:Job Scheduled Completion Date:ok]))))))) | [:Measure Names] | Automatic | - |
| `Sum Op in Queue over Last Touch Date` | [sum:Fm Op Qty in Queue:qk] | [my:Last Touch Date:ok] | Automatic | - |

### Worksheet Filters and Selections

| Worksheet | Filter class | Field | Selection / groupfilter |
| --- | --- | --- | --- |
| `Last Touch Date Data Details` | `categorical` | `[:Measure Names]` | - |
| `Last Touch Date Data Details` | `categorical` | `[my:Last Touch Date:ok]` | - |
| `Last Touch Date Data Details` | `categorical` | `[none:Fm Op Step:nk]` | - |
| `Last Touch Date Data Details` | `categorical` | `[none:Job Number:nk]` | - |
| `Last Touch Date Data Details` | `categorical` | `[none:Part Number:nk]` | - |
| `Last Touch Date Data Details` | `categorical` | `[none:Planner:nk]` | - |
| `Last Touch Date Data Details` | `quantitative` | `[sum:Fm Op Qty in Queue:qk]` | - |
| `Sum Op in Queue over Last Touch Date` | `categorical` | `[my:Last Touch Date:ok]` | - |
| `Sum Op in Queue over Last Touch Date` | `categorical` | `[none:Fm Op Step:nk]` | - |
| `Sum Op in Queue over Last Touch Date` | `categorical` | `[none:Part Number:nk]` | - |
| `Sum Op in Queue over Last Touch Date` | `categorical` | `[none:Planner:nk]` | - |

### Fields Used by Primary Worksheet

- `Last Touch Date Data Details`: `[Fm Op Qty in Queue]`, `[Fm Op Step]`, `[Job Number]`, `[Job Scheduled Completion Date]`, `[Job Scheduled Start Date]`, `[Last Touch Date]`, `[Part Number]`, `[Planner]`, `[WIP Job Status]`
- `Sum Op in Queue over Last Touch Date`: `[Fm Op Qty in Queue]`, `[Fm Op Step]`, `[Last Touch Date]`, `[Part Number]`, `[Planner]`

## Calculations

Recovered `0` calculated field definitions from static workbook XML.

### Calculated Fields

No calculated fields were recovered from static workbook XML.

### Calculation Field Dependencies

No calculation dependencies were recovered.

### Calculation Lineage Notes

Calculation lineage should be read against the likely static repo matches above; these matches are inferred from naming convention and local files.

### LOD and Table Calculation Summary

| Metric | Count | Fields |
| --- | ---: | --- |
| LOD calculations | 0 | - |
| Table calculations | 0 | - |

## Color and Legend Notes

No explicit color encoding or legend card elements were recovered from static workbook XML.
