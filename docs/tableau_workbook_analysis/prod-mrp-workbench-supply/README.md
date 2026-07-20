# MRP Workbench Supply Dashboard

## Tabular Report

| Attribute | Value |
| --- | --- |
| Source workbook | `tableau/my-tableau-dashboards/PROD_MRP_WORKBENCH_SUPPLY.twbx` |
| Embedded TWB | `PROD_MRP_WORKBENCH_SUPPLY.twb` |
| Primary dashboard | `MRP Workbench Supply Dashboard` |
| Dashboard count | 3 |
| Worksheet count | 3 |
| Datasource count | 1 |
| Calculated field count | 1 |
| LOD calculation count | 0 |
| Table calculation count | 0 |
| Screenshot | `docs/tableau_workbook_analysis/prod-mrp-workbench-supply/MRP-Workbench-Supply-Dashboard.jpeg` |

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
| `PROD_MRP_WORKBENCH_SUPPLY` | `sqlproxy.0jtqtdk0hxvt4815hvv1019243sv` | [sqlproxy], [sqlproxy] |

### Likely dbt / SQL or Seed Lineage Guess

| Likely file | Match score | Static reason |
| --- | ---: | --- |
| `models/1_sources/lookups/lu_mtl_mrp_supply_demand_source_type.sql` | 16.0 | shared tokens: mrp, supply |
| `analyses/recommend_me_columns_initial/bom/rmc_bom_cst_item_cost_details.sql` | 8.0 | shared tokens: details |
| `analyses/recommend_me_columns_initial/mrp/rmc_mrp_sales_order_updates.sql` | 8.0 | shared tokens: mrp |
| `analyses/recommend_me_columns_initial/wsh/rmc_wsh_delivery_details.sql` | 8.0 | shared tokens: details |
| `analyses/supporting_tools/data_quality/int_rollup_delivery_details_delivery_name__wsh_dd_source_line_id.sql` | 8.0 | shared tokens: details |
| `analyses/supporting_tools/data_quality/int_rollup_delivery_details_delivery_name__wsh_nd_name.sql` | 8.0 | shared tokens: details |
| `analyses/supporting_tools/data_quality/int_rollup_delivery_details_delivery_name__wsh_nd_name__windowfunction.sql` | 8.0 | shared tokens: details |
| `analyses/supporting_tools/data_quality/src_mtl_reservations_counts_demand_supply_source_type_id.sql` | 8.0 | shared tokens: supply |
| `knowledgebase/tableau/Dynamic_Daily_Rates_PROD_tableau_data_catalog_lineage.md` | 8.0 | shared tokens: data |
| `knowledgebase/tableau/Employee_WIP_Moves_Last_365_Days_tableau_data_catalog_lineage.md` | 8.0 | shared tokens: data |

## Sheet Inventory

| Worksheet | Datasources | Field count | Filter count | Marks |
| --- | --- | ---: | ---: | --- |
| `MRP WORKBENCH SUPPLY AGGREGATE` | sqlproxy.0jtqtdk0hxvt4815hvv1019243sv | 6 | 4 | Square |
| `MRP WORKBENCH SUPPLY DRILL-DOWN` | sqlproxy.0jtqtdk0hxvt4815hvv1019243sv | 7 | 5 | Square |
| `MRP Workbench Data Details` | sqlproxy.0jtqtdk0hxvt4815hvv1019243sv | 8 | 2 | Automatic |

### Filter Cards and Visible Controls

| Type | Parameter / field | Mode |
| --- | --- | --- |
| `filters` | `-` | - |
| `filter` | `[none:SUGG DUE DATE:qk]` | - |
| `filter` | `[none:PLANNER:nk]` | checkdropdown |
| `filter` | `[none:ITEM:nk]` | checkdropdown |
| `filter` | `[none:ORDER TYPE:nk]` | checkdropdown |
| `filter` | `[none:ORDER NUMBER:ok]` | checkdropdown |
| `filter` | `[sum:Qty/Rate:qk]` | - |

### Primary Worksheet Shelves and Marks

