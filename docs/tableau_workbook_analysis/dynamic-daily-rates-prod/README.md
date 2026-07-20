# Dynamic Daily Rates Dashboard

## Tabular Report

| Attribute | Value |
| --- | --- |
| Source workbook | `tableau/my-tableau-dashboards/Dynamic Daily Rates_PROD.twbx` |
| Embedded TWB | `Dynamic Daily Rates_PROD.twb` |
| Primary dashboard | `Dynamic Daily Rates Dashboard` |
| Dashboard count | 2 |
| Worksheet count | 10 |
| Datasource count | 2 |
| Calculated field count | 22 |
| LOD calculation count | 0 |
| Table calculation count | 0 |
| Screenshot | `docs/tableau_workbook_analysis/dynamic-daily-rates-prod/Dynamic-Daily-Rates-Dashboard.jpeg` |

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
| `move_trxns_dynamic_daily_rate` | `sqlproxy.0g5n51n0nsuu331d6li9z0lvs1aj` | [sqlproxy], [sqlproxy] |

### Likely dbt / SQL or Seed Lineage Guess

| Likely file | Match score | Static reason |
| --- | ---: | --- |
| `models/4_marts/move_trxns_dynamic_daily_rate.sql` | 140.0 | exact normalized name; shared tokens: daily, dynamic, move, rate, trxns |
| `models/3_intermediate/int_move_trxns_dynamic_daily_rate.sql` | 85.0 | normalized substring; shared tokens: daily, dynamic, move, rate, trxns |
| `models/3_intermediate/int_move_trxns_dynamic_daily_rate_part2.sql` | 85.0 | normalized substring; shared tokens: daily, dynamic, move, rate, trxns |
| `models/4_marts/move_trxns_dynamic_daily_rate_part_2.sql` | 85.0 | normalized substring; shared tokens: daily, dynamic, move, rate, trxns |
| `models/9_optimized_compiled_sql/move_trxns_dynamic_daily_rate_dev.sql` | 85.0 | normalized substring; shared tokens: daily, dynamic, move, rate, trxns |
| `models/9_optimized_compiled_sql/move_trxns_dynamic_daily_rate_prod.sql` | 85.0 | normalized substring; shared tokens: daily, dynamic, move, rate, trxns |
| `knowledgebase/tableau/Dynamic_Daily_Rates_PROD_tableau_data_catalog_lineage.md` | 69.0 | normalized substring; shared tokens: daily, dynamic, rates |
| `analyses/supporting_tools/data_quality/AddNavStrikePNs_move_trxns_dynamic.sql` | 24.0 | shared tokens: dynamic, move, trxns |
| `models/3_intermediate/int_agg_move_trxns.sql` | 16.0 | shared tokens: move, trxns |
| `models/3_intermediate/int_move_trxns_wip_job_start.sql` | 16.0 | shared tokens: move, trxns |

## Sheet Inventory

| Worksheet | Datasources | Field count | Filter count | Marks |
| --- | --- | ---: | ---: | --- |
| `ASR 3.7 Dynamic Daily Rate` | Parameters, sqlproxy.0g5n51n0nsuu331d6li9z0lvs1aj | 15 | 3 | Bar |
| `All Dynamic Daily Rates` | Parameters, sqlproxy.0g5n51n0nsuu331d6li9z0lvs1aj | 14 | 1 | Bar |
| `NavFire Dynamic Daily Rate` | Parameters, sqlproxy.0g5n51n0nsuu331d6li9z0lvs1aj | 15 | 3 | Bar |
| `NavStorm Dynamic Daily Rate` | Parameters, sqlproxy.0g5n51n0nsuu331d6li9z0lvs1aj | 15 | 3 | Bar |
| `NavStrike Dynamic Daily Rate` | Parameters, sqlproxy.0g5n51n0nsuu331d6li9z0lvs1aj | 15 | 3 | Bar |
| `TIMEZONE DATE CHECK` | sqlproxy.0g5n51n0nsuu331d6li9z0lvs1aj | 1 | 0 | Automatic |
| `zz.Data Refresh Caption` | sqlproxy.0g5n51n0nsuu331d6li9z0lvs1aj | 2 | 2 | Automatic |
| `zz.Data Refresh Caption (2)` | sqlproxy.0g5n51n0nsuu331d6li9z0lvs1aj | 2 | 2 | Automatic |
| `zz.EmailMe` | sqlproxy.0g5n51n0nsuu331d6li9z0lvs1aj | 2 | 1 | Shape |
| `zz.TeamsMsg` | sqlproxy.0g5n51n0nsuu331d6li9z0lvs1aj | 2 | 1 | Shape |

### Filter Cards and Visible Controls

