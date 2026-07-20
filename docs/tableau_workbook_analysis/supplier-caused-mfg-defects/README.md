# SCMD Rate Analysis Dashboard

## Tabular Report

| Attribute | Value |
| --- | --- |
| Source workbook | `tableau/my-tableau-dashboards/Supplier Caused Mfg Defects.twbx` |
| Embedded TWB | `DEV Supplier Caused Mfg Defects.twb` |
| Primary dashboard | `SCMD Rate Analysis Dashboard` |
| Dashboard count | 1 |
| Worksheet count | 5 |
| Datasource count | 1 |
| Calculated field count | 2 |
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
| `supplier_caused_defects_metrics` | `sqlproxy.073cvl01ba8aas18gcs2n1bs4lam` | collection, [sqlproxy], [sqlproxy], [sqlproxy], [sqlproxy], [sqlproxy], [sqlproxy], [sqlproxy], +3 more |

### Likely dbt / SQL or Seed Lineage Guess

| Likely file | Match score | Static reason |
| --- | ---: | --- |
| `models/4_marts/supplier_caused_defects.sql` | 69.0 | normalized substring; shared tokens: caused, defects, supplier |
| `models/3_intermediate/int_supplier_caused_defects.sql` | 24.0 | shared tokens: caused, defects, supplier |
| `models/4_marts/facts/fct_supplier_caused_defects.sql` | 24.0 | shared tokens: caused, defects, supplier |
| `models/4_marts/supplier_caused_defects__wip.sql` | 24.0 | shared tokens: caused, defects, supplier |
| `models/4_marts/supplier_defects_metric_daily.sql` | 16.0 | shared tokens: defects, supplier |
| `models/3_intermediate/int_move_trxns_dynamic_daily_rate.sql` | 8.0 | shared tokens: rate |
| `models/3_intermediate/int_move_trxns_dynamic_daily_rate_part2.sql` | 8.0 | shared tokens: rate |
| `models/4_marts/agg/agg_lead_time_analysis_median.sql` | 8.0 | shared tokens: analysis |
| `models/4_marts/agg/agg_lead_time_analysis_percent_complete.sql` | 8.0 | shared tokens: analysis |
| `models/4_marts/facts/fct_lead_time_analysis.sql` | 8.0 | shared tokens: analysis |

## Sheet Inventory

| Worksheet | Datasources | Field count | Filter count | Marks |
| --- | --- | ---: | ---: | --- |
| `Affected Assemblies Tool Tip` | sqlproxy.073cvl01ba8aas18gcs2n1bs4lam | 8 | 2 | Polygon |
| `Defect Codes Tool Tip` | sqlproxy.073cvl01ba8aas18gcs2n1bs4lam | 8 | 2 | Polygon |
| `Defect Details Data Table` | sqlproxy.073cvl01ba8aas18gcs2n1bs4lam | 20 | 4 | Text |
| `Pivot Supplier Caused Defects` | sqlproxy.073cvl01ba8aas18gcs2n1bs4lam | 11 | 3 | Bar |
| `SCMD Rate Trend Line` | sqlproxy.073cvl01ba8aas18gcs2n1bs4lam | 11 | 1 | Automatic |

### Filter Cards and Visible Controls

| Type | Parameter / field | Mode |
| --- | --- | --- |
| `filters` | `-` | - |
| `color` | `[usr:SCMD Rate (copy)_1500261641419567105:qk]` | - |
| `filter` | `[my:QA Creation Date:ok]` | checkdropdown |
| `filter` | `[none:Lab Office Code:nk]` | checkdropdown |
| `filter` | `[none:Purchasing Commodity Code:nk]` | checkdropdown |
| `color` | `[usr:Calculation_1927822130719088640:qk]` | - |
| `color` | `[sum:CONSUMPTION_QTYS:qk]` | - |
| `color` | `[sum:DEFECT_QTYS:qk]` | - |

### Primary Worksheet Shelves and Marks

