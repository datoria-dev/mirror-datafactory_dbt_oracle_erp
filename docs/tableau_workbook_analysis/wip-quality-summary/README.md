# WIP Quality Summary Dashboard

## Tabular Report

| Attribute | Value |
| --- | --- |
| Source workbook | `tableau/my-tableau-dashboards/WIP Quality Summary.twb` |
| Embedded TWB | `WIP Quality Summary.twb` |
| Primary dashboard | `WIP Quality Summary Dashboard` |
| Dashboard count | 1 |
| Worksheet count | 3 |
| Datasource count | 2 |
| Calculated field count | 8 |
| LOD calculation count | 0 |
| Table calculation count | 4 |
| Screenshot | `docs/tableau_workbook_analysis/wip-quality-summary/WIP-Quality-Summary-Dashboard.jpeg` |

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
| `wip_quality_summary_quality` | `sqlproxy.07la4s11pwtkes1c9rhj70zzexzy` | [sqlproxy], [sqlproxy] |
| `minus_wip_quality_summary_wip` | `sqlproxy.0a8sqpr06n70y51aboa451fwlhnr` | [sqlproxy], [sqlproxy] |

### Likely dbt / SQL or Seed Lineage Guess

| Likely file | Match score | Static reason |
| --- | ---: | --- |
| `models/9_optimized_compiled_sql/minus_wip_quality_summary_wip.sql` | 177.0 | normalized substring; exact normalized name; shared tokens: minus, quality, summary, wip |
| `models/4_marts/wip_quality_summary_quality.sql` | 169.0 | normalized substring; exact normalized name; shared tokens: quality, summary, wip |
| `models/2_staging/stg_wip_quality_summary_quality_rejects.sql` | 114.0 | normalized substring; shared tokens: quality, summary, wip |
| `models/2_staging/stg_wip_quality_summary_quality_reroutes.sql` | 114.0 | normalized substring; shared tokens: quality, summary, wip |
| `models/3_intermediate/int_wip_quality_summary_quality_rejects_and_sales_orders.sql` | 114.0 | normalized substring; shared tokens: quality, summary, wip |
| `models/3_intermediate/int_wip_quality_summary_quality_reroutes_and_sales_orders.sql` | 114.0 | normalized substring; shared tokens: quality, summary, wip |
| `models/4_marts/wip_quality_summary_wip.sql` | 114.0 | normalized substring; shared tokens: quality, summary, wip |
| `models/3_intermediate/int_wip_quality_summary_wip.sql` | 69.0 | normalized substring; shared tokens: quality, summary, wip |
| `models/9_optimized_compiled_sql/minus_employee_wip_moves_14days.sql` | 16.0 | shared tokens: minus, wip |
| `models/9_optimized_compiled_sql/minus_employee_wip_moves_alltime.sql` | 16.0 | shared tokens: minus, wip |

## Sheet Inventory

| Worksheet | Datasources | Field count | Filter count | Marks |
| --- | --- | ---: | ---: | --- |
| `WIP Quality Summary Sheet` | sqlproxy.07la4s11pwtkes1c9rhj70zzexzy, sqlproxy.0a8sqpr06n70y51aboa451fwlhnr | 20 | 8 | Bar |
| `zz.QUAL Refresh At` | sqlproxy.07la4s11pwtkes1c9rhj70zzexzy | 1 | 0 | Automatic |
| `zz.WIP Refresh At` | sqlproxy.0a8sqpr06n70y51aboa451fwlhnr | 1 | 0 | Square |

### Filter Cards and Visible Controls

| Type | Parameter / field | Mode |
| --- | --- | --- |
| `filters` | `-` | - |
| `color` | `[:Measure Names]` | - |
| `size` | `[usr:Calculation_969399827130773506:qk]` | - |

### Primary Worksheet Shelves and Marks

| Worksheet | Rows | Columns | Marks | Color fields |
| --- | --- | --- | --- | --- |
| `WIP Quality Summary Sheet` | ([sqlproxy.0a8sqpr06n70y51aboa451fwlhnr].[none:Planner:nk] / ([sqlproxy.0a8sqpr06n70y51aboa451fwlhnr].[none:Part Number:nk] / ([sqlproxy.0a8sqpr06n70y51aboa451fwlhnr].[none:Op Seq Num:ok] / [sqlproxy.0a8sqpr06n70y51aboa451fwlhnr].[none:Op Desc:nk]))) | [:Measure Names] | Bar | - |
| `zz.QUAL Refresh At` | - | - | Automatic | - |
| `zz.WIP Refresh At` | - | - | Square | - |

### Worksheet Filters and Selections

