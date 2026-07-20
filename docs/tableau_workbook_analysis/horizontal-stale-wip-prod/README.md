# HORIZONTAL WIP STALE

## Tabular Report

| Attribute | Value |
| --- | --- |
| Source workbook | `tableau/my-tableau-dashboards/HorizontalStaleWIP_PROD.twbx` |
| Embedded TWB | `HorizontalStaleWIP_PROD.twb` |
| Primary dashboard | `HORIZONTAL WIP STALE` |
| Dashboard count | 1 |
| Worksheet count | 5 |
| Datasource count | 1 |
| Calculated field count | 3 |
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
| `HorizontalWIP 2.0_PROD` | `sqlproxy.02z6qx71w41oxv17vopfm1s3xtdc` | collection, [sqlproxy], [sqlproxy], [sqlproxy], [sqlproxy], [sqlproxy], [sqlproxy] |

### Likely dbt / SQL or Seed Lineage Guess

| Likely file | Match score | Static reason |
| --- | ---: | --- |
| `models/4_marts/horizontal_wip.sql` | 151.0 | normalized substring; shared tokens: horizontal, wip |
| `knowledgebase/tableau/PROD_HorizontalWIP_tableau_data_catalog_lineage.md` | 16.0 | shared tokens: horizontal, wip |
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
| `JOB QTY BURNDOWN` | sqlproxy.02z6qx71w41oxv17vopfm1s3xtdc | 11 | 8 | Bar |
| `WIP DETAILS` | sqlproxy.02z6qx71w41oxv17vopfm1s3xtdc | 16 | 11 | Automatic |
| `zz.Data Refresh Caption` | sqlproxy.02z6qx71w41oxv17vopfm1s3xtdc | 3 | 2 | Automatic |
| `zz.EmailMe` | sqlproxy.02z6qx71w41oxv17vopfm1s3xtdc | 3 | 1 | Shape |
| `zz.TeamsMsg` | sqlproxy.02z6qx71w41oxv17vopfm1s3xtdc | 3 | 1 | Shape |

### Filter Cards and Visible Controls

| Type | Parameter / field | Mode |
| --- | --- | --- |
| `filters` | `-` | - |
| `filter` | `[none:JOB STATUS (Custom SQL Query1):nk]` | - |
| `filter` | `[none:JOB CLASS CODE:nk]` | checkdropdown |
| `filter` | `[none:JOB SCHEDULED START DATE:qk]` | - |
| `color` | `[none:PLANNER:nk]` | - |
| `filter` | `[none:OP QUANTITY IN QUEUE:qk]` | - |
| `color` | `[:Measure Names]` | - |

### Primary Worksheet Shelves and Marks

| Worksheet | Rows | Columns | Marks | Color fields |
| --- | --- | --- | --- | --- |
| `JOB QTY BURNDOWN` | [__tableau_internal_object_id__].[cnt:_F8CE4D71350F4AC38412C4C69D8FE49B:qk] | ([sqlproxy.02z6qx71w41oxv17vopfm1s3xtdc].[yr:JOB SCHEDULED START DATE:ok] / [sqlproxy.02z6qx71w41oxv17vopfm1s3xtdc].[mn:JOB SCHEDULED START DATE:ok]) | Bar | - |
| `WIP DETAILS` | ([sqlproxy.02z6qx71w41oxv17vopfm1s3xtdc].[yr:JOB SCHEDULED START DATE:ok] / ([sqlproxy.02z6qx71w41oxv17vopfm1s3xtdc].[mn:JOB SCHEDULED START DATE:ok] / ([sqlproxy.02z6qx71w41oxv17vopfm1s3xtdc].[none:PROGRAM:nk] / ([sqlproxy.02z6qx71w41oxv17vopfm1s3xtdc].[none:PLANNER (PROGRAM):nk] / ([sqlproxy.02z6qx71w41oxv17vopfm1s3xtdc].[none:OP SEQ NUM:ok] / ([sqlproxy.02z6qx71w41oxv17vopfm1s3xtdc].[none:OP DESC:nk] / ([sqlproxy.02z6qx71w41oxv17vopfm1s3xtdc].[none:JOB NAME (Custom SQL Query1):nk] / [sqlproxy.02z6qx71w41oxv17vopfm1s3xtdc].[none:PART NUMBER (PROGRAM):nk]))))))) | [:Measure Names] | Automatic | - |
| `zz.Data Refresh Caption` | - | - | Automatic | - |
| `zz.EmailMe` | - | - | Shape | - |
| `zz.TeamsMsg` | - | - | Shape | - |

### Worksheet Filters and Selections

