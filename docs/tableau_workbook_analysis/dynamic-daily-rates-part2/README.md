# Dynamic Daily Rates Dashboard

## Tabular Report

| Attribute | Value |
| --- | --- |
| Source workbook | `tableau/my-tableau-dashboards/Dynamic Daily Rates Part2.twbx` |
| Embedded TWB | `Dynamic Daily Rates Part2.twb` |
| Primary dashboard | `Dynamic Daily Rates Dashboard` |
| Dashboard count | 2 |
| Worksheet count | 6 |
| Datasource count | 2 |
| Calculated field count | 32 |
| LOD calculation count | 0 |
| Table calculation count | 0 |
| Screenshot | `docs/tableau_workbook_analysis/dynamic-daily-rates-part2/Dynamic-Daily-Rates-Dashboard.jpeg` |

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
| `move_trxns_dynamic_daily_rate_part_2` | `sqlproxy.0zbp27g0p88q1019m8lk713x7l7i` | [sqlproxy], [sqlproxy] |

### Likely dbt / SQL or Seed Lineage Guess

| Likely file | Match score | Static reason |
| --- | ---: | --- |
| `models/4_marts/move_trxns_dynamic_daily_rate_part_2.sql` | 148.0 | exact normalized name; shared tokens: daily, dynamic, move, part, rate, trxns |
| `models/3_intermediate/int_move_trxns_dynamic_daily_rate_part2.sql` | 93.0 | normalized substring; shared tokens: daily, dynamic, move, part2, rate, trxns |
| `models/4_marts/move_trxns_dynamic_daily_rate.sql` | 85.0 | normalized substring; shared tokens: daily, dynamic, move, rate, trxns |
| `models/3_intermediate/int_move_trxns_dynamic_daily_rate.sql` | 40.0 | shared tokens: daily, dynamic, move, rate, trxns |
| `models/9_optimized_compiled_sql/move_trxns_dynamic_daily_rate_dev.sql` | 40.0 | shared tokens: daily, dynamic, move, rate, trxns |
| `models/9_optimized_compiled_sql/move_trxns_dynamic_daily_rate_prod.sql` | 40.0 | shared tokens: daily, dynamic, move, rate, trxns |
| `analyses/supporting_tools/data_quality/AddNavStrikePNs_move_trxns_dynamic.sql` | 24.0 | shared tokens: dynamic, move, trxns |
| `knowledgebase/tableau/Dynamic_Daily_Rates_PROD_tableau_data_catalog_lineage.md` | 24.0 | shared tokens: daily, dynamic, rates |
| `models/3_intermediate/int_agg_move_trxns.sql` | 16.0 | shared tokens: move, trxns |
| `models/3_intermediate/int_move_trxns_wip_job_start.sql` | 16.0 | shared tokens: move, trxns |

## Sheet Inventory

| Worksheet | Datasources | Field count | Filter count | Marks |
| --- | --- | ---: | ---: | --- |
| `ASM Dynamic Daily Rate` | Parameters, sqlproxy.0zbp27g0p88q1019m8lk713x7l7i | 20 | 2 | Bar |
| `All Dynamic Daily Rates` | Parameters, sqlproxy.0zbp27g0p88q1019m8lk713x7l7i | 20 | 1 | Bar |
| `IGAS Dynamic Daily Rate` | Parameters, sqlproxy.0zbp27g0p88q1019m8lk713x7l7i | 20 | 2 | Bar |
| `SABR Dynamic Daily Rate` | Parameters, sqlproxy.0zbp27g0p88q1019m8lk713x7l7i | 20 | 2 | Bar |
| `SAJE Dynamic Daily Rate` | Parameters, sqlproxy.0zbp27g0p88q1019m8lk713x7l7i | 20 | 2 | Bar |
| `zz.Data Refresh Caption` | sqlproxy.0zbp27g0p88q1019m8lk713x7l7i | 1 | 1 | Automatic |

### Filter Cards and Visible Controls

| Type | Parameter / field | Mode |
| --- | --- | --- |
| `filters` | `-` | - |
| `parameter` | `[Parameter 2]` | type_in |
| `parameter` | `[Parameter 3]` | type_in |
| `parameter` | `[Parameter 1]` | type_in |
| `parameter` | `[NavStorm 10 Digit Rate (copy)_1645784251307188225]` | type_in |
| `color` | `[none:Calculation_2039567746848796673:nk]` | - |
| `color` | `[none:Calculation_2039567746848796673:nk]` | - |
| `size` | `[usr:Calculation_1645784251313434635:qk]` | - |
| `size` | `[usr:Calculation_1645784251313434635:qk]` | - |

### Primary Worksheet Shelves and Marks

