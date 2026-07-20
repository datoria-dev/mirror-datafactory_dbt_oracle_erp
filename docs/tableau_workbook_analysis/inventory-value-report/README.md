# Inventory Value Report

## Tabular Report

| Attribute | Value |
| --- | --- |
| Source workbook | `tableau/my-tableau-dashboards/Inventory Value Report.twbx` |
| Embedded TWB | `Inventory Value Report (1).twb` |
| Primary dashboard | `Inventory Value Report` |
| Dashboard count | 1 |
| Worksheet count | 5 |
| Datasource count | 1 |
| Calculated field count | 3 |
| LOD calculation count | 0 |
| Table calculation count | 1 |
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
| `midas nss inventory value report` | `sqlproxy.1c2buxr1bd2t861cqjukx1qw3jic` | collection, [sqlproxy], [sqlproxy], [sqlproxy], [sqlproxy], [sqlproxy], [sqlproxy] |

### Likely dbt / SQL or Seed Lineage Guess

| Likely file | Match score | Static reason |
| --- | ---: | --- |
| `models/9_optimized_compiled_sql/midas_Inventory_Value_report.sql` | 167.0 | normalized substring; shared tokens: inventory, midas, report, value |
| `seeds/tabular_index_for_inventory_value_report.csv` | 159.0 | normalized substring; shared tokens: inventory, report, value |
| `models/9_optimized_compiled_sql/midas_Oracle_WIP_Value_Report.sql` | 24.0 | shared tokens: midas, report, value |
| `models/9_optimized_compiled_sql/midas_Inspection_Escape_Report_MIDAS.sql` | 16.0 | shared tokens: midas, report |
| `models/9_optimized_compiled_sql/midas_Material_Base_Report_YTD.sql` | 16.0 | shared tokens: midas, report |
| `seeds/nss_part_numbers_adhoc_for_midas.csv` | 16.0 | shared tokens: midas, nss |
| `models/1_sources/qa/xxsrc_qa_char_value_lookups.sql` | 8.0 | shared tokens: value |
| `models/1_sources/qa/xxsrc_qa_plan_char_value_lookups.sql` | 8.0 | shared tokens: value |
| `models/9_optimized_compiled_sql/Inspection_Escapes_Report_Modified.sql` | 8.0 | shared tokens: report |
| `models/9_optimized_compiled_sql/midas_AR_Processing.sql` | 8.0 | shared tokens: midas |

## Sheet Inventory

| Worksheet | Datasources | Field count | Filter count | Marks |
| --- | --- | ---: | ---: | --- |
| `midas nss inventory value report` | sqlproxy.1c2buxr1bd2t861cqjukx1qw3jic | 26 | 9 | Automatic |
| `zz.Data Refresh At Caption` | sqlproxy.1c2buxr1bd2t861cqjukx1qw3jic | 1 | 1 | Automatic |
| `zz.Data Refresh At Caption (2)` | sqlproxy.1c2buxr1bd2t861cqjukx1qw3jic | 1 | 1 | Automatic |
| `zz.Frequency Caption` | - | 0 | 0 | Automatic |
| `zz.Frequency Caption (2)` | - | 0 | 0 | Automatic |

### Filter Cards and Visible Controls

| Type | Parameter / field | Mode |
| --- | --- | --- |
| `filters` | `-` | - |

### Primary Worksheet Shelves and Marks

