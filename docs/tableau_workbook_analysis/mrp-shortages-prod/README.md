# MRP Material Shortages Dashboard

## Tabular Report

| Attribute | Value |
| --- | --- |
| Source workbook | `tableau/my-tableau-dashboards/MRP Shortages_PROD.twbx` |
| Embedded TWB | `MRP Shortages_PROD.twb` |
| Primary dashboard | `MRP Material Shortages Dashboard` |
| Dashboard count | 1 |
| Worksheet count | 5 |
| Datasource count | 1 |
| Calculated field count | 5 |
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
| `PROD_MRP Material Shortages` | `sqlproxy.128nvnd1oq3h4b15uyfxt1v9t1kw` | [sqlproxy], [sqlproxy] |

### Likely dbt / SQL or Seed Lineage Guess

| Likely file | Match score | Static reason |
| --- | ---: | --- |
| `analyses/recommend_me_columns_initial/inv/rmc_inv_mtl_material_transactions.sql` | 8.0 | shared tokens: material |
| `analyses/recommend_me_columns_initial/mrp/rmc_mrp_sales_order_updates.sql` | 8.0 | shared tokens: mrp |
| `models/1_sources/inv/src_inv_mtl_material_transactions.sql` | 8.0 | shared tokens: material |
| `models/1_sources/inv/src_inv_mtl_material_transactions_custowned_alltime.sql` | 8.0 | shared tokens: material |
| `models/1_sources/inv/src_inv_mtl_material_transactions_type44.sql` | 8.0 | shared tokens: material |
| `models/1_sources/inv/src_inv_mtl_material_transactions_type44_45days.sql` | 8.0 | shared tokens: material |
| `models/1_sources/inv/src_inv_mtl_material_transactions_wip_issuances.sql` | 8.0 | shared tokens: material |
| `models/1_sources/lookups/lu_mtl_mrp_supply_demand_source_type.sql` | 8.0 | shared tokens: mrp |
| `models/1_sources/mrp/src_mrp_full_pegging.sql` | 8.0 | shared tokens: mrp |
| `models/1_sources/mrp/src_mrp_gross_requirements.sql` | 8.0 | shared tokens: mrp |

## Sheet Inventory

| Worksheet | Datasources | Field count | Filter count | Marks |
| --- | --- | ---: | ---: | --- |
| `MRP Material Shortages Details` | sqlproxy.128nvnd1oq3h4b15uyfxt1v9t1kw | 11 | 6 | Bar |
| `Pivot MRP Material Shortages` | sqlproxy.128nvnd1oq3h4b15uyfxt1v9t1kw | 11 | 6 | Bar |
| `zz.Data Refresh Caption` | sqlproxy.128nvnd1oq3h4b15uyfxt1v9t1kw | 6 | 6 | Automatic |
| `zz.EmailMe` | sqlproxy.128nvnd1oq3h4b15uyfxt1v9t1kw | 6 | 5 | Shape |
| `zz.TeamsMsg` | sqlproxy.128nvnd1oq3h4b15uyfxt1v9t1kw | 6 | 5 | Shape |

### Filter Cards and Visible Controls

| Type | Parameter / field | Mode |
| --- | --- | --- |
| `filters` | `-` | - |
| `color` | `[sum:ORG_QTY_REQUIRED:qk]` | - |
| `color` | `[sum:ORG_QTY_ONHAND:qk]` | - |
| `color` | `[sum:Calculation_1866742099008581632:qk]` | - |
| `color` | `[sum:MAKE_QTY_REQUIRED:qk]` | - |

### Primary Worksheet Shelves and Marks

