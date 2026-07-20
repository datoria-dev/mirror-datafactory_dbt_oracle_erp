# PROD_JeffOHQs

## Tabular Report

| Attribute | Value |
| --- | --- |
| Source workbook | `tableau/my-tableau-dashboards/PROD_JeffOHQs.twb` |
| Embedded TWB | `PROD_JeffOHQs.twb` |
| Primary dashboard | `PROD_JeffOHQs` |
| Dashboard count | 0 |
| Worksheet count | 1 |
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
| `PROD_JeffOHQ` | `sqlproxy.00fbce419azc441c2pyih0vmseqh` | [sqlproxy], [sqlproxy] |

### Likely dbt / SQL or Seed Lineage Guess

No likely dbt, SQL, seed, or knowledgebase matches were found by static filename matching.

## Sheet Inventory

| Worksheet | Datasources | Field count | Filter count | Marks |
| --- | --- | ---: | ---: | --- |
| `OH Quantities` | sqlproxy.00fbce419azc441c2pyih0vmseqh | 4 | 1 | Automatic |

### Filter Cards and Visible Controls

| Type | Parameter / field | Mode |
| --- | --- | --- |
| `filters` | `-` | - |
| `filter` | `[none:PN:nk]` | checkdropdown |
| `color` | `[sum:OHQ:qk]` | - |

### Primary Worksheet Shelves and Marks

| Worksheet | Rows | Columns | Marks | Color fields |
| --- | --- | --- | --- | --- |
| `OH Quantities` | ([sqlproxy.00fbce419azc441c2pyih0vmseqh].[none:SUBINVENTORY:nk] / ([sqlproxy.00fbce419azc441c2pyih0vmseqh].[none:PN:nk] / ([sqlproxy.00fbce419azc441c2pyih0vmseqh].[none:DESCRIPTION:nk] / [sqlproxy.00fbce419azc441c2pyih0vmseqh].[sum:OHQ:ok]))) | [sum:OHQ:qk] | Automatic | - |

### Worksheet Filters and Selections

| Worksheet | Filter class | Field | Selection / groupfilter |
| --- | --- | --- | --- |
| `OH Quantities` | `categorical` | `[none:PN:nk]` | - |

### Fields Used by Primary Worksheet

- `OH Quantities`: `[DESCRIPTION]`, `[OHQ]`, `[PN]`, `[SUBINVENTORY]`

## Calculations

Recovered `0` calculated field definitions from static workbook XML.

### Calculated Fields

No calculated fields were recovered from static workbook XML.

### Calculation Field Dependencies

No calculation dependencies were recovered.

### Calculation Lineage Notes

Calculation lineage is limited to Tableau XML field references because no likely local dbt or SQL filename match was found.

### LOD and Table Calculation Summary

| Metric | Count | Fields |
| --- | ---: | --- |
| LOD calculations | 0 | - |
| Table calculations | 0 | - |

## Color and Legend Notes

| Source | Color / legend detail |
| --- | --- |
| Workbook card | `color` for `[sum:OHQ:qk]` |
