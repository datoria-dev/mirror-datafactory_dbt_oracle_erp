# WIP POU Prep Details Report

## Tabular Report

| Attribute | Value |
| --- | --- |
| Source workbook | `tableau/my-tableau-dashboards/WIP POU and TO MOVE ONLY.twbx` |
| Embedded TWB | `WIP POU and TO MOVE ONLY (4).twb` |
| Primary dashboard | `WIP POU Prep Details Report` |
| Dashboard count | 2 |
| Worksheet count | 5 |
| Datasource count | 1 |
| Calculated field count | 2 |
| LOD calculation count | 0 |
| Table calculation count | 0 |
| Screenshot | `docs/tableau_workbook_analysis/wip-pou-and-to-move-only/WIP-POU-Prep-Details.jpeg` |

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
| `minus_horizontal_wip` | `federated.0uyks3x12n4wa21c2yxok0zuom7z` | collection, minus_horizontal_wip, dim_fiscal_and_calendar_dates, dim_item_master, minus_horizontal_wip, dim_fiscal_and_calendar_dates, dim_item_master |

### Likely dbt / SQL or Seed Lineage Guess

| Likely file | Match score | Static reason |
| --- | ---: | --- |
| `models/9_optimized_compiled_sql/minus_horizontal_wip.sql` | 124.0 | exact normalized name; shared tokens: horizontal, minus, wip |
| `models/4_marts/horizontal_wip.sql` | 61.0 | normalized substring; shared tokens: horizontal, wip |
| `models/4_marts/horizontal_wip_agg_qty_to_move.sql` | 32.0 | shared tokens: horizontal, move, to, wip |
| `models/3_intermediate/int_wip_nettable_credit_op_step_for_queue_to_move_types.sql` | 24.0 | shared tokens: move, to, wip |
| `analyses/recommend_me_columns_initial/wip/rmc_wip_move_transactions.sql` | 16.0 | shared tokens: move, wip |
| `knowledgebase/tableau/PROD_HorizontalWIP_tableau_data_catalog_lineage.md` | 16.0 | shared tokens: horizontal, wip |
| `knowledgebase/tableau/Pivots_HorizontalWIP_PROD_tableau_data_catalog_lineage.md` | 16.0 | shared tokens: horizontal, wip |
| `models/1_sources/wip/src_wip_move_transactions_14days.sql` | 16.0 | shared tokens: move, wip |
| `models/1_sources/wip/src_wip_move_transactions_30days.sql` | 16.0 | shared tokens: move, wip |
| `models/1_sources/wip/src_wip_move_transactions_365days.sql` | 16.0 | shared tokens: move, wip |

## Sheet Inventory

| Worksheet | Datasources | Field count | Filter count | Marks |
| --- | --- | ---: | ---: | --- |
| `Sheet 5` | federated.0uyks3x12n4wa21c2yxok0zuom7z | 4 | 0 | Automatic |
| `WIP POU Prep Sheet` | federated.0uyks3x12n4wa21c2yxok0zuom7z | 12 | 9 | Automatic |
| `WIP TO MOVE Sheet` | federated.0uyks3x12n4wa21c2yxok0zuom7z | 9 | 6 | Automatic |
| `zz.Data Refresh At Caption (2)` | federated.0uyks3x12n4wa21c2yxok0zuom7z | 1 | 1 | Automatic |
| `zz.Frequency Caption (2)` | - | 0 | 0 | Automatic |

### Filter Cards and Visible Controls

| Type | Parameter / field | Mode |
| --- | --- | --- |
| `filters` | `-` | - |

### Primary Worksheet Shelves and Marks

| Worksheet | Rows | Columns | Marks | Color fields |
| --- | --- | --- | --- | --- |
| `Sheet 5` | ([federated.0uyks3x12n4wa21c2yxok0zuom7z].[none:Job Scheduled Start Date:ok] / ([federated.0uyks3x12n4wa21c2yxok0zuom7z].[none:Calculation_2562829705742196737:ok] / ([federated.0uyks3x12n4wa21c2yxok0zuom7z].[none:Calculation_2312035488720396288:nk] / [federated.0uyks3x12n4wa21c2yxok0zuom7z].[usr:Calculation_2562829705742360579:ok]))) | - | Automatic | - |
| `WIP POU Prep Sheet` | ([federated.0uyks3x12n4wa21c2yxok0zuom7z].[none:Calculation_2312035488720396288:nk] / ([federated.0uyks3x12n4wa21c2yxok0zuom7z].[none:YESTERDAY_BUSINESS_DATE:ok] / ([federated.0uyks3x12n4wa21c2yxok0zuom7z].[none:Program:nk] / ([federated.0uyks3x12n4wa21c2yxok0zuom7z].[none:Part Number:nk] / ([federated.0uyks3x12n4wa21c2yxok0zuom7z].[none:Job Number:nk] / ([federated.0uyks3x12n4wa21c2yxok0zuom7z].[none:Op Seq Num:ok] / [federated.0uyks3x12n4wa21c2yxok0zuom7z].[none:Op Desc:nk])))))) | [:Measure Names] | Automatic | - |
| `WIP TO MOVE Sheet` | ([federated.0uyks3x12n4wa21c2yxok0zuom7z].[none:Program:nk] / ([federated.0uyks3x12n4wa21c2yxok0zuom7z].[none:Part Number:nk] / ([federated.0uyks3x12n4wa21c2yxok0zuom7z].[none:Job Number:nk] / ([federated.0uyks3x12n4wa21c2yxok0zuom7z].[none:Op Seq Num:ok] / [federated.0uyks3x12n4wa21c2yxok0zuom7z].[none:Op Desc:nk])))) | [:Measure Names] | Automatic | - |
| `zz.Data Refresh At Caption (2)` | - | - | Automatic | - |
| `zz.Frequency Caption (2)` | - | - | Automatic | - |