| Worksheet | Rows | Columns | Marks | Color fields |
| --- | --- | --- | --- | --- |
| `MRP Material Shortages Details` | ([sqlproxy.128nvnd1oq3h4b15uyfxt1v9t1kw].[none:PLANNER_NAME:nk] / ([sqlproxy.128nvnd1oq3h4b15uyfxt1v9t1kw].[none:MFG_NEED_DATE:ok] / ([sqlproxy.128nvnd1oq3h4b15uyfxt1v9t1kw].[none:RECORD_SOURCE:nk] / ([sqlproxy.128nvnd1oq3h4b15uyfxt1v9t1kw].[none:ITEM_NUMBER:nk] / ([sqlproxy.128nvnd1oq3h4b15uyfxt1v9t1kw].[none:ITEM_DESCRIPTION:nk] / [sqlproxy.128nvnd1oq3h4b15uyfxt1v9t1kw].[none:MAKE_ITEM_NUMBER:nk]))))) | [:Measure Names] | Bar | - |
| `Pivot MRP Material Shortages` | ([sqlproxy.128nvnd1oq3h4b15uyfxt1v9t1kw].[none:PLANNER_NAME:nk] / ([sqlproxy.128nvnd1oq3h4b15uyfxt1v9t1kw].[none:MAKE_ITEM_NUMBER:nk] / ([sqlproxy.128nvnd1oq3h4b15uyfxt1v9t1kw].[none:ITEM_NUMBER:nk] / ([sqlproxy.128nvnd1oq3h4b15uyfxt1v9t1kw].[none:ITEM_DESCRIPTION:nk] / ([sqlproxy.128nvnd1oq3h4b15uyfxt1v9t1kw].[none:RECORD_SOURCE:nk] / [sqlproxy.128nvnd1oq3h4b15uyfxt1v9t1kw].[:Measure Names]))))) | [none:MFG_NEED_DATE:ok] | Bar | - |
| `zz.Data Refresh Caption` | - | - | Automatic | - |
| `zz.EmailMe` | - | - | Shape | - |
| `zz.TeamsMsg` | - | - | Shape | - |

### Worksheet Filters and Selections

| Worksheet | Filter class | Field | Selection / groupfilter |
| --- | --- | --- | --- |
| `MRP Material Shortages Details` | `categorical` | `[:Measure Names]` | - |
| `MRP Material Shortages Details` | `categorical` | `[none:ITEM_NUMBER:nk]` | - |
| `MRP Material Shortages Details` | `categorical` | `[none:MAKE_ITEM_NUMBER:nk]` | - |
| `MRP Material Shortages Details` | `quantitative` | `[none:MFG_NEED_DATE:qk]` | - |
| `MRP Material Shortages Details` | `categorical` | `[none:PLANNER_NAME:nk]` | - |
| `MRP Material Shortages Details` | `categorical` | `[none:RECORD_SOURCE:nk]` | - |
| `Pivot MRP Material Shortages` | `categorical` | `[:Measure Names]` | - |
| `Pivot MRP Material Shortages` | `categorical` | `[none:ITEM_NUMBER:nk]` | - |
| `Pivot MRP Material Shortages` | `categorical` | `[none:MAKE_ITEM_NUMBER:nk]` | - |
| `Pivot MRP Material Shortages` | `quantitative` | `[none:MFG_NEED_DATE:qk]` | - |
| `Pivot MRP Material Shortages` | `categorical` | `[none:PLANNER_NAME:nk]` | - |
| `Pivot MRP Material Shortages` | `categorical` | `[none:RECORD_SOURCE:nk]` | - |
| `zz.Data Refresh Caption` | `categorical` | `[none:Calculation_1328843370564071424:nk]` | - |
| `zz.Data Refresh Caption` | `categorical` | `[none:ITEM_NUMBER:nk]` | - |
| `zz.Data Refresh Caption` | `categorical` | `[none:MAKE_ITEM_NUMBER:nk]` | - |
| `zz.Data Refresh Caption` | `quantitative` | `[none:MFG_NEED_DATE:qk]` | - |
| `zz.Data Refresh Caption` | `categorical` | `[none:PLANNER_NAME:nk]` | - |
| `zz.Data Refresh Caption` | `categorical` | `[none:RECORD_SOURCE:nk]` | - |
| `zz.EmailMe` | `categorical` | `[none:ITEM_NUMBER:nk]` | - |
| `zz.EmailMe` | `categorical` | `[none:MAKE_ITEM_NUMBER:nk]` | - |
| `zz.EmailMe` | `quantitative` | `[none:MFG_NEED_DATE:qk]` | - |
| `zz.EmailMe` | `categorical` | `[none:PLANNER_NAME:nk]` | - |
| `zz.EmailMe` | `categorical` | `[none:RECORD_SOURCE:nk]` | - |
| `zz.TeamsMsg` | `categorical` | `[none:ITEM_NUMBER:nk]` | - |
| `zz.TeamsMsg` | `categorical` | `[none:MAKE_ITEM_NUMBER:nk]` | - |
| `zz.TeamsMsg` | `quantitative` | `[none:MFG_NEED_DATE:qk]` | - |
| `zz.TeamsMsg` | `categorical` | `[none:PLANNER_NAME:nk]` | - |
| `zz.TeamsMsg` | `categorical` | `[none:RECORD_SOURCE:nk]` | - |

