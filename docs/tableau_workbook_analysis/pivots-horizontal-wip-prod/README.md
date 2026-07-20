# WIP Matrix by Op Desc Dash

## Tabular Report

| Attribute | Value |
| --- | --- |
| Source workbook | `tableau/my-tableau-dashboards/Pivots_HorizontalWIP_PROD.twbx` |
| Embedded TWB | `Pivots_HorizontalWIP_PROD.twb` |
| Primary dashboard | `WIP Matrix by Op Desc Dash` |
| Dashboard count | 2 |
| Worksheet count | 4 |
| Datasource count | 1 |
| Calculated field count | 2 |
| LOD calculation count | 0 |
| Table calculation count | 0 |
| Screenshot | `docs/tableau_workbook_analysis/pivots-horizontal-wip-prod/WIP-Matrix-by-Op-Desc-Dash.jpeg` |

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
| `Pivots_HorizontalWIP_PROD` | `sqlproxy.0qgi40g17mrx0l184q23w1hrtihd` | collection, [sqlproxy], [sqlproxy], [sqlproxy], [sqlproxy], [sqlproxy], [sqlproxy] |

### Likely dbt / SQL or Seed Lineage Guess

| Likely file | Match score | Static reason |
| --- | ---: | --- |
| `knowledgebase/tableau/Pivots_HorizontalWIP_PROD_tableau_data_catalog_lineage.md` | 114.0 | normalized substring; shared tokens: horizontal, pivots, wip |
| `models/4_marts/horizontal_wip.sql` | 106.0 | normalized substring; shared tokens: horizontal, wip |
| `models/4_marts/horizontal_wip_agg_qty_to_move.sql` | 24.0 | shared tokens: horizontal, qty, wip |
| `models/4_marts/horizontal_wip_qty_in_queue_gt_0.sql` | 24.0 | shared tokens: horizontal, qty, wip |
| `knowledgebase/tableau/PROD_HorizontalWIP_tableau_data_catalog_lineage.md` | 16.0 | shared tokens: horizontal, wip |
| `models/3_intermediate/int_horizontal_wip.sql` | 16.0 | shared tokens: horizontal, wip |
| `models/3_intermediate/int_horizontal_wip_released_unreleased.sql` | 16.0 | shared tokens: horizontal, wip |
| `models/3_intermediate/int_wip_nettable_credit_op_step_for_queue_to_move_types.sql` | 16.0 | shared tokens: op, wip |
| `models/9_optimized_compiled_sql/minus_horizontal_wip.sql` | 16.0 | shared tokens: horizontal, wip |
| `analyses/recommend_me_columns_initial/wip/rmc_wip_discrete_jobs.sql` | 8.0 | shared tokens: wip |

## Sheet Inventory

| Worksheet | Datasources | Field count | Filter count | Marks |
| --- | --- | ---: | ---: | --- |
| `Dummy Sheet` | sqlproxy.0qgi40g17mrx0l184q23w1hrtihd | 4 | 1 | Automatic |
| `Matrix PN by Department over Qty` | sqlproxy.0qgi40g17mrx0l184q23w1hrtihd | 7 | 5 | Square |
| `Matrix by Op Desc over Qty` | sqlproxy.0qgi40g17mrx0l184q23w1hrtihd | 10 | 8 | Square |
| `zz_DataRefresh` | sqlproxy.0qgi40g17mrx0l184q23w1hrtihd | 4 | 2 | Automatic |

### Filter Cards and Visible Controls

| Type | Parameter / field | Mode |
| --- | --- | --- |
| `filters` | `-` | - |
| `filter` | `[none:OP QUANTITY IN QUEUE:qk]` | - |
| `filter` | `[none:JOB STATUS:nk]` | - |
| `filter` | `[none:PLANNER:nk]` | checkdropdown |
| `filter` | `[none:OP DESC:nk]` | checkdropdown |
| `filter` | `[none:DEPARTMENT CODE:nk]` | checkdropdown |
| `filter` | `[none:JOB NAME:nk]` | checkdropdown |
| `filter` | `[none:PART NUMBER:nk]` | checkdropdown |
| `filter` | `[none:JOB SCHEDULED START DATE:qk]` | - |
| `color` | `[sum:OP QUANTITY IN QUEUE:qk]` | - |

### Primary Worksheet Shelves and Marks

| Worksheet | Rows | Columns | Marks | Color fields |
| --- | --- | --- | --- | --- |
| `Dummy Sheet` | - | - | Automatic | - |
| `Matrix PN by Department over Qty` | [none:PART NUMBER:nk] | [none:DEPARTMENT CODE:nk] | Square | - |
| `Matrix by Op Desc over Qty` | [none:PART NUMBER:nk] | ([sqlproxy.0qgi40g17mrx0l184q23w1hrtihd].[none:OP SEQ NUM:ok] / [sqlproxy.0qgi40g17mrx0l184q23w1hrtihd].[none:OP DESC:nk]) | Square | - |
| `zz_DataRefresh` | - | - | Automatic | - |

