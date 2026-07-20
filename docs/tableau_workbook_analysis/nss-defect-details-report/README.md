# NSS Defect Details Report

## Tabular Report

| Attribute | Value |
| --- | --- |
| Source workbook | `tableau/my-tableau-dashboards/NSS Defect Details Report.twbx` |
| Embedded TWB | `NSS Defect Details Report.twb` |
| Primary dashboard | `NSS Defect Details Report` |
| Dashboard count | 6 |
| Worksheet count | 20 |
| Datasource count | 1 |
| Calculated field count | 2 |
| LOD calculation count | 0 |
| Table calculation count | 1 |
| Screenshot | `docs/tableau_workbook_analysis/nss-defect-details-report/NSS-Defect-Details-Report.jpeg` |

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
| `DEFECT_DETAILS_TBL_WITH_RESULT_168` | `sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh` | collection, [sqlproxy], [sqlproxy], [sqlproxy], [sqlproxy], [sqlproxy], [sqlproxy] |

### Likely dbt / SQL or Seed Lineage Guess

| Likely file | Match score | Static reason |
| --- | ---: | --- |
| `models/9_optimized_compiled_sql/midas_DEFECT_DETAILS_TBL_WITH_RESULT_168.sql` | 93.0 | normalized substring; shared tokens: 168, defect, details, result, tbl, with |
| `analyses/supporting_tools/data_quality/int_saasm_top_level_sales_lines_and_deliveries___oeh_flow_status_code.sql` | 16.0 | shared tokens: level, top |
| `analyses/supporting_tools/data_quality/int_saasm_top_level_sales_lines_and_deliveries___oeh_line_category_code.sql` | 16.0 | shared tokens: level, top |
| `analyses/supporting_tools/data_quality/int_saasm_top_level_sales_lines_and_deliveries___oel_flow_status_code.sql` | 16.0 | shared tokens: level, top |
| `analyses/supporting_tools/data_quality/int_saasm_top_level_sales_lines_and_deliveries___oel_line_category_code.sql` | 16.0 | shared tokens: level, top |
| `analyses/supporting_tools/data_quality/int_saasm_top_level_sales_lines_and_deliveries___wsh_nd_status_code.sql` | 16.0 | shared tokens: level, top |
| `models/3_intermediate/int_saasm_top_level_sales_lines.sql` | 16.0 | shared tokens: level, top |
| `models/3_intermediate/int_saasm_top_level_sales_lines_and_deliveries.sql` | 16.0 | shared tokens: level, top |
| `models/4_marts/dimensions/dim_quality_defect_details_and_results_recording.sql` | 16.0 | shared tokens: defect, details |
| `models/4_marts/dimensions/dim_quality_defect_details_as_child.sql` | 16.0 | shared tokens: defect, details |

## Sheet Inventory

| Worksheet | Datasources | Field count | Filter count | Marks |
| --- | --- | ---: | ---: | --- |
| `Board Build Assembly Drill Through Pareto Sheet` | sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh | 6 | 6 | Automatic |
| `Board Build Cause By Graph Pareto Sheet` | sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh | 6 | 6 | Automatic |
| `Board Build Defect Code Drill Through Pareto` | sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh | 6 | 6 | Automatic |
| `Board Build Defect Details Drill Through Sheet` | sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh | 11 | 9 | Automatic |
| `CRGs Defect Details Data Sheet` | sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh | 36 | 13 | Automatic |
| `Defect Details Full Data Sheet` | sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh | 38 | 15 | Automatic |
| `Micro Assembly Drill Through Pareto Sheet (2)` | sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh | 6 | 5 | Automatic |
| `Micro Cause By Graph Pareto Sheet (2)` | sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh | 5 | 5 | Automatic |
| `Micro Defect Code Drill Through Pareto (2)` | sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh | 5 | 5 | Automatic |
| `Micro Defect Details Drill Through Sheet (2)` | sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh | 11 | 5 | Automatic |
| `NPI Top Level Assembly Drill Through Pareto Sheet (4)` | sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh | 4 | 2 | Automatic |
| `NPI Top Level Cause By Graph Pareto Sheet (4)` | sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh | 4 | 2 | Automatic |
| `NPI Top Level Defect Code Drill Through Pareto (4)` | sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh | 3 | 2 | Automatic |
| `NPI Top Level Defect Details Drill Through Sheet (4)` | sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh | 11 | 5 | Automatic |
| `Top Level Assembly Drill Through Pareto Sheet (3)` | sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh | 6 | 5 | Automatic |
| `Top Level Cause By Graph Pareto Sheet (3)` | sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh | 5 | 5 | Automatic |
| `Top Level Defect Code Drill Through Pareto (3)` | sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh | 5 | 5 | Automatic |
| `Top Level Defect Details Drill Through Sheet (3)` | sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh | 11 | 5 | Automatic |
| `zz.Data Refresh At Caption (2)` | sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh | 4 | 4 | Automatic |
| `zz.Frequency Caption (2)` | - | 0 | 0 | Automatic |