| Worksheet | Rows | Columns | Marks | Color fields |
| --- | --- | --- | --- | --- |
| `ASM Dynamic Daily Rate` | ([sqlproxy.0zbp27g0p88q1019m8lk713x7l7i].[none:PART NUMBER GROUP:nk] / [sqlproxy.0zbp27g0p88q1019m8lk713x7l7i].[none:Fm Op Num:ok]) | [none:Transacted At (CST):ok] | Bar | - |
| `All Dynamic Daily Rates` | ([sqlproxy.0zbp27g0p88q1019m8lk713x7l7i].[none:PART NUMBER GROUP:nk] / ([sqlproxy.0zbp27g0p88q1019m8lk713x7l7i].[none:Fm Op Num:ok] / [sqlproxy.0zbp27g0p88q1019m8lk713x7l7i].[none:PART NUMBER GROUP:nk])) | [none:Transacted At (CST):ok] | Bar | - |
| `IGAS Dynamic Daily Rate` | ([sqlproxy.0zbp27g0p88q1019m8lk713x7l7i].[none:PART NUMBER GROUP:nk] / [sqlproxy.0zbp27g0p88q1019m8lk713x7l7i].[none:Fm Op Num:ok]) | [none:Transacted At (CST):ok] | Bar | - |
| `SABR Dynamic Daily Rate` | ([sqlproxy.0zbp27g0p88q1019m8lk713x7l7i].[none:PART NUMBER GROUP:nk] / [sqlproxy.0zbp27g0p88q1019m8lk713x7l7i].[none:Fm Op Num:ok]) | [none:Transacted At (CST):ok] | Bar | - |
| `SAJE Dynamic Daily Rate` | ([sqlproxy.0zbp27g0p88q1019m8lk713x7l7i].[none:PART NUMBER GROUP:nk] / [sqlproxy.0zbp27g0p88q1019m8lk713x7l7i].[none:Fm Op Num:ok]) | [none:Transacted At (CST):ok] | Bar | - |
| `zz.Data Refresh Caption` | - | - | Automatic | - |

### Worksheet Filters and Selections

| Worksheet | Filter class | Field | Selection / groupfilter |
| --- | --- | --- | --- |
| `ASM Dynamic Daily Rate` | `categorical` | `[none:Fm Op Num:ok]` | - |
| `ASM Dynamic Daily Rate` | `categorical` | `[none:PART NUMBER GROUP:nk]` | - |
| `All Dynamic Daily Rates` | `categorical` | `[none:PART NUMBER GROUP:nk]` | - |
| `IGAS Dynamic Daily Rate` | `categorical` | `[none:Fm Op Num:ok]` | - |
| `IGAS Dynamic Daily Rate` | `categorical` | `[none:PART NUMBER GROUP:nk]` | - |
| `SABR Dynamic Daily Rate` | `categorical` | `[none:Fm Op Num:ok]` | - |
| `SABR Dynamic Daily Rate` | `categorical` | `[none:PART NUMBER GROUP:nk]` | - |
| `SAJE Dynamic Daily Rate` | `categorical` | `[none:Fm Op Num:ok]` | - |
| `SAJE Dynamic Daily Rate` | `categorical` | `[none:PART NUMBER GROUP:nk]` | - |
| `zz.Data Refresh Caption` | `categorical` | `[none:Calculation_1328843370564071424:nk]` | - |

### Fields Used by Primary Worksheet

- `ASM Dynamic Daily Rate`: `ASM`, `Color Coding`, `IGAS`, `Link`, `MIN1`, `MPEM-021`, `MPEM-121`, `MPEM-221`, `MPEM-321`, `Mgram M`, `Mgram-012`, `Mgram-112`, `REMAINING QTY`, `REMAINING QTY %`, `SABR`, `SAJE`, `[Fm Op Num]`, `[PART NUMBER GROUP]`, `[TRANSACTION QUANTITY]`, `[Transacted At (CST)]`
- `All Dynamic Daily Rates`: `ASM`, `Color Coding`, `IGAS`, `Link`, `MIN1`, `MPEM-021`, `MPEM-121`, `MPEM-221`, `MPEM-321`, `Mgram M`, `Mgram-012`, `Mgram-112`, `REMAINING QTY`, `REMAINING QTY %`, `SABR`, `SAJE`, `[Fm Op Num]`, `[PART NUMBER GROUP]`, `[TRANSACTION QUANTITY]`, `[Transacted At (CST)]`
- `IGAS Dynamic Daily Rate`: `ASM`, `Color Coding`, `IGAS`, `Link`, `MIN1`, `MPEM-021`, `MPEM-121`, `MPEM-221`, `MPEM-321`, `Mgram M`, `Mgram-012`, `Mgram-112`, `REMAINING QTY`, `REMAINING QTY %`, `SABR`, `SAJE`, `[Fm Op Num]`, `[PART NUMBER GROUP]`, `[TRANSACTION QUANTITY]`, `[Transacted At (CST)]`
- `SABR Dynamic Daily Rate`: `ASM`, `Color Coding`, `IGAS`, `Link`, `MIN1`, `MPEM-021`, `MPEM-121`, `MPEM-221`, `MPEM-321`, `Mgram M`, `Mgram-012`, `Mgram-112`, `REMAINING QTY`, `REMAINING QTY %`, `SABR`, `SAJE`, `[Fm Op Num]`, `[PART NUMBER GROUP]`, `[TRANSACTION QUANTITY]`, `[Transacted At (CST)]`
- `SAJE Dynamic Daily Rate`: `ASM`, `Color Coding`, `IGAS`, `Link`, `MIN1`, `MPEM-021`, `MPEM-121`, `MPEM-221`, `MPEM-321`, `Mgram M`, `Mgram-012`, `Mgram-112`, `REMAINING QTY`, `REMAINING QTY %`, `SABR`, `SAJE`, `[Fm Op Num]`, `[PART NUMBER GROUP]`, `[TRANSACTION QUANTITY]`, `[Transacted At (CST)]`
- `zz.Data Refresh Caption`: `Blank`

