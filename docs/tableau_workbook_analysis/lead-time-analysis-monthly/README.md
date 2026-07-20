# Histogram Lead Time Analysis Dashboard

## Tabular Report

| Attribute | Value |
| --- | --- |
| Source workbook | `tableau/my-tableau-dashboards/Lead Time Analysis Monthly.twbx` |
| Embedded TWB | `Lead Time Analysis Monthly.twb` |
| Primary dashboard | `Histogram Lead Time Analysis Dashboard` |
| Dashboard count | 3 |
| Worksheet count | 12 |
| Datasource count | 1 |
| Calculated field count | 4 |
| LOD calculation count | 0 |
| Table calculation count | 1 |
| Screenshot | `docs/tableau_workbook_analysis/lead-time-analysis-monthly/Histogram-Lead-Time-Analysis-Dashboard.jpeg` |

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
| `lead_times_analysis_final__item_program_details` | `sqlproxy.18u04ad1u0ux771g1bcas17khyy6` | collection, [sqlproxy], [sqlproxy], [sqlproxy], [sqlproxy], [sqlproxy], [sqlproxy], [sqlproxy], +1 more |

### Likely dbt / SQL or Seed Lineage Guess

| Likely file | Match score | Static reason |
| --- | ---: | --- |
| `models/4_marts/lead_times_analysis_final.sql` | 77.0 | normalized substring; shared tokens: analysis, final, lead, times |
| `models/4_marts/item_program_details.sql` | 69.0 | normalized substring; shared tokens: details, item, program |
| `models/4_marts/agg/agg_lead_time_analysis_percent_complete.sql` | 40.0 | shared tokens: analysis, complete, lead, percent, time |
| `models/3_intermediate/int_item_program_details.sql` | 24.0 | shared tokens: details, item, program |
| `models/4_marts/agg/agg_lead_time_analysis_median.sql` | 24.0 | shared tokens: analysis, lead, time |
| `models/4_marts/facts/fct_lead_time_analysis.sql` | 24.0 | shared tokens: analysis, lead, time |
| `models/4_marts/lead_times_analysis_full7day_week.sql` | 24.0 | shared tokens: analysis, lead, times |
| `models/4_marts/lead_times_analysis_workingdays_week.sql` | 24.0 | shared tokens: analysis, lead, times |
| `models/99_oracle_sql_dev/item_program_details_tableau_prep_formatted.sql` | 24.0 | shared tokens: details, item, program |
| `seeds/item_program_details__nss_ops_part_numbers_and_domains.csv` | 24.0 | shared tokens: details, item, program |

## Sheet Inventory

| Worksheet | Datasources | Field count | Filter count | Marks |
| --- | --- | ---: | ---: | --- |
| `1 Bar Charts Lead Times Analysis by Part Number` | sqlproxy.18u04ad1u0ux771g1bcas17khyy6 | 7 | 4 | Bar, Line |
| `1 Bar and Line Chart Med and Per` | sqlproxy.18u04ad1u0ux771g1bcas17khyy6 | 5 | 3 | Bar, Line |
| `1 Histogram Sheet` | sqlproxy.18u04ad1u0ux771g1bcas17khyy6 | 7 | 3 | Bar |
| `2 Histogram Sheet Crosstab` | sqlproxy.18u04ad1u0ux771g1bcas17khyy6 | 7 | 5 | Automatic |
| `2 Lead Time Crosstab` | sqlproxy.18u04ad1u0ux771g1bcas17khyy6 | 8 | 4 | Automatic |
| `2 Lead Time Med and Per Crosstab` | sqlproxy.18u04ad1u0ux771g1bcas17khyy6 | 5 | 4 | Automatic |
| `3 Export Ready Data Details 1` | sqlproxy.18u04ad1u0ux771g1bcas17khyy6 | 14 | 6 | Automatic |
| `3 Export Ready Data Details Sheet 2` | sqlproxy.18u04ad1u0ux771g1bcas17khyy6 | 14 | 5 | Automatic |
| `3 Export Ready Data Details Sheet 3` | sqlproxy.18u04ad1u0ux771g1bcas17khyy6 | 16 | 7 | Automatic |
| `Monthly Histogram` | sqlproxy.18u04ad1u0ux771g1bcas17khyy6 | 5 | 2 | Bar |
| `zz.Data Refresh At Caption` | sqlproxy.18u04ad1u0ux771g1bcas17khyy6 | 5 | 5 | Automatic |
| `zz.Frequency Caption` | - | 0 | 0 | Automatic |

