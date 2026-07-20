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
),  dbt__cte__src_wip_operations_from__ as (
SELECT
  actual_completion_date AS wop_fm_actual_completion_date,
  check_skill AS wop_fm_check_skill,
  wip_entity_id AS wop_fm_wip_entity_id,
  operation_seq_num AS wop_fm_operation_seq_num,
  organization_id AS wop_fm_organization_id,
  last_update_date AS wop_fm_last_update_date,
  last_updated_by AS wop_fm_last_updated_by,
  creation_date AS wop_fm_creation_date,
  created_by AS wop_fm_created_by,
  last_update_login AS wop_fm_last_update_login,
  request_id AS wop_fm_request_id,
  program_application_id AS wop_fm_program_application_id,
  program_id AS wop_fm_program_id,
  program_update_date AS wop_fm_program_update_date,
  operation_sequence_id AS wop_fm_operation_sequence_id,
  department_id AS wop_fm_department_id,
  description AS wop_fm_description,
  scheduled_quantity AS wop_fm_scheduled_quantity,
  quantity_in_queue AS wop_fm_quantity_in_queue,
  quantity_running AS wop_fm_quantity_running,
  quantity_waiting_to_move AS wop_fm_quantity_waiting_to_move,
  quantity_rejected AS wop_fm_quantity_rejected,
  quantity_scrapped AS wop_fm_quantity_scrapped,
  quantity_completed AS wop_fm_quantity_completed,
  first_unit_start_date AS wop_fm_first_unit_start_date,
  first_unit_completion_date AS wop_fm_first_unit_completion_date,
  last_unit_start_date AS wop_fm_last_unit_start_date,
  last_unit_completion_date AS wop_fm_last_unit_completion_date,
  previous_operation_seq_num AS wop_fm_previous_operation_seq_num,
  next_operation_seq_num AS wop_fm_next_operation_seq_num,
  count_point_type AS wop_fm_count_point_type,
  backflush_flag AS wop_fm_backflush_flag,
  minimum_transfer_quantity AS wop_fm_minimum_transfer_quantity,
  date_last_moved AS wop_fm_date_last_moved,
  attribute5 AS wop_fm_attribute5,
  cumulative_scrap_quantity AS wop_fm_cumulative_scrap_quantity
FROM
  apps.wip_operations
WHERE
  organization_id = 1213
  AND first_unit_start_date >= sysdate - 365
),  dbt__cte__stg_we_wdj_fm_wop__ as (
SELECT
    src_fmwop.*,
    stg_join1.*,
    standard_hash(stg_join1.wdj_wip_entity_id||stg_join1.wdj_organization_id||src_fmwop.wop_fm_operation_seq_num, 'MD5') as stg_wop_we_wdj_surrogate_key

FROM
    dbt__cte__stg_we_wdj__
    stg_join1
    JOIN dbt__cte__src_wip_operations_from__ src_fmwop
    ON  stg_join1.wdj_wip_entity_id = src_fmwop.wop_fm_wip_entity_id
    AND stg_join1.wdj_organization_id = src_fmwop.wop_fm_organization_id
),  dbt__cte__src_wip_move_transactions_45days__ as (
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
  AND transaction_date >= SYSDATE - 45
),  dbt__cte__stg_we_wdj_fm_wop_wmt45days__ as (
SELECT
    stg_base.*,
    src_wmt45.*
FROM
    dbt__cte__stg_we_wdj_fm_wop__
    stg_base
    JOIN dbt__cte__src_wip_move_transactions_45days__
    src_wmt45
    ON stg_base.wop_fm_wip_entity_id = src_wmt45.wmt_wip_entity_id
    AND stg_base.wop_fm_operation_seq_num = src_wmt45.wmt_fm_operation_seq_num
    AND stg_base.wop_fm_organization_id = src_wmt45.wmt_organization_id
),  dbt__cte__src_inv_mtl_secondary_inventories__ as (
SELECT
    enable_locator_alias AS msub_enable_locator_alias,
    enforce_alias_uniqueness AS msub_enforce_alias_uniqueness,
    enable_opp_cyc_count AS msub_enable_opp_cyc_count,
    depreciable_flag AS msub_depreciable_flag,
    default_cost_group_id AS msub_default_cost_group_id,
    status_id AS msub_status_id,
    default_loc_status_id AS msub_default_loc_status_id,
    lpn_controlled_flag AS msub_lpn_controlled_flag,
    cartonization_flag AS msub_cartonization_flag,
    subinventory_type AS msub_subinventory_type,
    planning_level AS msub_planning_level,
    default_count_type_code AS msub_default_count_type_code,
    enable_bulk_pick AS msub_enable_bulk_pick,
    secondary_inventory_name AS msub_secondary_inventory_name,
    organization_id AS msub_organization_id,
    last_update_date AS msub_last_update_date,
    last_updated_by AS msub_last_updated_by,
    creation_date AS msub_creation_date,
    created_by AS msub_created_by,
    last_update_login AS msub_last_update_login,
    description AS msub_description,
    inventory_atp_code AS msub_inventory_atp_code,
    availability_type AS msub_availability_type,
    reservable_type AS msub_reservable_type,
    locator_type AS msub_locator_type,
    picking_order AS msub_picking_order,
    material_account AS msub_material_account,
    material_overhead_account AS msub_material_overhead_account,
    resource_account AS msub_resource_account,
    overhead_account AS msub_overhead_account,
    outside_processing_account AS msub_outside_processing_account,
    quantity_tracked AS msub_quantity_tracked,
    asset_inventory AS msub_asset_inventory,
    requisition_approval_type AS msub_requisition_approval_type,
    expense_account AS msub_expense_account
FROM
    apps.mtl_secondary_inventories
WHERE
    organization_id = 1213
),  dbt__cte__int_wip_nettable_credit_op_step_for_queue_to_move_types__ as (
SELECT
    stg_base.we_wip_entity_name,
    stg_base.wmt_transaction_quantity,
    to_date(trunc(stg_base.wmt_transaction_date)) wmt_transaction_date,
    stg_base.wdj_primary_item_id
FROM
    dbt__cte__stg_we_wdj_fm_wop_wmt45days__
    stg_base
    JOIN dbt__cte__src_inv_mtl_secondary_inventories__
    src_msub
    ON src_msub.msub_secondary_inventory_name = stg_base.wdj_completion_subinventory
    AND src_msub.msub_organization_id = stg_base.wdj_organization_id
WHERE
    stg_base.wdj_organization_id = 1213 
    AND (stg_base.wop_fm_attribute5 = 'Y') -- credit op step
    AND stg_base.wmt_to_intraoperation_step_type IN (1,3) -- queue, to move types
    AND src_msub.msub_availability_type=1 -- nettable type
),  dbt__cte__int_actuals_build__ as (
SELECT
    'actual build' AS Feature,
    int_base.wmt_transaction_date,
    int_base.wdj_primary_item_id,
    sum(int_base.wmt_transaction_quantity) wmt_transaction_quantity,
    int_base.we_wip_entity_name
FROM
    dbt__cte__int_wip_nettable_credit_op_step_for_queue_to_move_types__
    int_base
GROUP BY
    int_base.we_wip_entity_name,
    int_base.wmt_transaction_date,
    int_base.wdj_primary_item_id
),  dbt__cte__actuals_build__ as (
SELECT
    'actual build' AS Feature,
    base.wmt_transaction_date AS "Transacted Date",
    base.wdj_primary_item_id,
    sum(base.wmt_transaction_quantity) AS "Qtys"
FROM
    dbt__cte__int_actuals_build__
    base
GROUP BY
    base.wmt_transaction_date,
    base.wdj_primary_item_id
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
),  dbt__cte__int_actuals_delivery__ as (
SELECT
    'actual delivery' AS feature,
    int_delivery.mt44_transaction_date,
    int_delivery.wdj_primary_item_id,
    sum(int_delivery.mt44_transaction_quantity) AS mt44_transaction_quantity,
    int_delivery.we_wip_entity_name
FROM dbt__cte__int_wip_assembly_completions__ int_delivery
GROUP BY
    int_delivery.we_wip_entity_name,
    int_delivery.mt44_transaction_date,
    int_delivery.wdj_primary_item_id
),  dbt__cte__actuals_delivery__ as (
SELECT
    'actual delivery' AS feature,
    base.mt44_transaction_date AS "Transacted Date",
    base.wdj_primary_item_id,
    sum(base.mt44_transaction_quantity) AS "Qtys"
FROM dbt__cte__int_actuals_delivery__ base
GROUP BY
    base.mt44_transaction_date,
    base.wdj_primary_item_id
),  dbt__cte__actuals_build_delivery__ as (
SELECT
    *
FROM
    dbt__cte__actuals_build__

UNION ALL

SELECT
    *
FROM
    dbt__cte__actuals_delivery__
),  dbt__cte__src_bom_calendar_dates_30days__ as (
SELECT
    calendar_date as bcal_calendar_date,
    next_date as bcal_next_date,
    seq_num as bcal_seq_num,
    next_seq_num as bcal_next_seq_num,
    CASE
        WHEN seq_num IS NULL THEN next_date
        ELSE calendar_date
    END as bcal_working_dates
FROM
    apps.bom_calendar_dates
WHERE
    calendar_code = 'NSS'
    AND calendar_date BETWEEN sysdate-30
    AND sysdate+30
),  dbt__cte__src_gl_periods__ as (
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
    AND start_date BETWEEN sysdate-30
    AND sysdate+30
),  dbt__cte__stg_bom_cal_fiscal_30days__ as (
SELECT
    src_bcal.*,
    src_fiscal.*
FROM
    dbt__cte__src_bom_calendar_dates_30days__
    src_bcal
    JOIN dbt__cte__src_gl_periods__
    src_fiscal
    ON src_bcal.bcal_calendar_date BETWEEN src_fiscal.fiscal_start_date
    AND src_fiscal.fiscal_end_date
) SELECT
    actuals.*,
    fiscal.fiscal_month as "Fiscal Month",
    fiscal.fiscal_year as "Fiscal Year",
    fiscal.fiscal_week as "Fiscal Week"
FROM
    dbt__cte__actuals_build_delivery__
    actuals
    JOIN dbt__cte__stg_bom_cal_fiscal_30days__
    fiscal
    ON fiscal.bcal_calendar_date = actuals."Completed Date"