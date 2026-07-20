
    
    

with dbt__cte__src_qa_results_rr__reject_reroute__opendef_greaterthan0__ as (
SELECT
    wip_entity_id as rr_wip_entity_id,
    qa_creation_date as rr_qa_creation_date,
    from_op_seq_num as rr_from_op_seq_num,
    character1 as rr_serial_number,
    character3 as rr_wip_insp_result,
    item_id as rr_item_id,
    character55 as rr_open_def,
    occurrence as rr_occurrence
FROM
    apps.qa_results
WHERE
    organization_id = 1213 AND plan_id = 5179 -- results recording nss
    AND (status = 2 OR status IS NULL)
    --and qa_creation_date >= sysdate -90
    and ((character3 = 'R' and character55 > 0) -- wip insp result, open def
    OR character3 = 'RR')
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
),  dbt__cte__stg_qa_results_reject_reroute__wop__ as (
SELECT
stg_base.*,
join1.wop_fm_operation_seq_num,
join1.wop_fm_description
FROM
dbt__cte__src_qa_results_rr__reject_reroute__opendef_greaterthan0__ stg_base
JOIN dbt__cte__src_wip_operations_from__ join1
on stg_base.rr_wip_entity_id = join1.wop_fm_wip_entity_id
and stg_base.rr_from_op_seq_num = wop_fm_operation_seq_num
),  dbt__cte__stg_wip_quality_summary_quality_rejects__ as (
-- declare grain: one row per part number per job per op seq num
SELECT 
'Rejects' feature,
stg_base.rr_item_id,
stg_base.rr_wip_entity_id,
stg_base.rr_from_op_seq_num,
stg_base.wop_fm_description,
standard_hash(stg_base.rr_item_id||stg_base.rr_wip_entity_id||stg_base.rr_from_op_seq_num, 'MD5') as rr_item_id__rr_wip_entity_id__rr_from_op_seq_num_sk,
standard_hash(to_char(stg_base.rr_item_id)||to_char(stg_base.rr_wip_entity_id)||to_char(stg_base.rr_from_op_seq_num)||stg_base.wop_fm_description, 'MD5') as rr_item_id__rr_wip_entity_id__rr_from_op_seq_num__op_desc_sk,
COUNT(stg_base.rr_serial_number) count_serial_number
FROM dbt__cte__stg_qa_results_reject_reroute__wop__ stg_base
WHERE
  rr_wip_insp_result = 'R'
GROUP BY
  stg_base.rr_item_id,
  stg_base.rr_wip_entity_id,
  stg_base.rr_from_op_seq_num,
  stg_base.wop_fm_description
) select
    rr_item_id__rr_wip_entity_id__rr_from_op_seq_num_sk as unique_field,
    count(*) as n_records

from dbt__cte__stg_wip_quality_summary_quality_rejects__
where rr_item_id__rr_wip_entity_id__rr_from_op_seq_num_sk is not null
group by rr_item_id__rr_wip_entity_id__rr_from_op_seq_num_sk
having count(*) > 1


