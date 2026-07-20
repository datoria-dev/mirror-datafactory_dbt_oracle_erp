# Defect Confirmations Dashboard

## Tabular Report

| Attribute | Value |
| --- | --- |
| Source workbook | `tableau/my-tableau-dashboards/DefectConfirmations_PROD.twbx` |
| Embedded TWB | `DefectConfirmations_PROD.twb` |
| Primary dashboard | `Defect Confirmations Dashboard` |
| Dashboard count | 3 |
| Worksheet count | 8 |
| Datasource count | 2 |
| Calculated field count | 14 |
| LOD calculation count | 1 |
| Table calculation count | 4 |
| Screenshot | `docs/tableau_workbook_analysis/defect-confirmations-prod/Defect-Confirmations-Dashboard.jpeg` |

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
| `Parameters` | `Parameters` | - |
| `DefectConfirmations_PROD` | `sqlproxy.056gqv21jnlvik1eq2uv9093gujs` | collection, [sqlproxy], [sqlproxy], [sqlproxy], [sqlproxy], [sqlproxy], [sqlproxy] |

### Likely dbt / SQL or Seed Lineage Guess

| Likely file | Match score | Static reason |
| --- | ---: | --- |
| `models/9_optimized_compiled_sql/DefectConfirmations_PROD.sql` | 216.0 | exact normalized name; shared tokens: confirmations, defect |
| `models/9_optimized_compiled_sql/RTY.sql` | 98.0 | normalized substring; shared tokens: rty |
| `analyses/supporting_tools/data_quality/int_saasm_top_level_sales_lines_and_deliveries___oeh_flow_status_code.sql` | 8.0 | shared tokens: saasm |
| `analyses/supporting_tools/data_quality/int_saasm_top_level_sales_lines_and_deliveries___oeh_line_category_code.sql` | 8.0 | shared tokens: saasm |
| `analyses/supporting_tools/data_quality/int_saasm_top_level_sales_lines_and_deliveries___oel_flow_status_code.sql` | 8.0 | shared tokens: saasm |
| `analyses/supporting_tools/data_quality/int_saasm_top_level_sales_lines_and_deliveries___oel_line_category_code.sql` | 8.0 | shared tokens: saasm |
| `analyses/supporting_tools/data_quality/int_saasm_top_level_sales_lines_and_deliveries___wsh_nd_status_code.sql` | 8.0 | shared tokens: saasm |
| `models/3_intermediate/int_saasm_custowned_material_transactions.sql` | 8.0 | shared tokens: saasm |
| `models/3_intermediate/int_saasm_sales_lines_and_deliveries.sql` | 8.0 | shared tokens: saasm |
| `models/3_intermediate/int_saasm_top_level_sales_lines.sql` | 8.0 | shared tokens: saasm |

## Sheet Inventory

| Worksheet | Datasources | Field count | Filter count | Marks |
| --- | --- | ---: | ---: | --- |
| `Defect Confirmations Chart` | sqlproxy.056gqv21jnlvik1eq2uv9093gujs | 9 | 9 | Bar |
| `Defect Confirmations Details` | sqlproxy.056gqv21jnlvik1eq2uv9093gujs | 8 | 8 | Automatic |
| `FCM Rolling Throughput Yield by Date` | sqlproxy.056gqv21jnlvik1eq2uv9093gujs | 3 | 1 | Line |
| `RTY All Steps Details` | sqlproxy.056gqv21jnlvik1eq2uv9093gujs | 8 | 4 | Automatic |
| `SAASM Rolling Throughput Yield by Date` | Parameters, sqlproxy.056gqv21jnlvik1eq2uv9093gujs | 7 | 1 | Line |
| `zz.Data Refresh Caption` | sqlproxy.056gqv21jnlvik1eq2uv9093gujs | 1 | 1 | Automatic |
| `zz.EmailMe` | sqlproxy.056gqv21jnlvik1eq2uv9093gujs | 1 | 0 | Shape |
| `zz.TeamsMsg` | sqlproxy.056gqv21jnlvik1eq2uv9093gujs | 1 | 0 | Shape |

