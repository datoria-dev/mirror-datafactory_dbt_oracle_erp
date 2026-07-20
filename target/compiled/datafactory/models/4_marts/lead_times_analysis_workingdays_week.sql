with dbt__cte__lu_we_entity_type__ as (
select lookup_type as lookup_type_we_entity_type, lookup_code as lookup_code_we_entity_type, meaning as meaning_we_entity_type from apps.fnd_lookup_values 
where lookup_type = 'WIP_ENTITY'
),  dbt__cte__src_wip_entities__ as (
SELECT
  wip_entity_id AS we_wip_entity_id,
  organization_id AS we_organization_id,
  wip_entity_name AS we_wip_entity_name,
  entity_type AS we_entity_type,
  lu.meaning_we_entity_type,
  description AS we_description,
  primary_item_id AS we_primary_item_id,
  program_application_id AS we_program_application_id
FROM
  apps.wip_entities
JOIN dbt__cte__lu_we_entity_type__ lu
on entity_type = lu.lookup_code_we_entity_type
WHERE
  organization_id = 1213
  and creation_date >= sysdate - 500
),  dbt__cte__lu_wdj_job_type__ as (
select lookup_type as lookup_type_wdj_job_type, lookup_code as lookup_code_wdj_job_type, meaning as meaning_wdj_job_type from apps.fnd_lookup_values 
where lookup_type = 'WIP_ENTITIES'
),  dbt__cte__lu_wdj_status_type__ as (
select lookup_type as lookup_type_wdj_status_type, lookup_code as lookup_code_wdj_status_type, meaning as meaning_wdj_status_type from apps.fnd_lookup_values
where lookup_type = 'WIP_JOB_STATUS'
),  dbt__cte__lu_wdj_wip_supply_type__ as (
select lookup_type as lookup_type_wdj_wip_supply_type, lookup_code as lookup_code_wdj_wip_supply_type, meaning as meaning_wdj_wip_supply_type from apps.fnd_lookup_values
where lookup_type = 'WIP_SUPPLY'
),  dbt__cte__src_wip_discrete_jobs__ as (
SELECT
  wip_entity_id AS wdj_wip_entity_id,
  organization_id AS wdj_organization_id,
  source_line_id AS wdj_source_line_id,
  source_code AS wdj_source_code,
  job_type AS wdj_job_type,
  lu.meaning_wdj_job_type,
  description AS wdj_description,
  status_type AS wdj_status_type,
  lu2.meaning_wdj_status_type,
  primary_item_id AS wdj_primary_item_id,
  wip_supply_type AS wdj_wip_supply_type,
  lu3.meaning_wdj_wip_supply_type,
  scheduled_start_date AS wdj_scheduled_start_date,
  date_released AS wdj_date_released,
  scheduled_completion_date AS wdj_scheduled_completion_date,
  mps_scheduled_completion_date as wdj_mps_scheduled_completion_date,
  common_bom_sequence_id as wdj_common_bom_sequence_id,
  common_routing_sequence_id as wdj_common_routing_sequence_id,
  date_completed AS wdj_date_completed,
  date_closed AS wdj_date_closed,
  start_quantity AS wdj_start_quantity,
  quantity_completed AS wdj_quantity_completed,
  quantity_scrapped AS wdj_quantity_scrapped,
  net_quantity AS wdj_net_quantity,
  mps_net_quantity as wdj_mps_net_quantity,
  bom_revision AS wdj_bom_revision,
  routing_revision AS wdj_routing_revision,
  bom_revision_date AS wdj_bom_revision_date,
  routing_revision_date AS wdj_routing_revision_date,
  end_item_unit_number AS wdj_end_item_unit_number,
  completion_subinventory as wdj_completion_subinventory,
  completion_locator_id as wdj_completion_locator_id,
  class_code AS wdj_class_code,
  firm_planned_flag AS wdj_firm_planned_flag,
  po_creation_time as wdj_po_creation_time,
  priority as wdj_priority,
  due_date as wdj_due_date,
  program_application_id as wdj_program_application_id
FROM
  apps.wip_discrete_jobs
JOIN dbt__cte__lu_wdj_job_type__ lu
on job_type = lu.lookup_code_wdj_job_type
JOIN dbt__cte__lu_wdj_status_type__ lu2
on status_type = lu2.lookup_code_wdj_status_type
JOIN dbt__cte__lu_wdj_wip_supply_type__ lu3
on wip_supply_type = lu3.lookup_code_wdj_wip_supply_type
WHERE
  organization_id = 1213
  and scheduled_start_date >= sysdate - 500
),  dbt__cte__stg_we_wdj__ as (
SELECT
    src_we.*,
    src_wdj.* 

FROM
    dbt__cte__src_wip_entities__
    src_we
    JOIN dbt__cte__src_wip_discrete_jobs__
    src_wdj
    ON src_we.we_wip_entity_id = src_wdj.wdj_wip_entity_id
    AND src_we.we_organization_id = src_wdj.wdj_organization_id
where 1=1
),  dbt__cte__lu_mtl_transaction_types__ as (
SELECT
    transaction_type_id AS lu_mtl_tt_transaction_type_id,
    last_update_date AS lu_mtl_tt_last_update_date,
    last_updated_by AS lu_mtl_tt_last_updated_by,
    creation_date AS lu_mtl_tt_creation_date,
    created_by AS lu_mtl_tt_created_by,
    transaction_type_name AS lu_mtl_tt_transaction_type_name,
    description AS lu_mtl_tt_description,
    transaction_action_id AS lu_mtl_tt_transaction_action_id,
    transaction_source_type_id AS lu_mtl_tt_transaction_source_type_id,
    shortage_msg_background_flag AS lu_mtl_tt_shortage_msg_background_flag,
    shortage_msg_online_flag AS lu_mtl_tt_shortage_msg_online_flag,
    disable_date AS lu_mtl_tt_disable_date
FROM
    inv.mtl_transaction_types
order by transaction_type_id asc
),  dbt__cte__src_inv_mtl_material_transactions_type44__ as (
select 
transaction_quantity as mt44_transaction_quantity,
transaction_date as mt44_transaction_date,
organization_id as mt44_organization_id,
transaction_source_id AS mt44_transaction_source_id,
transaction_id AS mt44_transaction_id,
transaction_type_id as mt44_transaction_type_id,
lu_mtl_tt_transaction_type_name,
lu_mtl_tt_description
from apps.mtl_material_transactions
left join dbt__cte__lu_mtl_transaction_types__ lu
on transaction_type_id = lu.lu_mtl_tt_transaction_type_id
where organization_id = 1213 and transaction_date >= sysdate - 500
and transaction_type_id = 44 -- Complete assemblies from WIP to stores
-- type 17 WIP Completion Return
),  dbt__cte__stg_we_wdj_mt44__ as (
SELECT
    stg_base.*,
    src_mt44.*

FROM
    dbt__cte__stg_we_wdj__ stg_base
    JOIN dbt__cte__src_inv_mtl_material_transactions_type44__ src_mt44
    ON stg_base.we_wip_entity_id = src_mt44.mt44_transaction_source_id
    and stg_base.we_organization_id = src_mt44.mt44_organization_id
),  dbt__cte__int_wip_assembly_completions__ as (
--declare grain: One row per job per day
select
    stg_base.we_wip_entity_id,
    stg_base.we_wip_entity_name,
    stg_base.wdj_primary_item_id,
    stg_base.we_organization_id,
    to_date(trunc(stg_base.mt44_transaction_date)) mt44_transaction_date,
    sum(stg_base.mt44_transaction_quantity) mt44_transaction_quantity,
    standard_hash(stg_base.we_wip_entity_id 
        || to_number(to_char(trunc(stg_base.mt44_transaction_date),'YYYYMMDD')), 'MD5') wip_assembly_completions_sk
from
    dbt__cte__stg_we_wdj_mt44__
    stg_base
group by
    stg_base.we_organization_id,
    stg_base.we_wip_entity_id,
    stg_base.we_wip_entity_name,
    stg_base.wdj_primary_item_id,
    to_date(trunc(stg_base.mt44_transaction_date)),
    to_number(to_char(trunc(stg_base.mt44_transaction_date),'YYYYMMDD'))
),  dbt__cte__src_wip_move_transactions_365days__ as (
SELECT
  transaction_id AS wmt_transaction_id,
  last_update_date AS wmt_last_update_date,
  last_updated_by AS wmt_last_updated_by,
  creation_date AS wmt_creation_date,
  created_by AS wmt_created_by,
  last_update_login AS wmt_last_update_login,
  request_id AS wmt_request_id,
  program_application_id AS wmt_program_application_id,
  program_id AS wmt_program_id,
  program_update_date AS wmt_program_update_date,
  group_id AS wmt_group_id,
  source_code AS wmt_source_code,
  source_line_id AS wmt_source_line_id,
  organization_id AS wmt_organization_id,
  wip_entity_id AS wmt_wip_entity_id,
  primary_item_id AS wmt_primary_item_id,
  transaction_date AS wmt_transaction_date,
  acct_period_id AS wmt_acct_period_id,
  fm_operation_seq_num AS wmt_fm_operation_seq_num,
  fm_department_id AS wmt_fm_department_id,
  fm_intraoperation_step_type AS wmt_fm_intraoperation_step_type,
  to_operation_seq_num AS wmt_to_operation_seq_num,
  to_department_id AS wmt_to_department_id,
  to_intraoperation_step_type AS wmt_to_intraoperation_step_type,
  transaction_quantity AS wmt_transaction_quantity,
  transaction_uom AS wmt_transaction_uom,
  primary_quantity AS wmt_primary_quantity,
  primary_uom AS wmt_primary_uom,
  qa_collection_id AS wmt_qa_collection_id,
  job_quantity_snapshot AS wmt_job_quantity_snapshot
FROM
  apps.wip_move_transactions
WHERE
  organization_id = 1213
  AND transaction_date >= SYSDATE - 365
),  dbt__cte__stg_we_wdj_wmt365days__ as (
SELECT
    src_we.*,
    src_wdj.*,
    src_wmt.*

FROM
    dbt__cte__src_wip_entities__
    src_we
    JOIN dbt__cte__src_wip_discrete_jobs__
    src_wdj
    ON src_we.we_wip_entity_id = src_wdj.wdj_wip_entity_id
    AND src_we.we_organization_id = src_wdj.wdj_organization_id
    JOIN dbt__cte__src_wip_move_transactions_365days__
    src_wmt
    ON src_we.we_wip_entity_id = src_wmt.wmt_wip_entity_id
),  dbt__cte__int_move_trxns_wip_job_start__ as (
-- declare grain: one row per job
select
int_base.we_wip_entity_id,
int_base.we_wip_entity_name,
int_base.wmt_primary_item_id,
min(trunc(int_base.wmt_transaction_date)) wmt_min_transaction_date,
standard_hash(int_base.we_wip_entity_id 
        || min(to_number(to_char(trunc(int_base.wmt_transaction_date),'YYYYMMDD'))), 'MD5') move_trxns_wip_job_start_sk
from dbt__cte__stg_we_wdj_wmt365days__ int_base
where int_base.wdj_class_code IN ('CONVERSION','NONSTD-PRJ','Production','REWORK','TECH MKTG') -- exclude NSS- repair jobs
group by we_wip_entity_id,
we_wip_entity_name,
wmt_primary_item_id
),  dbt__cte__src_inv_mtl_system_items_b__ as (
SELECT
  inventory_item_id AS msib_inventory_item_id,
  organization_id AS msib_organization_id,
  description AS msib_description,
  buyer_id AS msib_buyer_id,
  segment1 AS msib_segment1,
  end_assembly_pegging_flag AS msib_end_assembly_pegging_flag,
  inventory_item_status_code AS msib_inventory_item_status_code,
  planner_code AS msib_planner_code,
  planning_make_buy_code AS msib_planning_make_buy_code,
  full_lead_time AS msib_full_lead_time,
  program_application_id as msib_program_application_id
FROM
  apps.mtl_system_items_b
WHERE
  organization_id = 1213
),  dbt__cte__lead_times_analysis_full7day_week__ as (
--declare grain: One row per job per day
select
base.we_wip_entity_name "Job Number",
join1.wmt_primary_item_id wmt_primary_item_id,
join1.wmt_min_transaction_date "Job Start Date",
TO_CHAR(join1.wmt_min_transaction_date,'Day') "Job Start Day",
base.mt44_transaction_date "Completion Date",
TO_CHAR(base.mt44_transaction_date,'Day') "Completion Day",
base.mt44_transaction_date - join1.wmt_min_transaction_date fullweek_actual_lead_time,
join2.msib_full_lead_time "system_lead_time",
base.mt44_transaction_quantity "Qty Completed",
base.wip_assembly_completions_sk
from dbt__cte__int_wip_assembly_completions__ base
join dbt__cte__int_move_trxns_wip_job_start__ join1
on base.we_wip_entity_id = join1.we_wip_entity_id
join dbt__cte__src_inv_mtl_system_items_b__ join2  
on join1.wmt_primary_item_id = join2.msib_inventory_item_id
),  dbt__cte__src_bom_calendar_dates_365days__ as (
SELECT
    calendar_date as bcal_calendar_date,
        CASE
        WHEN seq_num IS NULL THEN next_date
        ELSE calendar_date
    END as bcal_next_working_dates,
    CASE
        WHEN seq_num IS NULL THEN prior_date
        ELSE calendar_date
    END as bcal_prev_working_dates,
    next_date as bcal_next_date,
    prior_date as bcal_prior_date,
    seq_num as bcal_seq_num,
    next_seq_num as bcal_next_seq_num

FROM
    apps.bom_calendar_dates
WHERE
    calendar_code = 'NSS'
    AND calendar_date BETWEEN TRUNC(sysdate - 365, 'YYYY') -- truncates to the first day of the year: 01-JAN-YYYY
    AND TRUNC(sysdate + 365, 'YYYY') -- truncates to the first day of the year: 01-JAN-YYYY
),  dbt__cte__src_gl_periods_365days__ as (
SELECT
    start_date AS fiscal_start_date,
    end_date AS fiscal_end_date,
    entered_period_name AS fiscal_month,
    period_year AS fiscal_year,
    'Week ' || period_num AS fiscal_week,
    quarter_num AS fiscal_quarter,
    period_set_name AS fiscal_period_set_name,
    year_start_date AS fiscal_year_start_date
FROM
    apps.gl_periods
WHERE 1=1
    AND period_set_name = 'BAE_FW' -- FW: Full Week
    --AND period_set_name = 'BAE_CALENDAR' -- Returns Monthly records
    AND start_date BETWEEN TRUNC(sysdate - 365, 'YYYY') -- truncates to the first day of the year: 01-JAN-YYYY
    AND TRUNC(sysdate + 365, 'YYYY') -- truncates to the first day of the year: 01-JAN-YYYY
),  dbt__cte__stg_bom_cal_fiscal_365days__ as (
SELECT
trunc(src_bcal.bcal_calendar_date) bcal_calendar_date,
src_bcal.bcal_next_date,
src_bcal.bcal_prior_date,
src_bcal.bcal_next_working_dates,
src_bcal.bcal_prev_working_dates,
src_bcal.bcal_seq_num,
src_bcal.bcal_next_seq_num,
src_fiscal.fiscal_start_date,
src_fiscal.fiscal_end_date,
src_fiscal.fiscal_month,
src_fiscal.fiscal_year,
src_fiscal.fiscal_week,
src_fiscal.fiscal_quarter,
to_char(src_bcal.bcal_calendar_date,'Dy') day_abbreviated,
trunc(src_bcal.bcal_calendar_date,'IW') oracle_monday_of_week,
next_day(src_bcal.bcal_calendar_date, 'MONDAY') next_monday,
row_number() over (partition by src_fiscal.fiscal_year, src_fiscal.fiscal_month order by trunc(src_bcal.bcal_calendar_date)) index_monthly,
standard_hash(src_bcal.bcal_calendar_date || src_fiscal.fiscal_month,'MD5') AS sk_fiscal_calendar
FROM
    dbt__cte__src_bom_calendar_dates_365days__
    src_bcal
    JOIN dbt__cte__src_gl_periods_365days__
    src_fiscal
    ON src_bcal.bcal_calendar_date BETWEEN src_fiscal.fiscal_start_date
    AND src_fiscal.fiscal_end_date
),  dbt__cte__int_fiscal_calendar_365days__ as (
SELECT 
int_base.*,
case
  -- fiscal 2024
  when int_base.fiscal_month = 'Jan24' then to_date('2024-01-01','YYYY-MM-DD')
  when int_base.fiscal_month = 'Feb24' then to_date('2024-02-01','YYYY-MM-DD')
  when int_base.fiscal_month = 'Mar24' then to_date('2024-03-01','YYYY-MM-DD')
  when int_base.fiscal_month = 'Apr24' then to_date('2024-04-01','YYYY-MM-DD')
  when int_base.fiscal_month = 'May24' then to_date('2024-05-01','YYYY-MM-DD')
  when int_base.fiscal_month = 'Jun24' then to_date('2024-06-01','YYYY-MM-DD')
  when int_base.fiscal_month = 'Jul24' then to_date('2024-07-01','YYYY-MM-DD')
  when int_base.fiscal_month = 'Aug24' then to_date('2024-08-01','YYYY-MM-DD')
  when int_base.fiscal_month = 'Sep24' then to_date('2024-09-01','YYYY-MM-DD')
  when int_base.fiscal_month = 'Oct24' then to_date('2024-10-01','YYYY-MM-DD')
  when int_base.fiscal_month = 'Nov24' then to_date('2024-11-01','YYYY-MM-DD')
  when int_base.fiscal_month = 'Dec24' then to_date('2024-12-01','YYYY-MM-DD')
  -- fiscal 2025
  when int_base.fiscal_month = 'Jan25' then to_date('2025-01-01','YYYY-MM-DD')
  when int_base.fiscal_month = 'Feb25' then to_date('2025-02-01','YYYY-MM-DD')
  when int_base.fiscal_month = 'Mar25' then to_date('2025-03-01','YYYY-MM-DD')
  when int_base.fiscal_month = 'Apr25' then to_date('2025-04-01','YYYY-MM-DD')
  when int_base.fiscal_month = 'May25' then to_date('2025-05-01','YYYY-MM-DD')
  when int_base.fiscal_month = 'Jun25' then to_date('2025-06-01','YYYY-MM-DD')
  when int_base.fiscal_month = 'Jul25' then to_date('2025-07-01','YYYY-MM-DD')
  when int_base.fiscal_month = 'Aug25' then to_date('2025-08-01','YYYY-MM-DD')
  when int_base.fiscal_month = 'Sep25' then to_date('2025-09-01','YYYY-MM-DD')
  when int_base.fiscal_month = 'Oct25' then to_date('2025-10-01','YYYY-MM-DD')
  when int_base.fiscal_month = 'Nov25' then to_date('2025-11-01','YYYY-MM-DD')
  when int_base.fiscal_month = 'Dec25' then to_date('2025-12-01','YYYY-MM-DD')
  -- fiscal 2026
  when int_base.fiscal_month = 'Jan26' then to_date('2026-01-01','YYYY-MM-DD')
  when int_base.fiscal_month = 'Feb26' then to_date('2026-02-01','YYYY-MM-DD')
  when int_base.fiscal_month = 'Mar26' then to_date('2026-03-01','YYYY-MM-DD')
  when int_base.fiscal_month = 'Apr26' then to_date('2026-04-01','YYYY-MM-DD')
  when int_base.fiscal_month = 'May26' then to_date('2026-05-01','YYYY-MM-DD')
  when int_base.fiscal_month = 'Jun26' then to_date('2026-06-01','YYYY-MM-DD')
  when int_base.fiscal_month = 'Jul26' then to_date('2026-07-01','YYYY-MM-DD')
  when int_base.fiscal_month = 'Aug26' then to_date('2026-08-01','YYYY-MM-DD')
  when int_base.fiscal_month = 'Sep26' then to_date('2026-09-01','YYYY-MM-DD')
  when int_base.fiscal_month = 'Oct26' then to_date('2026-10-01','YYYY-MM-DD')
  when int_base.fiscal_month = 'Nov26' then to_date('2026-11-01','YYYY-MM-DD')
  when int_base.fiscal_month = 'Dec26' then to_date('2026-12-01','YYYY-MM-DD')
    -- fiscal 2027
  when int_base.fiscal_month = 'Jan27' then to_date('2027-01-01','YYYY-MM-DD')
  when int_base.fiscal_month = 'Feb27' then to_date('2027-02-01','YYYY-MM-DD')
  when int_base.fiscal_month = 'Mar27' then to_date('2027-03-01','YYYY-MM-DD')
  when int_base.fiscal_month = 'Apr27' then to_date('2027-04-01','YYYY-MM-DD')
  when int_base.fiscal_month = 'May27' then to_date('2027-05-01','YYYY-MM-DD')
  when int_base.fiscal_month = 'Jun27' then to_date('2027-06-01','YYYY-MM-DD')
  when int_base.fiscal_month = 'Jul27' then to_date('2027-07-01','YYYY-MM-DD')
  when int_base.fiscal_month = 'Aug27' then to_date('2027-08-01','YYYY-MM-DD')
  when int_base.fiscal_month = 'Sep27' then to_date('2027-09-01','YYYY-MM-DD')
  when int_base.fiscal_month = 'Oct27' then to_date('2027-10-01','YYYY-MM-DD')
  when int_base.fiscal_month = 'Nov27' then to_date('2027-11-01','YYYY-MM-DD')
  when int_base.fiscal_month = 'Dec27' then to_date('2027-12-01','YYYY-MM-DD')
else null
end AS fiscal_date_placeholder
FROM
dbt__cte__stg_bom_cal_fiscal_365days__ int_base
) select
"Job Number",
wmt_primary_item_id,
"Job Start Date",
"Job Start Day",
"Completion Date",
"Completion Day",
fullweek_actual_lead_time,
"Qty Completed",
"system_lead_time",
count(*) - 1 workingdays_actual_lead_time_exclusive,
count(*) workingdays_actual_lead_time_inclusive,
base.wip_assembly_completions_sk
from dbt__cte__lead_times_analysis_full7day_week__ base
join dbt__cte__int_fiscal_calendar_365days__ join1
on join1.bcal_calendar_date BETWEEN base."Job Start Date" AND base."Completion Date"
where join1.bcal_seq_num is not null -- rm nonworking days and holidays
group by 
"Job Number",
wmt_primary_item_id,
"Job Start Date",
"Job Start Day",
"Completion Date",
"Completion Day",
fullweek_actual_lead_time,
"system_lead_time",
"Qty Completed",
base.wip_assembly_completions_sk