| Worksheet | Rows | Columns | Marks | Color fields |
| --- | --- | --- | --- | --- |
| `midas nss inventory value report` | ([sqlproxy.1c2buxr1bd2t861cqjukx1qw3jic].[usr:Calculation_159596329500360704:ok:1] / ([sqlproxy.1c2buxr1bd2t861cqjukx1qw3jic].[none:ITEM:nk] / ([sqlproxy.1c2buxr1bd2t861cqjukx1qw3jic].[none:DESCRIPTION:nk] / ([sqlproxy.1c2buxr1bd2t861cqjukx1qw3jic].[none:item type:nk] / ([sqlproxy.1c2buxr1bd2t861cqjukx1qw3jic].[none:inventory_type:nk] / ([sqlproxy.1c2buxr1bd2t861cqjukx1qw3jic].[none:subinventory:nk] / ([sqlproxy.1c2buxr1bd2t861cqjukx1qw3jic].[none:program:nk] / ([sqlproxy.1c2buxr1bd2t861cqjukx1qw3jic].[none:portfolio:nk] / ([sqlproxy.1c2buxr1bd2t861cqjukx1qw3jic].[none:make buy:nk] / ([sqlproxy.1c2buxr1bd2t861cqjukx1qw3jic].[none:item status:nk] / [sqlproxy.1c2buxr1bd2t861cqjukx1qw3jic].[none:planner code:nk])))))))))) | [:Measure Names] | Automatic | - |
| `zz.Data Refresh At Caption` | - | - | Automatic | - |
| `zz.Data Refresh At Caption (2)` | - | - | Automatic | - |
| `zz.Frequency Caption` | - | - | Automatic | - |
| `zz.Frequency Caption (2)` | - | - | Automatic | - |

### Worksheet Filters and Selections

| Worksheet | Filter class | Field | Selection / groupfilter |
| --- | --- | --- | --- |
| `midas nss inventory value report` | `categorical` | `[:Measure Names]` | - |
| `midas nss inventory value report` | `categorical` | `[none:Calculation_159596329501638657:nk]` | - |
| `midas nss inventory value report` | `categorical` | `[none:IS_PLUS_TL:ok]` | - |
| `midas nss inventory value report` | `categorical` | `[none:cost type:nk]` | - |
| `midas nss inventory value report` | `categorical` | `[none:inventory_type:nk]` | - |
| `midas nss inventory value report` | `categorical` | `[none:item type:nk]` | - |
| `midas nss inventory value report` | `categorical` | `[none:planner code:nk]` | - |
| `midas nss inventory value report` | `categorical` | `[none:program:nk]` | - |
| `midas nss inventory value report` | `categorical` | `[none:subinventory:nk]` | - |
| `zz.Data Refresh At Caption` | `categorical` | `[none:Calculation_1328843370564071424:nk]` | - |
| `zz.Data Refresh At Caption (2)` | `categorical` | `[none:Calculation_1328843370564071424:nk]` | - |

### Fields Used by Primary Worksheet

- `midas nss inventory value report`: `Inventory Type`, `On Hand Qty Flag`, `[DESCRIPTION]`, `[INVENTORY_ITEM_ID]`, `[IS_PLUS_TL]`, `[ITEM]`, `[Last Std Date]`, `[conv oh]`, `[cost type]`, `[item status]`, `[item type]`, `[make buy]`, `[material]`, `[mro]`, `[on hand qty]`, `[osp mro]`, `[osp]`, `[planner code]`, `[portfolio]`, `[program]`, `[shrinkage]`, `[subinventory]`, `[total inv]`, `[total mat]`, `[total std]`, `row number`
- `zz.Data Refresh At Caption`: `Blank`
- `zz.Data Refresh At Caption (2)`: `Blank`
- `zz.Frequency Caption`: No datasource dependency fields recovered.
- `zz.Frequency Caption (2)`: No datasource dependency fields recovered.

## Calculations

Recovered `3` calculated field definitions from static workbook XML.

### Calculated Fields

| Calculated field | Datasource | Formula |
| --- | --- | --- |
| `Blank` | `midas nss inventory value report` | `""` |
| `row number` | `midas nss inventory value report` | `INDEX()` |
| `On Hand Qty Flag` | `midas nss inventory value report` | `IF [on hand qty] > 0 THEN 'Nonzero Qty' ELSEIF [on hand qty] = 0 THEN 'Zero Qty' ELSE NULL END` |

### Calculation Field Dependencies

| Calculated field | Referenced fields |
| --- | --- |
| `Blank` | - |
| `row number` | - |
| `On Hand Qty Flag` | `on hand qty` |

### Calculation Lineage Notes

Calculation lineage should be read against the likely static repo matches above; these matches are inferred from naming convention and local files.

Calculated fields were recovered from: `midas nss inventory value report`.

### LOD and Table Calculation Summary

| Metric | Count | Fields |
| --- | ---: | --- |
| LOD calculations | 0 | - |
| Table calculations | 1 | row number |

## Color and Legend Notes

No explicit color encoding or legend card elements were recovered from static workbook XML.