| Worksheet | Filter class | Field | Selection / groupfilter |
| --- | --- | --- | --- |
| `WIP Quality Summary Sheet` | `categorical` | `[:Measure Names]` | - |
| `WIP Quality Summary Sheet` | `categorical` | `[none:Job Class Code:nk]` | - |
| `WIP Quality Summary Sheet` | `categorical` | `[none:Line Number:ok]` | - |
| `WIP Quality Summary Sheet` | `categorical` | `[none:Op Desc:nk]` | - |
| `WIP Quality Summary Sheet` | `categorical` | `[none:Op Seq Num:ok]` | - |
| `WIP Quality Summary Sheet` | `categorical` | `[none:Part Number:nk]` | - |
| `WIP Quality Summary Sheet` | `categorical` | `[none:Planner:nk]` | - |
| `WIP Quality Summary Sheet` | `categorical` | `[none:Sales Order:nk]` | - |

### Fields Used by Primary Worksheet

- `WIP Quality Summary Sheet`: `Rejects`, `Reroutes`, `Total`, `[COUNT_SERIAL_NUMBER]`, `[FEATURE]`, `[Job Class Code]`, `[Line Number]`, `[Op Desc]`, `[Op Qty in Queue]`, `[Op Seq Num]`, `[Op To Move]`, `[Part Number]`, `[Planner]`, `[RR_FROM_OP_SEQ_NUM]`, `[RR_ITEM_ID]`, `[Sales Order]`, `[wdj_primary_item_id]`, `min(1)`, `wip_qual_summary_qual_sk`, `wip_qual_summary_wip_sk`
- `zz.QUAL Refresh At`: `[FEATURE]`
- `zz.WIP Refresh At`: `[Job Class Code]`

## Calculations

Recovered `8` calculated field definitions from static workbook XML.

### Calculated Fields

| Calculated field | Datasource | Formula |
| --- | --- | --- |
| `wip_qual_summary_qual_sk` | `wip_quality_summary_quality` | `STR([RR_FROM_OP_SEQ_NUM]) + '_' + STR([RR_ITEM_ID])` |
| `Total` | `wip_quality_summary_quality` | `SUM([sqlproxy.0a8sqpr06n70y51aboa451fwlhnr].[Op Qty in Queue])-[Calculation_969399827125456896]-[Calculation_969399827125456896 1]` |
| `Reroutes` | `wip_quality_summary_quality` | `ZN(LOOKUP(SUM(IF [FEATURE] = 'Reroutes' THEN [COUNT_SERIAL_NUMBER] ELSE NULL END),0))` |
| `Rejects` | `wip_quality_summary_quality` | `ZN(LOOKUP(SUM(IF [FEATURE] = 'Rejects' THEN [COUNT_SERIAL_NUMBER] ELSE NULL END),0))` |
| `wip_qual_summary_wip_sk` | `minus_wip_quality_summary_wip` | `STR([Op Seq Num]) + '_' + STR([wdj_primary_item_id])` |
| `Total` | `minus_wip_quality_summary_wip` | `SUM([sqlproxy.0a8sqpr06n70y51aboa451fwlhnr].[Op Qty in Queue])-[Calculation_969399827125456896]-[Calculation_969399827125456896 1]` |
| `Reroutes` | `minus_wip_quality_summary_wip` | `ZN(LOOKUP(SUM(IF [FEATURE] = 'Reroutes' THEN [COUNT_SERIAL_NUMBER] ELSE NULL END),0))` |
| `Rejects` | `minus_wip_quality_summary_wip` | `ZN(LOOKUP(SUM(IF [FEATURE] = 'Rejects' THEN [COUNT_SERIAL_NUMBER] ELSE NULL END),0))` |

### Calculation Field Dependencies

| Calculated field | Referenced fields |
| --- | --- |
| `wip_qual_summary_qual_sk` | `RR_FROM_OP_SEQ_NUM`, `RR_ITEM_ID` |
| `Total` | `Calculation_969399827125456896`, `Calculation_969399827125456896 1`, `Op Qty in Queue`, `sqlproxy.0a8sqpr06n70y51aboa451fwlhnr` |
| `Reroutes` | `COUNT_SERIAL_NUMBER`, `FEATURE` |
| `Rejects` | `COUNT_SERIAL_NUMBER`, `FEATURE` |
| `wip_qual_summary_wip_sk` | `Op Seq Num`, `wdj_primary_item_id` |
| `Total` | `Calculation_969399827125456896`, `Calculation_969399827125456896 1`, `Op Qty in Queue`, `sqlproxy.0a8sqpr06n70y51aboa451fwlhnr` |
| `Reroutes` | `COUNT_SERIAL_NUMBER`, `FEATURE` |
| `Rejects` | `COUNT_SERIAL_NUMBER`, `FEATURE` |

### Calculation Lineage Notes

Calculation lineage should be read against the likely static repo matches above; these matches are inferred from naming convention and local files.

Calculated fields were recovered from: `minus_wip_quality_summary_wip`, `wip_quality_summary_quality`.

### LOD and Table Calculation Summary

| Metric | Count | Fields |
| --- | ---: | --- |
| LOD calculations | 0 | - |
| Table calculations | 4 | Reroutes, Rejects, Reroutes, Rejects |

## Color and Legend Notes

| Source | Color / legend detail |
| --- | --- |
| Workbook card | `color` for `[:Measure Names]` |
