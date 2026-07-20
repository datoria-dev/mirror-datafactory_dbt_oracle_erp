# SAASM VMI Dashboard

## Tabular Report

| Attribute | Value |
| --- | --- |
| Source workbook | `tableau/my-tableau-dashboards/SAASM VMI Sales, Inventory, and Production Alignment.twbx` |
| Embedded TWB | `SAASM VMI Sales, Inventory, and Production Alignment (4).twb` |
| Primary dashboard | `SAASM VMI Dashboard` |
| Dashboard count | 3 |
| Worksheet count | 13 |
| Datasource count | 1 |
| Calculated field count | 16 |
| LOD calculation count | 0 |
| Table calculation count | 4 |
| Screenshot | `docs/tableau_workbook_analysis/saasm-vmi-sales-inventory-and-production-alignment/SAASM-VMI-Dashboard.jpeg` |

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
| `saasm_vmi` | `sqlproxy.1w63rx5044o58h1e1lu2v0o4sa8h` | collection, [sqlproxy], [sqlproxy], [sqlproxy], [sqlproxy], [sqlproxy], [sqlproxy] |

### Likely dbt / SQL or Seed Lineage Guess

| Likely file | Match score | Static reason |
| --- | ---: | --- |
| `models/4_marts/saasm_vmi.sql` | 296.0 | normalized substring; exact normalized name; shared tokens: saasm, vmi |
| `models/4_marts/saasm_from_vmi_sales_planned_qtys.sql` | 32.0 | shared tokens: qtys, saasm, sales, vmi |
| `models/4_marts/saasm_for_top_level_sales_planned_qtys.sql` | 24.0 | shared tokens: qtys, saasm, sales |
| `analyses/supporting_tools/data_quality/int_saasm_top_level_sales_lines_and_deliveries___oeh_flow_status_code.sql` | 16.0 | shared tokens: saasm, sales |
| `analyses/supporting_tools/data_quality/int_saasm_top_level_sales_lines_and_deliveries___oeh_line_category_code.sql` | 16.0 | shared tokens: saasm, sales |
| `analyses/supporting_tools/data_quality/int_saasm_top_level_sales_lines_and_deliveries___oel_flow_status_code.sql` | 16.0 | shared tokens: saasm, sales |
| `analyses/supporting_tools/data_quality/int_saasm_top_level_sales_lines_and_deliveries___oel_line_category_code.sql` | 16.0 | shared tokens: saasm, sales |
| `analyses/supporting_tools/data_quality/int_saasm_top_level_sales_lines_and_deliveries___wsh_nd_status_code.sql` | 16.0 | shared tokens: saasm, sales |
| `models/3_intermediate/int_saasm_sales_lines_and_deliveries.sql` | 16.0 | shared tokens: saasm, sales |
| `models/3_intermediate/int_saasm_top_level_sales_lines.sql` | 16.0 | shared tokens: saasm, sales |

## Sheet Inventory

| Worksheet | Datasources | Field count | Filter count | Marks |
| --- | --- | ---: | ---: | --- |
| `Cascading Quantities by Locator` | sqlproxy.1w63rx5044o58h1e1lu2v0o4sa8h | 9 | 5 | Bar |
| `Deltas by Locator` | sqlproxy.1w63rx5044o58h1e1lu2v0o4sa8h | 8 | 3 | Automatic |
| `Horizontal POs Details` | sqlproxy.1w63rx5044o58h1e1lu2v0o4sa8h | 8 | 4 | Automatic |
| `Horizontal Trxns Details` | sqlproxy.1w63rx5044o58h1e1lu2v0o4sa8h | 12 | 10 | Automatic |
| `REF TEXT Audit` | sqlproxy.1w63rx5044o58h1e1lu2v0o4sa8h | 5 | 2 | Automatic |
| `SAASM VMI Export Ready Sheet` | sqlproxy.1w63rx5044o58h1e1lu2v0o4sa8h | 18 | 2 | Automatic |
| `SAASM VMI Qtys` | sqlproxy.1w63rx5044o58h1e1lu2v0o4sa8h | 15 | 7 | Automatic |
| `Sheet 13` | - | 0 | 0 | Automatic |
| `TL SOs Details` | sqlproxy.1w63rx5044o58h1e1lu2v0o4sa8h | 11 | 9 | Automatic |
| `VMI SOs Details` | sqlproxy.1w63rx5044o58h1e1lu2v0o4sa8h | 11 | 8 | Automatic |
| `Validation Horizontal Trxns Details` | sqlproxy.1w63rx5044o58h1e1lu2v0o4sa8h | 12 | 10 | Automatic |
| `zz.Data Refresh At Caption` | sqlproxy.1w63rx5044o58h1e1lu2v0o4sa8h | 1 | 1 | Automatic |
| `zz.Frequency Caption` | - | 0 | 0 | Automatic |