| Worksheet | Filter class | Field | Selection / groupfilter |
| --- | --- | --- | --- |
| `JOB QTY BURNDOWN` | `categorical` | `[none:JOB CLASS CODE:nk]` | - |
| `JOB QTY BURNDOWN` | `quantitative` | `[none:JOB SCHEDULED START DATE:qk]` | - |
| `JOB QTY BURNDOWN` | `categorical` | `[none:JOB STATUS (Custom SQL Query1):nk]` | - |
| `JOB QTY BURNDOWN` | `categorical` | `[none:OP DESC:nk]` | - |
| `JOB QTY BURNDOWN` | `quantitative` | `[none:OP QUANTITY IN QUEUE:qk]` | - |
| `JOB QTY BURNDOWN` | `categorical` | `[none:PART NUMBER (PROGRAM):nk]` | - |
| `JOB QTY BURNDOWN` | `categorical` | `[none:PLANNER (PROGRAM):nk]` | - |
| `JOB QTY BURNDOWN` | `categorical` | `[none:PROGRAM:nk]` | - |
| `WIP DETAILS` | `categorical` | `[:Measure Names]` | - |
| `WIP DETAILS` | `categorical` | `[Action (YEAR(JOB SCHEDULED START DATE),MONTH(JOB SCHEDULED START DATE),PLANNER)]` | - |
| `WIP DETAILS` | `categorical` | `[none:JOB CLASS CODE:nk]` | - |
| `WIP DETAILS` | `quantitative` | `[none:JOB SCHEDULED START DATE:qk]` | - |
| `WIP DETAILS` | `categorical` | `[none:JOB STATUS (Custom SQL Query1):nk]` | - |
| `WIP DETAILS` | `categorical` | `[none:JOB STATUS:nk]` | - |
| `WIP DETAILS` | `categorical` | `[none:OP DESC:nk]` | - |
| `WIP DETAILS` | `quantitative` | `[none:OP QUANTITY IN QUEUE:qk]` | - |
| `WIP DETAILS` | `categorical` | `[none:PART NUMBER (PROGRAM):nk]` | - |
| `WIP DETAILS` | `categorical` | `[none:PLANNER (PROGRAM):nk]` | - |
| `WIP DETAILS` | `categorical` | `[none:PROGRAM:nk]` | - |
| `zz.Data Refresh Caption` | `categorical` | `[Action (YEAR(JOB SCHEDULED START DATE),MONTH(JOB SCHEDULED START DATE),PLANNER)]` | - |
| `zz.Data Refresh Caption` | `categorical` | `[none:Calculation_1328843370564071424:nk]` | - |
| `zz.EmailMe` | `categorical` | `[Action (YEAR(JOB SCHEDULED START DATE),MONTH(JOB SCHEDULED START DATE),PLANNER)]` | - |
| `zz.TeamsMsg` | `categorical` | `[Action (YEAR(JOB SCHEDULED START DATE),MONTH(JOB SCHEDULED START DATE),PLANNER)]` | - |

### Fields Used by Primary Worksheet

- `JOB QTY BURNDOWN`: `WIP JOBS`, `[JOB CLASS CODE]`, `[JOB QUANTITY REMAINING]`, `[JOB SCHEDULED START DATE]`, `[JOB STATUS (Custom SQL Query1)]`, `[OP DESC]`, `[OP QUANTITY IN QUEUE]`, `[PART NUMBER (PROGRAM)]`, `[PLANNER (PROGRAM)]`, `[PLANNER]`, `[PROGRAM]`
- `WIP DETAILS`: `[JOB CLASS CODE]`, `[JOB NAME (Custom SQL Query1)]`, `[JOB SCHEDULED START DATE]`, `[JOB STATUS (Custom SQL Query1)]`, `[JOB STATUS]`, `[OP DESC]`, `[OP QUANTITY COMPLETED]`, `[OP QUANTITY IN QUEUE]`, `[OP QUANTITY REJECTED]`, `[OP QUANTITY SCRAPPED]`, `[OP SCHEDULED QUANTITY]`, `[OP SEQ NUM]`, `[PART NUMBER (PROGRAM)]`, `[PLANNER (PROGRAM)]`, `[PLANNER]`, `[PROGRAM]`
- `zz.Data Refresh Caption`: `Blank`, `[JOB SCHEDULED START DATE]`, `[PLANNER]`
- `zz.EmailMe`: `Email`, `[JOB SCHEDULED START DATE]`, `[PLANNER]`
- `zz.TeamsMsg`: `Teams`, `[JOB SCHEDULED START DATE]`, `[PLANNER]`

## Calculations

Recovered `3` calculated field definitions from static workbook XML.

### Calculated Fields

| Calculated field | Datasource | Formula |
| --- | --- | --- |
| `Blank` | `HorizontalWIP 2.0_PROD` | `""` |
| `Email` | `HorizontalWIP 2.0_PROD` | `"Email Me Here"` |
| `Teams` | `HorizontalWIP 2.0_PROD` | `"Write a Teams Message"` |

### Calculation Field Dependencies

| Calculated field | Referenced fields |
| --- | --- |
| `Blank` | - |
| `Email` | - |
| `Teams` | - |

### Calculation Lineage Notes

Calculation lineage should be read against the likely static repo matches above; these matches are inferred from naming convention and local files.

Calculated fields were recovered from: `HorizontalWIP 2.0_PROD`.

### LOD and Table Calculation Summary

| Metric | Count | Fields |
| --- | ---: | --- |
| LOD calculations | 0 | - |
| Table calculations | 0 | - |

## Color and Legend Notes

| Source | Color / legend detail |
| --- | --- |
| Workbook card | `color` for `[none:PLANNER:nk]` |
| Workbook card | `color` for `[:Measure Names]` |