### Filter Cards and Visible Controls

| Type | Parameter / field | Mode |
| --- | --- | --- |
| `filters` | `-` | - |
| `color` | `[:Measure Names]` | - |
| `color` | `[:Measure Names]` | - |
| `color` | `[none:Within Lead Time Flag:nk]` | - |
| `color` | `[:Measure Names]` | - |

### Primary Worksheet Shelves and Marks

| Worksheet | Rows | Columns | Marks | Color fields |
| --- | --- | --- | --- | --- |
| `1 Bar Charts Lead Times Analysis by Part Number` | ([sqlproxy.18u04ad1u0ux771g1bcas17khyy6].[Multiple Values] + [sqlproxy.18u04ad1u0ux771g1bcas17khyy6].[avg:WEIGHT_AVG_LEAD_TIME:vtavg:qk]) | [none:Part Number:nk] | Bar, Line | - |
| `1 Bar and Line Chart Med and Per` | ([sqlproxy.18u04ad1u0ux771g1bcas17khyy6].[none:Part Number:nk] * ([sqlproxy.18u04ad1u0ux771g1bcas17khyy6].[sum:WEIGHT_AVG_LEAD_TIME:qk] + [sqlproxy.18u04ad1u0ux771g1bcas17khyy6].[sum:Percent Complete Within Lead Time:qk])) | [tmn:FISCAL_DATE_PLACEHOLDER:qk] | Bar, Line | - |
| `1 Histogram Sheet` | [sum:Qty Completed:qk] | [none:Working Days Actual LT (bin):qk] | Bar | - |
| `2 Histogram Sheet Crosstab` | - | [none:Working Days Actual LT (bin):ok] | Automatic | - |
| `2 Lead Time Crosstab` | ([sqlproxy.18u04ad1u0ux771g1bcas17khyy6].[none:Part Number:nk] / [sqlproxy.18u04ad1u0ux771g1bcas17khyy6].[:Measure Names]) | [none:FISCAL_DATE_PLACEHOLDER:ok] | Automatic | - |
| `2 Lead Time Med and Per Crosstab` | [:Measure Names] | [tmn:FISCAL_DATE_PLACEHOLDER:ok] | Automatic | - |
| `3 Export Ready Data Details 1` | ([sqlproxy.18u04ad1u0ux771g1bcas17khyy6].[usr:Calculation_379146813477654529:ok] / ([sqlproxy.18u04ad1u0ux771g1bcas17khyy6].[none:Part Number:nk] / ([sqlproxy.18u04ad1u0ux771g1bcas17khyy6].[none:Job Number:nk] / ([sqlproxy.18u04ad1u0ux771g1bcas17khyy6].[none:Job Start Date:ok] / ([sqlproxy.18u04ad1u0ux771g1bcas17khyy6].[none:Completion Date:ok] / [sqlproxy.18u04ad1u0ux771g1bcas17khyy6].[none:FISCAL_DATE_PLACEHOLDER:ok]))))) | [:Measure Names] | Automatic | - |
| `3 Export Ready Data Details Sheet 2` | ([sqlproxy.18u04ad1u0ux771g1bcas17khyy6].[usr:Calculation_379146813477654529:ok] / ([sqlproxy.18u04ad1u0ux771g1bcas17khyy6].[none:Part Number:nk] / ([sqlproxy.18u04ad1u0ux771g1bcas17khyy6].[none:Job Number:nk] / ([sqlproxy.18u04ad1u0ux771g1bcas17khyy6].[none:Job Start Date:ok] / ([sqlproxy.18u04ad1u0ux771g1bcas17khyy6].[none:Completion Date:ok] / [sqlproxy.18u04ad1u0ux771g1bcas17khyy6].[none:FISCAL_DATE_PLACEHOLDER:ok]))))) | [:Measure Names] | Automatic | - |
| `3 Export Ready Data Details Sheet 3` | ([sqlproxy.18u04ad1u0ux771g1bcas17khyy6].[usr:Calculation_379146813477654529:ok] / ([sqlproxy.18u04ad1u0ux771g1bcas17khyy6].[none:Part Number:nk] / ([sqlproxy.18u04ad1u0ux771g1bcas17khyy6].[none:Job Number:nk] / ([sqlproxy.18u04ad1u0ux771g1bcas17khyy6].[none:Job Start Date:ok] / ([sqlproxy.18u04ad1u0ux771g1bcas17khyy6].[none:Completion Date:ok] / [sqlproxy.18u04ad1u0ux771g1bcas17khyy6].[none:FISCAL_DATE_PLACEHOLDER:ok]))))) | [:Measure Names] | Automatic | - |
| `Monthly Histogram` | [sum:Qty Completed:qk] | ([sqlproxy.18u04ad1u0ux771g1bcas17khyy6].[none:FISCAL_DATE_PLACEHOLDER:ok] * [sqlproxy.18u04ad1u0ux771g1bcas17khyy6].[none:Working Days Actual LT (bin):qk]) | Bar | - |
| `zz.Data Refresh At Caption` | - | - | Automatic | - |
| `zz.Frequency Caption` | - | - | Automatic | - |

