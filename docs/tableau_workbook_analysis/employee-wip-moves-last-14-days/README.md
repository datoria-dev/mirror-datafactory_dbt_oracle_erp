# Employee WIP Moves Report

## Tabular Report

| Attribute | Value |
| --- | --- |
| Source workbook | `tableau/my-tableau-dashboards/Employee WIP Moves Last 14 Days.twbx` |
| Embedded TWB | `Employee WIP Moves Last 14 Days_3.twb` |
| Primary dashboard | `Employee WIP Moves Report` |
| Dashboard count | 1 |
| Worksheet count | 4 |
| Datasource count | 2 |
| Calculated field count | 5 |
| LOD calculation count | 0 |
| Table calculation count | 0 |
| Screenshot | `docs/tableau_workbook_analysis/employee-wip-moves-last-14-days/Employee-WIP-Moves-Report.jpeg` |

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
| `employee_wip_moves_14days` | `sqlproxy.0jelmlv168my821filkn71h3ekyd` | [sqlproxy], [sqlproxy] |

### Likely dbt / SQL or Seed Lineage Guess

| Likely file | Match score | Static reason |
| --- | ---: | --- |
| `models/4_marts/employee_wip_moves_14days.sql` | 132.0 | exact normalized name; shared tokens: 14days, employee, moves, wip |
| `models/3_intermediate/int_employee_wip_moves_14days.sql` | 77.0 | normalized substring; shared tokens: 14days, employee, moves, wip |
| `models/99_oracle_sql_dev/dev_employee_wip_moves_14days.sql` | 77.0 | normalized substring; shared tokens: 14days, employee, moves, wip |
| `models/9_optimized_compiled_sql/minus_employee_wip_moves_14days.sql` | 77.0 | normalized substring; shared tokens: 14days, employee, moves, wip |
| `knowledgebase/tableau/Employee_WIP_Moves_Last_365_Days_tableau_data_catalog_lineage.md` | 40.0 | shared tokens: days, employee, last, moves, wip |
| `models/3_intermediate/int_employee_wip_moves_365days.sql` | 24.0 | shared tokens: employee, moves, wip |
| `models/4_marts/employee_wip_moves_365days.sql` | 24.0 | shared tokens: employee, moves, wip |
| `models/9_optimized_compiled_sql/minus_employee_wip_moves_alltime.sql` | 24.0 | shared tokens: employee, moves, wip |
| `models/1_sources/wip/src_wip_move_transactions_14days.sql` | 16.0 | shared tokens: 14days, wip |
| `models/4_marts/inspections_only_wip_moves.sql` | 16.0 | shared tokens: moves, wip |

## Sheet Inventory

| Worksheet | Datasources | Field count | Filter count | Marks |
| --- | --- | ---: | ---: | --- |
| `Employee WIP Moves Details` | sqlproxy.0jelmlv168my821filkn71h3ekyd | 14 | 5 | Automatic |
| `zz.Data Refresh Caption` | sqlproxy.0jelmlv168my821filkn71h3ekyd | 1 | 1 | Automatic |
| `zz.EmailMe` | sqlproxy.0jelmlv168my821filkn71h3ekyd | 1 | 0 | Shape |
| `zz.TeamsMsg` | sqlproxy.0jelmlv168my821filkn71h3ekyd | 1 | 0 | Shape |

### Filter Cards and Visible Controls

| Type | Parameter / field | Mode |
| --- | --- | --- |
| `filters` | `-` | - |
| `filter` | `[none:Planner:nk]` | checkdropdown |
| `filter` | `[none:Fm Op Seq Num:ok]` | checkdropdown |
| `filter` | `[none:Part Number:nk]` | checkdropdown |

### Primary Worksheet Shelves and Marks

