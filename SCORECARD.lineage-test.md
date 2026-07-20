# Scorecard Lineage Test

Traffic signal legend: `🟢` = good; `🟡` = so-so; `🔴` = bad.

Test purpose: review a simplified scorecard layout that links count cells to detailed appendix lists for dbt models, seed CSVs, and Oracle source tables.

## Table of Contents

- [Column Schema & Data Contracts](#column-schema--data-contracts)
- [2026 July 05](#2026-july-05)
- [Appendix: Lineage Lists](#appendix-lineage-lists)

## Column Schema & Data Contracts

| Column | Data Contract |
| --- | --- |
| Row ID | Integer whole number from 0 to N; no gaps; one row per workbook. |
| Traffic Signal | Exactly one emoji: 🟢 good, 🟡 so-so, 🔴 bad. |
| Line Item Name | Workbook or dashboard title from static Tableau XML. |
| Description | One concise sentence describing what the row tracks. |
| Workbook File | Repo-local Tableau .twb or .twbx path. |
| Data Sources | Tableau datasource labels; semicolon-separated. |
| DBT Model Count | Count of likely lineage files under models/**/*.sql; nonzero counts link to the appendix by row ID. |
| Seed Count | Count of likely lineage files under seeds/**/*.csv; nonzero counts link to the appendix by row ID. |
| Oracle Source Table Count | Unique upstream dbt source tables traced through manifest plus direct static SQL table references; nonzero counts link to the appendix by row ID. |
| Lineage Status | Manifest/static trace quality; manual review required when source trace is empty. |
| Status Notes | Compact counts and review flags. |

<!-- scorecard-entry-date: 2026 July 05 -->
## 2026 July 05

| Row ID | Traffic Signal | Line Item Name | Description | Workbook File | Data Sources | DBT Model Count | Seed Count | Oracle Source Table Count | Lineage Status | Status Notes |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| 0 | 🟢 | Defect Confirmations Dashboard | Track Tableau workbook documentation status and dbt-to-Oracle lineage readiness. | `tableau/my-tableau-dashboards/DefectConfirmations_PROD.twbx` | `Parameters`; `DefectConfirmations_PROD` | [5](#dbt-models-0) | 0 | [20](#oracle-source-tables-0) | manifest+static SQL trace | 8 worksheets; 14 calcs; 5 dbt model candidate(s); 20 Oracle source table(s). |
| 1 | 🟢 | Dynamic Daily Rates Dashboard | Track Tableau workbook documentation status and dbt-to-Oracle lineage readiness. | `tableau/my-tableau-dashboards/Dynamic Daily Rates Part2.twbx` | `Parameters`; `move_trxns_dynamic_daily_rate_part_2` | [8](#dbt-models-1) | 0 | [7](#oracle-source-tables-1) | manifest+static SQL trace | 6 worksheets; 32 calcs; 8 dbt model candidate(s); 7 Oracle source table(s). |
| 2 | 🟢 | Dynamic Daily Rates Dashboard | Track Tableau workbook documentation status and dbt-to-Oracle lineage readiness. | `tableau/my-tableau-dashboards/Dynamic Daily Rates_PROD.twbx` | `Parameters`; `move_trxns_dynamic_daily_rate` | [8](#dbt-models-2) | 0 | [7](#oracle-source-tables-2) | manifest+static SQL trace | 10 worksheets; 22 calcs; 8 dbt model candidate(s); 7 Oracle source table(s). |
| 3 | 🟢 | Employee WIP Moves Report | Track Tableau workbook documentation status and dbt-to-Oracle lineage readiness. | `tableau/my-tableau-dashboards/Employee WIP Moves All Time.twbx` | `Parameters`; `minus_employee_wip_moves_alltime` | [9](#dbt-models-3) | 0 | [12](#oracle-source-tables-3) | manifest+static SQL trace | 2 worksheets; 5 calcs; 9 dbt model candidate(s); 12 Oracle source table(s). |
| 4 | 🟢 | Employee WIP Moves Report | Track Tableau workbook documentation status and dbt-to-Oracle lineage readiness. | `tableau/my-tableau-dashboards/Employee WIP Moves Last 14 Days.twbx` | `Parameters`; `employee_wip_moves_14days` | [9](#dbt-models-4) | 0 | [8](#oracle-source-tables-4) | manifest+static SQL trace | 4 worksheets; 5 calcs; 9 dbt model candidate(s); 8 Oracle source table(s). |
| 5 | 🟡 | HORIZONTAL WIP STALE | Track Tableau workbook documentation status and dbt-to-Oracle lineage readiness. | `tableau/my-tableau-dashboards/HorizontalStaleWIP_PROD.twbx` | `HorizontalWIP 2.0_PROD` | [6](#dbt-models-5) | 0 | [9](#oracle-source-tables-5) | manifest+static SQL trace | 5 worksheets; 3 calcs; 6 dbt model candidate(s); 9 Oracle source table(s). Review: missing screenshot match. |
| 6 | 🟢 | Hourly WIP Quality Summary | Track Tableau workbook documentation status and dbt-to-Oracle lineage readiness. | `tableau/my-tableau-dashboards/Hourly WIP Quality Summary.twbx` | `wip_quality_summary_hourly` | [8](#dbt-models-6) | 0 | [11](#oracle-source-tables-6) | manifest+static SQL trace | 7 worksheets; 4 calcs; 8 dbt model candidate(s); 11 Oracle source table(s). |
| 7 | 🟢 | IGAS Daily Transactions | Track Tableau workbook documentation status and dbt-to-Oracle lineage readiness. | `tableau/my-tableau-dashboards/IGAS_SABR_Daily_PROD.twbx` | `Parameters`; `PROD_MoveTransactions_ValueStream (IGAS_SABR)` | [8](#dbt-models-7) | 0 | [7](#oracle-source-tables-7) | manifest+static SQL trace | 9 worksheets; 9 calcs; 8 dbt model candidate(s); 7 Oracle source table(s). |
| 8 | 🟡 | Inventory Value Report | Track Tableau workbook documentation status and dbt-to-Oracle lineage readiness. | `tableau/my-tableau-dashboards/Inventory Value Report.twbx` | `midas nss inventory value report` | [8](#dbt-models-8) | [2](#seed-csvs-8) | [1](#oracle-source-tables-8) | manifest+static SQL trace | 5 worksheets; 3 calcs; 8 dbt model candidate(s); 1 Oracle source table(s). Review: missing screenshot match. |
| 9 | 🟢 | Histogram Lead Time Analysis Dashboard | Track Tableau workbook documentation status and dbt-to-Oracle lineage readiness. | `tableau/my-tableau-dashboards/Lead Time Analysis Monthly.twbx` | `lead_times_analysis_final__item_program_details` | [9](#dbt-models-9) | [1](#seed-csvs-9) | [13](#oracle-source-tables-9) | manifest+static SQL trace | 12 worksheets; 4 calcs; 9 dbt model candidate(s); 13 Oracle source table(s). |
| 10 | 🟡 | NSS Material Base Report | Track Tableau workbook documentation status and dbt-to-Oracle lineage readiness. | `tableau/my-tableau-dashboards/Material Base Report Yearly Monthly.twbx` | `minus_wip_valuation_conv_oh__agg_monthly__dim_item_master__dim_fiscal_and_calendar_dates` | [10](#dbt-models-10) | 0 | [14](#oracle-source-tables-10) | manifest+static SQL trace | 3 worksheets; 2 calcs; 10 dbt model candidate(s); 14 Oracle source table(s). Review: missing screenshot match. |
| 11 | 🟢 | MDS Calculations Daily Report | Track Tableau workbook documentation status and dbt-to-Oracle lineage readiness. | `tableau/my-tableau-dashboards/MDS Calculations Current Month Daily.twbx` | `on_original_planning_dates__mrp_planning_snapshot_current_month__minus_actuals_build__item_program_details__nss_domains (2)` | [8](#dbt-models-11) | [2](#seed-csvs-11) | [15](#oracle-source-tables-11) | manifest+static SQL trace | 7 worksheets; 12 calcs; 8 dbt model candidate(s); 15 Oracle source table(s). |
| 12 | 🟡 | MRP Material Shortages Dashboard | Track Tableau workbook documentation status and dbt-to-Oracle lineage readiness. | `tableau/my-tableau-dashboards/MRP Shortages_PROD.twbx` | `PROD_MRP Material Shortages` | [8](#dbt-models-12) | 0 | [3](#oracle-source-tables-12) | manifest+static SQL trace | 5 worksheets; 5 calcs; 8 dbt model candidate(s); 3 Oracle source table(s). Review: missing screenshot match. |
| 13 | 🟢 | NavFire Daily Transactions | Track Tableau workbook documentation status and dbt-to-Oracle lineage readiness. | `tableau/my-tableau-dashboards/NavFireDaily_PROD.twbx` | `Parameters`; `PROD_MoveTransactions_ValueStream (NavFire)` | [7](#dbt-models-13) | 0 | [7](#oracle-source-tables-13) | manifest+static SQL trace | 11 worksheets; 9 calcs; 7 dbt model candidate(s); 7 Oracle source table(s). |
| 14 | 🟢 | NavStorm Daily Transactions | Track Tableau workbook documentation status and dbt-to-Oracle lineage readiness. | `tableau/my-tableau-dashboards/NavStormDaily_PROD.twbx` | `Parameters`; `PROD_MoveTransactions_ValueStream (NavStorm)` | [7](#dbt-models-14) | 0 | [7](#oracle-source-tables-14) | manifest+static SQL trace | 9 worksheets; 9 calcs; 7 dbt model candidate(s); 7 Oracle source table(s). |
| 15 | 🟢 | NSS Defect Details Report | Track Tableau workbook documentation status and dbt-to-Oracle lineage readiness. | `tableau/my-tableau-dashboards/NSS Defect Details Report.twbx` | `DEFECT_DETAILS_TBL_WITH_RESULT_168` | [5](#dbt-models-15) | 0 | [11](#oracle-source-tables-15) | manifest+static SQL trace | 20 worksheets; 2 calcs; 5 dbt model candidate(s); 11 Oracle source table(s). |
| 16 | 🟡 | NSS SMT BOM CompExp Dashboard | Track Tableau workbook documentation status and dbt-to-Oracle lineage readiness. | `tableau/my-tableau-dashboards/NSS SMT BOM CompExp Dashboard_PROD.twbx` | `PROD_SMT_BOM_CompExport` | [1](#dbt-models-16) | 0 | [1](#oracle-source-tables-16) | manifest+static SQL trace | 2 worksheets; 0 calcs; 1 dbt model candidate(s); 1 Oracle source table(s). Review: missing screenshot match. |
| 17 | 🟢 | WIP Matrix by Op Desc Dash | Track Tableau workbook documentation status and dbt-to-Oracle lineage readiness. | `tableau/my-tableau-dashboards/Pivots_HorizontalWIP_PROD.twbx` | `Pivots_HorizontalWIP_PROD` | [7](#dbt-models-17) | 0 | [11](#oracle-source-tables-17) | manifest+static SQL trace | 4 worksheets; 2 calcs; 7 dbt model candidate(s); 11 Oracle source table(s). |
| 18 | 🟢 | Horizontal WIP Dash | Track Tableau workbook documentation status and dbt-to-Oracle lineage readiness. | `tableau/my-tableau-dashboards/PROD_HorizontalWIP.twbx` | `PROD_HorizontalWIP` | [6](#dbt-models-18) | 0 | [9](#oracle-source-tables-18) | manifest+static SQL trace | 4 worksheets; 2 calcs; 6 dbt model candidate(s); 9 Oracle source table(s). |
| 19 | 🟡 | PROD_JeffOHQs | Track Tableau workbook documentation status and dbt-to-Oracle lineage readiness. | `tableau/my-tableau-dashboards/PROD_JeffOHQs.twb` | `PROD_JeffOHQ` | 0 | 0 | 0 | needs manual lineage review | 1 worksheets; 0 calcs; 0 dbt model candidate(s); 0 Oracle source table(s). Review: missing screenshot match, no dbt model candidate, no Oracle source trace. |
| 20 | 🟢 | Move Transac. by Op Desc | Track Tableau workbook documentation status and dbt-to-Oracle lineage readiness. | `tableau/my-tableau-dashboards/PROD_MoveTransactions.twbx` | `PROD_MoveTransactions` | [7](#dbt-models-20) | 0 | [7](#oracle-source-tables-20) | manifest+static SQL trace | 5 worksheets; 7 calcs; 7 dbt model candidate(s); 7 Oracle source table(s). |
| 21 | 🟢 | Move Transac. by Op Desc | Track Tableau workbook documentation status and dbt-to-Oracle lineage readiness. | `tableau/my-tableau-dashboards/PROD_MoveTransactionsDailyRefresh.twbx` | `PROD_MoveTransactions__DailyRefresh` | [8](#dbt-models-21) | 0 | [8](#oracle-source-tables-21) | manifest+static SQL trace | 5 worksheets; 5 calcs; 8 dbt model candidate(s); 8 Oracle source table(s). |
| 22 | 🟡 | MRP Workbench Supply Dashboard | Track Tableau workbook documentation status and dbt-to-Oracle lineage readiness. | `tableau/my-tableau-dashboards/PROD_MRP_WORKBENCH_SUPPLY.twbx` | `PROD_MRP_WORKBENCH_SUPPLY` | [1](#dbt-models-22) | 0 | 0 | needs manual lineage review | 3 worksheets; 1 calcs; 1 dbt model candidate(s); 0 Oracle source table(s). Review: no Oracle source trace. |
| 23 | 🟢 | SAASM VMI Dashboard | Track Tableau workbook documentation status and dbt-to-Oracle lineage readiness. | `tableau/my-tableau-dashboards/SAASM VMI Sales, Inventory, and Production Alignment.twbx` | `saasm_vmi` | [5](#dbt-models-23) | 0 | [11](#oracle-source-tables-23) | manifest+static SQL trace | 13 worksheets; 16 calcs; 5 dbt model candidate(s); 11 Oracle source table(s). |
| 24 | 🟡 | SCMD Rate Analysis Dashboard | Track Tableau workbook documentation status and dbt-to-Oracle lineage readiness. | `tableau/my-tableau-dashboards/Supplier Caused Mfg Defects.twbx` | `supplier_caused_defects_metrics` | [10](#dbt-models-24) | 0 | [19](#oracle-source-tables-24) | manifest+static SQL trace | 5 worksheets; 2 calcs; 10 dbt model candidate(s); 19 Oracle source table(s). Review: missing screenshot match. |
| 25 | 🟡 | WIP Last Touch Date Dashboard | Track Tableau workbook documentation status and dbt-to-Oracle lineage readiness. | `tableau/my-tableau-dashboards/WIP Last Touch Date.twb` | `wip_open_qtys_date_last_moved` | [2](#dbt-models-25) | 0 | [9](#oracle-source-tables-25) | manifest+static SQL trace | 2 worksheets; 0 calcs; 2 dbt model candidate(s); 9 Oracle source table(s). Review: missing screenshot match. |
| 26 | 🟢 | WIP POU Prep Details Report | Track Tableau workbook documentation status and dbt-to-Oracle lineage readiness. | `tableau/my-tableau-dashboards/WIP POU and TO MOVE ONLY.twbx` | `minus_horizontal_wip` | [7](#dbt-models-26) | 0 | [11](#oracle-source-tables-26) | manifest+static SQL trace | 5 worksheets; 2 calcs; 7 dbt model candidate(s); 11 Oracle source table(s). |
| 27 | 🟢 | WIP Quality Summary Dashboard | Track Tableau workbook documentation status and dbt-to-Oracle lineage readiness. | `tableau/my-tableau-dashboards/WIP Quality Summary.twb` | `wip_quality_summary_quality`; `minus_wip_quality_summary_wip` | [10](#dbt-models-27) | 0 | [11](#oracle-source-tables-27) | manifest+static SQL trace | 3 worksheets; 8 calcs; 10 dbt model candidate(s); 11 Oracle source table(s). |
| 28 | 🟢 | WIP Shipment Lines Dashboard | Track Tableau workbook documentation status and dbt-to-Oracle lineage readiness. | `tableau/my-tableau-dashboards/WIP Shipment Lines.twbx` | `dim_wip_reservations__dim_wip_jobs_and_operations__dim_item_master` | [7](#dbt-models-28) | 0 | [16](#oracle-source-tables-28) | manifest+static SQL trace | 3 worksheets; 3 calcs; 7 dbt model candidate(s); 16 Oracle source table(s). |

## Appendix: Lineage Lists

### Workbook 0 - defect-confirmations-prod

#### DBT Models 0

- `models/3_intermediate/int_saasm_custowned_material_transactions.sql`
- `models/3_intermediate/int_saasm_sales_lines_and_deliveries.sql`
- `models/3_intermediate/int_saasm_top_level_sales_lines.sql`
- `models/9_optimized_compiled_sql/DefectConfirmations_PROD.sql`
- `models/9_optimized_compiled_sql/RTY.sql`

[Back to Table of Contents](#table-of-contents)

#### Seed CSVs 0

- None recovered by static lineage matching.

[Back to Table of Contents](#table-of-contents)

#### Oracle Source Tables 0

- `applsys.fnd_user`
- `ar.hz_cust_accounts`
- `bom.bom_departments`
- `inv.mtl_item_locations`
- `inv.mtl_material_transactions`
- `inv.mtl_planners`
- `inv.mtl_system_items_b`
- `ont.oe_order_headers_all`
- `ont.oe_order_lines_all`
- `ont.oe_order_lines_all_ext_b`
- `qa.qa_pc_results_relationship`
- `qa.qa_plans`
- `qa.qa_results`
- `wip.wip_discrete_jobs`
- `wip.wip_entities`
- `wip.wip_move_transactions`
- `wip.wip_operations`
- `wsh.wsh_delivery_assignments`
- `wsh.wsh_delivery_details`
- `wsh.wsh_new_deliveries`

[Back to Table of Contents](#table-of-contents)

### Workbook 1 - dynamic-daily-rates-part2

#### DBT Models 1

- `models/3_intermediate/int_agg_move_trxns.sql`
- `models/3_intermediate/int_move_trxns_dynamic_daily_rate.sql`
- `models/3_intermediate/int_move_trxns_dynamic_daily_rate_part2.sql`
- `models/3_intermediate/int_move_trxns_wip_job_start.sql`
- `models/4_marts/move_trxns_dynamic_daily_rate.sql`
- `models/4_marts/move_trxns_dynamic_daily_rate_part_2.sql`
- `models/9_optimized_compiled_sql/move_trxns_dynamic_daily_rate_dev.sql`
- `models/9_optimized_compiled_sql/move_trxns_dynamic_daily_rate_prod.sql`

[Back to Table of Contents](#table-of-contents)

#### Seed CSVs 1

- None recovered by static lineage matching.

[Back to Table of Contents](#table-of-contents)

#### Oracle Source Tables 1

- `bom.bom_departments`
- `inv.mtl_planners`
- `inv.mtl_system_items_b`
- `wip.wip_discrete_jobs`
- `wip.wip_entities`
- `wip.wip_move_transactions`
- `wip.wip_operations`

[Back to Table of Contents](#table-of-contents)

### Workbook 2 - dynamic-daily-rates-prod

#### DBT Models 2

- `models/3_intermediate/int_agg_move_trxns.sql`
- `models/3_intermediate/int_move_trxns_dynamic_daily_rate.sql`
- `models/3_intermediate/int_move_trxns_dynamic_daily_rate_part2.sql`
- `models/3_intermediate/int_move_trxns_wip_job_start.sql`
- `models/4_marts/move_trxns_dynamic_daily_rate.sql`
- `models/4_marts/move_trxns_dynamic_daily_rate_part_2.sql`
- `models/9_optimized_compiled_sql/move_trxns_dynamic_daily_rate_dev.sql`
- `models/9_optimized_compiled_sql/move_trxns_dynamic_daily_rate_prod.sql`

[Back to Table of Contents](#table-of-contents)

#### Seed CSVs 2

- None recovered by static lineage matching.

[Back to Table of Contents](#table-of-contents)

#### Oracle Source Tables 2

- `bom.bom_departments`
- `inv.mtl_planners`
- `inv.mtl_system_items_b`
- `wip.wip_discrete_jobs`
- `wip.wip_entities`
- `wip.wip_move_transactions`
- `wip.wip_operations`

[Back to Table of Contents](#table-of-contents)

### Workbook 3 - employee-wip-moves-all-time

#### DBT Models 3

- `models/3_intermediate/int_employee_wip_moves_14days.sql`
- `models/3_intermediate/int_employee_wip_moves_365days.sql`
- `models/3_intermediate/int_wip_jobs_all.sql`
- `models/4_marts/employee_wip_moves_14days.sql`
- `models/4_marts/employee_wip_moves_365days.sql`
- `models/4_marts/inspections_only_wip_moves.sql`
- `models/99_oracle_sql_dev/dev_employee_wip_moves_14days.sql`
- `models/9_optimized_compiled_sql/minus_employee_wip_moves_14days.sql`
- `models/9_optimized_compiled_sql/minus_employee_wip_moves_alltime.sql`

[Back to Table of Contents](#table-of-contents)

#### Seed CSVs 3

- None recovered by static lineage matching.

[Back to Table of Contents](#table-of-contents)

#### Oracle Source Tables 3

- `applsys.fnd_lookup_values`
- `applsys.fnd_user`
- `bom.bom_departments`
- `inv.mtl_planners`
- `inv.mtl_reservations`
- `inv.mtl_sales_orders`
- `inv.mtl_system_items_b`
- `ont.oe_order_lines_all`
- `wip.wip_discrete_jobs`
- `wip.wip_entities`
- `wip.wip_move_transactions`
- `wip.wip_operations`

[Back to Table of Contents](#table-of-contents)

### Workbook 4 - employee-wip-moves-last-14-days

#### DBT Models 4

- `models/1_sources/wip/src_wip_move_transactions_14days.sql`
- `models/3_intermediate/int_employee_wip_moves_14days.sql`
- `models/3_intermediate/int_employee_wip_moves_365days.sql`
- `models/4_marts/employee_wip_moves_14days.sql`
- `models/4_marts/employee_wip_moves_365days.sql`
- `models/4_marts/inspections_only_wip_moves.sql`
- `models/99_oracle_sql_dev/dev_employee_wip_moves_14days.sql`
- `models/9_optimized_compiled_sql/minus_employee_wip_moves_14days.sql`
- `models/9_optimized_compiled_sql/minus_employee_wip_moves_alltime.sql`

[Back to Table of Contents](#table-of-contents)

#### Seed CSVs 4

- None recovered by static lineage matching.

[Back to Table of Contents](#table-of-contents)

#### Oracle Source Tables 4

- `applsys.fnd_user`
- `bom.bom_departments`
- `inv.mtl_planners`
- `inv.mtl_system_items_b`
- `wip.wip_discrete_jobs`
- `wip.wip_entities`
- `wip.wip_move_transactions`
- `wip.wip_operations`

[Back to Table of Contents](#table-of-contents)

### Workbook 5 - horizontal-stale-wip-prod

#### DBT Models 5

- `models/3_intermediate/int_horizontal_wip.sql`
- `models/3_intermediate/int_horizontal_wip_released_unreleased.sql`
- `models/4_marts/horizontal_wip.sql`
- `models/4_marts/horizontal_wip_agg_qty_to_move.sql`
- `models/4_marts/horizontal_wip_qty_in_queue_gt_0.sql`
- `models/9_optimized_compiled_sql/minus_horizontal_wip.sql`

[Back to Table of Contents](#table-of-contents)

#### Seed CSVs 5

- None recovered by static lineage matching.

[Back to Table of Contents](#table-of-contents)

#### Oracle Source Tables 5

- `bom.bom_departments`
- `inv.mtl_planners`
- `inv.mtl_reservations`
- `inv.mtl_sales_orders`
- `inv.mtl_system_items_b`
- `ont.oe_order_lines_all`
- `wip.wip_discrete_jobs`
- `wip.wip_entities`
- `wip.wip_operations`

[Back to Table of Contents](#table-of-contents)

### Workbook 6 - hourly-wip-quality-summary

#### DBT Models 6

- `models/2_staging/stg_wip_quality_summary_quality_rejects.sql`
- `models/2_staging/stg_wip_quality_summary_quality_reroutes.sql`
- `models/3_intermediate/int_wip_quality_summary_quality_rejects_and_sales_orders.sql`
- `models/3_intermediate/int_wip_quality_summary_quality_reroutes_and_sales_orders.sql`
- `models/3_intermediate/int_wip_quality_summary_wip.sql`
- `models/4_marts/wip_quality_summary_quality.sql`
- `models/4_marts/wip_quality_summary_wip.sql`
- `models/9_optimized_compiled_sql/minus_wip_quality_summary_wip.sql`

[Back to Table of Contents](#table-of-contents)

#### Seed CSVs 6

- None recovered by static lineage matching.

[Back to Table of Contents](#table-of-contents)

#### Oracle Source Tables 6

- `applsys.fnd_lookup_values`
- `bom.bom_departments`
- `inv.mtl_planners`
- `inv.mtl_reservations`
- `inv.mtl_sales_orders`
- `inv.mtl_system_items_b`
- `ont.oe_order_lines_all`
- `qa.qa_results`
- `wip.wip_discrete_jobs`
- `wip.wip_entities`
- `wip.wip_operations`

[Back to Table of Contents](#table-of-contents)

### Workbook 7 - igas-sabr-daily-prod

#### DBT Models 7

- `models/1_sources/wip/src_wip_move_transactions_14days.sql`
- `models/1_sources/wip/src_wip_move_transactions_30days.sql`
- `models/1_sources/wip/src_wip_move_transactions_365days.sql`
- `models/1_sources/wip/src_wip_move_transactions_45days.sql`
- `models/3_intermediate/int_move_trxns_dynamic_daily_rate.sql`
- `models/3_intermediate/int_move_trxns_dynamic_daily_rate_part2.sql`
- `models/4_marts/move_trxns_dynamic_daily_rate.sql`
- `models/9_optimized_compiled_sql/PROD_MoveTransactions.sql`

[Back to Table of Contents](#table-of-contents)

#### Seed CSVs 7

- None recovered by static lineage matching.

[Back to Table of Contents](#table-of-contents)

#### Oracle Source Tables 7

- `bom.bom_departments`
- `inv.mtl_planners`
- `inv.mtl_system_items_b`
- `wip.wip_discrete_jobs`
- `wip.wip_entities`
- `wip.wip_move_transactions`
- `wip.wip_operations`

[Back to Table of Contents](#table-of-contents)

### Workbook 8 - inventory-value-report

#### DBT Models 8

- `models/1_sources/qa/xxsrc_qa_char_value_lookups.sql`
- `models/1_sources/qa/xxsrc_qa_plan_char_value_lookups.sql`
- `models/9_optimized_compiled_sql/Inspection_Escapes_Report_Modified.sql`
- `models/9_optimized_compiled_sql/midas_AR_Processing.sql`
- `models/9_optimized_compiled_sql/midas_Inspection_Escape_Report_MIDAS.sql`
- `models/9_optimized_compiled_sql/midas_Inventory_Value_report.sql`
- `models/9_optimized_compiled_sql/midas_Material_Base_Report_YTD.sql`
- `models/9_optimized_compiled_sql/midas_Oracle_WIP_Value_Report.sql`

[Back to Table of Contents](#table-of-contents)

#### Seed CSVs 8

- `seeds/nss_part_numbers_adhoc_for_midas.csv`
- `seeds/tabular_index_for_inventory_value_report.csv`

[Back to Table of Contents](#table-of-contents)

#### Oracle Source Tables 8

- `qa.qa_plan_char_value_lookups`

[Back to Table of Contents](#table-of-contents)

### Workbook 9 - lead-time-analysis-monthly

#### DBT Models 9

- `models/3_intermediate/int_item_program_details.sql`
- `models/4_marts/agg/agg_lead_time_analysis_median.sql`
- `models/4_marts/agg/agg_lead_time_analysis_percent_complete.sql`
- `models/4_marts/facts/fct_lead_time_analysis.sql`
- `models/4_marts/item_program_details.sql`
- `models/4_marts/lead_times_analysis_final.sql`
- `models/4_marts/lead_times_analysis_full7day_week.sql`
- `models/4_marts/lead_times_analysis_workingdays_week.sql`
- `models/99_oracle_sql_dev/item_program_details_tableau_prep_formatted.sql`

[Back to Table of Contents](#table-of-contents)

#### Seed CSVs 9

- `seeds/item_program_details__nss_ops_part_numbers_and_domains.csv`

[Back to Table of Contents](#table-of-contents)

#### Oracle Source Tables 9

- `applsys.fnd_lookup_values`
- `bom.bom_calendar_dates`
- `gl.gl_periods`
- `inv.mtl_categories_b`
- `inv.mtl_category_sets_b`
- `inv.mtl_category_sets_tl`
- `inv.mtl_item_categories`
- `inv.mtl_material_transactions`
- `inv.mtl_planners`
- `inv.mtl_system_items_b`
- `wip.wip_discrete_jobs`
- `wip.wip_entities`
- `wip.wip_move_transactions`

[Back to Table of Contents](#table-of-contents)

### Workbook 10 - material-base-report-yearly-monthly

#### DBT Models 10

- `models/4_marts/agg/agg_wip_valuation_conv_oh_monthly.sql`
- `models/4_marts/agg/agg_wip_valuation_conv_oh_yearly.sql`
- `models/4_marts/dimensions/dim_fiscal_and_calendar_dates.sql`
- `models/4_marts/dimensions/dim_item_master.sql`
- `models/4_marts/wip_valuation_conv_oh.sql`
- `models/9_optimized_compiled_sql/minus_wip_valuation_conv_oh.sql`
- `models/9_optimized_compiled_sql/minus_wip_valuation_conv_oh__agg_monthly.sql`
- `models/9_optimized_compiled_sql/minus_wip_valuation_conv_oh__agg_yearly.sql`
- `models/9_optimized_compiled_sql/minus_wip_valuation_conv_oh__agg_ytd.sql`
- `models/9_optimized_compiled_sql/minus_wip_valuation_conv_oh__scf__agg_monthly.sql`

[Back to Table of Contents](#table-of-contents)

#### Seed CSVs 10

- None recovered by static lineage matching.

[Back to Table of Contents](#table-of-contents)

#### Oracle Source Tables 10

- `applsys.fnd_lookup_values`
- `bom.bom_calendar_dates`
- `bom.bom_resources`
- `gl.gl_periods`
- `inv.mtl_categories_b`
- `inv.mtl_category_sets_b`
- `inv.mtl_category_sets_tl`
- `inv.mtl_item_categories`
- `inv.mtl_planners`
- `inv.mtl_system_items_b`
- `wip.wip_discrete_jobs`
- `wip.wip_entities`
- `wip.wip_transaction_accounts`
- `wip.wip_transactions`

[Back to Table of Contents](#table-of-contents)

### Workbook 11 - mds-calculations-current-month-daily

#### DBT Models 11

- `models/3_intermediate/int_item_program_details.sql`
- `models/3_intermediate/int_mrp_monthly_snapshot_build.sql`
- `models/4_marts/actuals_build.sql`
- `models/4_marts/item_program_details.sql`
- `models/99_oracle_sql_dev/item_program_details_tableau_prep_formatted.sql`
- `models/99_oracle_sql_dev/minus_mrp_monthly_build_delivery_tableau_flow_formatted.sql`
- `models/9_optimized_compiled_sql/minus_actuals_build_delivery.sql`
- `models/9_optimized_compiled_sql/minus_actuals_build_delivery_historical.sql`

[Back to Table of Contents](#table-of-contents)

#### Seed CSVs 11

- `seeds/item_program_details__nss_ops_part_numbers_and_domains.csv`
- `seeds/mrp_planning_snapshot_current_month.csv`

[Back to Table of Contents](#table-of-contents)

#### Oracle Source Tables 11

- `applsys.fnd_lookup_values`
- `bom.bom_calendar_dates`
- `gl.gl_periods`
- `inv.mtl_categories_b`
- `inv.mtl_category_sets_b`
- `inv.mtl_category_sets_tl`
- `inv.mtl_item_categories`
- `inv.mtl_planners`
- `inv.mtl_secondary_inventories`
- `inv.mtl_system_items_b`
- `mrp.mrp_recommendations`
- `wip.wip_discrete_jobs`
- `wip.wip_entities`
- `wip.wip_move_transactions`
- `wip.wip_operations`

[Back to Table of Contents](#table-of-contents)

### Workbook 12 - mrp-shortages-prod

#### DBT Models 12

- `models/1_sources/inv/src_inv_mtl_material_transactions.sql`
- `models/1_sources/inv/src_inv_mtl_material_transactions_custowned_alltime.sql`
- `models/1_sources/inv/src_inv_mtl_material_transactions_type44.sql`
- `models/1_sources/inv/src_inv_mtl_material_transactions_type44_45days.sql`
- `models/1_sources/inv/src_inv_mtl_material_transactions_wip_issuances.sql`
- `models/1_sources/lookups/lu_mtl_mrp_supply_demand_source_type.sql`
- `models/1_sources/mrp/src_mrp_full_pegging.sql`
- `models/1_sources/mrp/src_mrp_gross_requirements.sql`

[Back to Table of Contents](#table-of-contents)

#### Seed CSVs 12

- None recovered by static lineage matching.

[Back to Table of Contents](#table-of-contents)

#### Oracle Source Tables 12

- `inv.mtl_material_transactions`
- `mrp.mrp_full_pegging`
- `mrp.mrp_gross_requirements`

[Back to Table of Contents](#table-of-contents)

### Workbook 13 - nav-fire-daily-prod

#### DBT Models 13

- `models/1_sources/wip/src_wip_move_transactions_14days.sql`
- `models/1_sources/wip/src_wip_move_transactions_30days.sql`
- `models/1_sources/wip/src_wip_move_transactions_365days.sql`
- `models/1_sources/wip/src_wip_move_transactions_45days.sql`
- `models/3_intermediate/int_move_trxns_dynamic_daily_rate.sql`
- `models/3_intermediate/int_move_trxns_dynamic_daily_rate_part2.sql`
- `models/9_optimized_compiled_sql/PROD_MoveTransactions.sql`

[Back to Table of Contents](#table-of-contents)

#### Seed CSVs 13

- None recovered by static lineage matching.

[Back to Table of Contents](#table-of-contents)

#### Oracle Source Tables 13

- `bom.bom_departments`
- `inv.mtl_planners`
- `inv.mtl_system_items_b`
- `wip.wip_discrete_jobs`
- `wip.wip_entities`
- `wip.wip_move_transactions`
- `wip.wip_operations`

[Back to Table of Contents](#table-of-contents)

### Workbook 14 - nav-storm-daily-prod

#### DBT Models 14

- `models/1_sources/wip/src_wip_move_transactions_14days.sql`
- `models/1_sources/wip/src_wip_move_transactions_30days.sql`
- `models/1_sources/wip/src_wip_move_transactions_365days.sql`
- `models/1_sources/wip/src_wip_move_transactions_45days.sql`
- `models/3_intermediate/int_move_trxns_dynamic_daily_rate.sql`
- `models/3_intermediate/int_move_trxns_dynamic_daily_rate_part2.sql`
- `models/9_optimized_compiled_sql/PROD_MoveTransactions.sql`

[Back to Table of Contents](#table-of-contents)

#### Seed CSVs 14

- None recovered by static lineage matching.

[Back to Table of Contents](#table-of-contents)

#### Oracle Source Tables 14

- `bom.bom_departments`
- `inv.mtl_planners`
- `inv.mtl_system_items_b`
- `wip.wip_discrete_jobs`
- `wip.wip_entities`
- `wip.wip_move_transactions`
- `wip.wip_operations`

[Back to Table of Contents](#table-of-contents)

### Workbook 15 - nss-defect-details-report

#### DBT Models 15

- `models/3_intermediate/int_saasm_top_level_sales_lines.sql`
- `models/3_intermediate/int_saasm_top_level_sales_lines_and_deliveries.sql`
- `models/4_marts/dimensions/dim_quality_defect_details_and_results_recording.sql`
- `models/4_marts/dimensions/dim_quality_defect_details_as_child.sql`
- `models/9_optimized_compiled_sql/midas_DEFECT_DETAILS_TBL_WITH_RESULT_168.sql`

[Back to Table of Contents](#table-of-contents)

#### Seed CSVs 15

- None recovered by static lineage matching.

[Back to Table of Contents](#table-of-contents)

#### Oracle Source Tables 15

- `ar.hz_cust_accounts`
- `inv.mtl_planners`
- `inv.mtl_system_items_b`
- `ont.oe_order_headers_all`
- `ont.oe_order_lines_all`
- `ont.oe_order_lines_all_ext_b`
- `qa.qa_pc_results_relationship`
- `qa.qa_results`
- `wsh.wsh_delivery_assignments`
- `wsh.wsh_delivery_details`
- `wsh.wsh_new_deliveries`

[Back to Table of Contents](#table-of-contents)

### Workbook 16 - nss-smt-bom-comp-exp-dashboard-prod

#### DBT Models 16

- `models/9_optimized_compiled_sql/SMT_BOM_CompExp.sql`

[Back to Table of Contents](#table-of-contents)

#### Seed CSVs 16

- None recovered by static lineage matching.

[Back to Table of Contents](#table-of-contents)

#### Oracle Source Tables 16

- `bom.cst_item_costs`

[Back to Table of Contents](#table-of-contents)

### Workbook 17 - pivots-horizontal-wip-prod

#### DBT Models 17

- `models/3_intermediate/int_horizontal_wip.sql`
- `models/3_intermediate/int_horizontal_wip_released_unreleased.sql`
- `models/3_intermediate/int_wip_nettable_credit_op_step_for_queue_to_move_types.sql`
- `models/4_marts/horizontal_wip.sql`
- `models/4_marts/horizontal_wip_agg_qty_to_move.sql`
- `models/4_marts/horizontal_wip_qty_in_queue_gt_0.sql`
- `models/9_optimized_compiled_sql/minus_horizontal_wip.sql`

[Back to Table of Contents](#table-of-contents)

#### Seed CSVs 17

- None recovered by static lineage matching.

[Back to Table of Contents](#table-of-contents)

#### Oracle Source Tables 17

- `bom.bom_departments`
- `inv.mtl_planners`
- `inv.mtl_reservations`
- `inv.mtl_sales_orders`
- `inv.mtl_secondary_inventories`
- `inv.mtl_system_items_b`
- `ont.oe_order_lines_all`
- `wip.wip_discrete_jobs`
- `wip.wip_entities`
- `wip.wip_move_transactions`
- `wip.wip_operations`

[Back to Table of Contents](#table-of-contents)

### Workbook 18 - prod-horizontal-wip

#### DBT Models 18

- `models/3_intermediate/int_horizontal_wip.sql`
- `models/3_intermediate/int_horizontal_wip_released_unreleased.sql`
- `models/4_marts/horizontal_wip.sql`
- `models/4_marts/horizontal_wip_agg_qty_to_move.sql`
- `models/4_marts/horizontal_wip_qty_in_queue_gt_0.sql`
- `models/9_optimized_compiled_sql/minus_horizontal_wip.sql`

[Back to Table of Contents](#table-of-contents)

#### Seed CSVs 18

- None recovered by static lineage matching.

[Back to Table of Contents](#table-of-contents)

#### Oracle Source Tables 18

- `bom.bom_departments`
- `inv.mtl_planners`
- `inv.mtl_reservations`
- `inv.mtl_sales_orders`
- `inv.mtl_system_items_b`
- `ont.oe_order_lines_all`
- `wip.wip_discrete_jobs`
- `wip.wip_entities`
- `wip.wip_operations`

[Back to Table of Contents](#table-of-contents)

### Workbook 19 - prod-jeff-ohqs

#### DBT Models 19

- None recovered by static lineage matching.

[Back to Table of Contents](#table-of-contents)

#### Seed CSVs 19

- None recovered by static lineage matching.

[Back to Table of Contents](#table-of-contents)

#### Oracle Source Tables 19

- None traced through manifest or direct static SQL parsing.

[Back to Table of Contents](#table-of-contents)

### Workbook 20 - prod-move-transactions

#### DBT Models 20

- `models/1_sources/wip/src_wip_move_transactions_14days.sql`
- `models/1_sources/wip/src_wip_move_transactions_30days.sql`
- `models/1_sources/wip/src_wip_move_transactions_365days.sql`
- `models/1_sources/wip/src_wip_move_transactions_45days.sql`
- `models/3_intermediate/int_wip_nettable_credit_op_step_for_queue_to_move_types.sql`
- `models/9_optimized_compiled_sql/PROD_MoveTransactions.sql`
- `models/9_optimized_compiled_sql/dev_minus_move_transactions.sql`

[Back to Table of Contents](#table-of-contents)

#### Seed CSVs 20

- None recovered by static lineage matching.

[Back to Table of Contents](#table-of-contents)

#### Oracle Source Tables 20

- `bom.bom_departments`
- `inv.mtl_secondary_inventories`
- `inv.mtl_system_items_b`
- `wip.wip_discrete_jobs`
- `wip.wip_entities`
- `wip.wip_move_transactions`
- `wip.wip_operations`

[Back to Table of Contents](#table-of-contents)

### Workbook 21 - prod-move-transactions-daily-refresh

#### DBT Models 21

- `models/1_sources/wip/src_wip_move_transactions_14days.sql`
- `models/1_sources/wip/src_wip_move_transactions_30days.sql`
- `models/1_sources/wip/src_wip_move_transactions_365days.sql`
- `models/1_sources/wip/src_wip_move_transactions_45days.sql`
- `models/3_intermediate/int_move_trxns_dynamic_daily_rate.sql`
- `models/3_intermediate/int_move_trxns_dynamic_daily_rate_part2.sql`
- `models/3_intermediate/int_wip_nettable_credit_op_step_for_queue_to_move_types.sql`
- `models/9_optimized_compiled_sql/PROD_MoveTransactions.sql`

[Back to Table of Contents](#table-of-contents)

#### Seed CSVs 21

- None recovered by static lineage matching.

[Back to Table of Contents](#table-of-contents)

#### Oracle Source Tables 21

- `bom.bom_departments`
- `inv.mtl_planners`
- `inv.mtl_secondary_inventories`
- `inv.mtl_system_items_b`
- `wip.wip_discrete_jobs`
- `wip.wip_entities`
- `wip.wip_move_transactions`
- `wip.wip_operations`

[Back to Table of Contents](#table-of-contents)

### Workbook 22 - prod-mrp-workbench-supply

#### DBT Models 22

- `models/1_sources/lookups/lu_mtl_mrp_supply_demand_source_type.sql`

[Back to Table of Contents](#table-of-contents)

#### Seed CSVs 22

- None recovered by static lineage matching.

[Back to Table of Contents](#table-of-contents)

#### Oracle Source Tables 22

- None traced through manifest or direct static SQL parsing.

[Back to Table of Contents](#table-of-contents)

### Workbook 23 - saasm-vmi-sales-inventory-and-production-alignment

#### DBT Models 23

- `models/3_intermediate/int_saasm_sales_lines_and_deliveries.sql`
- `models/3_intermediate/int_saasm_top_level_sales_lines.sql`
- `models/4_marts/saasm_for_top_level_sales_planned_qtys.sql`
- `models/4_marts/saasm_from_vmi_sales_planned_qtys.sql`
- `models/4_marts/saasm_vmi.sql`

[Back to Table of Contents](#table-of-contents)

#### Seed CSVs 23

- None recovered by static lineage matching.

[Back to Table of Contents](#table-of-contents)

#### Oracle Source Tables 23

- `ar.hz_cust_accounts`
- `inv.mtl_item_locations`
- `inv.mtl_material_transactions`
- `inv.mtl_planners`
- `inv.mtl_system_items_b`
- `ont.oe_order_headers_all`
- `ont.oe_order_lines_all`
- `ont.oe_order_lines_all_ext_b`
- `wsh.wsh_delivery_assignments`
- `wsh.wsh_delivery_details`
- `wsh.wsh_new_deliveries`

[Back to Table of Contents](#table-of-contents)

### Workbook 24 - supplier-caused-mfg-defects

#### DBT Models 24

- `models/3_intermediate/int_move_trxns_dynamic_daily_rate.sql`
- `models/3_intermediate/int_move_trxns_dynamic_daily_rate_part2.sql`
- `models/3_intermediate/int_supplier_caused_defects.sql`
- `models/4_marts/agg/agg_lead_time_analysis_median.sql`
- `models/4_marts/agg/agg_lead_time_analysis_percent_complete.sql`
- `models/4_marts/facts/fct_lead_time_analysis.sql`
- `models/4_marts/facts/fct_supplier_caused_defects.sql`
- `models/4_marts/supplier_caused_defects.sql`
- `models/4_marts/supplier_caused_defects__wip.sql`
- `models/4_marts/supplier_defects_metric_daily.sql`

[Back to Table of Contents](#table-of-contents)

#### Seed CSVs 24

- None recovered by static lineage matching.

[Back to Table of Contents](#table-of-contents)

#### Oracle Source Tables 24

- `applsys.fnd_lookup_values`
- `bom.bom_calendar_dates`
- `bom.bom_components_b`
- `bom.bom_structure_types_b`
- `bom.bom_structures_b`
- `gl.gl_periods`
- `inv.mtl_categories_b`
- `inv.mtl_category_sets_b`
- `inv.mtl_category_sets_tl`
- `inv.mtl_item_categories`
- `inv.mtl_material_transactions`
- `inv.mtl_planners`
- `inv.mtl_system_items_b`
- `qa.qa_pc_results_relationship`
- `qa.qa_results`
- `wip.wip_discrete_jobs`
- `wip.wip_entities`
- `wip.wip_move_transactions`
- `wip.wip_operations`

[Back to Table of Contents](#table-of-contents)

### Workbook 25 - wip-last-touch-date

#### DBT Models 25

- `models/4_marts/wip_open_qtys_date_last_moved.sql`
- `models/9_optimized_compiled_sql/minus_wip_open_qtys_date_last_moved.sql`

[Back to Table of Contents](#table-of-contents)

#### Seed CSVs 25

- None recovered by static lineage matching.

[Back to Table of Contents](#table-of-contents)

#### Oracle Source Tables 25

- `bom.bom_departments`
- `inv.mtl_planners`
- `inv.mtl_reservations`
- `inv.mtl_sales_orders`
- `inv.mtl_system_items_b`
- `ont.oe_order_lines_all`
- `wip.wip_discrete_jobs`
- `wip.wip_entities`
- `wip.wip_operations`

[Back to Table of Contents](#table-of-contents)

### Workbook 26 - wip-pou-and-to-move-only

#### DBT Models 26

- `models/1_sources/wip/src_wip_move_transactions_14days.sql`
- `models/1_sources/wip/src_wip_move_transactions_30days.sql`
- `models/1_sources/wip/src_wip_move_transactions_365days.sql`
- `models/3_intermediate/int_wip_nettable_credit_op_step_for_queue_to_move_types.sql`
- `models/4_marts/horizontal_wip.sql`
- `models/4_marts/horizontal_wip_agg_qty_to_move.sql`
- `models/9_optimized_compiled_sql/minus_horizontal_wip.sql`

[Back to Table of Contents](#table-of-contents)

#### Seed CSVs 26

- None recovered by static lineage matching.

[Back to Table of Contents](#table-of-contents)

#### Oracle Source Tables 26

- `bom.bom_departments`
- `inv.mtl_planners`
- `inv.mtl_reservations`
- `inv.mtl_sales_orders`
- `inv.mtl_secondary_inventories`
- `inv.mtl_system_items_b`
- `ont.oe_order_lines_all`
- `wip.wip_discrete_jobs`
- `wip.wip_entities`
- `wip.wip_move_transactions`
- `wip.wip_operations`

[Back to Table of Contents](#table-of-contents)

### Workbook 27 - wip-quality-summary

#### DBT Models 27

- `models/2_staging/stg_wip_quality_summary_quality_rejects.sql`
- `models/2_staging/stg_wip_quality_summary_quality_reroutes.sql`
- `models/3_intermediate/int_wip_quality_summary_quality_rejects_and_sales_orders.sql`
- `models/3_intermediate/int_wip_quality_summary_quality_reroutes_and_sales_orders.sql`
- `models/3_intermediate/int_wip_quality_summary_wip.sql`
- `models/4_marts/wip_quality_summary_quality.sql`
- `models/4_marts/wip_quality_summary_wip.sql`
- `models/9_optimized_compiled_sql/minus_employee_wip_moves_14days.sql`
- `models/9_optimized_compiled_sql/minus_employee_wip_moves_alltime.sql`
- `models/9_optimized_compiled_sql/minus_wip_quality_summary_wip.sql`

[Back to Table of Contents](#table-of-contents)

#### Seed CSVs 27

- None recovered by static lineage matching.

[Back to Table of Contents](#table-of-contents)

#### Oracle Source Tables 27

- `applsys.fnd_lookup_values`
- `bom.bom_departments`
- `inv.mtl_planners`
- `inv.mtl_reservations`
- `inv.mtl_sales_orders`
- `inv.mtl_system_items_b`
- `ont.oe_order_lines_all`
- `qa.qa_results`
- `wip.wip_discrete_jobs`
- `wip.wip_entities`
- `wip.wip_operations`

[Back to Table of Contents](#table-of-contents)

### Workbook 28 - wip-shipment-lines

#### DBT Models 28

- `models/1_sources/mrp/src_mrp_item_wip_entities.sql`
- `models/4_marts/dimensions/dim_item_master.sql`
- `models/4_marts/dimensions/dim_wip_jobs.sql`
- `models/4_marts/dimensions/dim_wip_jobs_and_operations.sql`
- `models/4_marts/dimensions/dim_wip_jobs_batch_completions.sql`
- `models/4_marts/dimensions/dim_wip_jobs_completions.sql`
- `models/4_marts/dimensions/dim_wip_reservations_on_sales_orders.sql`

[Back to Table of Contents](#table-of-contents)

#### Seed CSVs 28

- None recovered by static lineage matching.

[Back to Table of Contents](#table-of-contents)

#### Oracle Source Tables 28

- `applsys.fnd_lookup_values`
- `inv.mtl_categories_b`
- `inv.mtl_category_sets_b`
- `inv.mtl_category_sets_tl`
- `inv.mtl_item_categories`
- `inv.mtl_material_transactions`
- `inv.mtl_planners`
- `inv.mtl_reservations`
- `inv.mtl_sales_orders`
- `inv.mtl_system_items_b`
- `mrp.mrp_item_wip_entities`
- `ont.oe_order_lines_all`
- `wip.wip_discrete_jobs`
- `wip.wip_entities`
- `wip.wip_move_transactions`
- `wip.wip_operations`

[Back to Table of Contents](#table-of-contents)
