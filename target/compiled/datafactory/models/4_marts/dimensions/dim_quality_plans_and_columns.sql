with dbt__cte__src_qa_plan_chars__ as (
SELECT
    plan_id AS qpc_plan_id,
    char_id AS qpc_char_id,
    last_update_date AS qpc_last_update_date,
    last_updated_by AS qpc_last_updated_by,
    result_column_name AS qpc_result_column_name,
    prompt_sequence AS qpc_prompt_sequence,
    prompt AS qpc_prompt,
    creation_date AS qpc_creation_date,
    created_by AS qpc_created_by,
    last_update_login AS qpc_last_update_login,
    enabled_flag AS qpc_enabled_flag,
    mandatory_flag AS qpc_mandatory_flag,
    default_value AS qpc_default_value,
    default_value_id AS qpc_default_value_id,
    values_exist_flag AS qpc_values_exist_flag,
    displayed_flag AS qpc_displayed_flag,
    attribute_category AS qpc_attribute_category,
    decimal_precision AS qpc_decimal_precision,
    read_only_flag AS qpc_read_only_flag,
    ss_poplist_flag AS qpc_ss_poplist_flag,
    information_flag AS qpc_information_flag,
    device_flag AS qpc_device_flag,
    override_flag AS qpc_override_flag,
    zd_edition_name AS qpc_zd_edition_name
FROM
    apps.qa_plan_chars
WHERE
    plan_id IN (
        5166,
        5175, 
        5178,
        5179,
        5191,
        143
    )

ORDER BY plan_id ASC, qpc_result_column_name ASC
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
),  dbt__cte__stg_qa_plan_and_chars__ as (
select 
join1.qp_name,
join1.qp_description,
base.*
from dbt__cte__src_qa_plan_chars__ base
join dbt__cte__src_qa_plans__ join1
on base.qpc_plan_id = join1.qp_plan_id
) select
qp_name,
qp_description,
qp_plan_id,
qpc_result_column_name,
qpc_prompt_sequence,
qpc_prompt,
qp_import_view_name,
qp_organization_id
from 
dbt__cte__stg_qa_plan_and_chars__