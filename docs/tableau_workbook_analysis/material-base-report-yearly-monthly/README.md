# NSS Material Base Report

## Tabular Report

| Attribute | Value |
| --- | --- |
| Source workbook | `tableau/my-tableau-dashboards/Material Base Report Yearly Monthly.twbx` |
| Embedded TWB | `Material Base Report Yearly Monthly (2).twb` |
| Primary dashboard | `NSS Material Base Report` |
| Dashboard count | 1 |
| Worksheet count | 3 |
| Datasource count | 1 |
| Calculated field count | 2 |
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
| `minus_wip_valuation_conv_oh__agg_monthly__dim_item_master__dim_fiscal_and_calendar_dates` | `sqlproxy.0ejz8vt0t1z73e1grt0dq09g5z9i` | collection, [sqlproxy], [sqlproxy], [sqlproxy], [sqlproxy], [sqlproxy], [sqlproxy] |

### Likely dbt / SQL or Seed Lineage Guess

| Likely file | Match score | Static reason |
| --- | ---: | --- |
| `models/9_optimized_compiled_sql/minus_wip_valuation_conv_oh__agg_monthly.sql` | 101.0 | normalized substring; shared tokens: agg, conv, minus, monthly, oh, valuation, wip |
| `models/9_optimized_compiled_sql/minus_wip_valuation_conv_oh.sql` | 85.0 | normalized substring; shared tokens: conv, minus, oh, valuation, wip |
| `models/4_marts/dimensions/dim_fiscal_and_calendar_dates.sql` | 77.0 | normalized substring; shared tokens: calendar, dates, dim, fiscal |
| `models/4_marts/wip_valuation_conv_oh.sql` | 77.0 | normalized substring; shared tokens: conv, oh, valuation, wip |
| `models/4_marts/dimensions/dim_item_master.sql` | 69.0 | normalized substring; shared tokens: dim, item, master |
| `models/9_optimized_compiled_sql/minus_wip_valuation_conv_oh__agg_yearly.sql` | 56.0 | shared tokens: agg, conv, minus, oh, valuation, wip, yearly |
| `models/9_optimized_compiled_sql/minus_wip_valuation_conv_oh__scf__agg_monthly.sql` | 56.0 | shared tokens: agg, conv, minus, monthly, oh, valuation, wip |
| `models/4_marts/agg/agg_wip_valuation_conv_oh_monthly.sql` | 48.0 | shared tokens: agg, conv, monthly, oh, valuation, wip |
| `models/4_marts/agg/agg_wip_valuation_conv_oh_yearly.sql` | 48.0 | shared tokens: agg, conv, oh, valuation, wip, yearly |
| `models/9_optimized_compiled_sql/minus_wip_valuation_conv_oh__agg_ytd.sql` | 48.0 | shared tokens: agg, conv, minus, oh, valuation, wip |

## Sheet Inventory

| Worksheet | Datasources | Field count | Filter count | Marks |
| --- | --- | ---: | ---: | --- |
| `Material Base Report Export Data Sheet` | sqlproxy.0ejz8vt0t1z73e1grt0dq09g5z9i | 12 | 8 | Automatic |
| `zz.Data Refresh At Caption (2)` | sqlproxy.0ejz8vt0t1z73e1grt0dq09g5z9i | 1 | 1 | Automatic |
| `zz.Frequency Caption (2)` | - | 0 | 0 | Automatic |

### Filter Cards and Visible Controls

| Type | Parameter / field | Mode |
| --- | --- | --- |
| `filters` | `-` | - |
| `filter` | `[none:Plus TL Flag:ok]` | - |
| `filter` | `[none:FISCAL_DATE_PLACEHOLDER:ok]` | checkdropdown |
| `filter` | `[none:Part Number:nk]` | checkdropdown |
| `filter` | `[none:Job Class Code:nk]` | checkdropdown |
| `filter` | `[none:Item Status:nk]` | checkdropdown |
| `filter` | `[:Measure Names]` | - |
| `filter` | `[none:Planner Code:nk]` | checkdropdown |

### Primary Worksheet Shelves and Marks