### Filter Cards and Visible Controls

| Type | Parameter / field | Mode |
| --- | --- | --- |
| `filters` | `-` | - |
| `filter` | `[:Measure Names]` | - |
| `color` | `[:Measure Names]` | - |
| `filter` | `[none:PART_NUMBER:nk]` | checkdropdown |
| `filter` | `[LOCATOR (CLEANED)]` | checkdropdown |
| `filter` | `[none:REASON_CODE:nk]` | checkdropdown |
| `filter` | `[none:REF_TEXT:nk]` | checkdropdown |

### Primary Worksheet Shelves and Marks

| Worksheet | Rows | Columns | Marks | Color fields |
| --- | --- | --- | --- | --- |
| `Cascading Quantities by Locator` | [LOCATOR (CLEANED)] | ([sqlproxy.1w63rx5044o58h1e1lu2v0o4sa8h].[sum:Calculation_1313925209169190914:qk] + [sqlproxy.1w63rx5044o58h1e1lu2v0o4sa8h].[sum:VMI SOs PLANNED QTY (copy)_1313925209169993731:qk]) | Bar | - |
| `Deltas by Locator` | [none:LOCATOR:nk] | - | Automatic | - |
| `Horizontal POs Details` | ([sqlproxy.1w63rx5044o58h1e1lu2v0o4sa8h].[none:LOCATOR:nk] / ([sqlproxy.1w63rx5044o58h1e1lu2v0o4sa8h].[none:ELEMENT_ID:nk] / ([sqlproxy.1w63rx5044o58h1e1lu2v0o4sa8h].[none:PART_NUMBER:nk] / [sqlproxy.1w63rx5044o58h1e1lu2v0o4sa8h].[none:VMI_DATE_CST:ok]))) | [:Measure Names] | Automatic | - |
| `Horizontal Trxns Details` | ([sqlproxy.1w63rx5044o58h1e1lu2v0o4sa8h].[yr:VMI_DATE_CST:ok] / ([sqlproxy.1w63rx5044o58h1e1lu2v0o4sa8h].[mn:VMI_DATE_CST:ok] / ([sqlproxy.1w63rx5044o58h1e1lu2v0o4sa8h].[LOCATOR (CLEANED)] / ([sqlproxy.1w63rx5044o58h1e1lu2v0o4sa8h].[none:REF_TEXT:nk] / ([sqlproxy.1w63rx5044o58h1e1lu2v0o4sa8h].[none:REASON_CODE:nk] / ([sqlproxy.1w63rx5044o58h1e1lu2v0o4sa8h].[none:PART_NUMBER:nk] / [sqlproxy.1w63rx5044o58h1e1lu2v0o4sa8h].[none:ELEMENT_ID:nk])))))) | [:Measure Names] | Automatic | - |
| `REF TEXT Audit` | [none:REF_TEXT:nk] | [:Measure Names] | Automatic | - |
| `SAASM VMI Export Ready Sheet` | ([sqlproxy.1w63rx5044o58h1e1lu2v0o4sa8h].[usr:Calculation_1181913447665487876:ok] / ([sqlproxy.1w63rx5044o58h1e1lu2v0o4sa8h].[yr:VMI_DATE_CST:ok] / ([sqlproxy.1w63rx5044o58h1e1lu2v0o4sa8h].[mn:VMI_DATE_CST:ok] / ([sqlproxy.1w63rx5044o58h1e1lu2v0o4sa8h].[LOCATOR (CLEANED)] / ([sqlproxy.1w63rx5044o58h1e1lu2v0o4sa8h].[none:PARTY_NAME:nk] / ([sqlproxy.1w63rx5044o58h1e1lu2v0o4sa8h].[none:PART_NUMBER:nk] / ([sqlproxy.1w63rx5044o58h1e1lu2v0o4sa8h].[none:FLOW_STATUS:nk] / ([sqlproxy.1w63rx5044o58h1e1lu2v0o4sa8h].[none:DELIVERY_NO:nk] / ([sqlproxy.1w63rx5044o58h1e1lu2v0o4sa8h].[none:ELEMENT_ID:nk] / [sqlproxy.1w63rx5044o58h1e1lu2v0o4sa8h].[none:REASON_CODE:nk]))))))))) | [:Measure Names] | Automatic | - |
| `SAASM VMI Qtys` | [LOCATOR (CLEANED)] | [:Measure Names] | Automatic | - |
| `Sheet 13` | - | - | Automatic | - |
| `TL SOs Details` | ([sqlproxy.1w63rx5044o58h1e1lu2v0o4sa8h].[yr:VMI_DATE_CST:ok] / ([sqlproxy.1w63rx5044o58h1e1lu2v0o4sa8h].[mn:VMI_DATE_CST:ok] / ([sqlproxy.1w63rx5044o58h1e1lu2v0o4sa8h].[LOCATOR (CLEANED)] / ([sqlproxy.1w63rx5044o58h1e1lu2v0o4sa8h].[none:PARTY_NAME:nk] / ([sqlproxy.1w63rx5044o58h1e1lu2v0o4sa8h].[none:PART_NUMBER:nk] / ([sqlproxy.1w63rx5044o58h1e1lu2v0o4sa8h].[none:FLOW_STATUS:nk] / ([sqlproxy.1w63rx5044o58h1e1lu2v0o4sa8h].[none:DELIVERY_NO:nk] / [sqlproxy.1w63rx5044o58h1e1lu2v0o4sa8h].[none:ELEMENT_ID:nk]))))))) | [:Measure Names] | Automatic | - |
| `VMI SOs Details` | ([sqlproxy.1w63rx5044o58h1e1lu2v0o4sa8h].[yr:VMI_DATE_CST:ok] / ([sqlproxy.1w63rx5044o58h1e1lu2v0o4sa8h].[mn:VMI_DATE_CST:ok] / ([sqlproxy.1w63rx5044o58h1e1lu2v0o4sa8h].[LOCATOR (CLEANED)] / ([sqlproxy.1w63rx5044o58h1e1lu2v0o4sa8h].[none:PARTY_NAME:nk] / ([sqlproxy.1w63rx5044o58h1e1lu2v0o4sa8h].[none:PART_NUMBER:nk] / ([sqlproxy.1w63rx5044o58h1e1lu2v0o4sa8h].[none:FLOW_STATUS:nk] / ([sqlproxy.1w63rx5044o58h1e1lu2v0o4sa8h].[none:DELIVERY_NO:nk] / [sqlproxy.1w63rx5044o58h1e1lu2v0o4sa8h].[none:ELEMENT_ID:nk]))))))) | [:Measure Names] | Automatic | - |
| `Validation Horizontal Trxns Details` | ([sqlproxy.1w63rx5044o58h1e1lu2v0o4sa8h].[yr:VMI_DATE_CST:ok] / ([sqlproxy.1w63rx5044o58h1e1lu2v0o4sa8h].[mn:VMI_DATE_CST:ok] / ([sqlproxy.1w63rx5044o58h1e1lu2v0o4sa8h].[LOCATOR (CLEANED)] / ([sqlproxy.1w63rx5044o58h1e1lu2v0o4sa8h].[none:VMI_DATE_CST:ok] / ([sqlproxy.1w63rx5044o58h1e1lu2v0o4sa8h].[none:REF_TEXT:nk] / ([sqlproxy.1w63rx5044o58h1e1lu2v0o4sa8h].[none:REASON_CODE:nk] / ([sqlproxy.1w63rx5044o58h1e1lu2v0o4sa8h].[none:PART_NUMBER:nk] / [sqlproxy.1w63rx5044o58h1e1lu2v0o4sa8h].[none:ELEMENT_ID:nk]))))))) | [:Measure Names] | Automatic | - |
| `zz.Data Refresh At Caption` | - | - | Automatic | - |
| `zz.Frequency Caption` | - | - | Automatic | - |

