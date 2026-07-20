# Horizontal WIP Dash

## Tabular Report

| Attribute | Value |
| --- | --- |
| Source workbook | `tableau/my-tableau-dashboards/PROD_HorizontalWIP.twbx` |
| Embedded TWB | `PROD_HorizontalWIP.twb` |
| Primary dashboard | `Horizontal WIP Dash` |
| Dashboard count | 1 |
| Worksheet count | 4 |
| Datasource count | 1 |
| Calculated field count | 2 |
| LOD calculation count | 0 |
| Table calculation count | 0 |
| Screenshot | `docs/tableau_workbook_analysis/prod-horizontal-wip/Horizontal-WIP-Dash.jpeg` |

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
| `PROD_HorizontalWIP` | `sqlproxy.0o47a9n0e67rqs1g8ms8513or8np` | collection, [sqlproxy], [sqlproxy], [sqlproxy], [sqlproxy], [sqlproxy], [sqlproxy] |

### Likely dbt / SQL or Seed Lineage Guess

| Likely file | Match score | Static reason |
| --- | ---: | --- |
| `models/4_marts/horizontal_wip.sql` | 196.0 | normalized substring; shared tokens: horizontal, wip |
| `knowledgebase/tableau/PROD_HorizontalWIP_tableau_data_catalog_lineage.md` | 106.0 | normalized substring; shared tokens: horizontal, wip |
| `knowledgebase/tableau/Pivots_HorizontalWIP_PROD_tableau_data_catalog_lineage.md` | 16.0 | shared tokens: horizontal, wip |
| `models/3_intermediate/int_horizontal_wip.sql` | 16.0 | shared tokens: horizontal, wip |
| `models/3_intermediate/int_horizontal_wip_released_unreleased.sql` | 16.0 | shared tokens: horizontal, wip |
| `models/4_marts/horizontal_wip_agg_qty_to_move.sql` | 16.0 | shared tokens: horizontal, wip |
| `models/4_marts/horizontal_wip_qty_in_queue_gt_0.sql` | 16.0 | shared tokens: horizontal, wip |
| `models/9_optimized_compiled_sql/minus_horizontal_wip.sql` | 16.0 | shared tokens: horizontal, wip |
| `analyses/recommend_me_columns_initial/wip/rmc_wip_discrete_jobs.sql` | 8.0 | shared tokens: wip |
| `analyses/recommend_me_columns_initial/wip/rmc_wip_move_transactions.sql` | 8.0 | shared tokens: wip |

## Sheet Inventory

| Worksheet | Datasources | Field count | Filter count | Marks |
| --- | --- | ---: | ---: | --- |
| `Dummy Sheet` | sqlproxy.0o47a9n0e67rqs1g8ms8513or8np | 4 | 0 | Automatic |
| `Horizontal WIP Sheet` | sqlproxy.0o47a9n0e67rqs1g8ms8513or8np | 23 | 8 | Automatic |
| `Sheet 4` | sqlproxy.0o47a9n0e67rqs1g8ms8513or8np | 7 | 1 | Automatic |
| `zz.DataRefresh` | sqlproxy.0o47a9n0e67rqs1g8ms8513or8np | 4 | 1 | Automatic |

### Filter Cards and Visible Controls

| Type | Parameter / field | Mode |
| --- | --- | --- |
| `filters` | `-` | - |
| `filter` | `[my:JOB SCHEDULED START DATE:ok]` | checkdropdown |
| `filter` | `[my:LINE SCHEDULED SHIP DATE:ok]` | checkdropdown |
| `filter` | `[none:PLANNER:nk]` | checkdropdown |
| `filter` | `[none:PROGRAM:nk]` | checkdropdown |
| `filter` | `[none:DEPARTMENT CODE:nk]` | checkdropdown |
| `filter` | `[none:PART NUMBER:nk]` | checkdropdown |
| `filter` | `[none:SO NUMBER:nk]` | checkdropdown |
| `filter` | `[none:JOB NAME:nk]` | checkdropdown |

### Primary Worksheet Shelves and Marks