### Worksheet Filters and Selections

| Worksheet | Filter class | Field | Selection / groupfilter |
| --- | --- | --- | --- |
| `1 Bar Charts Lead Times Analysis by Part Number` | `categorical` | `[:Measure Names]` | - |
| `1 Bar Charts Lead Times Analysis by Part Number` | `categorical` | `[none:FISCAL_DATE_PLACEHOLDER:ok]` | - |
| `1 Bar Charts Lead Times Analysis by Part Number` | `categorical` | `[none:Part Number:nk]` | - |
| `1 Bar Charts Lead Times Analysis by Part Number` | `categorical` | `[none:Planner:nk]` | - |
| `1 Bar and Line Chart Med and Per` | `categorical` | `[none:FISCAL_DATE_PLACEHOLDER:ok]` | - |
| `1 Bar and Line Chart Med and Per` | `categorical` | `[none:Part Number:nk]` | - |
| `1 Bar and Line Chart Med and Per` | `categorical` | `[none:Planner:nk]` | - |
| `1 Histogram Sheet` | `categorical` | `[none:FISCAL_DATE_PLACEHOLDER:ok]` | - |
| `1 Histogram Sheet` | `categorical` | `[none:Part Number:nk]` | - |
| `1 Histogram Sheet` | `categorical` | `[none:Planner:nk]` | - |
| `2 Histogram Sheet Crosstab` | `categorical` | `[Action (Within Lead Time Flag,bins)]` | - |
| `2 Histogram Sheet Crosstab` | `categorical` | `[Action (bins)]` | - |
| `2 Histogram Sheet Crosstab` | `categorical` | `[none:FISCAL_DATE_PLACEHOLDER:ok]` | - |
| `2 Histogram Sheet Crosstab` | `categorical` | `[none:Part Number:nk]` | - |
| `2 Histogram Sheet Crosstab` | `categorical` | `[none:Planner:nk]` | - |
| `2 Lead Time Crosstab` | `categorical` | `[:Measure Names]` | - |
| `2 Lead Time Crosstab` | `categorical` | `[none:FISCAL_DATE_PLACEHOLDER:ok]` | - |
| `2 Lead Time Crosstab` | `categorical` | `[none:Part Number:nk]` | - |
| `2 Lead Time Crosstab` | `categorical` | `[none:Planner:nk]` | - |
| `2 Lead Time Med and Per Crosstab` | `categorical` | `[:Measure Names]` | - |
| `2 Lead Time Med and Per Crosstab` | `categorical` | `[none:FISCAL_DATE_PLACEHOLDER:ok]` | - |
| `2 Lead Time Med and Per Crosstab` | `categorical` | `[none:Part Number:nk]` | - |
| `2 Lead Time Med and Per Crosstab` | `categorical` | `[none:Planner:nk]` | - |
| `3 Export Ready Data Details 1` | `categorical` | `[:Measure Names]` | - |
| `3 Export Ready Data Details 1` | `categorical` | `[Action (Part Number)]` | - |
| `3 Export Ready Data Details 1` | `categorical` | `[none:FISCAL_DATE_PLACEHOLDER:ok]` | - |
| `3 Export Ready Data Details 1` | `categorical` | `[none:Job Number:nk]` | - |
| `3 Export Ready Data Details 1` | `categorical` | `[none:Part Number:nk]` | - |
| `3 Export Ready Data Details 1` | `categorical` | `[none:Planner:nk]` | - |
| `3 Export Ready Data Details Sheet 2` | `categorical` | `[:Measure Names]` | - |
| `3 Export Ready Data Details Sheet 2` | `categorical` | `[none:FISCAL_DATE_PLACEHOLDER:ok]` | - |
| `3 Export Ready Data Details Sheet 2` | `categorical` | `[none:Job Number:nk]` | - |
| `3 Export Ready Data Details Sheet 2` | `categorical` | `[none:Part Number:nk]` | - |
| `3 Export Ready Data Details Sheet 2` | `categorical` | `[none:Planner:nk]` | - |
| `3 Export Ready Data Details Sheet 3` | `categorical` | `[:Measure Names]` | - |
| `3 Export Ready Data Details Sheet 3` | `categorical` | `[Action (Within Lead Time Flag,bins)]` | - |
| `3 Export Ready Data Details Sheet 3` | `categorical` | `[Action (bins)]` | - |
| `3 Export Ready Data Details Sheet 3` | `categorical` | `[none:FISCAL_DATE_PLACEHOLDER:ok]` | - |
| `3 Export Ready Data Details Sheet 3` | `categorical` | `[none:Job Number:nk]` | - |
| `3 Export Ready Data Details Sheet 3` | `categorical` | `[none:Part Number:nk]` | - |
| `3 Export Ready Data Details Sheet 3` | `categorical` | `[none:Planner:nk]` | - |
| `Monthly Histogram` | `categorical` | `[none:FISCAL_DATE_PLACEHOLDER:ok]` | - |
| `Monthly Histogram` | `categorical` | `[none:Part Number:nk]` | - |
| `zz.Data Refresh At Caption` | `categorical` | `[Action (Part Number)]` | - |
| `zz.Data Refresh At Caption` | `categorical` | `[Action (Within Lead Time Flag,bins)]` | - |
| `zz.Data Refresh At Caption` | `categorical` | `[Action (Working Days Actual LT (bin))]` | - |
| `zz.Data Refresh At Caption` | `categorical` | `[Action (bins)]` | - |
| `zz.Data Refresh At Caption` | `quantitative` | `[none:WMT_PRIMARY_ITEM_ID (Custom SQL Query):qk]` | - |