### Worksheet Filters and Selections

| Worksheet | Filter class | Field | Selection / groupfilter |
| --- | --- | --- | --- |
| `Cascading Quantities by Locator` | `categorical` | `[LOCATOR (CLEANED)]` | - |
| `Cascading Quantities by Locator` | `categorical` | `[none:ELEMENT_ID:nk]` | - |
| `Cascading Quantities by Locator` | `categorical` | `[none:LOCATOR:nk]` | - |
| `Cascading Quantities by Locator` | `categorical` | `[none:PART_NUMBER:nk]` | - |
| `Cascading Quantities by Locator` | `quantitative` | `[none:VMI_DATE_CST:qk]` | - |
| `Deltas by Locator` | `categorical` | `[none:ELEMENT_ID:nk]` | - |
| `Deltas by Locator` | `categorical` | `[none:LOCATOR:nk]` | - |
| `Deltas by Locator` | `categorical` | `[none:PART_NUMBER:nk]` | - |
| `Horizontal POs Details` | `categorical` | `[:Measure Names]` | - |
| `Horizontal POs Details` | `categorical` | `[none:ELEMENT_ID:nk]` | - |
| `Horizontal POs Details` | `categorical` | `[none:LOCATOR:nk]` | - |
| `Horizontal POs Details` | `categorical` | `[none:PART_NUMBER:nk]` | - |
| `Horizontal Trxns Details` | `categorical` | `[:Measure Names]` | - |
| `Horizontal Trxns Details` | `categorical` | `[Action (LOCATOR (CLEANED))]` | - |
| `Horizontal Trxns Details` | `categorical` | `[LOCATOR (CLEANED)]` | - |
| `Horizontal Trxns Details` | `categorical` | `[none:ELEMENT_ID:nk]` | - |
| `Horizontal Trxns Details` | `categorical` | `[none:FEATURE:nk]` | - |
| `Horizontal Trxns Details` | `categorical` | `[none:FLOW_STATUS:nk]` | - |
| `Horizontal Trxns Details` | `categorical` | `[none:PART_NUMBER:nk]` | - |
| `Horizontal Trxns Details` | `categorical` | `[none:REASON_CODE:nk]` | - |
| `Horizontal Trxns Details` | `categorical` | `[none:REF_TEXT:nk]` | - |
| `Horizontal Trxns Details` | `quantitative` | `[none:VMI_DATE_CST:qk]` | - |
| `REF TEXT Audit` | `categorical` | `[:Measure Names]` | - |
| `REF TEXT Audit` | `categorical` | `[none:REF_TEXT:nk]` | - |
| `SAASM VMI Export Ready Sheet` | `categorical` | `[:Measure Names]` | - |
| `SAASM VMI Export Ready Sheet` | `categorical` | `[LOCATOR (CLEANED)]` | - |
| `SAASM VMI Qtys` | `categorical` | `[:Measure Names]` | - |
| `SAASM VMI Qtys` | `categorical` | `[LOCATOR (CLEANED)]` | - |
| `SAASM VMI Qtys` | `categorical` | `[none:ELEMENT_ID:nk]` | - |
| `SAASM VMI Qtys` | `categorical` | `[none:FLOW_STATUS:nk]` | - |
| `SAASM VMI Qtys` | `categorical` | `[none:PART_NUMBER:nk]` | - |
| `SAASM VMI Qtys` | `categorical` | `[none:REF_TEXT:nk]` | - |
| `SAASM VMI Qtys` | `quantitative` | `[none:VMI_DATE_CST:qk]` | - |
| `TL SOs Details` | `categorical` | `[:Measure Names]` | - |
| `TL SOs Details` | `categorical` | `[Action (LOCATOR (CLEANED))]` | - |
| `TL SOs Details` | `categorical` | `[LOCATOR (CLEANED)]` | - |
| `TL SOs Details` | `categorical` | `[none:ELEMENT_ID:nk]` | - |
| `TL SOs Details` | `categorical` | `[none:FEATURE:nk]` | - |
| `TL SOs Details` | `categorical` | `[none:FLOW_STATUS:nk]` | - |
| `TL SOs Details` | `categorical` | `[none:PART_NUMBER:nk]` | - |
| `TL SOs Details` | `quantitative` | `[none:VMI SOs PLANNED (copy)_1847320320673456128:qk]` | - |
| `TL SOs Details` | `quantitative` | `[none:VMI_DATE_CST:qk]` | - |
| `VMI SOs Details` | `categorical` | `[:Measure Names]` | - |
| `VMI SOs Details` | `categorical` | `[Action (LOCATOR (CLEANED))]` | - |
| `VMI SOs Details` | `categorical` | `[LOCATOR (CLEANED)]` | - |
| `VMI SOs Details` | `categorical` | `[none:ELEMENT_ID:nk]` | - |
| `VMI SOs Details` | `categorical` | `[none:FEATURE:nk]` | - |
| `VMI SOs Details` | `categorical` | `[none:FLOW_STATUS:nk]` | - |
| `VMI SOs Details` | `categorical` | `[none:PART_NUMBER:nk]` | - |
| `VMI SOs Details` | `quantitative` | `[none:VMI_DATE_CST:qk]` | - |
| `Validation Horizontal Trxns Details` | `categorical` | `[:Measure Names]` | - |
| `Validation Horizontal Trxns Details` | `categorical` | `[Action (LOCATOR (CLEANED))]` | - |
| `Validation Horizontal Trxns Details` | `categorical` | `[LOCATOR (CLEANED)]` | - |
| `Validation Horizontal Trxns Details` | `categorical` | `[none:ELEMENT_ID:nk]` | - |
| `Validation Horizontal Trxns Details` | `categorical` | `[none:FEATURE:nk]` | - |
| `Validation Horizontal Trxns Details` | `categorical` | `[none:FLOW_STATUS:nk]` | - |
| `Validation Horizontal Trxns Details` | `categorical` | `[none:PART_NUMBER:nk]` | - |
| `Validation Horizontal Trxns Details` | `categorical` | `[none:REASON_CODE:nk]` | - |
| `Validation Horizontal Trxns Details` | `categorical` | `[none:REF_TEXT:nk]` | - |
| `Validation Horizontal Trxns Details` | `quantitative` | `[none:VMI_DATE_CST:qk]` | - |
| `zz.Data Refresh At Caption` | `categorical` | `[none:Calculation_1328843370564071424:nk]` | - |