| Type | Parameter / field | Mode |
| --- | --- | --- |
| `filters` | `-` | - |
| `filter` | `[none:FM OP DESC:nk]` | checkdropdown |
| `parameter` | `[Parameter 2]` | type_in |
| `parameter` | `[Parameter 3]` | type_in |
| `parameter` | `[Parameter 1]` | type_in |
| `parameter` | `[NavStorm 10 Digit Rate (copy)_1645784251307188225]` | type_in |
| `color` | `[none:Calculation_2039567746848796673:nk]` | - |
| `color` | `[none:Calculation_2039567746848796673:nk]` | - |
| `size` | `[usr:Calculation_1645784251313434635:qk]` | - |

### Primary Worksheet Shelves and Marks

| Worksheet | Rows | Columns | Marks | Color fields |
| --- | --- | --- | --- | --- |
| `ASR 3.7 Dynamic Daily Rate` | ([sqlproxy.0g5n51n0nsuu331d6li9z0lvs1aj].[none:PART NUMBER GROUP:nk] / [sqlproxy.0g5n51n0nsuu331d6li9z0lvs1aj].[none:FM OP DESC:nk]) | [none:START DAILY RATE DATE:ok] | Bar | - |
| `All Dynamic Daily Rates` | ([sqlproxy.0g5n51n0nsuu331d6li9z0lvs1aj].[none:PART NUMBER GROUP:nk] / ([sqlproxy.0g5n51n0nsuu331d6li9z0lvs1aj].[none:FM OP DESC:nk] / [sqlproxy.0g5n51n0nsuu331d6li9z0lvs1aj].[none:PART NUMBER GROUP:nk])) | - | Bar | - |
| `NavFire Dynamic Daily Rate` | ([sqlproxy.0g5n51n0nsuu331d6li9z0lvs1aj].[none:PART NUMBER GROUP:nk] / [sqlproxy.0g5n51n0nsuu331d6li9z0lvs1aj].[none:FM OP DESC:nk]) | [none:START DAILY RATE DATE:ok] | Bar | - |
| `NavStorm Dynamic Daily Rate` | ([sqlproxy.0g5n51n0nsuu331d6li9z0lvs1aj].[none:PART NUMBER GROUP:nk] / [sqlproxy.0g5n51n0nsuu331d6li9z0lvs1aj].[none:FM OP DESC:nk]) | [none:START DAILY RATE DATE:ok] | Bar | - |
| `NavStrike Dynamic Daily Rate` | ([sqlproxy.0g5n51n0nsuu331d6li9z0lvs1aj].[none:PART NUMBER GROUP:nk] / [sqlproxy.0g5n51n0nsuu331d6li9z0lvs1aj].[none:FM OP DESC:nk]) | [none:START DAILY RATE DATE:ok] | Bar | - |
| `TIMEZONE DATE CHECK` | [none:START DAILY RATE DATE:ok] | - | Automatic | - |
| `zz.Data Refresh Caption` | - | - | Automatic | - |
| `zz.Data Refresh Caption (2)` | - | - | Automatic | - |
| `zz.EmailMe` | - | - | Shape | - |
| `zz.TeamsMsg` | - | - | Shape | - |

### Worksheet Filters and Selections

| Worksheet | Filter class | Field | Selection / groupfilter |
| --- | --- | --- | --- |
| `ASR 3.7 Dynamic Daily Rate` | `categorical` | `[none:FM OP DESC:nk]` | - |
| `ASR 3.7 Dynamic Daily Rate` | `categorical` | `[none:PART NUMBER GROUP:nk]` | - |
| `ASR 3.7 Dynamic Daily Rate` | `categorical` | `[none:START DAILY RATE DATE:ok]` | - |
| `All Dynamic Daily Rates` | `categorical` | `[none:PART NUMBER GROUP:nk]` | - |
| `NavFire Dynamic Daily Rate` | `categorical` | `[none:FM OP DESC:nk]` | - |
| `NavFire Dynamic Daily Rate` | `categorical` | `[none:PART NUMBER GROUP:nk]` | - |
| `NavFire Dynamic Daily Rate` | `categorical` | `[none:START DAILY RATE DATE:ok]` | - |
| `NavStorm Dynamic Daily Rate` | `categorical` | `[none:FM OP DESC:nk]` | - |
| `NavStorm Dynamic Daily Rate` | `categorical` | `[none:PART NUMBER GROUP:nk]` | - |
| `NavStorm Dynamic Daily Rate` | `categorical` | `[none:START DAILY RATE DATE:ok]` | - |
| `NavStrike Dynamic Daily Rate` | `categorical` | `[none:FM OP DESC:nk]` | - |
| `NavStrike Dynamic Daily Rate` | `categorical` | `[none:PART NUMBER GROUP:nk]` | - |
| `NavStrike Dynamic Daily Rate` | `categorical` | `[none:START DAILY RATE DATE:ok]` | - |
| `zz.Data Refresh Caption` | `categorical` | `[none:Calculation_1328843370564071424:nk]` | - |
| `zz.Data Refresh Caption` | `categorical` | `[none:START DAILY RATE DATE:ok]` | - |
| `zz.Data Refresh Caption (2)` | `categorical` | `[none:Calculation_1328843370564071424:nk]` | - |
| `zz.Data Refresh Caption (2)` | `categorical` | `[none:START DAILY RATE DATE:ok]` | - |
| `zz.EmailMe` | `categorical` | `[none:START DAILY RATE DATE:ok]` | - |
| `zz.TeamsMsg` | `categorical` | `[none:START DAILY RATE DATE:ok]` | - |

