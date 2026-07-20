with dbt__cte__src_qa_results_dd__ as (
SELECT
    collection_id AS dd_collection_id,
    occurrence AS dd_occurrence,
    last_update_date AS dd_last_update_date,
    qa_last_update_date AS dd_qa_last_update_date,
    last_updated_by AS dd_last_updated_by,
    qa_last_updated_by AS dd_qa_last_updated_by,
    creation_date AS dd_creation_date,
    qa_creation_date AS dd_qa_creation_date,
    created_by AS dd_created_by,
    qa_created_by AS dd_qa_created_by,
    last_update_login AS dd_last_update_login,
    request_id AS dd_request_id,
    program_application_id AS dd_program_application_id,
    program_id AS dd_program_id,
    program_update_date AS dd_program_update_date,
    transaction_number AS dd_transaction_number,
    txn_header_id AS dd_txn_header_id,
    organization_id AS dd_organization_id,
    plan_id AS dd_plan_id,
    spec_id AS dd_spec_id,
    quantity AS dd_quantity,
    item_id AS dd_item_id,
    wip_entity_id AS dd_wip_entity_id,
    to_op_seq_num AS dd_to_op_seq_num,
    from_op_seq_num AS dd_from_op_seq_num,
    status AS dd_status,
    plan_id || '-' || collection_id || '-' || occurrence dd_plan_collection_occur_ids,
    character1 AS dd_def_detail_id,
    character2 AS dd_defect_detail_insp,
    character3 AS dd_inspector_name,
    character4 AS dd_inspection_date,
    character5 AS dd_insp_result,
    character6 AS dd_assembly_description,
    character7 AS dd_revision_nss,
    character8 AS dd_insp_result_meaning,
    character9 AS dd_wip_record_defect_copy_from_variant,
    character10 AS dd_cr_serial_number,
    character11 AS dd_cr_serial_id,
    character13 AS dd_affected_assembly_material,
    character14 AS dd_cr_affected_assy_sn,
    character15 AS dd_cr_affected_assy_sn_id,
    character16 AS dd_rework_oper,
    character17 AS dd_level_revision,
    character18 AS dd_dt_defect_code,
    character19 AS dd_dt_defect_code_meaning,
    character37 AS dd_save_allowed,
    character38 AS dd_open_def,
    character39 AS dd_print_mat_req,
    character40 AS dd_def_detail_print_count,
    character41 AS dd_print_def_sa,
    character42 AS dd_inspection_source,
    character43 AS dd_updated_source,--26.4 % nonnull 
    character44 AS dd_creation_source,--26.4 % nonnull 
    character45 AS dd_nss_dd_ref_hist,--43.8 % nonnull 
    character47 AS dd_interface_id,
    character48 AS dd_accountable_device,
    comment2 AS dd_problem_description_hist,
    -- NOT included IN recommend_me_columns macro 
    character90 AS dd_non_serial_number,
    character20 AS dd_ref_designator,
    character21 AS dd_comp_item,
    character23 AS dd_problem_description,
    character24 AS dd_caused_by,
    character25 AS dd_caused_by_description,
    character26 AS dd_date_code,
    character27 AS dd_material_used,
    character28 AS dd_nc_location,
    character29 AS dd_nc_size,
    character30 AS dd_reject,
    character31 AS dd_repair_fixed,
    character32 AS dd_vendor_sn,
    character33 AS dd_operator_id,
    character34 AS dd_additional_text,
    character35 AS dd_escaped_by_ci,
    character46 AS dd_rf_id,
    character49 AS dd_component_sn
FROM
    apps.qa_results
WHERE
    organization_id IN (
        1213,
        1273
    ) -- nss and general org id
    AND plan_id = 5166 -- defect details nss
    AND (
        status IS NULL
        OR status = 2
    ) -- In progress or completed forms
),  dbt__cte__src_qa_pc_results_relationship__ as (
SELECT
    parent_plan_id as pc_rr_parent_plan_id,
    parent_collection_id as pc_rr_parent_collection_id,
    parent_occurrence as pc_rr_parent_occurrence,
    child_plan_id as pc_rr_child_plan_id,
    child_collection_id as pc_rr_child_collection_id,
    child_occurrence as pc_rr_child_occurrence,
    enabled_flag as pc_rr_enabled_flag,
    last_update_date as pc_rr_last_update_date,
    last_updated_by as pc_rr_last_updated_by,
    creation_date as pc_rr_creation_date,
    created_by as pc_rr_created_by,
    last_update_login as pc_rr_last_update_login,
    child_txn_header_id as pc_rr_child_txn_header_id
FROM
    apps.qa_pc_results_relationship
),  dbt__cte__stg_qa_dd_pch__ as (
SELECT
stg_qa_dd.*,
src_pc_rr.*
FROM
    dbt__cte__src_qa_results_dd__
    stg_qa_dd
    JOIN dbt__cte__src_qa_pc_results_relationship__
    src_pc_rr
    ON src_pc_rr.pc_rr_child_plan_id = stg_qa_dd.dd_plan_id
    AND src_pc_rr.pc_rr_child_occurrence = stg_qa_dd.dd_occurrence
    AND src_pc_rr.pc_rr_child_collection_id = stg_qa_dd.dd_collection_id
),  dbt__cte__src_qa_results_rr__ as (
SELECT
    wip_entity_id as rr_wip_entity_id,
    character53 as rr_wip_id_ref,
    from_op_seq_num as rr_from_op_seq_num,
    character1 as rr_serial_number,
    character2 as rr_cr_serial_id,
    character3 as rr_wip_insp_result,
    character54 as rr_inspection_source,
    item_id as rr_item_id,
    character4 as rr_description,
    character23 as rr_available_quantity,
    character5 as rr_status,
    character65 as rr_valid_insp_change,
    character6 as rr_valid_insp_result,
    character7 as rr_clean_up_move,
    character8 as rr_status_description,
    character9 as rr_cr_header_id,
    character10 as rr_insp_res,
    character56 as rr_from_op_locked,
    character57 as rr_to_op_locked,
    character11 as rr_prev_insp_result,
    character12 as rr_cr_lock,
    character13 as rr_cr_status_update,
    character61 as rr_def_detail_print_count,
    character59 as rr_print_def_traveler,
    character14 as rr_num_of_def,
    character55 as rr_open_def,
    character15 as rr_num_of_accepts,
    character16 as rr_from_intraop,
    department_id as rr_department_id,
    to_op_seq_num as rr_to_op_seq_num,
    character17 as rr_to_intraop,
    character18 as rr_final_insp_step,
    character19 as rr_prior_insp_comp,
    character64 as rr_future_insp_comp,
    character20 as rr_lst_op_seq,
    character21 as rr_serial_profile,
    character22 as rr_revision,
    quantity as rr_job_quantity,
    character24 as rr_inspection_quantity,
    character25 as rr_serial_inspection_qty,
    character26 as rr_in_queue_qty,
    character27 as rr_running_qty,
    character28 as rr_to_move_qty,
    character29 as rr_rejected_qty,
    character30 as rr_scrapped_qty,
    character31 as rr_comp_qty,
    character32 as rr_org_id_ref,
    character33 as rr_inventory_item_id,
    character34 as rr_fai_status,
    character35 as rr_fai_ship_hold,
    character36 as rr_open_waivers,
    character37 as rr_open_run_and_hold,
    character38 as rr_open_mat_stop,
    character39 as rr_material_hold_comments,
    character40 as rr_config_record_status,
    subinventory as rr_subinventory,
    character41 as rr_launch_create_sn,
    character42 as rr_process_wip,
    comment1 as rr_comments,
    disposition_action as rr_disposition_action,
    character43 as rr_operation,
    character44 as rr_to_operation_code,
    character45 as rr_reason_code,
    character46 as rr_launch_action,
    character47 as rr_action_fired,
    transaction_date as rr_transaction_date,
    disposition_status as rr_disposition_status,
    character48 as rr_disposition_message,
    concurrent_request_id as rr_concurrent_request_id,
    character49 as rr_save_allowed,
    character50 as rr_insp_lot,
    character51 as rr_wip_insp_results_changed_by,
    character52 as rr_inspection_date,
    character58 as rr_leading_zero_fix,
    character60 as rr_scrap_account_alias,
    character62 as rr_creation_source,
    character63 as rr_updated_source,
    plan_id as rr_plan_id,
    occurrence as rr_occurrence,
    collection_id as rr_collection_id,
    program_application_id as rr_program_application_id
FROM
    apps.qa_results
WHERE
    organization_id IN (1213,1273) 
    AND plan_id = 5179 -- results recording nss
    and (status IS NULL OR status = 2)  -- In progress or completed forms (needed for all plan_ids in qa_results)
    and transaction_date >= sysdate - 365
),  dbt__cte__stg_qa_dd_pch_lf_rr__ as (
SELECT
    stg_base.*,
    join1.*
FROM
    dbt__cte__stg_qa_dd_pch__
    stg_base
    LEFT JOIN dbt__cte__src_qa_results_rr__ join1
    ON stg_base.pc_rr_parent_plan_id = join1.rr_plan_id
    AND stg_base.pc_rr_parent_occurrence = join1.rr_occurrence
    AND stg_base.pc_rr_parent_collection_id = join1.rr_collection_id
),  dbt__cte__lu_we_entity_type__ as (
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
),  dbt__cte__stg_qa_dd_pch_lf_rr__stg_we_wdj__ as (
SELECT
stg_base.*,
join1.we_wip_entity_name,
join1.meaning_we_entity_type,
join1.wdj_source_code,
join1.meaning_wdj_status_type,
join1.wdj_class_code,
join1.meaning_wdj_job_type
FROM dbt__cte__stg_qa_dd_pch_lf_rr__ stg_base
JOIN dbt__cte__stg_we_wdj__ join1
ON stg_base.dd_wip_entity_id = join1.we_wip_entity_id
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
),  dbt__cte__src_inv_mtl_planners__ as (
SELECT
  planner_code as mp_planner_code,
  organization_id as mp_organization_id,
  description as mp_description
FROM
  apps.mtl_planners
WHERE
  organization_id = 1213
),  dbt__cte__stg_msib_lf_mp__ as (
SELECT
  src_msib.*,
  src_mp.*

FROM
    dbt__cte__src_inv_mtl_system_items_b__ src_msib
    LEFT JOIN dbt__cte__src_inv_mtl_planners__ src_mp
    on src_msib.msib_planner_code = src_mp.mp_planner_code
    and src_msib.msib_organization_id = src_mp.mp_organization_id
) SELECT
stg_base.*,
join1.*
FROM dbt__cte__stg_qa_dd_pch_lf_rr__stg_we_wdj__ stg_base
LEFT JOIN dbt__cte__stg_msib_lf_mp__ join1
ON stg_base.dd_item_id = join1.msib_inventory_item_id