## Calculations

Recovered `32` calculated field definitions from static workbook XML.

### Calculated Fields

| Calculated field | Datasource | Formula |
| --- | --- | --- |
| `MPEM-321` | `Parameters` | `10` |
| `MPEM-221` | `Parameters` | `10` |
| `MPEM-121` | `Parameters` | `10` |
| `MPEM-021` | `Parameters` | `10` |
| `IGAS` | `Parameters` | `90.` |
| `SABR` | `Parameters` | `40.` |
| `ASM` | `Parameters` | `38.` |
| `SAJE` | `Parameters` | `10.` |
| `Mgram-012` | `Parameters` | `10` |
| `Mgram-112` | `Parameters` | `10` |
| `Link` | `Parameters` | `10` |
| `Mgram M` | `Parameters` | `3.` |
| `Blank` | `move_trxns_dynamic_daily_rate_part_2` | `""` |
| `Email` | `move_trxns_dynamic_daily_rate_part_2` | `"Email Me Here"` |
| `Teams` | `move_trxns_dynamic_daily_rate_part_2` | `"Write a Teams Message"` |
| `REMAINING QTY` | `move_trxns_dynamic_daily_rate_part_2` | `-(INT(CASE [PART NUMBER GROUP] WHEN 'SABR' THEN [Parameters].[Parameter 1]-[TRANSACTION QUANTITY] WHEN 'IGAS' THEN [Parameters].[NavStorm 10 Digit Rate (copy)_1645784251307188225]-[TRANSACTION QUANTITY] WHEN 'ASM' THEN [Parameters].[Parameter 2]-[TRANSACTION QUANTITY] WHEN 'SAJE' THEN [Parameters].[Parameter 3]-[TRANSACTION QUANTITY] WHEN 'Mgram-012' THEN [Parameters].[Parameter 4]-[TRANSACTION QUANTITY] WHEN 'Mgram-112' THEN [Parameters].[Parameter 5]-[TRANSACTION QUANTITY] WHEN 'Link' THEN...` |
| `MIN1` | `move_trxns_dynamic_daily_rate_part_2` | `MIN(1)` |
| `Color Coding` | `move_trxns_dynamic_daily_rate_part_2` | `IF [REMAINING QTY (copy)_2039567746846916608] > .30 THEN '>30%' ELSEIF [REMAINING QTY (copy)_2039567746846916608] >=.01 AND [REMAINING QTY (copy)_2039567746846916608] <= .30 THEN '1%-30%' ELSEIF [REMAINING QTY (copy)_2039567746846916608] <= 0 THEN '0%' END` |
| `ZZ.Nested Color Coding` | `move_trxns_dynamic_daily_rate_part_2` | `/*NavStorm 10Digit Setup */ /*NavStorm 10Digit Setup */ /*NavStorm 10Digit Setup */ IF [PART NUMBER GROUP] = 'NavStorm 10Digit' THEN ( IF [Calculation_1645784251306131456] >= 30 THEN 'RED' ELSEIF [Calculation_1645784251306131456] <30 AND [Calculation_1645784251306131456] >=10 THEN 'YELLOW' ELSE 'GREEN' END ) /*NavStorm +SA Setup */ /*NavStorm +SA Setup */ /*NavStorm +SA Setup */ ELSEIF [PART NUMBER GROUP] = 'NavStorm+SA' THEN ( IF [Calculation_1645784251306131456] >= 30 THEN 'RED' ELSEIF [Cal...` |
| `REMAINING QTY %` | `move_trxns_dynamic_daily_rate_part_2` | `CASE [PART NUMBER GROUP] WHEN 'ASM' THEN 1- [TRANSACTION QUANTITY]/[Parameters].[Parameter 2] WHEN 'IGAS' THEN 1-[TRANSACTION QUANTITY]/[Parameters].[NavStorm 10 Digit Rate (copy)_1645784251307188225] WHEN 'Link' THEN 1-[TRANSACTION QUANTITY]/[Parameters].[Parameter 6] WHEN 'Mgram M' THEN 1-[TRANSACTION QUANTITY]/[Parameters].[SAJE (copy)] WHEN 'Mgram-012' THEN 1-[TRANSACTION QUANTITY]/[Parameters].[Parameter 4] WHEN 'Mgram-112' THEN 1-[TRANSACTION QUANTITY]/[Parameters].[Parameter 5] WHEN 'M...` |
| `MPEM-321` | `move_trxns_dynamic_daily_rate_part_2` | `10` |
| `MPEM-221` | `move_trxns_dynamic_daily_rate_part_2` | `10` |
| `MPEM-121` | `move_trxns_dynamic_daily_rate_part_2` | `10` |
| `MPEM-021` | `move_trxns_dynamic_daily_rate_part_2` | `10` |
| `IGAS` | `move_trxns_dynamic_daily_rate_part_2` | `90.` |
| `SABR` | `move_trxns_dynamic_daily_rate_part_2` | `40.` |
| `ASM` | `move_trxns_dynamic_daily_rate_part_2` | `38.` |
| `SAJE` | `move_trxns_dynamic_daily_rate_part_2` | `10.` |
| `Mgram-012` | `move_trxns_dynamic_daily_rate_part_2` | `10` |
| `Mgram-112` | `move_trxns_dynamic_daily_rate_part_2` | `10` |
| `Link` | `move_trxns_dynamic_daily_rate_part_2` | `10` |
| `Mgram M` | `move_trxns_dynamic_daily_rate_part_2` | `3.` |