### Fields Used by Primary Worksheet

- `ASR 3.7 Dynamic Daily Rate`: `ASR 3.7`, `Color Coding`, `DAGR`, `DIGAR`, `MIN1`, `NavFire`, `NavStorm`, `NavStrike`, `NavStrike M`, `REMAINING QTY`, `REMAINING QTY %`, `[FM OP DESC]`, `[PART NUMBER GROUP]`, `[START DAILY RATE DATE]`, `[TRANSACTION QUANTITY]`
- `All Dynamic Daily Rates`: `ASR 3.7`, `Color Coding`, `DAGR`, `DIGAR`, `MIN1`, `NavFire`, `NavStorm`, `NavStrike`, `NavStrike M`, `REMAINING QTY`, `REMAINING QTY %`, `[FM OP DESC]`, `[PART NUMBER GROUP]`, `[TRANSACTION QUANTITY]`
- `NavFire Dynamic Daily Rate`: `ASR 3.7`, `Color Coding`, `DAGR`, `DIGAR`, `MIN1`, `NavFire`, `NavStorm`, `NavStrike`, `NavStrike M`, `REMAINING QTY`, `REMAINING QTY %`, `[FM OP DESC]`, `[PART NUMBER GROUP]`, `[START DAILY RATE DATE]`, `[TRANSACTION QUANTITY]`
- `NavStorm Dynamic Daily Rate`: `ASR 3.7`, `Color Coding`, `DAGR`, `DIGAR`, `MIN1`, `NavFire`, `NavStorm`, `NavStrike`, `NavStrike M`, `REMAINING QTY`, `REMAINING QTY %`, `[FM OP DESC]`, `[PART NUMBER GROUP]`, `[START DAILY RATE DATE]`, `[TRANSACTION QUANTITY]`
- `NavStrike Dynamic Daily Rate`: `ASR 3.7`, `Color Coding`, `DAGR`, `DIGAR`, `MIN1`, `NavFire`, `NavStorm`, `NavStrike`, `NavStrike M`, `REMAINING QTY`, `REMAINING QTY %`, `[FM OP DESC]`, `[PART NUMBER GROUP]`, `[START DAILY RATE DATE]`, `[TRANSACTION QUANTITY]`
- `TIMEZONE DATE CHECK`: `[START DAILY RATE DATE]`
- `zz.Data Refresh Caption`: `Blank`, `[START DAILY RATE DATE]`
- `zz.Data Refresh Caption (2)`: `Blank`, `[START DAILY RATE DATE]`
- `zz.EmailMe`: `Email`, `[START DAILY RATE DATE]`
- `zz.TeamsMsg`: `Teams`, `[START DAILY RATE DATE]`

## Calculations

Recovered `22` calculated field definitions from static workbook XML.

### Calculated Fields

