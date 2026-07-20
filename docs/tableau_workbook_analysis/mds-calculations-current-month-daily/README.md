# MDS Calculations Daily Report

## Tabular Report

| Attribute | Value |
| --- | --- |
| Source workbook | `tableau/my-tableau-dashboards/MDS Calculations Current Month Daily.twbx` |
| Embedded TWB | `MDS Calculations Current Month Daily.twb` |
| Primary dashboard | `MDS Calculations Daily Report` |
| Dashboard count | 2 |
| Worksheet count | 7 |
| Datasource count | 1 |
| Calculated field count | 12 |
| LOD calculation count | 0 |
| Table calculation count | 6 |
| Screenshot | `docs/tableau_workbook_analysis/mds-calculations-current-month-daily/MDS-Calculations-Daily-Report.jpeg` |

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
| `on_original_planning_dates__mrp_planning_snapshot_current_month__minus_actuals_build__item_program_details__nss_domains (2)` | `sqlproxy.1uowoye1ldq3fp1enjg9601qeckd` | collection, [sqlproxy], [sqlproxy], [sqlproxy], [sqlproxy], [sqlproxy], [sqlproxy] |

### Likely dbt / SQL or Seed Lineage Guess

| Likely file | Match score | Static reason |
| --- | ---: | --- |
| `seeds/mrp_planning_snapshot_current_month.csv` | 85.0 | normalized substring; shared tokens: current, month, mrp, planning, snapshot |
| `models/4_marts/item_program_details.sql` | 69.0 | normalized substring; shared tokens: details, item, program |
| `models/4_marts/actuals_build.sql` | 61.0 | normalized substring; shared tokens: actuals, build |
| `seeds/item_program_details__nss_ops_part_numbers_and_domains.csv` | 40.0 | shared tokens: details, domains, item, nss, program |
| `models/3_intermediate/int_item_program_details.sql` | 24.0 | shared tokens: details, item, program |
| `models/3_intermediate/int_mrp_monthly_snapshot_build.sql` | 24.0 | shared tokens: build, mrp, snapshot |
| `models/99_oracle_sql_dev/item_program_details_tableau_prep_formatted.sql` | 24.0 | shared tokens: details, item, program |
| `models/99_oracle_sql_dev/minus_mrp_monthly_build_delivery_tableau_flow_formatted.sql` | 24.0 | shared tokens: build, minus, mrp |
| `models/9_optimized_compiled_sql/minus_actuals_build_delivery.sql` | 24.0 | shared tokens: actuals, build, minus |
| `models/9_optimized_compiled_sql/minus_actuals_build_delivery_historical.sql` | 24.0 | shared tokens: actuals, build, minus |

## Sheet Inventory

| Worksheet | Datasources | Field count | Filter count | Marks |
| --- | --- | ---: | ---: | --- |
| `Current Past Dues Trend_FINAL` | sqlproxy.1uowoye1ldq3fp1enjg9601qeckd | 14 | 4 | Bar, Line |
| `MDS Calculations Daily Sheet` | sqlproxy.1uowoye1ldq3fp1enjg9601qeckd | 13 | 3 | Automatic |
| `Past Dues Trend Details` | sqlproxy.1uowoye1ldq3fp1enjg9601qeckd | 12 | 4 | Automatic |
| `zz.MRP Frequency Caption` | - | 0 | 0 | Automatic |
| `zz.MRP Snapshot Caption (2)` | - | 0 | 0 | Automatic |
| `zz.WIP Frequency Caption` | - | 0 | 0 | Automatic |
| `zz.WIP Refreshed At Caption` | sqlproxy.1uowoye1ldq3fp1enjg9601qeckd | 6 | 3 | Automatic |

### Filter Cards and Visible Controls

| Type | Parameter / field | Mode |
| --- | --- | --- |
| `filters` | `-` | - |
| `filter` | `[none:domain_seed:nk]` | - |
| `color` | `[none:domain_seed:nk] [sqlproxy.1uowoye1ldq3fp1enjg9601qeckd].[:Measure Names]` | - |