| Worksheet | Rows | Columns | Marks | Color fields |
| --- | --- | --- | --- | --- |
| `Material Base Report Export Data Sheet` | ([sqlproxy.0ejz8vt0t1z73e1grt0dq09g5z9i].[usr:Calculation_1126462901046956032:ok:2] / ([sqlproxy.0ejz8vt0t1z73e1grt0dq09g5z9i].[none:Program:nk] / ([sqlproxy.0ejz8vt0t1z73e1grt0dq09g5z9i].[none:FISCAL_DATE_PLACEHOLDER:ok] / ([sqlproxy.0ejz8vt0t1z73e1grt0dq09g5z9i].[none:Planner Code:nk] / ([sqlproxy.0ejz8vt0t1z73e1grt0dq09g5z9i].[none:Part Number:nk] / ([sqlproxy.0ejz8vt0t1z73e1grt0dq09g5z9i].[none:Part Description:nk] / ([sqlproxy.0ejz8vt0t1z73e1grt0dq09g5z9i].[none:Item Status:nk] / [sqlproxy.0ejz8vt0t1z73e1grt0dq09g5z9i].[none:Job Class Code:nk]))))))) | [:Measure Names] | Automatic | - |
| `zz.Data Refresh At Caption (2)` | - | - | Automatic | - |
| `zz.Frequency Caption (2)` | - | - | Automatic | - |

### Worksheet Filters and Selections

| Worksheet | Filter class | Field | Selection / groupfilter |
| --- | --- | --- | --- |
| `Material Base Report Export Data Sheet` | `categorical` | `[:Measure Names]` | - |
| `Material Base Report Export Data Sheet` | `categorical` | `[none:FISCAL_DATE_PLACEHOLDER:ok]` | - |
| `Material Base Report Export Data Sheet` | `categorical` | `[none:Item Status:nk]` | - |
| `Material Base Report Export Data Sheet` | `categorical` | `[none:Job Class Code:nk]` | - |
| `Material Base Report Export Data Sheet` | `categorical` | `[none:Part Number:nk]` | - |
| `Material Base Report Export Data Sheet` | `categorical` | `[none:Planner Code:nk]` | - |
| `Material Base Report Export Data Sheet` | `categorical` | `[none:Plus TL Flag:ok]` | - |
| `Material Base Report Export Data Sheet` | `categorical` | `[none:Program:nk]` | - |
| `zz.Data Refresh At Caption (2)` | `categorical` | `[none:Calculation_1328843370564071424:nk]` | - |

### Fields Used by Primary Worksheet

- `Material Base Report Export Data Sheet`: `Fiscal M/Y`, `[Base Material Monthly]`, `[Item Status]`, `[Job Class Code]`, `[Part Description]`, `[Part Number]`, `[Planner Code]`, `[Plus TL Flag]`, `[Program]`, `[Unit Cost]`, `[Units Monthly]`, `row num`
- `zz.Data Refresh At Caption (2)`: `Blank`
- `zz.Frequency Caption (2)`: No datasource dependency fields recovered.

## Calculations

Recovered `2` calculated field definitions from static workbook XML.

### Calculated Fields

| Calculated field | Datasource | Formula |
| --- | --- | --- |
| `row num` | `minus_wip_valuation_conv_oh__agg_monthly__dim_item_master__dim_fiscal_and_calendar_dates` | `index()` |
| `Blank` | `minus_wip_valuation_conv_oh__agg_monthly__dim_item_master__dim_fiscal_and_calendar_dates` | `""` |

### Calculation Field Dependencies

| Calculated field | Referenced fields |
| --- | --- |
| `row num` | - |
| `Blank` | - |

### Calculation Lineage Notes

Calculation lineage should be read against the likely static repo matches above; these matches are inferred from naming convention and local files.

Calculated fields were recovered from: `minus_wip_valuation_conv_oh__agg_monthly__dim_item_master__dim_fiscal_and_calendar_dates`.

### LOD and Table Calculation Summary

| Metric | Count | Fields |
| --- | ---: | --- |
| LOD calculations | 0 | - |
| Table calculations | 1 | row num |

## Color and Legend Notes

No explicit color encoding or legend card elements were recovered from static workbook XML.
