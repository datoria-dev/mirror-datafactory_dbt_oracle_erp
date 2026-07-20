# WIP Shipment Lines Dashboard

## Tabular Report

| Attribute | Value |
| --- | --- |
| Source workbook | `tableau/my-tableau-dashboards/WIP Shipment Lines.twbx` |
| Embedded TWB | `WIP Shipment Lines.twb` |
| Primary dashboard | `WIP Shipment Lines Dashboard` |
| Dashboard count | 1 |
| Worksheet count | 3 |
| Datasource count | 1 |
| Calculated field count | 3 |
| LOD calculation count | 0 |
| Table calculation count | 0 |
| Screenshot | `docs/tableau_workbook_analysis/wip-shipment-lines/WIP-Shipment-Lines-Dashboard.jpeg` |

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
| `dim_wip_reservations__dim_wip_jobs_and_operations__dim_item_master` | `sqlproxy.1c08zgc1eykv741afj51o14xpmpp` | collection, [sqlproxy], [sqlproxy], [sqlproxy], [sqlproxy], [sqlproxy], [sqlproxy], [sqlproxy], +3 more |

### Likely dbt / SQL or Seed Lineage Guess

| Likely file | Match score | Static reason |
| --- | ---: | --- |
| `models/4_marts/dimensions/dim_wip_jobs_and_operations.sql` | 77.0 | normalized substring; shared tokens: dim, jobs, operations, wip |
| `models/4_marts/dimensions/dim_item_master.sql` | 69.0 | normalized substring; shared tokens: dim, item, master |
| `models/4_marts/dimensions/dim_wip_jobs.sql` | 69.0 | normalized substring; shared tokens: dim, jobs, wip |
| `models/4_marts/dimensions/dim_wip_jobs_batch_completions.sql` | 24.0 | shared tokens: dim, jobs, wip |
| `models/4_marts/dimensions/dim_wip_jobs_completions.sql` | 24.0 | shared tokens: dim, jobs, wip |
| `models/4_marts/dimensions/dim_wip_reservations_on_sales_orders.sql` | 24.0 | shared tokens: dim, reservations, wip |
| `analyses/recommend_me_columns_initial/wip/rmc_wip_discrete_jobs.sql` | 16.0 | shared tokens: jobs, wip |
| `analyses/recommend_me_columns_initial/wip/rmc_wip_operations.sql` | 16.0 | shared tokens: operations, wip |
| `analyses/recommend_me_columns_initial/wip/rmc_wip_requirement_operations.sql` | 16.0 | shared tokens: operations, wip |
| `models/1_sources/mrp/src_mrp_item_wip_entities.sql` | 16.0 | shared tokens: item, wip |

## Sheet Inventory

| Worksheet | Datasources | Field count | Filter count | Marks |
| --- | --- | ---: | ---: | --- |
| `WIP Shipment Lines Pivot` | sqlproxy.1c08zgc1eykv741afj51o14xpmpp | 14 | 7 | Automatic |
| `zz.Data Refresh At Caption` | sqlproxy.1c08zgc1eykv741afj51o14xpmpp | 7 | 2 | Automatic |
| `zz.freq.Every Hour from 445am to 845pm` | - | 0 | 0 | Automatic |

### Filter Cards and Visible Controls

| Type | Parameter / field | Mode |
| --- | --- | --- |
| `filters` | `-` | - |
| `filter` | `[:Measure Names]` | - |
| `color` | `[:Measure Names]` | - |

### Primary Worksheet Shelves and Marks

| Worksheet | Rows | Columns | Marks | Color fields |
| --- | --- | --- | --- | --- |
| `WIP Shipment Lines Pivot` | ([sqlproxy.1c08zgc1eykv741afj51o14xpmpp].[none:Scheduled Delivery Date:ok] / ([sqlproxy.1c08zgc1eykv741afj51o14xpmpp].[none:Part Number:nk] / ([sqlproxy.1c08zgc1eykv741afj51o14xpmpp].[none:Sales Order:nk] / ([sqlproxy.1c08zgc1eykv741afj51o14xpmpp].[none:Sales Line Number:ok] / ([sqlproxy.1c08zgc1eykv741afj51o14xpmpp].[none:From Op Seq Num:ok] / [sqlproxy.1c08zgc1eykv741afj51o14xpmpp].[none:From Op Desc:nk]))))) | [:Measure Names] | Automatic | - |
| `zz.Data Refresh At Caption` | - | - | Automatic | - |
| `zz.freq.Every Hour from 445am to 845pm` | - | - | Automatic | - |