| Worksheet | Rows | Columns | Marks | Color fields |
| --- | --- | --- | --- | --- |
| `Dummy Sheet` | - | - | Automatic | - |
| `Horizontal WIP Sheet` | ([sqlproxy.0o47a9n0e67rqs1g8ms8513or8np].[none:PLANNER:nk] / ([sqlproxy.0o47a9n0e67rqs1g8ms8513or8np].[none:PROGRAM:nk] / ([sqlproxy.0o47a9n0e67rqs1g8ms8513or8np].[none:PART NUMBER:nk] / ([sqlproxy.0o47a9n0e67rqs1g8ms8513or8np].[none:PART DESCRIPTION:nk] / ([sqlproxy.0o47a9n0e67rqs1g8ms8513or8np].[none:JOB STATUS:nk] / ([sqlproxy.0o47a9n0e67rqs1g8ms8513or8np].[none:JOB NAME:nk] / ([sqlproxy.0o47a9n0e67rqs1g8ms8513or8np].[none:OP SEQ NUM:ok] / ([sqlproxy.0o47a9n0e67rqs1g8ms8513or8np].[none:OP DESC:nk] / ([sqlproxy.0o47a9n0e67rqs1g8ms8513or8np].[none:DEPARTMENT CODE:nk] / ([sqlproxy.0o47a9n0e67rqs1g8ms8513or8np].[none:JOB SCHEDULED START DATE:ok] / ([sqlproxy.0o47a9n0e67rqs1g8ms8513or8np].[none:JOB SCHEDULED COMPLETION DATE:ok] / ([sqlproxy.0o47a9n0e67rqs1g8ms8513or8np].[none:SO NUMBER:nk] / ([sqlproxy.0o47a9n0e67rqs1g8ms8513or8np].[none:LINE SCHEDULED SHIP DATE:ok] / [sqlproxy.0o47a9n0e67rqs1g8ms8513or8np].[none:SO LINE NUMBER:ok]))))))))))))) | [:Measure Names] | Automatic | - |
| `Sheet 4` | ([sqlproxy.0o47a9n0e67rqs1g8ms8513or8np].[none:JOB NAME:nk] / [sqlproxy.0o47a9n0e67rqs1g8ms8513or8np].[none:OP SEQ NUM:ok]) | [:Measure Names] | Automatic | - |
| `zz.DataRefresh` | - | - | Automatic | - |

### Worksheet Filters and Selections

| Worksheet | Filter class | Field | Selection / groupfilter |
| --- | --- | --- | --- |
| `Horizontal WIP Sheet` | `categorical` | `[:Measure Names]` | - |
| `Horizontal WIP Sheet` | `categorical` | `[my:LINE SCHEDULED SHIP DATE:ok]` | - |
| `Horizontal WIP Sheet` | `categorical` | `[none:DEPARTMENT CODE:nk]` | - |
| `Horizontal WIP Sheet` | `categorical` | `[none:JOB CLASS CODE:nk]` | - |
| `Horizontal WIP Sheet` | `categorical` | `[none:JOB NAME:nk]` | - |
| `Horizontal WIP Sheet` | `categorical` | `[none:OP DESC:nk]` | - |
| `Horizontal WIP Sheet` | `categorical` | `[none:PART NUMBER:nk]` | - |
| `Horizontal WIP Sheet` | `categorical` | `[none:SO NUMBER:nk]` | - |
| `Sheet 4` | `categorical` | `[:Measure Names]` | - |
| `zz.DataRefresh` | `categorical` | `[none:Calculation_916201071712772096:nk]` | - |

### Fields Used by Primary Worksheet

- `Dummy Sheet`: `JOB SCHED START DATE`, `ToolTip`, `[PLANNER]`, `[PROGRAM]`
- `Horizontal WIP Sheet`: `JOB SCHED COMPLETION DATE`, `JOB SCHED START DATE`, `OP QTY COMPLETED`, `OP QTY IN QUEUE`, `OP QTY OPEN`, `OP QTY SCRAPPED`, `OP SCHEDULED QTY`, `SCHEDULED DELIVERY DATE`, `[DEPARTMENT CODE]`, `[JOB CLASS CODE]`, `[JOB NAME]`, `[JOB QUANTITY REMAINING]`, `[JOB STATUS]`, `[OP DESC]`, `[OP QTY TO MOVE]`, `[OP QUANTITY REJECTED]`, `[OP SEQ NUM]`, `[PART DESCRIPTION]`, `[PART NUMBER]`, `[PLANNER]`, `[PROGRAM]`, `[SO LINE NUMBER]`, `[SO NUMBER]`
- `Sheet 4`: `JOB SCHED START DATE`, `OP QTY COMPLETED`, `OP QTY IN QUEUE`, `[JOB NAME]`, `[OP SEQ NUM]`, `[PLANNER]`, `[PROGRAM]`
- `zz.DataRefresh`: `JOB SCHED START DATE`, `ToolTip`, `[PLANNER]`, `[PROGRAM]`

## Calculations

Recovered `2` calculated field definitions from static workbook XML.

### Calculated Fields

| Calculated field | Datasource | Formula |
| --- | --- | --- |
| `OP QTY OPEN` | `PROD_HorizontalWIP` | `[OP SCHEDULED QUANTITY]-[OP QUANTITY COMPLETED]-[OP QUANTITY REJECTED]-[OP QUANTITY SCRAPPED]` |
| `ToolTip` | `PROD_HorizontalWIP` | `'Tooltip'` |

### Calculation Field Dependencies

| Calculated field | Referenced fields |
| --- | --- |
| `OP QTY OPEN` | `OP QUANTITY COMPLETED`, `OP QUANTITY REJECTED`, `OP QUANTITY SCRAPPED`, `OP SCHEDULED QUANTITY` |
| `ToolTip` | - |

### Calculation Lineage Notes

Calculation lineage should be read against the likely static repo matches above; these matches are inferred from naming convention and local files.

Calculated fields were recovered from: `PROD_HorizontalWIP`.

### LOD and Table Calculation Summary

| Metric | Count | Fields |
| --- | ---: | --- |
| LOD calculations | 0 | - |
| Table calculations | 0 | - |

## Color and Legend Notes

No explicit color encoding or legend card elements were recovered from static workbook XML.
