# NSS SMT BOM CompExp Dashboard

## Tabular Report

| Attribute | Value |
| --- | --- |
| Source workbook | `tableau/my-tableau-dashboards/NSS SMT BOM CompExp Dashboard_PROD.twbx` |
| Embedded TWB | `NSS SMT BOM CompExp Dashboard_PROD.twb` |
| Primary dashboard | `NSS SMT BOM CompExp Dashboard` |
| Dashboard count | 1 |
| Worksheet count | 2 |
| Datasource count | 1 |
| Calculated field count | 0 |
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
| `PROD_SMT_BOM_CompExport` | `sqlproxy.1fblg8o039oujy18ntuef0u5t811` | [sqlproxy], [sqlproxy] |

### Likely dbt / SQL or Seed Lineage Guess

| Likely file | Match score | Static reason |
| --- | ---: | --- |
| `models/9_optimized_compiled_sql/SMT_BOM_CompExp.sql` | 212.0 | normalized substring; shared tokens: bom, comp, exp, smt |
| `analyses/oracle_get_profile_initial/ogp_bom_departments.sql` | 8.0 | shared tokens: bom |
| `analyses/recommend_me_columns_initial/bom/rmc_bom_components_b.sql` | 8.0 | shared tokens: bom |
| `analyses/recommend_me_columns_initial/bom/rmc_bom_cst_cost_types.sql` | 8.0 | shared tokens: bom |
| `analyses/recommend_me_columns_initial/bom/rmc_bom_cst_item_cost_details.sql` | 8.0 | shared tokens: bom |
| `analyses/recommend_me_columns_initial/bom/rmc_bom_cst_item_costs.sql` | 8.0 | shared tokens: bom |
| `analyses/recommend_me_columns_initial/bom/rmc_bom_departments.sql` | 8.0 | shared tokens: bom |
| `analyses/recommend_me_columns_initial/bom/rmc_bom_operational_routings.sql` | 8.0 | shared tokens: bom |
| `analyses/recommend_me_columns_initial/bom/rmc_bom_operational_sequences.sql` | 8.0 | shared tokens: bom |
| `analyses/recommend_me_columns_initial/bom/rmc_bom_reference_designators.sql` | 8.0 | shared tokens: bom |

## Sheet Inventory

| Worksheet | Datasources | Field count | Filter count | Marks |
| --- | --- | ---: | ---: | --- |
| `ASSY ITEM by Components with Std Costs` | sqlproxy.1fblg8o039oujy18ntuef0u5t811 | 6 | 5 | Automatic |
| `NSS SMT BOM CompExp Data Details` | sqlproxy.1fblg8o039oujy18ntuef0u5t811 | 11 | 7 | Automatic |

### Filter Cards and Visible Controls

| Type | Parameter / field | Mode |
| --- | --- | --- |
| `filters` | `-` | - |

### Primary Worksheet Shelves and Marks

| Worksheet | Rows | Columns | Marks | Color fields |
| --- | --- | --- | --- | --- |
| `ASSY ITEM by Components with Std Costs` | [none:ASSEMBLY_ITEM_NUMBER:nk] | [cnt:COMPONENT_ITEM_NUMBER:qk] | Automatic | - |
| `NSS SMT BOM CompExp Data Details` | ([sqlproxy.1fblg8o039oujy18ntuef0u5t811].[none:ITEM_NUM:ok] / ([sqlproxy.1fblg8o039oujy18ntuef0u5t811].[none:ASSEMBLY_ITEM_NUMBER:nk] / ([sqlproxy.1fblg8o039oujy18ntuef0u5t811].[none:ROUTING_OP_SEQUENCE:ok] / ([sqlproxy.1fblg8o039oujy18ntuef0u5t811].[none:OPERATION_DESCRIPTION:nk] / ([sqlproxy.1fblg8o039oujy18ntuef0u5t811].[none:COMPONENT_ITEM_NUMBER:nk] / ([sqlproxy.1fblg8o039oujy18ntuef0u5t811].[none:ASSEMBLY_REVISION:nk] / ([sqlproxy.1fblg8o039oujy18ntuef0u5t811].[none:COMPONENT_REFERENCE_DESIGNATOR:nk] / [sqlproxy.1fblg8o039oujy18ntuef0u5t811].[none:COMPONENT_ITEM_ID:ok]))))))) | [:Measure Names] | Automatic | - |

### Worksheet Filters and Selections

| Worksheet | Filter class | Field | Selection / groupfilter |
| --- | --- | --- | --- |
| `ASSY ITEM by Components with Std Costs` | `categorical` | `[none:ASSEMBLY_ITEM_NUMBER:nk]` | - |
| `ASSY ITEM by Components with Std Costs` | `categorical` | `[none:COMPONENT_ITEM_NUMBER:nk]` | - |
| `ASSY ITEM by Components with Std Costs` | `categorical` | `[none:COMPONENT_REFERENCE_DESIGNATOR:nk]` | - |
| `ASSY ITEM by Components with Std Costs` | `categorical` | `[none:OPERATION_DESCRIPTION:nk]` | - |
| `ASSY ITEM by Components with Std Costs` | `quantitative` | `[sum:STANDARD_COSTS:qk]` | - |
| `NSS SMT BOM CompExp Data Details` | `categorical` | `[:Measure Names]` | - |
| `NSS SMT BOM CompExp Data Details` | `categorical` | `[none:ASSEMBLY_ITEM_NUMBER:nk]` | - |
| `NSS SMT BOM CompExp Data Details` | `categorical` | `[none:COMPONENT_ITEM_NUMBER:nk]` | - |
| `NSS SMT BOM CompExp Data Details` | `categorical` | `[none:COMPONENT_REFERENCE_DESIGNATOR:nk]` | - |
| `NSS SMT BOM CompExp Data Details` | `categorical` | `[none:ITEM_NUM:ok]` | - |
| `NSS SMT BOM CompExp Data Details` | `categorical` | `[none:OPERATION_DESCRIPTION:nk]` | - |
| `NSS SMT BOM CompExp Data Details` | `quantitative` | `[sum:STANDARD_COSTS:qk]` | - |

### Fields Used by Primary Worksheet

- `ASSY ITEM by Components with Std Costs`: `ASSEMBLY ITEM NUMBER`, `COMPONENT ITEM NUMBER`, `COMPONENT REFERENCE DESIGNATOR`, `OPERATION DESCRIPTION`, `STANDARD COSTS`, `[ASSEMBLY_ITEM_DESCRIPTION]`
- `NSS SMT BOM CompExp Data Details`: `ASSEMBLY ITEM NUMBER`, `COMPONENT ITEM NUMBER`, `COMPONENT LEAD TIME`, `COMPONENT QUANTITY`, `COMPONENT REFERENCE DESIGNATOR`, `ITEM NUM`, `OPERATION DESCRIPTION`, `ROUTING OP SEQUENCE`, `STANDARD COSTS`, `[ASSEMBLY_REVISION]`, `[COMPONENT_ITEM_ID]`

## Calculations

Recovered `0` calculated field definitions from static workbook XML.

### Calculated Fields

No calculated fields were recovered from static workbook XML.

### Calculation Field Dependencies

No calculation dependencies were recovered.

### Calculation Lineage Notes

Calculation lineage should be read against the likely static repo matches above; these matches are inferred from naming convention and local files.

### LOD and Table Calculation Summary

| Metric | Count | Fields |
| --- | ---: | --- |
| LOD calculations | 0 | - |
| Table calculations | 0 | - |

## Color and Legend Notes

No explicit color encoding or legend card elements were recovered from static workbook XML.