### Calculation Field Dependencies

| Calculated field | Referenced fields |
| --- | --- |
| `MPEM-321` | - |
| `MPEM-221` | - |
| `MPEM-121` | - |
| `MPEM-021` | - |
| `IGAS` | - |
| `SABR` | - |
| `ASM` | - |
| `SAJE` | - |
| `Mgram-012` | - |
| `Mgram-112` | - |
| `Link` | - |
| `Mgram M` | - |
| `Blank` | - |
| `Email` | - |
| `Teams` | - |
| `REMAINING QTY` | `MPEM-021 (copy) (copy) (copy)_1666613356517933060`, `MPEM-021 (copy) (copy)_1666613356517924867`, `MPEM-021 (copy)_1666613356517904386`, `Mgram-112 (copy)_1666613356517642240`, `NavStorm 10 Digit Rate (copy)_1645784251307188225`, `PART NUMBER GROUP`, `Parameter 1`, `Parameter 2`, `Parameter 3`, `Parameter 4`, `Parameter 5`, `Parameter 6`, `Parameters`, `SAJE (copy)`, `TRANSACTION QUANTITY` |
| `MIN1` | - |
| `Color Coding` | `REMAINING QTY (copy)_2039567746846916608` |
| `ZZ.Nested Color Coding` | `Calculation_1645784251306131456`, `PART NUMBER GROUP` |
| `REMAINING QTY %` | `MPEM-021 (copy) (copy) (copy)_1666613356517933060`, `MPEM-021 (copy) (copy)_1666613356517924867`, `MPEM-021 (copy)_1666613356517904386`, `Mgram-112 (copy)_1666613356517642240`, `NavStorm 10 Digit Rate (copy)_1645784251307188225`, `PART NUMBER GROUP`, `Parameter 1`, `Parameter 2`, `Parameter 3`, `Parameter 4`, `Parameter 5`, `Parameter 6`, `Parameters`, `SAJE (copy)`, `TRANSACTION QUANTITY` |
| `MPEM-321` | - |
| `MPEM-221` | - |
| `MPEM-121` | - |
| `MPEM-021` | - |
| `IGAS` | - |
| `SABR` | - |
| `ASM` | - |
| `SAJE` | - |
| `Mgram-012` | - |
| `Mgram-112` | - |
| `Link` | - |
| `Mgram M` | - |

### Calculation Lineage Notes

Calculation lineage should be read against the likely static repo matches above; these matches are inferred from naming convention and local files.

Calculated fields were recovered from: `Parameters`, `move_trxns_dynamic_daily_rate_part_2`.

### LOD and Table Calculation Summary

| Metric | Count | Fields |
| --- | ---: | --- |
| LOD calculations | 0 | - |
| Table calculations | 0 | - |

## Color and Legend Notes

| Source | Color / legend detail |
| --- | --- |
| Workbook card | `color` for `[none:Calculation_2039567746848796673:nk]` |
| Workbook card | `color` for `[none:Calculation_2039567746848796673:nk]` |
