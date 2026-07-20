# Employee WIP Moves Report

## Tabular Report

| Attribute | Value |
| --- | --- |
| Source workbook | `tableau/my-tableau-dashboards/Employee WIP Moves All Time.twbx` |
| Embedded TWB | `Employee WIP Moves All Time.twb` |
| Primary dashboard | `Employee WIP Moves Report` |
| Dashboard count | 1 |
| Worksheet count | 2 |
| Datasource count | 2 |
| Calculated field count | 5 |
| LOD calculation count | 0 |
| Table calculation count | 1 |
| Screenshot | `docs/tableau_workbook_analysis/employee-wip-moves-all-time/Employee-WIP-Moves-Report.jpeg` |

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
| `minus_employee_wip_moves_alltime` | `sqlproxy.0922h0y021ekdc18nxg0f0n1zzlq` | [sqlproxy], [sqlproxy] |

### Likely dbt / SQL or Seed Lineage Guess

| Likely file | Match score | Static reason |
| --- | ---: | --- |
| `models/9_optimized_compiled_sql/minus_employee_wip_moves_alltime.sql` | 185.0 | normalized substring; exact normalized name; shared tokens: alltime, employee, minus, moves, wip |
| `models/9_optimized_compiled_sql/minus_employee_wip_moves_14days.sql` | 32.0 | shared tokens: employee, minus, moves, wip |
| `knowledgebase/tableau/Employee_WIP_Moves_Last_365_Days_tableau_data_catalog_lineage.md` | 24.0 | shared tokens: employee, moves, wip |
| `models/3_intermediate/int_employee_wip_moves_14days.sql` | 24.0 | shared tokens: employee, moves, wip |
| `models/3_intermediate/int_employee_wip_moves_365days.sql` | 24.0 | shared tokens: employee, moves, wip |
| `models/4_marts/employee_wip_moves_14days.sql` | 24.0 | shared tokens: employee, moves, wip |
| `models/4_marts/employee_wip_moves_365days.sql` | 24.0 | shared tokens: employee, moves, wip |
| `models/99_oracle_sql_dev/dev_employee_wip_moves_14days.sql` | 24.0 | shared tokens: employee, moves, wip |
| `models/3_intermediate/int_wip_jobs_all.sql` | 16.0 | shared tokens: all, wip |
| `models/4_marts/inspections_only_wip_moves.sql` | 16.0 | shared tokens: moves, wip |

## Sheet Inventory

| Worksheet | Datasources | Field count | Filter count | Marks |
| --- | --- | ---: | ---: | --- |
| `Employee WIP Moves Details` | sqlproxy.0922h0y021ekdc18nxg0f0n1zzlq | 15 | 8 | Automatic |
| `zz.Data Refresh Caption` | sqlproxy.0922h0y021ekdc18nxg0f0n1zzlq | 1 | 1 | Automatic |

### Filter Cards and Visible Controls

| Type | Parameter / field | Mode |
| --- | --- | --- |
| `filters` | `-` | - |
| `filter` | `[none:Planner:nk]` | checkdropdown |
| `filter` | `[none:Fm Op Seq Num:nk]` | checkdropdown |
| `filter` | `[none:Part Number:nk]` | checkdropdown |

### Primary Worksheet Shelves and Marks