### Filter Cards and Visible Controls

| Type | Parameter / field | Mode |
| --- | --- | --- |
| `filters` | `-` | - |
| `color` | `[cnt:DT_DEFECT_CODE:qk]` | - |

### Primary Worksheet Shelves and Marks

| Worksheet | Rows | Columns | Marks | Color fields |
| --- | --- | --- | --- | --- |
| `Board Build Assembly Drill Through Pareto Sheet` | [cnt:DT_DEFECT_CODE:qk] | [none:AFFECTED_ASSEMBLY_MATERIAL:nk] | Automatic | - |
| `Board Build Cause By Graph Pareto Sheet` | [cnt:DT_DEFECT_CODE:qk] | [none:DT_CAUSED_BY:nk] | Automatic | - |
| `Board Build Defect Code Drill Through Pareto` | [cnt:DT_DEFECT_CODE:qk] | [none:DT_DEFECT_CODE:nk] | Automatic | - |
| `Board Build Defect Details Drill Through Sheet` | ([sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh].[none:DEF_DETAIL_ID:nk] / ([sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh].[none:CREATION_DATE:ok] / ([sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh].[none:CREATED_BY:nk] / ([sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh].[none:DT_CAUSED_BY:nk] / ([sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh].[none:DT_DEFECT_CODE:nk] / ([sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh].[none:JOB:nk] / ([sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh].[sum:FROM_OP_SEQ_NUMBER:ok] / ([sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh].[none:AFFECTED_ASSEMBLY_MATERIAL:nk] / ([sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh].[none:DEPARTMENT_GROUPING:nk] / [sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh].[none:DEPARTMENT:nk]))))))))) | - | Automatic | - |
| `CRGs Defect Details Data Sheet` | ([sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh].[none:DEF_DETAIL_ID:nk] / ([sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh].[none:CREATION_DATE:ok] / ([sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh].[none:CREATED_BY:nk] / ([sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh].[none:DEFECT_DETAIL_INSP:nk] / ([sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh].[none:INSPECTOR:nk] / ([sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh].[none:INSPECTION_DATE:ok] / ([sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh].[none:JOB:nk] / ([sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh].[none:FROM_OP_SEQ_NUMBER:ok] / ([sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh].[none:From Op Desc:nk] / ([sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh].[none:DEPARTMENT:nk] / ([sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh].[none:WIP_INSP_RESULT:nk] / ([sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh].[none:WIP_INSP_RESULT_MEANING:nk] / ([sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh].[none:Program:nk] / ([sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh].[none:ITEM:nk] / ([sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh].[none:CR_SERIAL_NUMBER:nk] / ([sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh].[none:AFFECTED_ASSEMBLY_MATERIAL:nk] / ([sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh].[none:CR_AFFECTED_ASSY_SN:nk] / ([sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh].[none:LEVEL_REVISION:nk] / ([sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh].[none:REWORK_OPER:nk] / ([sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh].[none:DT_DEFECT_CODE:nk] / ([sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh].[none:NSS_DEFECT_TRACKER_REF_DES:nk] / ([sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh].[none:DT_COMPONENT:nk] / ([sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh].[none:PROBLEM_DESCRIPTION:nk] / ([sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh].[none:PROBLEM_DESCRIPTION_LONG:nk] / ([sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh].[sum:QUANTITY:ok] / ([sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh].[none:DT_CAUSED_BY:nk] / ([sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh].[none:DT_CAUSED_BY_DESCRIPTION:nk] / ([sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh].[none:DATE_CODE:nk] / ([sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh].[none:MATERIAL_AFFECTED:nk] / ([sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh].[none:NC_LOCATION:nk] / ([sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh].[none:NC_SIZE:nk] / ([sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh].[none:OPERATOR_ID:nk] / ([sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh].[none:ESCAPED_BY:nk] / [sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh].[none:CHARGE_DEFECT_TO_OPERATOR:nk]))))))))))))))))))))))))))))))))) | - | Automatic | - |
| `Defect Details Full Data Sheet` | ([sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh].[usr:Calculation_2894125747362193408:ok] / ([sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh].[none:DEF_DETAIL_ID:nk] / ([sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh].[none:CREATION_DATE:ok] / ([sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh].[none:CREATED_BY:nk] / ([sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh].[none:DEFECT_DETAIL_INSP:nk] / ([sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh].[none:INSPECTOR:nk] / ([sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh].[none:INSPECTION_DATE:ok] / ([sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh].[none:JOB:nk] / ([sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh].[none:FROM_OP_SEQ_NUMBER:ok] / ([sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh].[none:From Op Desc:nk] / ([sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh].[none:DEPARTMENT:nk] / ([sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh].[none:WIP_INSP_RESULT:nk] / ([sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh].[none:WIP_INSP_RESULT_MEANING:nk] / ([sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh].[none:Program:nk] / ([sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh].[none:ITEM:nk] / ([sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh].[none:CR_SERIAL_NUMBER:nk] / ([sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh].[none:AFFECTED_ASSEMBLY_MATERIAL:nk] / ([sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh].[none:CR_AFFECTED_ASSY_SN:nk] / ([sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh].[none:LEVEL_REVISION:nk] / ([sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh].[none:REWORK_OPER:nk] / ([sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh].[none:DT_DEFECT_CODE:nk] / ([sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh].[none:DT_DEFECT_CODE_MEANING:nk] / ([sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh].[none:NSS_DEFECT_TRACKER_REF_DES:nk] / ([sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh].[none:DT_COMPONENT:nk] / ([sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh].[none:PROBLEM_DESCRIPTION:nk] / ([sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh].[none:PROBLEM_DESCRIPTION_LONG:nk] / ([sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh].[sum:QUANTITY:ok] / ([sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh].[none:DT_CAUSED_BY:nk] / ([sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh].[none:DT_CAUSED_BY_DESCRIPTION:nk] / ([sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh].[none:DATE_CODE:nk] / ([sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh].[none:MATERIAL_AFFECTED:nk] / ([sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh].[none:NC_LOCATION:nk] / ([sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh].[none:NC_SIZE:nk] / ([sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh].[none:OPERATOR_ID:nk] / ([sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh].[none:ESCAPED_BY:nk] / [sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh].[none:CHARGE_DEFECT_TO_OPERATOR:nk]))))))))))))))))))))))))))))))))))) | - | Automatic | - |
| `Micro Assembly Drill Through Pareto Sheet (2)` | [cnt:DT_DEFECT_CODE:qk] | [none:AFFECTED_ASSEMBLY_MATERIAL:nk] | Automatic | - |
| `Micro Cause By Graph Pareto Sheet (2)` | [cnt:DT_DEFECT_CODE:qk] | [none:DT_CAUSED_BY:nk] | Automatic | - |
| `Micro Defect Code Drill Through Pareto (2)` | [cnt:DT_DEFECT_CODE:qk] | [none:DT_DEFECT_CODE:nk] | Automatic | - |
| `Micro Defect Details Drill Through Sheet (2)` | ([sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh].[none:DEF_DETAIL_ID:nk] / ([sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh].[none:CREATION_DATE:ok] / ([sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh].[none:CREATED_BY:nk] / ([sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh].[none:DT_CAUSED_BY:nk] / ([sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh].[none:DT_DEFECT_CODE:nk] / ([sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh].[none:JOB:nk] / ([sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh].[sum:FROM_OP_SEQ_NUMBER:ok] / ([sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh].[none:AFFECTED_ASSEMBLY_MATERIAL:nk] / ([sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh].[none:DEPARTMENT_GROUPING:nk] / ([sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh].[none:DEPARTMENT:nk] / [sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh].[none:ITEM_STATUS:nk])))))))))) | - | Automatic | - |
| `NPI Top Level Assembly Drill Through Pareto Sheet (4)` | [cnt:DT_DEFECT_CODE:qk] | [none:AFFECTED_ASSEMBLY_MATERIAL:nk] | Automatic | - |
| `NPI Top Level Cause By Graph Pareto Sheet (4)` | [cnt:DT_DEFECT_CODE:qk] | [none:DT_CAUSED_BY:nk] | Automatic | - |
| `NPI Top Level Defect Code Drill Through Pareto (4)` | [cnt:DT_DEFECT_CODE:qk] | [none:DT_DEFECT_CODE:nk] | Automatic | - |
| `NPI Top Level Defect Details Drill Through Sheet (4)` | ([sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh].[none:DEF_DETAIL_ID:nk] / ([sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh].[none:CREATION_DATE:ok] / ([sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh].[none:CREATED_BY:nk] / ([sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh].[none:DT_CAUSED_BY:nk] / ([sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh].[none:DT_DEFECT_CODE:nk] / ([sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh].[none:JOB:nk] / ([sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh].[sum:FROM_OP_SEQ_NUMBER:ok] / ([sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh].[none:AFFECTED_ASSEMBLY_MATERIAL:nk] / ([sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh].[none:DEPARTMENT_GROUPING:nk] / ([sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh].[none:DEPARTMENT:nk] / [sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh].[none:ITEM_STATUS:nk])))))))))) | - | Automatic | - |
| `Top Level Assembly Drill Through Pareto Sheet (3)` | [cnt:DT_DEFECT_CODE:qk] | [none:AFFECTED_ASSEMBLY_MATERIAL:nk] | Automatic | - |
| `Top Level Cause By Graph Pareto Sheet (3)` | [cnt:DT_DEFECT_CODE:qk] | [none:DT_CAUSED_BY:nk] | Automatic | - |
| `Top Level Defect Code Drill Through Pareto (3)` | [cnt:DT_DEFECT_CODE:qk] | [none:DT_DEFECT_CODE:nk] | Automatic | - |
| `Top Level Defect Details Drill Through Sheet (3)` | ([sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh].[none:DEF_DETAIL_ID:nk] / ([sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh].[none:CREATION_DATE:ok] / ([sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh].[none:CREATED_BY:nk] / ([sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh].[none:DT_CAUSED_BY:nk] / ([sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh].[none:DT_DEFECT_CODE:nk] / ([sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh].[none:JOB:nk] / ([sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh].[sum:FROM_OP_SEQ_NUMBER:ok] / ([sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh].[none:AFFECTED_ASSEMBLY_MATERIAL:nk] / ([sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh].[none:DEPARTMENT_GROUPING:nk] / ([sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh].[none:DEPARTMENT:nk] / [sqlproxy.1jh96qv1rhk0k01h8jl3s0ddi8fh].[none:ITEM_STATUS:nk])))))))))) | - | Automatic | - |
| `zz.Data Refresh At Caption (2)` | - | - | Automatic | - |
| `zz.Frequency Caption (2)` | - | - | Automatic | - |

