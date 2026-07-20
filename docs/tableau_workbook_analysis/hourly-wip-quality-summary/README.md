# Hourly WIP Quality Summary

## Tabular Report

| Attribute | Value |
| --- | --- |
| Source workbook | `tableau/my-tableau-dashboards/Hourly WIP Quality Summary.twbx` |
| Embedded TWB | `Hourly WIP Quality Summary.twb` |
| Primary dashboard | `Hourly WIP Quality Summary` |
| Dashboard count | 1 |
| Worksheet count | 7 |
| Datasource count | 1 |
| Calculated field count | 4 |
| LOD calculation count | 0 |
| Table calculation count | 2 |
| Screenshot | `docs/tableau_workbook_analysis/hourly-wip-quality-summary/Hourly-WIP-Quality-Summary.jpeg` |

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
| `wip_quality_summary_hourly` | `sqlproxy.0w4t7ky0ekui5f1dnf4000phprzz` | collection, [sqlproxy], [sqlproxy], [sqlproxy], [sqlproxy], [sqlproxy], [sqlproxy] |

### Likely dbt / SQL or Seed Lineage Guess

| Likely file | Match score | Static reason |
| --- | ---: | --- |
| `models/2_staging/stg_wip_quality_summary_quality_rejects.sql` | 24.0 | shared tokens: quality, summary, wip |
| `models/2_staging/stg_wip_quality_summary_quality_reroutes.sql` | 24.0 | shared tokens: quality, summary, wip |
| `models/3_intermediate/int_wip_quality_summary_quality_rejects_and_sales_orders.sql` | 24.0 | shared tokens: quality, summary, wip |
| `models/3_intermediate/int_wip_quality_summary_quality_reroutes_and_sales_orders.sql` | 24.0 | shared tokens: quality, summary, wip |
| `models/3_intermediate/int_wip_quality_summary_wip.sql` | 24.0 | shared tokens: quality, summary, wip |
| `models/4_marts/wip_quality_summary_quality.sql` | 24.0 | shared tokens: quality, summary, wip |
| `models/4_marts/wip_quality_summary_wip.sql` | 24.0 | shared tokens: quality, summary, wip |
| `models/9_optimized_compiled_sql/minus_wip_quality_summary_wip.sql` | 24.0 | shared tokens: quality, summary, wip |
| `analyses/recommend_me_columns_initial/wip/rmc_wip_discrete_jobs.sql` | 8.0 | shared tokens: wip |
| `analyses/recommend_me_columns_initial/wip/rmc_wip_move_transactions.sql` | 8.0 | shared tokens: wip |

## Sheet Inventory

| Worksheet | Datasources | Field count | Filter count | Marks |
| --- | --- | ---: | ---: | --- |
| `Reroutes_with_defect_detail` | sqlproxy.0w4t7ky0ekui5f1dnf4000phprzz | 13 | 1 | Automatic |
| `Results Recording Defect Details Data` | sqlproxy.0w4t7ky0ekui5f1dnf4000phprzz | 24 | 9 | Automatic |
| `WIP Quality Summary Sheet` | sqlproxy.0w4t7ky0ekui5f1dnf4000phprzz | 15 | 7 | Bar |
| `zz.Data Refresh At Caption` | sqlproxy.0w4t7ky0ekui5f1dnf4000phprzz | 5 | 2 | Automatic |
| `zz.Data Refresh At Caption (2)` | sqlproxy.0w4t7ky0ekui5f1dnf4000phprzz | 6 | 3 | Automatic |
| `zz.Frequency Caption` | - | 0 | 0 | Automatic |
| `zz.Frequency Caption (2)` | - | 0 | 0 | Automatic |

### Filter Cards and Visible Controls

| Type | Parameter / field | Mode |
| --- | --- | --- |
| `filters` | `-` | - |
| `size` | `[usr:Calculation_1054686776010567684:qk]` | - |
| `color` | `[:Measure Names]` | - |

### Primary Worksheet Shelves and Marks