| Worksheet | Rows | Columns | Marks | Color fields |
| --- | --- | --- | --- | --- |
| `Employee WIP Moves Details` | ([sqlproxy.0922h0y021ekdc18nxg0f0n1zzlq].[usr:Calculation_2176646014389460992:ok] / ([sqlproxy.0922h0y021ekdc18nxg0f0n1zzlq].[none:Calculation_272186321928298496:ok] / ([sqlproxy.0922h0y021ekdc18nxg0f0n1zzlq].[none:Transaction Date CST:ok] / ([sqlproxy.0922h0y021ekdc18nxg0f0n1zzlq].[none:Planner:nk] / ([sqlproxy.0922h0y021ekdc18nxg0f0n1zzlq].[none:Part Number:nk] / ([sqlproxy.0922h0y021ekdc18nxg0f0n1zzlq].[none:Transacted By:nk] / ([sqlproxy.0922h0y021ekdc18nxg0f0n1zzlq].[sum:Transaction Qty:ok] / ([sqlproxy.0922h0y021ekdc18nxg0f0n1zzlq].[none:Fm Op Seq Num:nk] / ([sqlproxy.0922h0y021ekdc18nxg0f0n1zzlq].[none:Fm Op Desc:nk] / ([sqlproxy.0922h0y021ekdc18nxg0f0n1zzlq].[none:Fm Department:nk] / ([sqlproxy.0922h0y021ekdc18nxg0f0n1zzlq].[none:To Op Seq Num:nk] / ([sqlproxy.0922h0y021ekdc18nxg0f0n1zzlq].[none:To Op Desc:nk] / ([sqlproxy.0922h0y021ekdc18nxg0f0n1zzlq].[none:To Department:nk] / [sqlproxy.0922h0y021ekdc18nxg0f0n1zzlq].[none:Job Number:nk]))))))))))))) | - | Automatic | - |
| `zz.Data Refresh Caption` | - | - | Automatic | - |

### Worksheet Filters and Selections

| Worksheet | Filter class | Field | Selection / groupfilter |
| --- | --- | --- | --- |
| `Employee WIP Moves Details` | `categorical` | `[none:Calculation_272186321928298496:ok]` | - |
| `Employee WIP Moves Details` | `categorical` | `[none:Fm Op Desc:nk]` | - |
| `Employee WIP Moves Details` | `categorical` | `[none:Fm Op Seq Num:nk]` | - |
| `Employee WIP Moves Details` | `categorical` | `[none:Job Number:nk]` | - |
| `Employee WIP Moves Details` | `categorical` | `[none:Part Number:nk]` | - |
| `Employee WIP Moves Details` | `categorical` | `[none:Planner:nk]` | - |
| `Employee WIP Moves Details` | `categorical` | `[none:To Op Desc:nk]` | - |
| `Employee WIP Moves Details` | `categorical` | `[none:Transacted By:nk]` | - |
| `zz.Data Refresh Caption` | `quantitative` | `[sum:Transaction Qty:qk]` | - |

### Fields Used by Primary Worksheet

- `Employee WIP Moves Details`: `Blank`, `Transaction Date CST M/Y`, `[Fm Department]`, `[Fm Op Desc]`, `[Fm Op Seq Num]`, `[Job Number]`, `[Part Number]`, `[Planner]`, `[To Department]`, `[To Op Desc]`, `[To Op Seq Num]`, `[Transacted By]`, `[Transaction Date CST]`, `[Transaction Qty]`, `row num`
- `zz.Data Refresh Caption`: `[Transaction Qty]`

## Calculations

Recovered `5` calculated field definitions from static workbook XML.

### Calculated Fields

| Calculated field | Datasource | Formula |
| --- | --- | --- |
| `Top Customers` | `Parameters` | `5` |
| `Profit Bin Size` | `Parameters` | `200` |
| `Blank` | `minus_employee_wip_moves_alltime` | `""` |
| `row num` | `minus_employee_wip_moves_alltime` | `INDEX()` |
| `Transaction Date CST M/Y` | `minus_employee_wip_moves_alltime` | `DATE(DATETRUNC('month',[Transaction Date CST]))` |

### Calculation Field Dependencies

| Calculated field | Referenced fields |
| --- | --- |
| `Top Customers` | - |
| `Profit Bin Size` | - |
| `Blank` | - |
| `row num` | - |
| `Transaction Date CST M/Y` | `Transaction Date CST` |

### Calculation Lineage Notes

Calculation lineage should be read against the likely static repo matches above; these matches are inferred from naming convention and local files.

Calculated fields were recovered from: `Parameters`, `minus_employee_wip_moves_alltime`.

### LOD and Table Calculation Summary

| Metric | Count | Fields |
| --- | ---: | --- |
| LOD calculations | 0 | - |
| Table calculations | 1 | row num |

## Color and Legend Notes

No explicit color encoding or legend card elements were recovered from static workbook XML.