### Fields Used by Primary Worksheet

- `Cascading Quantities by Locator`: `ELEMENT ID`, `PART NUMBER`, `QUANTITY (DON'T USE)`, `VMI ON HAND QTY_old_version`, `VMI SOs PLANNED`, `[FEATURE]`, `[LOCATOR (CLEANED)]`, `[LOCATOR]`, `[VMI_DATE_CST]`
- `Deltas by Locator`: `DELTA (PLANNED - OHQ)`, `ELEMENT ID`, `PART NUMBER`, `QUANTITY (DON'T USE)`, `VMI ON HAND QTY_old_version`, `VMI SOs PLANNED`, `[FEATURE]`, `[LOCATOR]`
- `Horizontal POs Details`: `ELEMENT ID`, `PART NUMBER`, `QUANTITY (DON'T USE)`, `VMI ON HAND QTY_old_version`, `VMI SOs PLANNED`, `[FEATURE]`, `[LOCATOR]`, `[VMI_DATE_CST]`
- `Horizontal Trxns Details`: `ELEMENT ID`, `ISSUE OUT OF VMI`, `PART NUMBER`, `QUANTITY (DON'T USE)`, `RECEIPT INTO VMI`, `REF TEXT`, `[FEATURE]`, `[FLOW_STATUS]`, `[LOCATOR (CLEANED)]`, `[LOCATOR]`, `[REASON_CODE]`, `[VMI_DATE_CST]`
- `REF TEXT Audit`: `ISSUE OUT OF VMI`, `QUANTITY (DON'T USE)`, `RECEIPT INTO VMI`, `REF TEXT`, `[FEATURE]`
- `SAASM VMI Export Ready Sheet`: `CUST NAME`, `ELEMENT ID`, `ISSUE OUT OF VMI`, `PART NUMBER`, `QUANTITY (DON'T USE)`, `RECEIPT INTO VMI`, `TL LI CLOSED`, `TL SOs PLANNED`, `VMI SOs CLOSED`, `VMI SOs PLANNED`, `[DELIVERY_NO]`, `[FEATURE]`, `[FLOW_STATUS]`, `[LOCATOR (CLEANED)]`, `[LOCATOR]`, `[REASON_CODE]`, `[VMI_DATE_CST]`, `row num`
- `SAASM VMI Qtys`: `ELEMENT ID`, `ISSUE OUT OF VMI`, `PART NUMBER`, `QUANTITY (DON'T USE)`, `RECEIPT INTO VMI`, `REF TEXT`, `TL LI CLOSED`, `VMI ON HAND QTY`, `VMI SOs CLOSED`, `VMI SOs PLANNED`, `[FEATURE]`, `[FLOW_STATUS]`, `[LOCATOR (CLEANED)]`, `[LOCATOR]`, `[VMI_DATE_CST]`
- `Sheet 13`: No datasource dependency fields recovered.
- `TL SOs Details`: `CUST NAME`, `ELEMENT ID`, `PART NUMBER`, `QUANTITY (DON'T USE)`, `TL SOs PLANNED`, `[DELIVERY_NO]`, `[FEATURE]`, `[FLOW_STATUS]`, `[LOCATOR (CLEANED)]`, `[LOCATOR]`, `[VMI_DATE_CST]`
- `VMI SOs Details`: `CUST NAME`, `ELEMENT ID`, `PART NUMBER`, `QUANTITY (DON'T USE)`, `VMI SOs PLANNED`, `[DELIVERY_NO]`, `[FEATURE]`, `[FLOW_STATUS]`, `[LOCATOR (CLEANED)]`, `[LOCATOR]`, `[VMI_DATE_CST]`
- `Validation Horizontal Trxns Details`: `ELEMENT ID`, `ISSUE OUT OF VMI`, `PART NUMBER`, `QUANTITY (DON'T USE)`, `RECEIPT INTO VMI`, `REF TEXT`, `[FEATURE]`, `[FLOW_STATUS]`, `[LOCATOR (CLEANED)]`, `[LOCATOR]`, `[REASON_CODE]`, `[VMI_DATE_CST]`
- `zz.Data Refresh At Caption`: `Blank`
- `zz.Frequency Caption`: No datasource dependency fields recovered.