### Primary Worksheet Shelves and Marks

| Worksheet | Rows | Columns | Marks | Color fields |
| --- | --- | --- | --- | --- |
| `Current Past Dues Trend_FINAL` | ([sqlproxy.1uowoye1ldq3fp1enjg9601qeckd].[none:domain_seed:nk] * ([sqlproxy.1uowoye1ldq3fp1enjg9601qeckd].[usr:past due 7-Day Moving Avg (copy)_1820580166017200141:qk] + ([sqlproxy.1uowoye1ldq3fp1enjg9601qeckd].[usr:Calculation_2314568744870027265:qk] + [sqlproxy.1uowoye1ldq3fp1enjg9601qeckd].[usr:current past due (copy)_1820580165997432837:qk]))) | [none:original_planing_dates:qk] | Bar, Line | - |
| `MDS Calculations Daily Sheet` | ([sqlproxy.1uowoye1ldq3fp1enjg9601qeckd].[none:domain_seed:nk] / ([sqlproxy.1uowoye1ldq3fp1enjg9601qeckd].[none:program_name_seed:nk] / [sqlproxy.1uowoye1ldq3fp1enjg9601qeckd].[none:part_number_seed:nk])) | ([sqlproxy.1uowoye1ldq3fp1enjg9601qeckd].[iwk:rollover_planing_dates:ok] / ([sqlproxy.1uowoye1ldq3fp1enjg9601qeckd].[none:original_planing_dates:ok] / ([sqlproxy.1uowoye1ldq3fp1enjg9601qeckd].[none:is_current_week_highlighter (copy)_1820580165979484160:nk] / [sqlproxy.1uowoye1ldq3fp1enjg9601qeckd].[:Measure Names]))) | Automatic | - |
| `Past Dues Trend Details` | ([sqlproxy.1uowoye1ldq3fp1enjg9601qeckd].[none:domain_seed:nk] / ([sqlproxy.1uowoye1ldq3fp1enjg9601qeckd].[none:program_name_seed:nk] / [sqlproxy.1uowoye1ldq3fp1enjg9601qeckd].[none:part_number_seed:nk])) | [:Measure Names] | Automatic | - |
| `zz.MRP Frequency Caption` | - | - | Automatic | - |
| `zz.MRP Snapshot Caption (2)` | - | - | Automatic | - |
| `zz.WIP Frequency Caption` | - | - | Automatic | - |
| `zz.WIP Refreshed At Caption` | - | - | Automatic | - |

### Worksheet Filters and Selections

| Worksheet | Filter class | Field | Selection / groupfilter |
| --- | --- | --- | --- |
| `Current Past Dues Trend_FINAL` | `categorical` | `[:Measure Names]` | - |
| `Current Past Dues Trend_FINAL` | `categorical` | `[Action (Domain,Part Number_,Program Name_)]` | - |
| `Current Past Dues Trend_FINAL` | `categorical` | `[none:domain_seed:nk]` | - |
| `Current Past Dues Trend_FINAL` | `categorical` | `[none:program_name_seed:nk]` | - |
| `MDS Calculations Daily Sheet` | `categorical` | `[:Measure Names]` | - |
| `MDS Calculations Daily Sheet` | `categorical` | `[none:domain_seed:nk]` | - |
| `MDS Calculations Daily Sheet` | `categorical` | `[none:program_name_seed:nk]` | - |
| `Past Dues Trend Details` | `categorical` | `[:Measure Names]` | - |
| `Past Dues Trend Details` | `categorical` | `[Action (what_is_today,Domain,Original Planing Dates)]` | - |
| `Past Dues Trend Details` | `categorical` | `[none:domain_seed:nk]` | - |
| `Past Dues Trend Details` | `categorical` | `[none:program_name_seed:nk]` | - |
| `zz.WIP Refreshed At Caption` | `categorical` | `[Action (Domain,Part Number_,Program Name_)]` | - |
| `zz.WIP Refreshed At Caption` | `categorical` | `[Action (what_is_today,Domain,Original Planing Dates)]` | - |
| `zz.WIP Refreshed At Caption` | `quantitative` | `[__tableau_internal_object_id__].[cnt:_82127576962C41CA8F606C090BF7E035:qk]` | - |