### Filter Cards and Visible Controls

| Type | Parameter / field | Mode |
| --- | --- | --- |
| `filters` | `-` | - |
| `filter` | `[none:TRANSACTION DATE:ok]` | checkdropdown |
| `filter` | `[mn:TRANSACTION DATE:ok]` | checkdropdown |
| `filter` | `[qr:TRANSACTION DATE:ok]` | - |
| `filter` | `[yr:TRANSACTION DATE:ok]` | - |
| `filter` | `[none:FM OP SEQ NUM:ok]` | checkdropdown |
| `filter` | `[none:PART NUMBER:nk]` | checkdropdown |
| `filter` | `[none:FULL NAME:nk]` | typeinlist |
| `filter` | `[none:WIP ENTITY NAME:nk]` | typeinlist |
| `color` | `[none:TRANSACTION TYPE:nk]` | - |
| `filter` | `[none:FULL NAME:nk]` | checkdropdown |
| `filter` | `[none:WIP ENTITY NAME:nk]` | checkdropdown |
| `color` | `[none:PART NUMBER RTY:nk]` | - |
| `filter` | `[my:FIRST MONTH DATE (Custom SQL Query2):ok]` | - |
| `filter` | `[none:PART NUMBER RTY (Custom SQL Query2):nk]` | - |
| `filter` | `[none:FM OP SEQ NUM RTY (Custom SQL Query2):ok]` | - |
| `color` | `[PART NUMBER RTY (group)]` | - |
| `parameter` | `[Parameter 1]` | type_in |
| `parameter` | `[Parameter 2]` | type_in |
| `parameter` | `[Parameter 3]` | type_in |

### Primary Worksheet Shelves and Marks

| Worksheet | Rows | Columns | Marks | Color fields |
| --- | --- | --- | --- | --- |
| `Defect Confirmations Chart` | [sum:TRANSACTION QTY:qk] | [none:FM OP SEQ NUM:ok] | Bar | - |
| `Defect Confirmations Details` | ([sqlproxy.056gqv21jnlvik1eq2uv9093gujs].[none:TRANSACTION DATE:ok] / ([sqlproxy.056gqv21jnlvik1eq2uv9093gujs].[none:FM OP SEQ NUM:ok] / ([sqlproxy.056gqv21jnlvik1eq2uv9093gujs].[none:PART NUMBER:nk] / ([sqlproxy.056gqv21jnlvik1eq2uv9093gujs].[none:WIP ENTITY NAME:nk] / ([sqlproxy.056gqv21jnlvik1eq2uv9093gujs].[none:FULL NAME:nk] / [sqlproxy.056gqv21jnlvik1eq2uv9093gujs].[none:SERIAL NUMBER:nk]))))) | [none:TRANSACTION TYPE:nk] | Automatic | - |
| `FCM Rolling Throughput Yield by Date` | [min:CUMU_YIELD_PERCENT:qk] | [none:FIRST MONTH DATE:ok] | Line | - |
| `RTY All Steps Details` | ([sqlproxy.056gqv21jnlvik1eq2uv9093gujs].[none:FIRST MONTH DATE (Custom SQL Query2):ok] / ([sqlproxy.056gqv21jnlvik1eq2uv9093gujs].[none:PART NUMBER RTY (Custom SQL Query2):nk] / [sqlproxy.056gqv21jnlvik1eq2uv9093gujs].[none:FM OP SEQ NUM RTY (Custom SQL Query2):ok])) | [:Measure Names] | Automatic | - |
| `SAASM Rolling Throughput Yield by Date` | [min:CUMU_YIELD_PERCENT:qk] | [none:FIRST MONTH DATE:ok] | Line | - |
| `zz.Data Refresh Caption` | - | - | Automatic | - |
| `zz.EmailMe` | - | - | Shape | - |
| `zz.TeamsMsg` | - | - | Shape | - |

### Worksheet Filters and Selections