| Worksheet | Rows | Columns | Marks | Color fields |
| --- | --- | --- | --- | --- |
| `Affected Assemblies Tool Tip` | [none:AFFECTED_ASSEMBLY_MATERIAL:nk] | - | Polygon | - |
| `Defect Codes Tool Tip` | - | [none:DT_DEFECT_CODE:nk] | Polygon | - |
| `Defect Details Data Table` | ([sqlproxy.073cvl01ba8aas18gcs2n1bs4lam].[none:CREATION_DATE:ok] / ([sqlproxy.073cvl01ba8aas18gcs2n1bs4lam].[none:DT_COMPONENT:nk] / ([sqlproxy.073cvl01ba8aas18gcs2n1bs4lam].[none:OCCURRENCE:ok] / ([sqlproxy.073cvl01ba8aas18gcs2n1bs4lam].[sum:QUANTITY:ok] / ([sqlproxy.073cvl01ba8aas18gcs2n1bs4lam].[none:AFFECTED_ASSEMBLY_MATERIAL:nk] / ([sqlproxy.073cvl01ba8aas18gcs2n1bs4lam].[none:DT_DEFECT_CODE:nk] / ([sqlproxy.073cvl01ba8aas18gcs2n1bs4lam].[none:DT_DEFECT_CODE_MEANING:nk] / ([sqlproxy.073cvl01ba8aas18gcs2n1bs4lam].[none:DT_CAUSED_BY:nk] / ([sqlproxy.073cvl01ba8aas18gcs2n1bs4lam].[none:DT_CAUSED_BY_DESCRIPTION:nk] / ([sqlproxy.073cvl01ba8aas18gcs2n1bs4lam].[none:Purchasing Commodity Code:nk] / ([sqlproxy.073cvl01ba8aas18gcs2n1bs4lam].[none:RI_SAP_QMS_CODES:nk] / ([sqlproxy.073cvl01ba8aas18gcs2n1bs4lam].[none:RI_FOLDER_NOTES:nk] / ([sqlproxy.073cvl01ba8aas18gcs2n1bs4lam].[none:FROM_OP_SEQ_NUMBER:ok] / ([sqlproxy.073cvl01ba8aas18gcs2n1bs4lam].[none:From Op Desc:nk] / ([sqlproxy.073cvl01ba8aas18gcs2n1bs4lam].[none:CREATED_BY:nk] / ([sqlproxy.073cvl01ba8aas18gcs2n1bs4lam].[none:INSPECTOR:nk] / [sqlproxy.073cvl01ba8aas18gcs2n1bs4lam].[none:S_VENDOR_NAME:nk])))))))))))))))) | - | Text | - |
| `Pivot Supplier Caused Defects` | ([sqlproxy.073cvl01ba8aas18gcs2n1bs4lam].[yr:QA Creation Date:ok] / ([sqlproxy.073cvl01ba8aas18gcs2n1bs4lam].[mn:QA Creation Date:ok] / [sqlproxy.073cvl01ba8aas18gcs2n1bs4lam].[none:Component Item:nk])) | ([sqlproxy.073cvl01ba8aas18gcs2n1bs4lam].[:Measure Names] * [sqlproxy.073cvl01ba8aas18gcs2n1bs4lam].[Multiple Values]) | Bar | - |
| `SCMD Rate Trend Line` | [usr:SCMD Rate (copy)_1500261641419567105:qk] | [none:QA Creation Date:qk] | Automatic | - |

### Worksheet Filters and Selections

| Worksheet | Filter class | Field | Selection / groupfilter |
| --- | --- | --- | --- |
| `Affected Assemblies Tool Tip` | `categorical` | `[Action (Component Item,YEAR(QA Creation Date),MONTH(QA Creation Date))]` | - |
| `Affected Assemblies Tool Tip` | `categorical` | `[Tooltip (Component Item,YEAR(QA Creation Date),MONTH(QA Creation Date))]` | - |
| `Defect Codes Tool Tip` | `categorical` | `[Action (Component Item,YEAR(QA Creation Date),MONTH(QA Creation Date))]` | - |
| `Defect Codes Tool Tip` | `categorical` | `[Tooltip (Component Item,YEAR(QA Creation Date),MONTH(QA Creation Date))]` | - |
| `Defect Details Data Table` | `categorical` | `[:Measure Names]` | - |
| `Defect Details Data Table` | `categorical` | `[Action (Component Item,YEAR(QA Creation Date),MONTH(QA Creation Date))]` | - |
| `Defect Details Data Table` | `categorical` | `[Action (QA Creation Date)]` | - |
| `Defect Details Data Table` | `categorical` | `[none:DT_CAUSED_BY:nk]` | - |
| `Pivot Supplier Caused Defects` | `categorical` | `[:Measure Names]` | - |
| `Pivot Supplier Caused Defects` | `categorical` | `[Action (QA Creation Date)]` | - |
| `Pivot Supplier Caused Defects` | `quantitative` | `[usr:Calculation_1927822130719088640:qk]` | - |
| `SCMD Rate Trend Line` | `categorical` | `[Action (Component Item,YEAR(QA Creation Date),MONTH(QA Creation Date))]` | - |