### Fields Used by Primary Worksheet

- `Current Past Dues Trend_FINAL`: `7-Day Moving Avg daily past due`, `Domain`, `Original Planing Dates`, `Part Number_`, `Past Due Delivery`, `Program Name_`, `[FEATURE]`, `[Qtys]`, `actual delivery`, `daily past due`, `daily past due 7-Day Moving Avg 6th_forward_looking`, `plan delivery`, `total past due`, `what_is_today`
- `MDS Calculations Daily Sheet`: `Domain`, `MDS %`, `Original Planing Dates`, `Part Number_`, `Past Due Delivery`, `Program Name_`, `Rollover Planing Dates`, `[FEATURE]`, `[Qtys]`, `actual delivery`, `is_current_day_highlighter`, `plan delivery`, `total past due`
- `Past Dues Trend Details`: `Domain`, `MDS %`, `Original Planing Dates`, `Part Number_`, `Past Due Delivery`, `Program Name_`, `[FEATURE]`, `[Qtys]`, `actual delivery`, `plan delivery`, `total past due`, `what_is_today`
- `zz.MRP Frequency Caption`: No datasource dependency fields recovered.
- `zz.MRP Snapshot Caption (2)`: No datasource dependency fields recovered.
- `zz.WIP Frequency Caption`: No datasource dependency fields recovered.
- `zz.WIP Refreshed At Caption`: `Domain`, `Original Planing Dates`, `Part Number_`, `Program Name_`, `minus_actuals_build_delivery`, `what_is_today`

## Calculations

Recovered `12` calculated field definitions from static workbook XML.

### Calculated Fields

| Calculated field | Datasource | Formula |
| --- | --- | --- |
| `is_current_week_highlighter` | `on_original_planning_dates__mrp_planning_snapshot_current_month__minus_actuals_build__item_program_details__nss_domains (2)` | `ISOWEEK(TODAY())>=ISOWEEK([rollover_planing_dates])` |
| `daily past due 7-Day Moving Avg 6th_forward_looking` | `on_original_planning_dates__mrp_planning_snapshot_current_month__minus_actuals_build__item_program_details__nss_domains (2)` | `/// avg of the start pos: first row (0th index) to the end position: 7th row(6th index) INT(WINDOW_AVG(SUM([past_due_delivery])+SUM([plan_delivery_qty])-[Calculation_2249829504782798850],0,6))` |
| `what_is_today` | `on_original_planning_dates__mrp_planning_snapshot_current_month__minus_actuals_build__item_program_details__nss_domains (2)` | `TODAY()` |
| `Monday of Rollover Planning Dates` | `on_original_planning_dates__mrp_planning_snapshot_current_month__minus_actuals_build__item_program_details__nss_domains (2)` | `DATE(DATETRUNC('iso-week',[rollover_planing_dates]))` |
| `actual delivery` | `on_original_planning_dates__mrp_planning_snapshot_current_month__minus_actuals_build__item_program_details__nss_domains (2)` | `ZN(LOOKUP(SUM(IF [FEATURE] = 'actual delivery' THEN [Qtys] ELSE 0 END),0))` |
| `total past due` | `on_original_planning_dates__mrp_planning_snapshot_current_month__minus_actuals_build__item_program_details__nss_domains (2)` | `RUNNING_SUM(SUM([past_due_delivery]) + SUM([plan_delivery_qty]) - [Calculation_2249829504782798850])` |
| `MDS %` | `on_original_planning_dates__mrp_planning_snapshot_current_month__minus_actuals_build__item_program_details__nss_domains (2)` | `IF [Calculation_2249829504782798850]/SUM([plan_delivery_qty]) >1 THEN 1 ELSEIF [Calculation_2249829504782798850] = 0 and sum([plan_delivery_qty]) = 0 THEN NULL ELSEIF ISNULL([Calculation_2249829504782798850]/SUM([plan_delivery_qty])) THEN 1 ELSE [Calculation_2249829504782798850]/SUM([plan_delivery_qty]) END` |
| `row number` | `on_original_planning_dates__mrp_planning_snapshot_current_month__minus_actuals_build__item_program_details__nss_domains (2)` | `INDEX()` |
| `daily past due` | `on_original_planning_dates__mrp_planning_snapshot_current_month__minus_actuals_build__item_program_details__nss_domains (2)` | `SUM([past_due_delivery]) + SUM([plan_delivery_qty]) - [Calculation_2249829504782798850]` |
| `is_current_day_highlighter` | `on_original_planning_dates__mrp_planning_snapshot_current_month__minus_actuals_build__item_program_details__nss_domains (2)` | `TODAY()=[original_planing_dates]` |
| `7-Day Moving Avg daily past due` | `on_original_planning_dates__mrp_planning_snapshot_current_month__minus_actuals_build__item_program_details__nss_domains (2)` | `/// avg of the start pos: -7th row (-6th index) to the end position: 1st row(0th index) INT(WINDOW_AVG(SUM([past_due_delivery])+SUM([plan_delivery_qty])-[Calculation_2249829504782798850],-7,0))` |
| `total past due 7-Day Moving Avg` | `on_original_planning_dates__mrp_planning_snapshot_current_month__minus_actuals_build__item_program_details__nss_domains (2)` | `INT(WINDOW_AVG(RUNNING_SUM(SUM([past_due_delivery])+SUM([plan_delivery_qty])-[Calculation_2249829504782798850]),-7,0))` |