## Calculations

Recovered `16` calculated field definitions from static workbook XML.

### Calculated Fields

| Calculated field | Datasource | Formula |
| --- | --- | --- |
| `row num` | `saasm_vmi` | `INDEX()` |
| `VMI SOs PLANNED` | `saasm_vmi` | `CASE [FEATURE] WHEN 'VMI SOs PLANNED' THEN [QUANTITY] END` |
| `DELTA (PLANNED - OHQ)` | `saasm_vmi` | `SUM([Calculation_1313925209169190914])-ZN(LOOKUP(SUM([VMI SOs PLANNED QTY (copy)_1313925209169993731]),0))` |
| `Blank` | `saasm_vmi` | `""` |
| `Email` | `saasm_vmi` | `"Email Me Here"` |
| `Teams` | `saasm_vmi` | `"Write a Teams Message"` |
| `Empty` | `saasm_vmi` | `' '` |
| `ISSUE OUT OF VMI (copy)` | `saasm_vmi` | `IF [FEATURE] ='VMI TRXNS ACTUALS' AND [QUANTITY]< 1 THEN [QUANTITY] END` |
| `[LOCATOR (CLEANED)]` | `saasm_vmi` | `-` |
| `ISSUE OUT OF VMI` | `saasm_vmi` | `IF [FEATURE] ='VMI TRXNS ACTUALS' AND [QUANTITY]< 1 THEN [QUANTITY] END` |
| `TL LI CLOSED` | `saasm_vmi` | `ZN(LOOKUP(SUM(IF [FEATURE] = 'TL SOs PLANNED' AND [FLOW_STATUS] = 'CLOSED' THEN [QUANTITY] END),0))` |
| `RECEIPT INTO VMI` | `saasm_vmi` | `IF [FEATURE] ='VMI TRXNS ACTUALS' AND [QUANTITY]>=1 THEN [QUANTITY] END` |
| `VMI ON HAND QTY` | `saasm_vmi` | `[VMI SOs PLANNED (copy)_1181913447697276934] - [TL SOs PLANNED (copy)_1047086927952670720]` |
| `VMI SOs CLOSED` | `saasm_vmi` | `ZN(LOOKUP(SUM(IF [FEATURE] = 'VMI SOs PLANNED' AND [FLOW_STATUS] = 'CLOSED' THEN [QUANTITY] END),0))` |
| `TL SOs PLANNED` | `saasm_vmi` | `CASE [FEATURE] WHEN 'TL SOs PLANNED' THEN [QUANTITY] END` |
| `VMI ON HAND QTY_old_version` | `saasm_vmi` | `CASE [FEATURE] WHEN 'VMI TRXNS ACTUALS' THEN [QUANTITY] END` |