| Worksheet | Rows | Columns | Marks | Color fields |
| --- | --- | --- | --- | --- |
| `MRP WORKBENCH SUPPLY AGGREGATE` | [none:ITEM:nk] | [none:SUGG DUE DATE (copy)_1487313779683512320:ok] | Square | - |
| `MRP WORKBENCH SUPPLY DRILL-DOWN` | ([sqlproxy.0jtqtdk0hxvt4815hvv1019243sv].[none:ITEM:nk] / ([sqlproxy.0jtqtdk0hxvt4815hvv1019243sv].[none:ORDER TYPE:nk] / [sqlproxy.0jtqtdk0hxvt4815hvv1019243sv].[none:ORDER NUMBER:ok])) | [none:SUGG DUE DATE (copy)_1487313779683512320:ok] | Square | - |
| `MRP Workbench Data Details` | ([sqlproxy.0jtqtdk0hxvt4815hvv1019243sv].[none:ITEM:nk] / ([sqlproxy.0jtqtdk0hxvt4815hvv1019243sv].[none:ORDER TYPE:nk] / ([sqlproxy.0jtqtdk0hxvt4815hvv1019243sv].[none:SUGG DUE DATE (copy)_1487313779683512320:ok] / ([sqlproxy.0jtqtdk0hxvt4815hvv1019243sv].[none:SUGG START DATE:ok] / ([sqlproxy.0jtqtdk0hxvt4815hvv1019243sv].[none:PLANNER:nk] / ([sqlproxy.0jtqtdk0hxvt4815hvv1019243sv].[none:Qty/Rate:ok] / [sqlproxy.0jtqtdk0hxvt4815hvv1019243sv].[none:ORDER NUMBER:ok])))))) | - | Automatic | - |

### Worksheet Filters and Selections

| Worksheet | Filter class | Field | Selection / groupfilter |
| --- | --- | --- | --- |
| `MRP WORKBENCH SUPPLY AGGREGATE` | `categorical` | `[none:ITEM:nk]` | - |
| `MRP WORKBENCH SUPPLY AGGREGATE` | `categorical` | `[none:ORDER TYPE:nk]` | - |
| `MRP WORKBENCH SUPPLY AGGREGATE` | `quantitative` | `[none:SUGG DUE DATE:qk]` | - |
| `MRP WORKBENCH SUPPLY AGGREGATE` | `quantitative` | `[sum:Qty/Rate:qk]` | - |
| `MRP WORKBENCH SUPPLY DRILL-DOWN` | `categorical` | `[none:ITEM:nk]` | - |
| `MRP WORKBENCH SUPPLY DRILL-DOWN` | `categorical` | `[none:ORDER NUMBER:ok]` | - |
| `MRP WORKBENCH SUPPLY DRILL-DOWN` | `categorical` | `[none:ORDER TYPE:nk]` | - |
| `MRP WORKBENCH SUPPLY DRILL-DOWN` | `quantitative` | `[none:SUGG DUE DATE (copy)_1487313779683512320:qk]` | - |
| `MRP WORKBENCH SUPPLY DRILL-DOWN` | `quantitative` | `[sum:Qty/Rate:qk]` | - |
| `MRP Workbench Data Details` | `categorical` | `[none:ITEM:nk]` | - |
| `MRP Workbench Data Details` | `categorical` | `[none:ORDER TYPE:nk]` | - |

### Fields Used by Primary Worksheet

- `MRP WORKBENCH SUPPLY AGGREGATE`: `SUGG DUE DATETIME`, `[ITEM]`, `[ORDER TYPE]`, `[PLANNER]`, `[Qty/Rate]`, `[SUGG DUE DATE]`
- `MRP WORKBENCH SUPPLY DRILL-DOWN`: `SUGG DUE DATETIME`, `[ITEM]`, `[ORDER NUMBER]`, `[ORDER TYPE]`, `[PLANNER]`, `[Qty/Rate]`, `[SUGG DUE DATE]`
- `MRP Workbench Data Details`: `SUGG DUE DATETIME`, `[ITEM]`, `[ORDER NUMBER]`, `[ORDER TYPE]`, `[PLANNER]`, `[Qty/Rate]`, `[SUGG DUE DATE]`, `[SUGG START DATE]`

## Calculations

Recovered `1` calculated field definitions from static workbook XML.

### Calculated Fields

| Calculated field | Datasource | Formula |
| --- | --- | --- |
| `SUGG DUE DATETIME` | `PROD_MRP_WORKBENCH_SUPPLY` | `DATE([SUGG DUE DATE])` |

### Calculation Field Dependencies

| Calculated field | Referenced fields |
| --- | --- |
| `SUGG DUE DATETIME` | `SUGG DUE DATE` |

### Calculation Lineage Notes

Calculation lineage should be read against the likely static repo matches above; these matches are inferred from naming convention and local files.

Calculated fields were recovered from: `PROD_MRP_WORKBENCH_SUPPLY`.

### LOD and Table Calculation Summary

| Metric | Count | Fields |
| --- | ---: | --- |
| LOD calculations | 0 | - |
| Table calculations | 0 | - |

## Color and Legend Notes

No explicit color encoding or legend card elements were recovered from static workbook XML.