### Fields Used by Primary Worksheet

- `1 Bar Charts Lead Times Analysis by Part Number`: `Fiscal Month_`, `Median Lead Time`, `Oracle Lead Time`, `[Part Number]`, `[Planner]`, `[Qty Completed Over LT]`, `[Qty Completed Within LT]`
- `1 Bar and Line Chart Med and Per`: `Fiscal Month_`, `Median Lead Time`, `[Part Number]`, `[Percent Complete Within Lead Time]`, `[Planner]`
- `1 Histogram Sheet`: `Actual Lead Time`, `Fiscal Month_`, `Total Qty Completed`, `[Part Number]`, `[Planner]`, `[Within Lead Time Flag]`, `bins`
- `2 Histogram Sheet Crosstab`: `Actual Lead Time`, `Fiscal Month_`, `Total Qty Completed`, `[Part Number]`, `[Planner]`, `[Within Lead Time Flag]`, `bins`
- `2 Lead Time Crosstab`: `Fiscal Month_`, `Median Lead Time`, `Oracle Lead Time`, `Total Qty Completed`, `[Part Number]`, `[Planner]`, `[Qty Completed Over LT]`, `[Qty Completed Within LT]`
- `2 Lead Time Med and Per Crosstab`: `Fiscal Month_`, `Median Lead Time`, `[Part Number]`, `[Percent Complete Within Lead Time]`, `[Planner]`
- `3 Export Ready Data Details 1`: `Actual Lead Time`, `Fiscal Month_`, `Median Lead Time`, `Oracle Lead Time`, `Total Qty Completed`, `[Completion Date]`, `[Job Number]`, `[Job Start Date]`, `[Part Number]`, `[Percent Complete Within Lead Time]`, `[Planner]`, `[Qty Completed Over LT]`, `[Qty Completed Within LT]`, `row num`
- `3 Export Ready Data Details Sheet 2`: `Actual Lead Time`, `Fiscal Month_`, `Median Lead Time`, `Oracle Lead Time`, `Total Qty Completed`, `[Completion Date]`, `[Job Number]`, `[Job Start Date]`, `[Part Number]`, `[Percent Complete Within Lead Time]`, `[Planner]`, `[Qty Completed Over LT]`, `[Qty Completed Within LT]`, `row num`
- `3 Export Ready Data Details Sheet 3`: `Actual Lead Time`, `Fiscal Month_`, `Median Lead Time`, `Oracle Lead Time`, `Total Qty Completed`, `[Completion Date]`, `[Job Number]`, `[Job Start Date]`, `[Part Number]`, `[Percent Complete Within Lead Time]`, `[Planner]`, `[Qty Completed Over LT]`, `[Qty Completed Within LT]`, `[Within Lead Time Flag]`, `bins`, `row num`
- `Monthly Histogram`: `Actual Lead Time`, `Fiscal Month_`, `Total Qty Completed`, `[Part Number]`, `bins`
- `zz.Data Refresh At Caption`: `Actual Lead Time`, `[Part Number]`, `[WMT_PRIMARY_ITEM_ID (Custom SQL Query)]`, `[Within Lead Time Flag]`, `bins`
- `zz.Frequency Caption`: No datasource dependency fields recovered.