### Worksheet Filters and Selections

| Worksheet | Filter class | Field | Selection / groupfilter |
| --- | --- | --- | --- |
| `WIP Shipment Lines Pivot` | `categorical` | `[:Measure Names]` | - |
| `WIP Shipment Lines Pivot` | `categorical` | `[none:Calculation_2105995834456551424:nk]` | - |
| `WIP Shipment Lines Pivot` | `categorical` | `[none:Calculation_2194660452536893440:nk]` | - |
| `WIP Shipment Lines Pivot` | `categorical` | `[none:From Op Desc:nk]` | - |
| `WIP Shipment Lines Pivot` | `categorical` | `[none:Part Number:nk]` | - |
| `WIP Shipment Lines Pivot` | `categorical` | `[none:Planner:nk]` | - |
| `WIP Shipment Lines Pivot` | `categorical` | `[none:Sales Order:nk]` | - |
| `zz.Data Refresh At Caption` | `categorical` | `[Action (From Op Desc,From Op Seq Num,Part Number,Sales Line Number,Sales Order,Scheduled Delivery Date)]` | - |
| `zz.Data Refresh At Caption` | `categorical` | `[none:Calculation_1328843370564071424:nk]` | - |

### Fields Used by Primary Worksheet

- `WIP Shipment Lines Pivot`: `Is Complete?`, `Scheduled Ship Date`, `[Fm Op Qty Completed]`, `[Fm Op Qty Remaining]`, `[Fm Op Qty in Queue]`, `[Fm Op Scheduled Qty]`, `[From Op Desc]`, `[From Op Seq Num]`, `[Job Qty Remaining]`, `[Part Number]`, `[Planner]`, `[Sales Line Number]`, `[Sales Order]`, `is_sales_order`
- `zz.Data Refresh At Caption`: `Blank`, `Scheduled Ship Date`, `[From Op Desc]`, `[From Op Seq Num]`, `[Part Number]`, `[Sales Line Number]`, `[Sales Order]`
- `zz.freq.Every Hour from 445am to 845pm`: No datasource dependency fields recovered.

## Calculations

Recovered `3` calculated field definitions from static workbook XML.

### Calculated Fields

| Calculated field | Datasource | Formula |
| --- | --- | --- |
| `Blank` | `dim_wip_reservations__dim_wip_jobs_and_operations__dim_item_master` | `""` |
| `Is Complete?` | `dim_wip_reservations__dim_wip_jobs_and_operations__dim_item_master` | `[Fm Op Qty Completed] = [Fm Op Scheduled Qty]` |
| `is_sales_order` | `dim_wip_reservations__dim_wip_jobs_and_operations__dim_item_master` | `NOT ISNULL([Sales Order])` |

### Calculation Field Dependencies

| Calculated field | Referenced fields |
| --- | --- |
| `Blank` | - |
| `Is Complete?` | `Fm Op Qty Completed`, `Fm Op Scheduled Qty` |
| `is_sales_order` | `Sales Order` |

### Calculation Lineage Notes

Calculation lineage should be read against the likely static repo matches above; these matches are inferred from naming convention and local files.

Calculated fields were recovered from: `dim_wip_reservations__dim_wip_jobs_and_operations__dim_item_master`.

### LOD and Table Calculation Summary

| Metric | Count | Fields |
| --- | ---: | --- |
| LOD calculations | 0 | - |
| Table calculations | 0 | - |

## Color and Legend Notes

| Source | Color / legend detail |
| --- | --- |
| Workbook card | `color` for `[:Measure Names]` |