| Worksheet | Rows | Columns | Marks | Color fields |
| --- | --- | --- | --- | --- |
| `Employee WIP Moves Details` | ([sqlproxy.0jelmlv168my821filkn71h3ekyd].[none:Transaction Date CST:ok] / ([sqlproxy.0jelmlv168my821filkn71h3ekyd].[none:Planner:nk] / ([sqlproxy.0jelmlv168my821filkn71h3ekyd].[none:Part Number:nk] / ([sqlproxy.0jelmlv168my821filkn71h3ekyd].[none:Employee Name:nk] / ([sqlproxy.0jelmlv168my821filkn71h3ekyd].[none:Transaction Datetime CST:ok] / ([sqlproxy.0jelmlv168my821filkn71h3ekyd].[sum:Transaction Qty:ok] / ([sqlproxy.0jelmlv168my821filkn71h3ekyd].[none:Fm Op Seq Num:ok] / ([sqlproxy.0jelmlv168my821filkn71h3ekyd].[none:Fm Op Description:nk] / ([sqlproxy.0jelmlv168my821filkn71h3ekyd].[none:Fm Department:nk] / ([sqlproxy.0jelmlv168my821filkn71h3ekyd].[none:To Op Seq Num:ok] / ([sqlproxy.0jelmlv168my821filkn71h3ekyd].[none:To Op Description:nk] / ([sqlproxy.0jelmlv168my821filkn71h3ekyd].[none:To Department:nk] / [sqlproxy.0jelmlv168my821filkn71h3ekyd].[none:Job Number:nk])))))))))))) | - | Automatic | - |
| `zz.Data Refresh Caption` | - | - | Automatic | - |
| `zz.EmailMe` | - | - | Shape | - |
| `zz.TeamsMsg` | - | - | Shape | - |

### Worksheet Filters and Selections

| Worksheet | Filter class | Field | Selection / groupfilter |
| --- | --- | --- | --- |
| `Employee WIP Moves Details` | `categorical` | `[none:Employee Name:nk]` | - |
| `Employee WIP Moves Details` | `categorical` | `[none:Fm Op Seq Num:ok]` | - |
| `Employee WIP Moves Details` | `categorical` | `[none:Part Number:nk]` | - |
| `Employee WIP Moves Details` | `categorical` | `[none:Planner:nk]` | - |
| `Employee WIP Moves Details` | `categorical` | `[none:Transaction Date CST:ok]` | - |
| `zz.Data Refresh Caption` | `categorical` | `[none:Calculation_1328843370564071424:nk]` | - |

### Fields Used by Primary Worksheet

- `Employee WIP Moves Details`: `Transacted By`, `[BLANK__]`, `[Fm Department]`, `[Fm Op Description]`, `[Fm Op Seq Num]`, `[Job Number]`, `[Part Number]`, `[Planner]`, `[To Department]`, `[To Op Description]`, `[To Op Seq Num]`, `[Transaction Date CST]`, `[Transaction Datetime CST]`, `[Transaction Qty]`
- `zz.Data Refresh Caption`: `Blank`
- `zz.EmailMe`: `Email`
- `zz.TeamsMsg`: `Teams`

## Calculations

Recovered `5` calculated field definitions from static workbook XML.

### Calculated Fields

| Calculated field | Datasource | Formula |
| --- | --- | --- |
| `Top Customers` | `Parameters` | `5` |
| `Profit Bin Size` | `Parameters` | `200` |
| `Blank` | `employee_wip_moves_14days` | `""` |
| `Email` | `employee_wip_moves_14days` | `"Email Me Here"` |
| `Teams` | `employee_wip_moves_14days` | `"Write a Teams Message"` |

### Calculation Field Dependencies

| Calculated field | Referenced fields |
| --- | --- |
| `Top Customers` | - |
| `Profit Bin Size` | - |
| `Blank` | - |
| `Email` | - |
| `Teams` | - |

### Calculation Lineage Notes

Calculation lineage should be read against the likely static repo matches above; these matches are inferred from naming convention and local files.

Calculated fields were recovered from: `Parameters`, `employee_wip_moves_14days`.

### LOD and Table Calculation Summary

| Metric | Count | Fields |
| --- | ---: | --- |
| LOD calculations | 0 | - |
| Table calculations | 0 | - |

## Color and Legend Notes

No explicit color encoding or legend card elements were recovered from static workbook XML.