## Calculations

Recovered `4` calculated field definitions from static workbook XML.

### Calculated Fields

| Calculated field | Datasource | Formula |
| --- | --- | --- |
| `M/Y Completion Date` | `lead_times_analysis_final__item_program_details` | `DATE(DATETRUNC('month',[Completion Date]))` |
| `row num` | `lead_times_analysis_final__item_program_details` | `INDEX()` |
| `Delta` | `lead_times_analysis_final__item_program_details` | `[Full Lead Time]-[WORKINGDAYS_ACTUAL_LEAD_TIME_INCLUSIVE]` |
| `bins` | `lead_times_analysis_final__item_program_details` | `[WORKINGDAYS_ACTUAL_LEAD_TIME_INCLUSIVE]` |

### Calculation Field Dependencies

| Calculated field | Referenced fields |
| --- | --- |
| `M/Y Completion Date` | `Completion Date` |
| `row num` | - |
| `Delta` | `Full Lead Time`, `WORKINGDAYS_ACTUAL_LEAD_TIME_INCLUSIVE` |
| `bins` | `WORKINGDAYS_ACTUAL_LEAD_TIME_INCLUSIVE` |

### Calculation Lineage Notes

Calculation lineage should be read against the likely static repo matches above; these matches are inferred from naming convention and local files.

Calculated fields were recovered from: `lead_times_analysis_final__item_program_details`.

### LOD and Table Calculation Summary

| Metric | Count | Fields |
| --- | ---: | --- |
| LOD calculations | 0 | - |
| Table calculations | 1 | row num |

## Color and Legend Notes

| Source | Color / legend detail |
| --- | --- |
| Workbook card | `color` for `[:Measure Names]` |
| Workbook card | `color` for `[:Measure Names]` |
| Workbook card | `color` for `[none:Within Lead Time Flag:nk]` |
| Workbook card | `color` for `[:Measure Names]` |