### Worksheet Filters and Selections

| Worksheet | Filter class | Field | Selection / groupfilter |
| --- | --- | --- | --- |
| `Board Build Assembly Drill Through Pareto Sheet` | `categorical` | `[none:AFFECTED_ASSEMBLY_MATERIAL:nk]` | - |
| `Board Build Assembly Drill Through Pareto Sheet` | `categorical` | `[none:DEPARTMENT:nk]` | - |
| `Board Build Assembly Drill Through Pareto Sheet` | `categorical` | `[none:DEPARTMENT_GROUPING:nk]` | - |
| `Board Build Assembly Drill Through Pareto Sheet` | `categorical` | `[none:DT_CAUSED_BY:nk]` | - |
| `Board Build Assembly Drill Through Pareto Sheet` | `categorical` | `[none:DT_DEFECT_CODE:nk]` | - |
| `Board Build Assembly Drill Through Pareto Sheet` | `categorical` | `[none:ITEM_STATUS:nk]` | - |
| `Board Build Cause By Graph Pareto Sheet` | `categorical` | `[none:AFFECTED_ASSEMBLY_MATERIAL:nk]` | - |
| `Board Build Cause By Graph Pareto Sheet` | `categorical` | `[none:DEPARTMENT:nk]` | - |
| `Board Build Cause By Graph Pareto Sheet` | `categorical` | `[none:DEPARTMENT_GROUPING:nk]` | - |
| `Board Build Cause By Graph Pareto Sheet` | `categorical` | `[none:DT_CAUSED_BY:nk]` | - |
| `Board Build Cause By Graph Pareto Sheet` | `categorical` | `[none:DT_DEFECT_CODE:nk]` | - |
| `Board Build Cause By Graph Pareto Sheet` | `categorical` | `[none:ITEM_STATUS:nk]` | - |
| `Board Build Defect Code Drill Through Pareto` | `categorical` | `[none:AFFECTED_ASSEMBLY_MATERIAL:nk]` | - |
| `Board Build Defect Code Drill Through Pareto` | `categorical` | `[none:DEPARTMENT:nk]` | - |
| `Board Build Defect Code Drill Through Pareto` | `categorical` | `[none:DEPARTMENT_GROUPING:nk]` | - |
| `Board Build Defect Code Drill Through Pareto` | `categorical` | `[none:DT_CAUSED_BY:nk]` | - |
| `Board Build Defect Code Drill Through Pareto` | `categorical` | `[none:DT_DEFECT_CODE:nk]` | - |
| `Board Build Defect Code Drill Through Pareto` | `categorical` | `[none:ITEM_STATUS:nk]` | - |
| `Board Build Defect Details Drill Through Sheet` | `categorical` | `[Action (AFFECTED_ASSEMBLY_MATERIAL)]` | - |
| `Board Build Defect Details Drill Through Sheet` | `categorical` | `[Action (DT_CAUSED_BY)]` | - |
| `Board Build Defect Details Drill Through Sheet` | `categorical` | `[Action (DT_DEFECT_CODE)]` | - |
| `Board Build Defect Details Drill Through Sheet` | `categorical` | `[none:AFFECTED_ASSEMBLY_MATERIAL:nk]` | - |
| `Board Build Defect Details Drill Through Sheet` | `categorical` | `[none:DEPARTMENT:nk]` | - |
| `Board Build Defect Details Drill Through Sheet` | `categorical` | `[none:DEPARTMENT_GROUPING:nk]` | - |
| `Board Build Defect Details Drill Through Sheet` | `categorical` | `[none:DT_CAUSED_BY:nk]` | - |
| `Board Build Defect Details Drill Through Sheet` | `categorical` | `[none:DT_DEFECT_CODE:nk]` | - |
| `Board Build Defect Details Drill Through Sheet` | `categorical` | `[none:ITEM_STATUS:nk]` | - |
| `CRGs Defect Details Data Sheet` | `categorical` | `[none:AFFECTED_ASSEMBLY_MATERIAL:nk]` | - |
| `CRGs Defect Details Data Sheet` | `relative-date` | `[none:CREATION_DATE:qk]` | - |
| `CRGs Defect Details Data Sheet` | `categorical` | `[none:CR_SERIAL_NUMBER:nk]` | - |
| `CRGs Defect Details Data Sheet` | `categorical` | `[none:DEFECT_DETAIL_INSP:nk]` | - |
| `CRGs Defect Details Data Sheet` | `categorical` | `[none:DEF_DETAIL_ID:nk]` | - |
| `CRGs Defect Details Data Sheet` | `categorical` | `[none:DEPARTMENT:nk]` | - |
| `CRGs Defect Details Data Sheet` | `categorical` | `[none:INSPECTION_DATE:ok]` | - |
| `CRGs Defect Details Data Sheet` | `categorical` | `[none:INSPECTOR:nk]` | - |
| `CRGs Defect Details Data Sheet` | `categorical` | `[none:ITEM_STATUS:nk]` | - |
| `CRGs Defect Details Data Sheet` | `categorical` | `[none:JOB:nk]` | - |
| `CRGs Defect Details Data Sheet` | `categorical` | `[none:Program:nk]` | - |
| `CRGs Defect Details Data Sheet` | `categorical` | `[none:SOURCE_CODE:nk]` | - |
| `CRGs Defect Details Data Sheet` | `categorical` | `[none:WIP_INSP_RESULT_MEANING:nk]` | - |
| `Defect Details Full Data Sheet` | `categorical` | `[none:AFFECTED_ASSEMBLY_MATERIAL:nk]` | - |
| `Defect Details Full Data Sheet` | `relative-date` | `[none:CREATION_DATE:qk]` | - |
| `Defect Details Full Data Sheet` | `categorical` | `[none:CR_SERIAL_NUMBER:nk]` | - |
| `Defect Details Full Data Sheet` | `categorical` | `[none:DEFECT_DETAIL_INSP:nk]` | - |
| `Defect Details Full Data Sheet` | `categorical` | `[none:DEF_DETAIL_ID:nk]` | - |
| `Defect Details Full Data Sheet` | `categorical` | `[none:DEPARTMENT:nk]` | - |
| `Defect Details Full Data Sheet` | `categorical` | `[none:FROM_OP_SEQ_NUMBER:ok]` | - |
| `Defect Details Full Data Sheet` | `categorical` | `[none:From Op Desc:nk]` | - |
| `Defect Details Full Data Sheet` | `categorical` | `[none:INSPECTION_DATE:ok]` | - |
| `Defect Details Full Data Sheet` | `categorical` | `[none:INSPECTOR:nk]` | - |
| `Defect Details Full Data Sheet` | `categorical` | `[none:ITEM_STATUS:nk]` | - |
| `Defect Details Full Data Sheet` | `categorical` | `[none:JOB:nk]` | - |
| `Defect Details Full Data Sheet` | `categorical` | `[none:Program:nk]` | - |
| `Defect Details Full Data Sheet` | `categorical` | `[none:SOURCE_CODE:nk]` | - |
| `Defect Details Full Data Sheet` | `categorical` | `[none:WIP_INSP_RESULT_MEANING:nk]` | - |
| `Micro Assembly Drill Through Pareto Sheet (2)` | `categorical` | `[none:DEPARTMENT:nk]` | - |
| `Micro Assembly Drill Through Pareto Sheet (2)` | `categorical` | `[none:DEPARTMENT_GROUPING:nk]` | - |
| `Micro Assembly Drill Through Pareto Sheet (2)` | `categorical` | `[none:DT_CAUSED_BY:nk]` | - |
| `Micro Assembly Drill Through Pareto Sheet (2)` | `categorical` | `[none:DT_DEFECT_CODE:nk]` | - |
| `Micro Assembly Drill Through Pareto Sheet (2)` | `categorical` | `[none:ITEM_STATUS:nk]` | - |
| `Micro Cause By Graph Pareto Sheet (2)` | `categorical` | `[none:DEPARTMENT:nk]` | - |
| `Micro Cause By Graph Pareto Sheet (2)` | `categorical` | `[none:DEPARTMENT_GROUPING:nk]` | - |
| `Micro Cause By Graph Pareto Sheet (2)` | `categorical` | `[none:DT_CAUSED_BY:nk]` | - |
| `Micro Cause By Graph Pareto Sheet (2)` | `categorical` | `[none:DT_DEFECT_CODE:nk]` | - |
| `Micro Cause By Graph Pareto Sheet (2)` | `categorical` | `[none:ITEM_STATUS:nk]` | - |
| `Micro Defect Code Drill Through Pareto (2)` | `categorical` | `[none:DEPARTMENT:nk]` | - |
| `Micro Defect Code Drill Through Pareto (2)` | `categorical` | `[none:DEPARTMENT_GROUPING:nk]` | - |
| `Micro Defect Code Drill Through Pareto (2)` | `categorical` | `[none:DT_CAUSED_BY:nk]` | - |
| `Micro Defect Code Drill Through Pareto (2)` | `categorical` | `[none:DT_DEFECT_CODE:nk]` | - |
| `Micro Defect Code Drill Through Pareto (2)` | `categorical` | `[none:ITEM_STATUS:nk]` | - |
| `Micro Defect Details Drill Through Sheet (2)` | `categorical` | `[none:DEPARTMENT:nk]` | - |
| `Micro Defect Details Drill Through Sheet (2)` | `categorical` | `[none:DEPARTMENT_GROUPING:nk]` | - |
| `Micro Defect Details Drill Through Sheet (2)` | `categorical` | `[none:DT_CAUSED_BY:nk]` | - |
| `Micro Defect Details Drill Through Sheet (2)` | `categorical` | `[none:DT_DEFECT_CODE:nk]` | - |
| `Micro Defect Details Drill Through Sheet (2)` | `categorical` | `[none:ITEM_STATUS:nk]` | - |
| `NPI Top Level Assembly Drill Through Pareto Sheet (4)` | `categorical` | `[none:DEPARTMENT:nk]` | - |
| `NPI Top Level Assembly Drill Through Pareto Sheet (4)` | `categorical` | `[none:DEPARTMENT_GROUPING:nk]` | - |
| `NPI Top Level Cause By Graph Pareto Sheet (4)` | `categorical` | `[none:DEPARTMENT:nk]` | - |
| `NPI Top Level Cause By Graph Pareto Sheet (4)` | `categorical` | `[none:DEPARTMENT_GROUPING:nk]` | - |
| `NPI Top Level Defect Code Drill Through Pareto (4)` | `categorical` | `[none:DEPARTMENT:nk]` | - |
| `NPI Top Level Defect Code Drill Through Pareto (4)` | `categorical` | `[none:DEPARTMENT_GROUPING:nk]` | - |
| `NPI Top Level Defect Details Drill Through Sheet (4)` | `categorical` | `[none:DEPARTMENT:nk]` | - |
| `NPI Top Level Defect Details Drill Through Sheet (4)` | `categorical` | `[none:DEPARTMENT_GROUPING:nk]` | - |
| `NPI Top Level Defect Details Drill Through Sheet (4)` | `categorical` | `[none:DT_CAUSED_BY:nk]` | - |
| `NPI Top Level Defect Details Drill Through Sheet (4)` | `categorical` | `[none:DT_DEFECT_CODE:nk]` | - |
| `NPI Top Level Defect Details Drill Through Sheet (4)` | `categorical` | `[none:ITEM_STATUS:nk]` | - |
| `Top Level Assembly Drill Through Pareto Sheet (3)` | `categorical` | `[none:DEPARTMENT:nk]` | - |
| `Top Level Assembly Drill Through Pareto Sheet (3)` | `categorical` | `[none:DEPARTMENT_GROUPING:nk]` | - |
| `Top Level Assembly Drill Through Pareto Sheet (3)` | `categorical` | `[none:DT_CAUSED_BY:nk]` | - |
| `Top Level Assembly Drill Through Pareto Sheet (3)` | `categorical` | `[none:DT_DEFECT_CODE:nk]` | - |
| `Top Level Assembly Drill Through Pareto Sheet (3)` | `categorical` | `[none:ITEM_STATUS:nk]` | - |
| `Top Level Cause By Graph Pareto Sheet (3)` | `categorical` | `[none:DEPARTMENT:nk]` | - |
| `Top Level Cause By Graph Pareto Sheet (3)` | `categorical` | `[none:DEPARTMENT_GROUPING:nk]` | - |
| `Top Level Cause By Graph Pareto Sheet (3)` | `categorical` | `[none:DT_CAUSED_BY:nk]` | - |
| `Top Level Cause By Graph Pareto Sheet (3)` | `categorical` | `[none:DT_DEFECT_CODE:nk]` | - |
| `Top Level Cause By Graph Pareto Sheet (3)` | `categorical` | `[none:ITEM_STATUS:nk]` | - |
| `Top Level Defect Code Drill Through Pareto (3)` | `categorical` | `[none:DEPARTMENT:nk]` | - |
| `Top Level Defect Code Drill Through Pareto (3)` | `categorical` | `[none:DEPARTMENT_GROUPING:nk]` | - |
| `Top Level Defect Code Drill Through Pareto (3)` | `categorical` | `[none:DT_CAUSED_BY:nk]` | - |
| `Top Level Defect Code Drill Through Pareto (3)` | `categorical` | `[none:DT_DEFECT_CODE:nk]` | - |
| `Top Level Defect Code Drill Through Pareto (3)` | `categorical` | `[none:ITEM_STATUS:nk]` | - |
| `Top Level Defect Details Drill Through Sheet (3)` | `categorical` | `[none:DEPARTMENT:nk]` | - |
| `Top Level Defect Details Drill Through Sheet (3)` | `categorical` | `[none:DEPARTMENT_GROUPING:nk]` | - |
| `Top Level Defect Details Drill Through Sheet (3)` | `categorical` | `[none:DT_CAUSED_BY:nk]` | - |
| `Top Level Defect Details Drill Through Sheet (3)` | `categorical` | `[none:DT_DEFECT_CODE:nk]` | - |
| `Top Level Defect Details Drill Through Sheet (3)` | `categorical` | `[none:ITEM_STATUS:nk]` | - |
| `zz.Data Refresh At Caption (2)` | `categorical` | `[Action (AFFECTED_ASSEMBLY_MATERIAL)]` | - |
| `zz.Data Refresh At Caption (2)` | `categorical` | `[Action (DT_CAUSED_BY)]` | - |
| `zz.Data Refresh At Caption (2)` | `categorical` | `[Action (DT_DEFECT_CODE)]` | - |
| `zz.Data Refresh At Caption (2)` | `categorical` | `[none:Calculation_1328843370564071424:nk]` | - |