### Worksheet Filters and Selections

| Worksheet | Filter class | Field | Selection / groupfilter |
| --- | --- | --- | --- |
| `Dummy Sheet` | `quantitative` | `[none:JOB SCHEDULED START DATE:qk]` | - |
| `Matrix PN by Department over Qty` | `categorical` | `[none:DEPARTMENT CODE:nk]` | - |
| `Matrix PN by Department over Qty` | `categorical` | `[none:JOB NAME:nk]` | - |
| `Matrix PN by Department over Qty` | `quantitative` | `[none:JOB SCHEDULED START DATE:qk]` | - |
| `Matrix PN by Department over Qty` | `categorical` | `[none:PART NUMBER:nk]` | - |
| `Matrix PN by Department over Qty` | `quantitative` | `[sum:OP QUANTITY IN QUEUE:qk]` | - |
| `Matrix by Op Desc over Qty` | `categorical` | `[my:JOB SCHEDULED COMPLETION DATE:ok]` | - |
| `Matrix by Op Desc over Qty` | `categorical` | `[none:DEPARTMENT CODE:nk]` | - |
| `Matrix by Op Desc over Qty` | `categorical` | `[none:JOB NAME:nk]` | - |
| `Matrix by Op Desc over Qty` | `categorical` | `[none:JOB STATUS:nk]` | - |
| `Matrix by Op Desc over Qty` | `categorical` | `[none:OP DESC:nk]` | - |
| `Matrix by Op Desc over Qty` | `quantitative` | `[none:OP QUANTITY IN QUEUE:qk]` | - |
| `Matrix by Op Desc over Qty` | `categorical` | `[none:PART NUMBER:nk]` | - |
| `Matrix by Op Desc over Qty` | `quantitative` | `[sum:OP QUANTITY IN QUEUE:qk]` | - |
| `zz_DataRefresh` | `categorical` | `[none:Calculation_916201071712772096:nk]` | - |
| `zz_DataRefresh` | `quantitative` | `[none:JOB SCHEDULED START DATE:qk]` | - |

### Fields Used by Primary Worksheet

- `Dummy Sheet`: `JOB SCHED START DATE`, `ToolTip`, `[PLANNER]`, `[PROGRAM]`
- `Matrix PN by Department over Qty`: `JOB SCHED START DATE`, `OP QTY IN QUEUE`, `[DEPARTMENT CODE]`, `[JOB NAME]`, `[PART NUMBER]`, `[PLANNER]`, `[PROGRAM]`
- `Matrix by Op Desc over Qty`: `JOB SCHED COMPLETION DATE`, `OP QTY IN QUEUE`, `[DEPARTMENT CODE]`, `[JOB NAME]`, `[JOB STATUS]`, `[OP DESC]`, `[OP SEQ NUM]`, `[PART NUMBER]`, `[PLANNER]`, `[PROGRAM]`
- `zz_DataRefresh`: `JOB SCHED START DATE`, `ToolTip`, `[PLANNER]`, `[PROGRAM]`

## Calculations

Recovered `2` calculated field definitions from static workbook XML.

### Calculated Fields

| Calculated field | Datasource | Formula |
| --- | --- | --- |
| `OP QTY OPEN` | `Pivots_HorizontalWIP_PROD` | `[OP SCHEDULED QUANTITY]-[OP QUANTITY COMPLETED]-[OP QUANTITY REJECTED]-[OP QUANTITY SCRAPPED]` |
| `ToolTip` | `Pivots_HorizontalWIP_PROD` | `'Tooltip'` |

### Calculation Field Dependencies

| Calculated field | Referenced fields |
| --- | --- |
| `OP QTY OPEN` | `OP QUANTITY COMPLETED`, `OP QUANTITY REJECTED`, `OP QUANTITY SCRAPPED`, `OP SCHEDULED QUANTITY` |
| `ToolTip` | - |

### Calculation Lineage Notes

Calculation lineage should be read against the likely static repo matches above; these matches are inferred from naming convention and local files.

Calculated fields were recovered from: `Pivots_HorizontalWIP_PROD`.

### LOD and Table Calculation Summary

| Metric | Count | Fields |
| --- | ---: | --- |
| LOD calculations | 0 | - |
| Table calculations | 0 | - |

## Color and Legend Notes

| Source | Color / legend detail |
| --- | --- |
| Workbook card | `color` for `[sum:OP QUANTITY IN QUEUE:qk]` |
