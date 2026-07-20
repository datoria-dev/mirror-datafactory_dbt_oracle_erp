with  dbt__cte__lu_we_entity_type__ as (
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
), dim_wip_jobs as (
    select 
        we_wip_entity_id,
        we_wip_entity_name
    from dbt__cte__stg_we_wdj__ 
),
job_start as (
    select
        we_wip_entity_id,
        wmt_min_transaction_date
    from dbt__cte__int_move_trxns_wip_job_start__
),
job_completion as (
    select 
        we_wip_entity_id,
        mt44_transaction_date
    from dbt__cte__int_wip_assembly_completions__
)

select
    jobs.we_wip_entity_name as "Job Number",
    job_start.wmt_min_transaction_date as "Job Start Date",
    job_completion.mt44_transaction_date as "Job Completion Date",
    jobs.we_wip_entity_id,
    standard_hash(jobs.we_wip_entity_id || to_number(to_char(trunc(job_start.wmt_min_transaction_date),'YYYYMMDD')) || to_number(to_char(trunc(job_completion.mt44_transaction_date),'YYYYMMDD')) , 'MD5') lead_time_analysis_sk
from dim_wip_jobs jobs
join job_start on jobs.we_wip_entity_id = job_start.we_wip_entity_id
join job_completion on jobs.we_wip_entity_id = job_completion.we_wip_entity_id