| Worksheet | Rows | Columns | Marks | Color fields |
| --- | --- | --- | --- | --- |
| `Reroutes_with_defect_detail` | ([sqlproxy.0w4t7ky0ekui5f1dnf4000phprzz].[none:Planner:nk] / ([sqlproxy.0w4t7ky0ekui5f1dnf4000phprzz].[none:Part Number:nk] / ([sqlproxy.0w4t7ky0ekui5f1dnf4000phprzz].[none:Op Seq Num:ok] / ([sqlproxy.0w4t7ky0ekui5f1dnf4000phprzz].[none:DD Serial Number:nk] / ([sqlproxy.0w4t7ky0ekui5f1dnf4000phprzz].[none:Job Number:nk] / ([sqlproxy.0w4t7ky0ekui5f1dnf4000phprzz].[none:RR Open Def:nk] / ([sqlproxy.0w4t7ky0ekui5f1dnf4000phprzz].[none:RR WIP Insp Result:nk] / ([sqlproxy.0w4t7ky0ekui5f1dnf4000phprzz].[none:RR WIP Insp Result:nk] / ([sqlproxy.0w4t7ky0ekui5f1dnf4000phprzz].[none:Defect Detail ID:nk] / ([sqlproxy.0w4t7ky0ekui5f1dnf4000phprzz].[none:DD_DEFECT_DETAIL_INSP:nk] / ([sqlproxy.0w4t7ky0ekui5f1dnf4000phprzz].[none:Caused By:nk] / ([sqlproxy.0w4t7ky0ekui5f1dnf4000phprzz].[none:Caused By Desc:nk] / [sqlproxy.0w4t7ky0ekui5f1dnf4000phprzz].[none:Problem Desc:nk])))))))))))) | - | Automatic | - |
| `Results Recording Defect Details Data` | ([sqlproxy.0w4t7ky0ekui5f1dnf4000phprzz].[none:Planner:nk] / ([sqlproxy.0w4t7ky0ekui5f1dnf4000phprzz].[none:Part Number:nk] / ([sqlproxy.0w4t7ky0ekui5f1dnf4000phprzz].[none:Op Seq Num:ok] / ([sqlproxy.0w4t7ky0ekui5f1dnf4000phprzz].[none:Job Number:nk] / ([sqlproxy.0w4t7ky0ekui5f1dnf4000phprzz].[none:DD Serial Number:nk] / ([sqlproxy.0w4t7ky0ekui5f1dnf4000phprzz].[none:Affected Assy Material:nk] / ([sqlproxy.0w4t7ky0ekui5f1dnf4000phprzz].[none:Affected Assy SN:nk] / ([sqlproxy.0w4t7ky0ekui5f1dnf4000phprzz].[none:Ref Designator:nk] / ([sqlproxy.0w4t7ky0ekui5f1dnf4000phprzz].[none:Component Item:nk] / ([sqlproxy.0w4t7ky0ekui5f1dnf4000phprzz].[none:Problem Desc:nk] / ([sqlproxy.0w4t7ky0ekui5f1dnf4000phprzz].[none:Defect Code:nk] / ([sqlproxy.0w4t7ky0ekui5f1dnf4000phprzz].[none:Defect Code Desc:nk] / ([sqlproxy.0w4t7ky0ekui5f1dnf4000phprzz].[none:Creation Date:ok] / ([sqlproxy.0w4t7ky0ekui5f1dnf4000phprzz].[none:Comp SN:nk] / ([sqlproxy.0w4t7ky0ekui5f1dnf4000phprzz].[none:RFID:nk] / ([sqlproxy.0w4t7ky0ekui5f1dnf4000phprzz].[none:Caused By:nk] / ([sqlproxy.0w4t7ky0ekui5f1dnf4000phprzz].[none:Caused By Desc:nk] / [sqlproxy.0w4t7ky0ekui5f1dnf4000phprzz].[none:RR WIP Insp Result:nk]))))))))))))))))) | - | Automatic | - |
| `WIP Quality Summary Sheet` | ([sqlproxy.0w4t7ky0ekui5f1dnf4000phprzz].[none:Planner:nk] / ([sqlproxy.0w4t7ky0ekui5f1dnf4000phprzz].[none:Part Number:nk] / ([sqlproxy.0w4t7ky0ekui5f1dnf4000phprzz].[none:Op Seq Num:ok] / [sqlproxy.0w4t7ky0ekui5f1dnf4000phprzz].[none:Op Desc:nk]))) | [:Measure Names] | Bar | - |
| `zz.Data Refresh At Caption` | - | - | Automatic | - |
| `zz.Data Refresh At Caption (2)` | - | - | Automatic | - |
| `zz.Frequency Caption` | - | - | Automatic | - |
| `zz.Frequency Caption (2)` | - | - | Automatic | - |

### Worksheet Filters and Selections