### Fields Used by Primary Worksheet

- `Board Build Assembly Drill Through Pareto Sheet`: `AFFECTED ASSEMBLY MATERIAL`, `DEFECT CODE`, `DEPARTMENT GROUPING`, `DT CAUSED BY`, `ITEM STATUS`, `[DEPARTMENT]`
- `Board Build Cause By Graph Pareto Sheet`: `AFFECTED ASSEMBLY MATERIAL`, `DEFECT CODE`, `DEPARTMENT GROUPING`, `DT CAUSED BY`, `ITEM STATUS`, `[DEPARTMENT]`
- `Board Build Defect Code Drill Through Pareto`: `AFFECTED ASSEMBLY MATERIAL`, `DEFECT CODE`, `DEPARTMENT GROUPING`, `DT CAUSED BY`, `ITEM STATUS`, `[DEPARTMENT]`
- `Board Build Defect Details Drill Through Sheet`: `AFFECTED ASSEMBLY MATERIAL`, `CREATED BY`, `CREATION DATE`, `DEF DETAIL ID`, `DEFECT CODE`, `DEPARTMENT GROUPING`, `DT CAUSED BY`, `FROM OP SEQ NUMBER`, `ITEM STATUS`, `[DEPARTMENT]`, `[JOB]`
- `CRGs Defect Details Data Sheet`: `AFFECTED ASSEMBLY MATERIAL`, `ASSEMBLY`, `CHARGE DEFECT TO OPERATOR`, `CR SERIAL NUMBER`, `CREATED BY`, `CREATION DATE`, `DATE CODE`, `DEF DETAIL ID`, `DEFECT CODE`, `DEFECT DETAIL INSP`, `DT CAUSED BY`, `DT CAUSED BY DESC`, `DT COMPONENT`, `ESCAPED BY`, `FROM OP SEQ NUMBER`, `INSPECTION DATE`, `ITEM STATUS`, `LEVEL REVISION`, `MATERIAL AFFECTED`, `NC LOCATION`, `NC SIZE`, `NSS DEFECT TRACKER REF DES`, `OPERATOR ID`, `PROBLEM DESC`, `PROBLEM DESC LONG`, `REWORK OPER`, `WIP INSP RESULT`, `WIP INSP RESULT MEANING`, `[CR_AFFECTED_ASSY_SN]`, `[DEPARTMENT]`, `[From Op Desc]`, `[INSPECTOR]`, `[JOB]`, `[Program]`, `[QUANTITY]`, `[SOURCE_CODE]`
- `Defect Details Full Data Sheet`: `AFFECTED ASSEMBLY MATERIAL`, `ASSEMBLY`, `CHARGE DEFECT TO OPERATOR`, `CR SERIAL NUMBER`, `CREATED BY`, `CREATION DATE`, `DATE CODE`, `DEF DETAIL ID`, `DEFECT CODE`, `DEFECT CODE MEANING`, `DEFECT DETAIL INSP`, `DT CAUSED BY`, `DT CAUSED BY DESC`, `DT COMPONENT`, `ESCAPED BY`, `FROM OP SEQ NUMBER`, `INSPECTION DATE`, `ITEM STATUS`, `LEVEL REVISION`, `MATERIAL AFFECTED`, `NC LOCATION`, `NC SIZE`, `NSS DEFECT TRACKER REF DES`, `OPERATOR ID`, `PROBLEM DESC`, `PROBLEM DESC LONG`, `REWORK OPER`, `Row Num`, `WIP INSP RESULT`, `WIP INSP RESULT MEANING`, `[CR_AFFECTED_ASSY_SN]`, `[DEPARTMENT]`, `[From Op Desc]`, `[INSPECTOR]`, `[JOB]`, `[Program]`, `[QUANTITY]`, `[SOURCE_CODE]`
- `Micro Assembly Drill Through Pareto Sheet (2)`: `AFFECTED ASSEMBLY MATERIAL`, `DEFECT CODE`, `DEPARTMENT GROUPING`, `DT CAUSED BY`, `ITEM STATUS`, `[DEPARTMENT]`
- `Micro Cause By Graph Pareto Sheet (2)`: `DEFECT CODE`, `DEPARTMENT GROUPING`, `DT CAUSED BY`, `ITEM STATUS`, `[DEPARTMENT]`
- `Micro Defect Code Drill Through Pareto (2)`: `DEFECT CODE`, `DEPARTMENT GROUPING`, `DT CAUSED BY`, `ITEM STATUS`, `[DEPARTMENT]`
- `Micro Defect Details Drill Through Sheet (2)`: `AFFECTED ASSEMBLY MATERIAL`, `CREATED BY`, `CREATION DATE`, `DEF DETAIL ID`, `DEFECT CODE`, `DEPARTMENT GROUPING`, `DT CAUSED BY`, `FROM OP SEQ NUMBER`, `ITEM STATUS`, `[DEPARTMENT]`, `[JOB]`
- `NPI Top Level Assembly Drill Through Pareto Sheet (4)`: `AFFECTED ASSEMBLY MATERIAL`, `DEFECT CODE`, `DEPARTMENT GROUPING`, `[DEPARTMENT]`
- `NPI Top Level Cause By Graph Pareto Sheet (4)`: `DEFECT CODE`, `DEPARTMENT GROUPING`, `DT CAUSED BY`, `[DEPARTMENT]`
- `NPI Top Level Defect Code Drill Through Pareto (4)`: `DEFECT CODE`, `DEPARTMENT GROUPING`, `[DEPARTMENT]`
- `NPI Top Level Defect Details Drill Through Sheet (4)`: `AFFECTED ASSEMBLY MATERIAL`, `CREATED BY`, `CREATION DATE`, `DEF DETAIL ID`, `DEFECT CODE`, `DEPARTMENT GROUPING`, `DT CAUSED BY`, `FROM OP SEQ NUMBER`, `ITEM STATUS`, `[DEPARTMENT]`, `[JOB]`
- `Top Level Assembly Drill Through Pareto Sheet (3)`: `AFFECTED ASSEMBLY MATERIAL`, `DEFECT CODE`, `DEPARTMENT GROUPING`, `DT CAUSED BY`, `ITEM STATUS`, `[DEPARTMENT]`
- `Top Level Cause By Graph Pareto Sheet (3)`: `DEFECT CODE`, `DEPARTMENT GROUPING`, `DT CAUSED BY`, `ITEM STATUS`, `[DEPARTMENT]`
- `Top Level Defect Code Drill Through Pareto (3)`: `DEFECT CODE`, `DEPARTMENT GROUPING`, `DT CAUSED BY`, `ITEM STATUS`, `[DEPARTMENT]`
- `Top Level Defect Details Drill Through Sheet (3)`: `AFFECTED ASSEMBLY MATERIAL`, `CREATED BY`, `CREATION DATE`, `DEF DETAIL ID`, `DEFECT CODE`, `DEPARTMENT GROUPING`, `DT CAUSED BY`, `FROM OP SEQ NUMBER`, `ITEM STATUS`, `[DEPARTMENT]`, `[JOB]`
- `zz.Data Refresh At Caption (2)`: `AFFECTED ASSEMBLY MATERIAL`, `Blank`, `DEFECT CODE`, `DT CAUSED BY`
- `zz.Frequency Caption (2)`: No datasource dependency fields recovered.

## Calculations

Recovered `2` calculated field definitions from static workbook XML.

### Calculated Fields

| Calculated field | Datasource | Formula |
| --- | --- | --- |
| `Blank` | `DEFECT_DETAILS_TBL_WITH_RESULT_168` | `""` |
| `Row Num` | `DEFECT_DETAILS_TBL_WITH_RESULT_168` | `INDEX()` |

### Calculation Field Dependencies

| Calculated field | Referenced fields |
| --- | --- |
| `Blank` | - |
| `Row Num` | - |

### Calculation Lineage Notes

Calculation lineage should be read against the likely static repo matches above; these matches are inferred from naming convention and local files.

Calculated fields were recovered from: `DEFECT_DETAILS_TBL_WITH_RESULT_168`.

### LOD and Table Calculation Summary

| Metric | Count | Fields |
| --- | ---: | --- |
| LOD calculations | 0 | - |
| Table calculations | 1 | Row Num |

## Color and Legend Notes

| Source | Color / legend detail |
| --- | --- |
| Workbook card | `color` for `[cnt:DT_DEFECT_CODE:qk]` |