| Worksheet | Filter class | Field | Selection / groupfilter |
| --- | --- | --- | --- |
| `Defect Confirmations Chart` | `categorical` | `[mn:TRANSACTION DATE:ok]` | - |
| `Defect Confirmations Chart` | `categorical` | `[none:FM OP SEQ NUM:ok]` | - |
| `Defect Confirmations Chart` | `categorical` | `[none:FULL NAME:nk]` | - |
| `Defect Confirmations Chart` | `categorical` | `[none:Job Type:nk]` | - |
| `Defect Confirmations Chart` | `categorical` | `[none:PART NUMBER:nk]` | - |
| `Defect Confirmations Chart` | `categorical` | `[none:TRANSACTION DATE:ok]` | - |
| `Defect Confirmations Chart` | `categorical` | `[none:WIP ENTITY NAME:nk]` | - |
| `Defect Confirmations Chart` | `categorical` | `[qr:TRANSACTION DATE:ok]` | - |
| `Defect Confirmations Chart` | `categorical` | `[yr:TRANSACTION DATE:ok]` | - |
| `Defect Confirmations Details` | `categorical` | `[mn:TRANSACTION DATE:ok]` | - |
| `Defect Confirmations Details` | `categorical` | `[none:FM OP SEQ NUM:ok]` | - |
| `Defect Confirmations Details` | `categorical` | `[none:FULL NAME:nk]` | - |
| `Defect Confirmations Details` | `categorical` | `[none:PART NUMBER:nk]` | - |
| `Defect Confirmations Details` | `categorical` | `[none:TRANSACTION DATE:ok]` | - |
| `Defect Confirmations Details` | `categorical` | `[none:WIP ENTITY NAME:nk]` | - |
| `Defect Confirmations Details` | `categorical` | `[qr:TRANSACTION DATE:ok]` | - |
| `Defect Confirmations Details` | `categorical` | `[yr:TRANSACTION DATE:ok]` | - |
| `FCM Rolling Throughput Yield by Date` | `categorical` | `[none:PART NUMBER RTY:nk]` | - |
| `RTY All Steps Details` | `categorical` | `[:Measure Names]` | - |
| `RTY All Steps Details` | `categorical` | `[my:FIRST MONTH DATE (Custom SQL Query2):ok]` | - |
| `RTY All Steps Details` | `categorical` | `[none:FM OP SEQ NUM RTY (Custom SQL Query2):ok]` | - |
| `RTY All Steps Details` | `categorical` | `[none:PART NUMBER RTY (Custom SQL Query2):nk]` | - |
| `SAASM Rolling Throughput Yield by Date` | `categorical` | `[none:PART NUMBER RTY:nk]` | - |
| `zz.Data Refresh Caption` | `categorical` | `[none:Calculation_1499135731406987267:nk]` | - |

### Fields Used by Primary Worksheet

- `Defect Confirmations Chart`: `Yield %`, `[FM OP SEQ NUM]`, `[FULL NAME]`, `[Job Type]`, `[PART NUMBER]`, `[TRANSACTION DATE]`, `[TRANSACTION QTY]`, `[TRANSACTION TYPE]`, `[WIP ENTITY NAME]`
- `Defect Confirmations Details`: `DEFECT SERIAL NUMBER`, `[FM OP SEQ NUM]`, `[FULL NAME]`, `[PART NUMBER]`, `[TRANSACTION DATE]`, `[TRANSACTION QTY]`, `[TRANSACTION TYPE]`, `[WIP ENTITY NAME]`
- `FCM Rolling Throughput Yield by Date`: `[CUMU_YIELD_PERCENT]`, `[FIRST MONTH DATE]`, `[PART NUMBER RTY]`
- `RTY All Steps Details`: `ALL PARTS CUMU YIELD PERCENT (All Steps)`, `CUMU_YIELD_PERCENT (All Steps)`, `TOT_CONFIRMS (All Steps)`, `TOT_DEFECTS (All Steps)`, `YIELD_RATIO (All Steps)`, `[FIRST MONTH DATE (Custom SQL Query2)]`, `[FM OP SEQ NUM RTY (Custom SQL Query2)]`, `[PART NUMBER RTY (Custom SQL Query2)]`
- `SAASM Rolling Throughput Yield by Date`: `966-2083-2X4 Goal`, `966-2083-3X4 Goal`, `966-2083-5X4 Goal`, `[CUMU_YIELD_PERCENT]`, `[FIRST MONTH DATE]`, `[PART NUMBER RTY (group)]`, `[PART NUMBER RTY]`
- `zz.Data Refresh Caption`: `Blank`
- `zz.EmailMe`: `Email`
- `zz.TeamsMsg`: `Teams`