| Worksheet | Filter class | Field | Selection / groupfilter |
| --- | --- | --- | --- |
| `Reroutes_with_defect_detail` | `categorical` | `[none:RR WIP Insp Result:nk]` | - |
| `Results Recording Defect Details Data` | `categorical` | `[Action (Op Desc,Op Seq Num,Part Number,Planner)]` | - |
| `Results Recording Defect Details Data` | `categorical` | `[none:DD_DEFECT_DETAIL_INSP:nk]` | - |
| `Results Recording Defect Details Data` | `categorical` | `[none:Job Class Code:nk]` | - |
| `Results Recording Defect Details Data` | `categorical` | `[none:Line Number:ok]` | - |
| `Results Recording Defect Details Data` | `categorical` | `[none:Op Seq Num:ok]` | - |
| `Results Recording Defect Details Data` | `categorical` | `[none:Part Number:nk]` | - |
| `Results Recording Defect Details Data` | `categorical` | `[none:Planner:nk]` | - |
| `Results Recording Defect Details Data` | `categorical` | `[none:RR WIP Insp Result:nk]` | - |
| `Results Recording Defect Details Data` | `categorical` | `[none:Sales Order:nk]` | - |
| `WIP Quality Summary Sheet` | `categorical` | `[:Measure Names]` | - |
| `WIP Quality Summary Sheet` | `categorical` | `[none:Job Class Code:nk]` | - |
| `WIP Quality Summary Sheet` | `categorical` | `[none:Line Number:ok]` | - |
| `WIP Quality Summary Sheet` | `categorical` | `[none:Op Seq Num:ok]` | - |
| `WIP Quality Summary Sheet` | `categorical` | `[none:Part Number:nk]` | - |
| `WIP Quality Summary Sheet` | `categorical` | `[none:Planner:nk]` | - |
| `WIP Quality Summary Sheet` | `categorical` | `[none:Sales Order:nk]` | - |
| `zz.Data Refresh At Caption` | `categorical` | `[Action (Op Desc,Op Seq Num,Part Number,Planner)]` | - |
| `zz.Data Refresh At Caption` | `quantitative` | `[cnt:Caused By:qk]` | - |
| `zz.Data Refresh At Caption (2)` | `categorical` | `[Action (Op Desc,Op Seq Num,Part Number,Planner)]` | - |
| `zz.Data Refresh At Caption (2)` | `categorical` | `[none:Calculation_1328843370564071424:nk]` | - |
| `zz.Data Refresh At Caption (2)` | `quantitative` | `[sum:Op Qty in Queue:qk]` | - |

### Fields Used by Primary Worksheet

- `Reroutes_with_defect_detail`: `Blank`, `Is Inspected Flag?`, `[Caused By Desc]`, `[Caused By]`, `[DD Serial Number]`, `[Defect Detail ID]`, `[Job Number]`, `[Op Seq Num]`, `[Part Number]`, `[Planner]`, `[Problem Desc]`, `[RR Open Def]`, `[RR WIP Insp Result]`
- `Results Recording Defect Details Data`: `Blank`, `Is Inspected Flag?`, `[Affected Assy Material]`, `[Affected Assy SN]`, `[Caused By Desc]`, `[Caused By]`, `[Comp SN]`, `[Component Item]`, `[Creation Date]`, `[DD Serial Number]`, `[Defect Code Desc]`, `[Defect Code]`, `[Job Class Code]`, `[Job Number]`, `[Line Number]`, `[Op Desc]`, `[Op Seq Num]`, `[Part Number]`, `[Planner]`, `[Problem Desc]`, `[RFID]`, `[RR WIP Insp Result]`, `[Ref Designator]`, `[Sales Order]`
- `WIP Quality Summary Sheet`: `Rejects`, `Rejects wo 0s`, `Reroutes`, `Reroutes wo 0s`, `Total`, `[Job Class Code]`, `[Line Number]`, `[Op Desc]`, `[Op Qty in Queue]`, `[Op Seq Num]`, `[Op To Move]`, `[Part Number]`, `[Planner]`, `[Sales Order]`, `min(1)`
- `zz.Data Refresh At Caption`: `[Caused By]`, `[Op Desc]`, `[Op Seq Num]`, `[Part Number]`, `[Planner]`
- `zz.Data Refresh At Caption (2)`: `Blank`, `[Op Desc]`, `[Op Qty in Queue]`, `[Op Seq Num]`, `[Part Number]`, `[Planner]`
- `zz.Frequency Caption`: No datasource dependency fields recovered.
- `zz.Frequency Caption (2)`: No datasource dependency fields recovered.

## Calculations

Recovered `4` calculated field definitions from static workbook XML.

### Calculated Fields

| Calculated field | Datasource | Formula |
| --- | --- | --- |
| `Rejects` | `wip_quality_summary_hourly` | `ZN(LOOKUP(SUM([Rejects]),0))` |
| `Reroutes` | `wip_quality_summary_hourly` | `ZN(LOOKUP(SUM([Reroutes]),0))` |
| `Total` | `wip_quality_summary_hourly` | `SUM([Op Qty in Queue]) - [Calculation_1054686776007675904] - [Calculation_1054686776008069121]` |
| `Blank` | `wip_quality_summary_hourly` | `""` |

### Calculation Field Dependencies

| Calculated field | Referenced fields |
| --- | --- |
| `Rejects` | `Rejects` |
| `Reroutes` | `Reroutes` |
| `Total` | `Calculation_1054686776007675904`, `Calculation_1054686776008069121`, `Op Qty in Queue` |
| `Blank` | - |

### Calculation Lineage Notes

Calculation lineage should be read against the likely static repo matches above; these matches are inferred from naming convention and local files.

Calculated fields were recovered from: `wip_quality_summary_hourly`.

### LOD and Table Calculation Summary

| Metric | Count | Fields |
| --- | ---: | --- |
| LOD calculations | 0 | - |
| Table calculations | 2 | Rejects, Reroutes |

## Color and Legend Notes

| Source | Color / legend detail |
| --- | --- |
| Workbook card | `color` for `[:Measure Names]` |