### Calculation Field Dependencies

| Calculated field | Referenced fields |
| --- | --- |
| `is_current_week_highlighter` | `rollover_planing_dates` |
| `daily past due 7-Day Moving Avg 6th_forward_looking` | `Calculation_2249829504782798850`, `past_due_delivery`, `plan_delivery_qty` |
| `what_is_today` | - |
| `Monday of Rollover Planning Dates` | `rollover_planing_dates` |
| `actual delivery` | `FEATURE`, `Qtys` |
| `total past due` | `Calculation_2249829504782798850`, `past_due_delivery`, `plan_delivery_qty` |
| `MDS %` | `Calculation_2249829504782798850`, `plan_delivery_qty` |
| `row number` | - |
| `daily past due` | `Calculation_2249829504782798850`, `past_due_delivery`, `plan_delivery_qty` |
| `is_current_day_highlighter` | `original_planing_dates` |
| `7-Day Moving Avg daily past due` | `Calculation_2249829504782798850`, `past_due_delivery`, `plan_delivery_qty` |
| `total past due 7-Day Moving Avg` | `Calculation_2249829504782798850`, `past_due_delivery`, `plan_delivery_qty` |

### Calculation Lineage Notes

Calculation lineage should be read against the likely static repo matches above; these matches are inferred from naming convention and local files.

Calculated fields were recovered from: `on_original_planning_dates__mrp_planning_snapshot_current_month__minus_actuals_build__item_program_details__nss_domains (2)`.

### LOD and Table Calculation Summary

| Metric | Count | Fields |
| --- | ---: | --- |
| LOD calculations | 0 | - |
| Table calculations | 6 | daily past due 7-Day Moving Avg 6th_forward_looking, actual delivery, total past due, row number, 7-Day Moving Avg daily past due, total past due 7-Day Moving Avg |

## Color and Legend Notes

| Source | Color / legend detail |
| --- | --- |
| Workbook card | `color` for `[none:domain_seed:nk] [sqlproxy.1uowoye1ldq3fp1enjg9601qeckd].[:Measure Names]` |