## Calculations

Recovered `14` calculated field definitions from static workbook XML.

### Calculated Fields

| Calculated field | Datasource | Formula |
| --- | --- | --- |
| `966-2083-2X4 Goal` | `Parameters` | `0.1` |
| `966-2083-3X4 Goal` | `Parameters` | `0.20` |
| `966-2083-5X4 Goal` | `Parameters` | `0.3` |
| `Email` | `DefectConfirmations_PROD` | `"Email Me Here"` |
| `Teams` | `DefectConfirmations_PROD` | `"Write a Teams Message"` |
| `Blank` | `DefectConfirmations_PROD` | `""` |
| `MAX OP SEQ` | `DefectConfirmations_PROD` | `{MAX([FM OP SEQ NUM RTY])}` |
| `MAX CUMU YIELD` | `DefectConfirmations_PROD` | `AVG({INCLUDE [FM OP SEQ NUM RTY] : SUM([CUMU_YIELD_PERCENT]) })` |
| `ZZ EXP_LN Rolling Yield %` | `DefectConfirmations_PROD` | `EXP(RUNNING_SUM(LN([Calculation_2320479721268088850])))` |
| `ZZRolling Sum` | `DefectConfirmations_PROD` | `RUNNING_SUM(SUM([TRANSACTION QTY]))` |
| `Yield %` | `DefectConfirmations_PROD` | `SUM([TRANSACTION QTY])/TOTAL(SUM([TRANSACTION QTY]))` |
| `[Groups Part Number]` | `DefectConfirmations_PROD` | `-` |
| `[PART NUMBER RTY (group)]` | `DefectConfirmations_PROD` | `-` |
| `Rolling Yield %` | `DefectConfirmations_PROD` | `[Calculation_2320479721268088850]*PREVIOUS_VALUE(1)` |

### Calculation Field Dependencies

| Calculated field | Referenced fields |
| --- | --- |
| `966-2083-2X4 Goal` | - |
| `966-2083-3X4 Goal` | - |
| `966-2083-5X4 Goal` | - |
| `Email` | - |
| `Teams` | - |
| `Blank` | - |
| `MAX OP SEQ` | `FM OP SEQ NUM RTY` |
| `MAX CUMU YIELD` | `CUMU_YIELD_PERCENT`, `FM OP SEQ NUM RTY` |
| `ZZ EXP_LN Rolling Yield %` | `Calculation_2320479721268088850` |
| `ZZRolling Sum` | `TRANSACTION QTY` |
| `Yield %` | `TRANSACTION QTY` |
| `[Groups Part Number]` | - |
| `[PART NUMBER RTY (group)]` | - |
| `Rolling Yield %` | `Calculation_2320479721268088850` |

### Calculation Lineage Notes

Calculation lineage should be read against the likely static repo matches above; these matches are inferred from naming convention and local files.

Calculated fields were recovered from: `DefectConfirmations_PROD`, `Parameters`.

### LOD and Table Calculation Summary

| Metric | Count | Fields |
| --- | ---: | --- |
| LOD calculations | 1 | MAX CUMU YIELD |
| Table calculations | 4 | ZZ EXP_LN Rolling Yield %, ZZRolling Sum, Yield %, Rolling Yield % |

## Color and Legend Notes

| Source | Color / legend detail |
| --- | --- |
| Workbook card | `color` for `[none:TRANSACTION TYPE:nk]` |
| Workbook card | `color` for `[none:PART NUMBER RTY:nk]` |
| Workbook card | `color` for `[PART NUMBER RTY (group)]` |