### Fields Used by Primary Worksheet

- `Affected Assemblies Tool Tip`: `Affected Assembly`, `Defect Codes`, `[Component Item]`, `[DT_DEFECT_CODE_MEANING]`, `[Lab Office Code]`, `[Purchasing Commodity Code]`, `[QA Creation Date]`, `[RI_SAP_QMS_CODES]`
- `Defect Codes Tool Tip`: `Affected Assembly`, `Defect Codes`, `[Component Item]`, `[DT_DEFECT_CODE_MEANING]`, `[Lab Office Code]`, `[Purchasing Commodity Code]`, `[QA Creation Date]`, `[RI_SAP_QMS_CODES]`
- `Defect Details Data Table`: `Affected Assembly`, `Defect Codes`, `[CREATED_BY]`, `[CREATION_DATE]`, `[Component Item]`, `[DT_CAUSED_BY]`, `[DT_CAUSED_BY_DESCRIPTION]`, `[DT_COMPONENT]`, `[DT_DEFECT_CODE_MEANING]`, `[FROM_OP_SEQ_NUMBER]`, `[From Op Desc]`, `[INSPECTOR]`, `[Lab Office Code]`, `[OCCURRENCE]`, `[Purchasing Commodity Code]`, `[QA Creation Date]`, `[QUANTITY]`, `[RI_FOLDER_NOTES]`, `[RI_SAP_QMS_CODES]`, `[S_VENDOR_NAME]`
- `Pivot Supplier Caused Defects`: `Affected Assembly`, `Defect Codes`, `SCMD Rate`, `[CONSUMPTION_QTYS]`, `[Component Item]`, `[DEFECT_QTYS]`, `[DT_DEFECT_CODE_MEANING]`, `[Lab Office Code]`, `[Purchasing Commodity Code]`, `[QA Creation Date]`, `[RI_SAP_QMS_CODES]`
- `SCMD Rate Trend Line`: `Affected Assembly`, `Avg SCMD Rate`, `Defect Codes`, `[CONSUMPTION_QTYS]`, `[Component Item]`, `[DEFECT_QTYS]`, `[DT_DEFECT_CODE_MEANING]`, `[Lab Office Code]`, `[Purchasing Commodity Code]`, `[QA Creation Date]`, `[RI_SAP_QMS_CODES]`

## Calculations

Recovered `2` calculated field definitions from static workbook XML.

### Calculated Fields

| Calculated field | Datasource | Formula |
| --- | --- | --- |
| `SCMD Rate` | `supplier_caused_defects_metrics` | `abs(sum([DEFECT_QTYS])/sum([CONSUMPTION_QTYS]))` |
| `Avg SCMD Rate` | `supplier_caused_defects_metrics` | `avg(abs(([DEFECT_QTYS])/([CONSUMPTION_QTYS])))` |

### Calculation Field Dependencies

| Calculated field | Referenced fields |
| --- | --- |
| `SCMD Rate` | `CONSUMPTION_QTYS`, `DEFECT_QTYS` |
| `Avg SCMD Rate` | `CONSUMPTION_QTYS`, `DEFECT_QTYS` |

### Calculation Lineage Notes

Calculation lineage should be read against the likely static repo matches above; these matches are inferred from naming convention and local files.

Calculated fields were recovered from: `supplier_caused_defects_metrics`.

### LOD and Table Calculation Summary

| Metric | Count | Fields |
| --- | ---: | --- |
| LOD calculations | 0 | - |
| Table calculations | 0 | - |

## Color and Legend Notes

| Source | Color / legend detail |
| --- | --- |
| Workbook card | `color` for `[usr:SCMD Rate (copy)_1500261641419567105:qk]` |
| Workbook card | `color` for `[usr:Calculation_1927822130719088640:qk]` |
| Workbook card | `color` for `[sum:CONSUMPTION_QTYS:qk]` |
| Workbook card | `color` for `[sum:DEFECT_QTYS:qk]` |
