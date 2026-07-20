with dbt__cte__src_qa_pc_results_relationship__ as (
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
),  dbt__cte__src_qa_plans__ as (
SELECT
    plan_id AS qp_plan_id,
    NAME AS qp_name,
    description AS qp_description,
    organization_id AS qp_organization_id,
    last_update_date AS qp_last_update_date,
    last_updated_by AS qp_last_updated_by,
    creation_date AS qp_creation_date,
    created_by AS qp_created_by,
    last_update_login AS qp_last_update_login,
    plan_type_code AS qp_plan_type_code,
    import_view_name AS qp_import_view_name,
    instructions AS qp_instructions,
    view_name AS qp_view_name,
    effective_from AS qp_effective_from,
    effective_to AS qp_effective_to
FROM
    apps.qa_plans
WHERE organization_id in (1213,165)
ORDER BY plan_id
) SELECT DISTINCT
    pc_rr_parent_plan_id,
    parent.qp_name,
    parent.qp_description,
    pc_rr_child_plan_id,
    child.qp_name,
    child.qp_description,
    pc_rr_enabled_flag
FROM
    dbt__cte__src_qa_pc_results_relationship__ stg_base
    join dbt__cte__src_qa_plans__ parent
    on pc_rr_parent_plan_id = parent.qp_plan_id
    join dbt__cte__src_qa_plans__ child
    on pc_rr_child_plan_id = child.qp_plan_id
order by pc_rr_parent_plan_id,pc_rr_parent_plan_id