### Calculation Field Dependencies

| Calculated field | Referenced fields |
| --- | --- |
| `row num` | - |
| `VMI SOs PLANNED` | `FEATURE`, `QUANTITY` |
| `DELTA (PLANNED - OHQ)` | `Calculation_1313925209169190914`, `VMI SOs PLANNED QTY (copy)_1313925209169993731` |
| `Blank` | - |
| `Email` | - |
| `Teams` | - |
| `Empty` | - |
| `ISSUE OUT OF VMI (copy)` | `FEATURE`, `QUANTITY` |
| `[LOCATOR (CLEANED)]` | - |
| `ISSUE OUT OF VMI` | `FEATURE`, `QUANTITY` |
| `TL LI CLOSED` | `FEATURE`, `FLOW_STATUS`, `QUANTITY` |
| `RECEIPT INTO VMI` | `FEATURE`, `QUANTITY` |
| `VMI ON HAND QTY` | `TL SOs PLANNED (copy)_1047086927952670720`, `VMI SOs PLANNED (copy)_1181913447697276934` |
| `VMI SOs CLOSED` | `FEATURE`, `FLOW_STATUS`, `QUANTITY` |
| `TL SOs PLANNED` | `FEATURE`, `QUANTITY` |
| `VMI ON HAND QTY_old_version` | `FEATURE`, `QUANTITY` |

### Calculation Lineage Notes

Calculation lineage should be read against the likely static repo matches above; these matches are inferred from naming convention and local files.

Calculated fields were recovered from: `saasm_vmi`.

### LOD and Table Calculation Summary

| Metric | Count | Fields |
| --- | ---: | --- |
| LOD calculations | 0 | - |
| Table calculations | 4 | row num, DELTA (PLANNED - OHQ), TL LI CLOSED, VMI SOs CLOSED |

## Color and Legend Notes

| Source | Color / legend detail |
| --- | --- |
| Workbook card | `color` for `[:Measure Names]` |