| Calculated field | Datasource | Formula |
| --- | --- | --- |
| `NavStrike` | `Parameters` | `90.` |
| `NavStorm` | `Parameters` | `28.` |
| `NavFire` | `Parameters` | `18.` |
| `ASR 3.7` | `Parameters` | `3.` |
| `NavStrike M` | `Parameters` | `10` |
| `DAGR` | `Parameters` | `10` |
| `DIGAR` | `Parameters` | `10` |
| `Blank` | `move_trxns_dynamic_daily_rate` | `""` |
| `Email` | `move_trxns_dynamic_daily_rate` | `"Email Me Here"` |
| `Teams` | `move_trxns_dynamic_daily_rate` | `"Write a Teams Message"` |
| `REMAINING QTY` | `move_trxns_dynamic_daily_rate` | `INT(CASE [PART NUMBER GROUP] WHEN 'NavStorm' THEN [Parameters].[Parameter 1]-[TRANSACTION QUANTITY] WHEN 'NavStrike' THEN [Parameters].[NavStorm 10 Digit Rate (copy)_1645784251307188225]-[TRANSACTION QUANTITY] WHEN 'NavFire' THEN [Parameters].[Parameter 2]-[TRANSACTION QUANTITY] WHEN 'ASR 3.7' THEN [Parameters].[Parameter 3]-[TRANSACTION QUANTITY] WHEN 'NavStrike M' THEN [Parameters].[Parameter 4]-[TRANSACTION QUANTITY] WHEN 'DAGR' THEN [Parameters].[Parameter 5]-[TRANSACTION QUANTITY] WHEN '...` |
| `MIN1` | `move_trxns_dynamic_daily_rate` | `MIN(1)` |
| `Color Coding` | `move_trxns_dynamic_daily_rate` | `IF [REMAINING QTY (copy)_2039567746846916608] > .30 THEN '>30%' ELSEIF [REMAINING QTY (copy)_2039567746846916608] >=.01 AND [REMAINING QTY (copy)_2039567746846916608] <= .30 THEN '1%-30%' ELSEIF [REMAINING QTY (copy)_2039567746846916608] <= 0 THEN '0%' END` |
| `ZZ.Nested Color Coding` | `move_trxns_dynamic_daily_rate` | `/*NavStorm 10Digit Setup */ /*NavStorm 10Digit Setup */ /*NavStorm 10Digit Setup */ IF [PART NUMBER GROUP] = 'NavStorm 10Digit' THEN ( IF [Calculation_1645784251306131456] >= 30 THEN 'RED' ELSEIF [Calculation_1645784251306131456] <30 AND [Calculation_1645784251306131456] >=10 THEN 'YELLOW' ELSE 'GREEN' END ) /*NavStorm +SA Setup */ /*NavStorm +SA Setup */ /*NavStorm +SA Setup */ ELSEIF [PART NUMBER GROUP] = 'NavStorm+SA' THEN ( IF [Calculation_1645784251306131456] >= 30 THEN 'RED' ELSEIF [Cal...` |
| `REMAINING QTY %` | `move_trxns_dynamic_daily_rate` | `CASE [PART NUMBER GROUP] WHEN 'NavStorm' THEN 1- [TRANSACTION QUANTITY]/[Parameters].[Parameter 1] WHEN 'NavStrike' THEN 1-[TRANSACTION QUANTITY]/[Parameters].[NavStorm 10 Digit Rate (copy)_1645784251307188225] WHEN 'NavFire' THEN 1-[TRANSACTION QUANTITY]/[Parameters].[Parameter 2] WHEN 'ASR 3.7' THEN 1-[TRANSACTION QUANTITY]/[Parameters].[Parameter 3] WHEN 'NavStrike M' THEN 1-[TRANSACTION QUANTITY]/[Parameters].[Parameter 4] WHEN 'DAGR' THEN 1-[TRANSACTION QUANTITY]/[Parameters].[Parameter...` |
| `NavStrike` | `move_trxns_dynamic_daily_rate` | `90.` |
| `NavStorm` | `move_trxns_dynamic_daily_rate` | `28.` |
| `NavFire` | `move_trxns_dynamic_daily_rate` | `18.` |
| `ASR 3.7` | `move_trxns_dynamic_daily_rate` | `3.` |
| `NavStrike M` | `move_trxns_dynamic_daily_rate` | `10` |
| `DAGR` | `move_trxns_dynamic_daily_rate` | `10` |
| `DIGAR` | `move_trxns_dynamic_daily_rate` | `10` |

### Calculation Field Dependencies

| Calculated field | Referenced fields |
| --- | --- |
| `NavStrike` | - |
| `NavStorm` | - |
| `NavFire` | - |
| `ASR 3.7` | - |
| `NavStrike M` | - |
| `DAGR` | - |
| `DIGAR` | - |
| `Blank` | - |
| `Email` | - |
| `Teams` | - |
| `REMAINING QTY` | `NavStorm 10 Digit Rate (copy)_1645784251307188225`, `PART NUMBER GROUP`, `Parameter 1`, `Parameter 2`, `Parameter 3`, `Parameter 4`, `Parameter 5`, `Parameter 6`, `Parameters`, `TRANSACTION QUANTITY` |
| `MIN1` | - |
| `Color Coding` | `REMAINING QTY (copy)_2039567746846916608` |
| `ZZ.Nested Color Coding` | `Calculation_1645784251306131456`, `PART NUMBER GROUP` |
| `REMAINING QTY %` | `NavStorm 10 Digit Rate (copy)_1645784251307188225`, `PART NUMBER GROUP`, `Parameter 1`, `Parameter 2`, `Parameter 3`, `Parameter 4`, `Parameter 5`, `Parameter 6`, `Parameters`, `TRANSACTION QUANTITY` |
| `NavStrike` | - |
| `NavStorm` | - |
| `NavFire` | - |
| `ASR 3.7` | - |
| `NavStrike M` | - |
| `DAGR` | - |
| `DIGAR` | - |

### Calculation Lineage Notes

Calculation lineage should be read against the likely static repo matches above; these matches are inferred from naming convention and local files.

Calculated fields were recovered from: `Parameters`, `move_trxns_dynamic_daily_rate`.

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