### Worksheet Filters and Selections

| Worksheet | Filter class | Field | Selection / groupfilter |
| --- | --- | --- | --- |
| `WIP POU Prep Sheet` | `categorical` | `[:Measure Names]` | - |
| `WIP POU Prep Sheet` | `categorical` | `[none:Calculation_2312035488720396288:nk]` | - |
| `WIP POU Prep Sheet` | `categorical` | `[none:Department:nk]` | - |
| `WIP POU Prep Sheet` | `categorical` | `[none:Job Class Code:nk]` | - |
| `WIP POU Prep Sheet` | `categorical` | `[none:Op Desc:nk]` | - |
| `WIP POU Prep Sheet` | `quantitative` | `[none:Op Qty in Queue:qk]` | - |
| `WIP POU Prep Sheet` | `categorical` | `[none:Op Seq Num:ok]` | - |
| `WIP POU Prep Sheet` | `categorical` | `[none:Part Number:nk]` | - |
| `WIP POU Prep Sheet` | `categorical` | `[none:Planner:nk]` | - |
| `WIP TO MOVE Sheet` | `categorical` | `[:Measure Names]` | - |
| `WIP TO MOVE Sheet` | `categorical` | `[none:Department:nk]` | - |
| `WIP TO MOVE Sheet` | `categorical` | `[none:Job Class Code:nk]` | - |
| `WIP TO MOVE Sheet` | `categorical` | `[none:Op Desc:nk]` | - |
| `WIP TO MOVE Sheet` | `quantitative` | `[none:Op Qty To Move:qk]` | - |
| `WIP TO MOVE Sheet` | `categorical` | `[none:Planner:nk]` | - |
| `zz.Data Refresh At Caption (2)` | `categorical` | `[none:Calculation_1328843370564071424:nk]` | - |

### Fields Used by Primary Worksheet

- `Sheet 5`: `[Job Scheduled Start Date]`, `index()`, `is_today_yesterday_past`, `today()`
- `WIP POU Prep Sheet`: `Yesterday Job Schedule Start`, `[Department]`, `[Job Class Code]`, `[Job Number]`, `[Job Scheduled Start Date]`, `[Op Desc]`, `[Op Qty in Queue]`, `[Op Seq Num]`, `[Part Number]`, `[Planner]`, `[Program]`, `is_today_yesterday_past`
- `WIP TO MOVE Sheet`: `[Department]`, `[Job Class Code]`, `[Job Number]`, `[Op Desc]`, `[Op Qty To Move]`, `[Op Seq Num]`, `[Part Number]`, `[Planner]`, `[Program]`
- `zz.Data Refresh At Caption (2)`: `Blank`
- `zz.Frequency Caption (2)`: No datasource dependency fields recovered.

## Calculations

Recovered `2` calculated field definitions from static workbook XML.

### Calculated Fields

| Calculated field | Datasource | Formula |
| --- | --- | --- |
| `Blank` | `minus_horizontal_wip` | `""` |
| `is_today_yesterday_past` | `minus_horizontal_wip` | `IF [Job Scheduled Start Date] = TODAY() then 'TODAY' ELSEIF [Job Scheduled Start Date] = DATEADD('day',1,TODAY()) then 'TOMORROW' ELSEIF [Job Scheduled Start Date]< TODAY() then 'PAST' ELSE 'FUTURE' END` |

### Calculation Field Dependencies

| Calculated field | Referenced fields |
| --- | --- |
| `Blank` | - |
| `is_today_yesterday_past` | `Job Scheduled Start Date` |

### Calculation Lineage Notes

Calculation lineage should be read against the likely static repo matches above; these matches are inferred from naming convention and local files.

Calculated fields were recovered from: `minus_horizontal_wip`.

### LOD and Table Calculation Summary

| Metric | Count | Fields |
| --- | ---: | --- |
| LOD calculations | 0 | - |
| Table calculations | 0 | - |

## Color and Legend Notes

No explicit color encoding or legend card elements were recovered from static workbook XML.