### Fields Used by Primary Worksheet

- `MRP Material Shortages Details`: `COMPONENT ITEM`, `ITEM DESCRIPTION`, `MAKE ITEM`, `MFG NEED DATE`, `MIN(1)`, `ORDER QTY REQUIRED`, `ORDER TYPE`, `PLANNER NAME`, `QTY ONHAND`, `SHORTAGE QTY`, `TOTAL QTY REQUIRED`
- `Pivot MRP Material Shortages`: `COMPONENT ITEM`, `ITEM DESCRIPTION`, `MAKE ITEM`, `MFG NEED DATE`, `MIN(1)`, `ORDER QTY REQUIRED`, `ORDER TYPE`, `PLANNER NAME`, `QTY ONHAND`, `SHORTAGE QTY`, `TOTAL QTY REQUIRED`
- `zz.Data Refresh Caption`: `Blank`, `COMPONENT ITEM`, `MAKE ITEM`, `MFG NEED DATE`, `ORDER TYPE`, `PLANNER NAME`
- `zz.EmailMe`: `COMPONENT ITEM`, `Email`, `MAKE ITEM`, `MFG NEED DATE`, `ORDER TYPE`, `PLANNER NAME`
- `zz.TeamsMsg`: `COMPONENT ITEM`, `MAKE ITEM`, `MFG NEED DATE`, `ORDER TYPE`, `PLANNER NAME`, `Teams`

## Calculations

Recovered `5` calculated field definitions from static workbook XML.

### Calculated Fields

| Calculated field | Datasource | Formula |
| --- | --- | --- |
| `Blank` | `PROD_MRP Material Shortages` | `""` |
| `Email` | `PROD_MRP Material Shortages` | `"Email Me Here"` |
| `Teams` | `PROD_MRP Material Shortages` | `"Write a Teams Message"` |
| `SHORTAGE QTY` | `PROD_MRP Material Shortages` | `[ORG_QTY_REQUIRED]-[ORG_QTY_ONHAND]` |
| `SHORTAGE COLOR` | `PROD_MRP Material Shortages` | `[Calculation_1866742099008581632]<=0` |

### Calculation Field Dependencies

| Calculated field | Referenced fields |
| --- | --- |
| `Blank` | - |
| `Email` | - |
| `Teams` | - |
| `SHORTAGE QTY` | `ORG_QTY_ONHAND`, `ORG_QTY_REQUIRED` |
| `SHORTAGE COLOR` | `Calculation_1866742099008581632` |

### Calculation Lineage Notes

Calculation lineage should be read against the likely static repo matches above; these matches are inferred from naming convention and local files.

Calculated fields were recovered from: `PROD_MRP Material Shortages`.

### LOD and Table Calculation Summary

| Metric | Count | Fields |
| --- | ---: | --- |
| LOD calculations | 0 | - |
| Table calculations | 0 | - |

## Color and Legend Notes

| Source | Color / legend detail |
| --- | --- |
| Workbook card | `color` for `[sum:ORG_QTY_REQUIRED:qk]` |
| Workbook card | `color` for `[sum:ORG_QTY_ONHAND:qk]` |
| Workbook card | `color` for `[sum:Calculation_1866742099008581632:qk]` |
| Workbook card | `color` for `[sum:MAKE_QTY_REQUIRED:qk]` |
