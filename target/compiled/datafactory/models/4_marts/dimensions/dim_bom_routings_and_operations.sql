with dbt__cte__src_bom_operation_sequences__ as (
SELECT
    operation_sequence_id AS bos_operation_sequence_id,
    routing_sequence_id AS bos_routing_sequence_id,
    operation_seq_num AS bos_operation_seq_num,
    last_update_date AS bos_last_update_date,
    last_updated_by AS bos_last_updated_by,
    creation_date AS bos_creation_date,
    created_by AS bos_created_by,
    last_update_login AS bos_last_update_login,
    department_id AS bos_department_id,
    operation_lead_time_percent AS bos_operation_lead_time_percent,
    minimum_transfer_quantity AS bos_minimum_transfer_quantity,
    count_point_type AS bos_count_point_type,
    operation_description AS bos_operation_description,
    effectivity_date AS bos_effectivity_date,
    backflush_flag AS bos_backflush_flag,
    option_dependent_flag AS bos_option_dependent_flag,
    attribute13 AS bos_attribute13,
    attribute14 AS bos_attribute14,
    request_id AS bos_request_id,
    program_application_id AS bos_program_application_id,
    program_id AS bos_program_id,
    program_update_date AS bos_program_update_date,
    operation_type AS bos_operation_type,
    reference_flag AS bos_reference_flag,
    labor_time_user AS bos_labor_time_user,
    machine_time_user AS bos_machine_time_user,
    total_time_user AS bos_total_time_user,
    include_in_rollup AS bos_include_in_rollup,
    operation_yield_enabled AS bos_operation_yield_enabled,
    implementation_date AS bos_implementation_date,
    eco_for_production AS bos_eco_for_production
FROM
    apps.bom_operation_sequences
),  dbt__cte__src_bom_operational_routings__ as (
SELECT
    routing_sequence_id AS bor_routing_sequence_id,
    assembly_item_id AS bor_assembly_item_id,
    organization_id AS bor_organization_id,
    last_update_date AS bor_last_update_date,
    last_updated_by AS bor_last_updated_by,
    creation_date AS bor_creation_date,
    created_by AS bor_created_by,
    last_update_login AS bor_last_update_login,
    routing_type AS bor_routing_type,
    common_routing_sequence_id AS bor_common_routing_sequence_id,
    completion_subinventory AS bor_completion_subinventory,
    completion_locator_id AS bor_completion_locator_id,
    request_id AS bor_request_id,
    program_application_id AS bor_program_application_id,
    program_id AS bor_program_id,
    program_update_date AS bor_program_update_date,
    cfm_routing_flag AS bor_cfm_routing_flag,
    mixed_model_map_flag AS bor_mixed_model_map_flag,
    ctp_flag AS bor_ctp_flag,
    original_system_reference AS bor_original_system_reference
FROM
    apps.bom_operational_routings
WHERE
    organization_id = 1213
),  dbt__cte__stg_bos_bor__ as (
SELECT 
src_bos.*,
src_bor.*
FROM dbt__cte__src_bom_operation_sequences__ src_bos
JOIN dbt__cte__src_bom_operational_routings__ src_bor
ON src_bos.bos_routing_sequence_id = src_bor.bor_routing_sequence_id
) --declare grain: one row per assembly per routing per operation step
-- column ordering: Surrogate Keys -> Business Keys -> Major Descriptive Attributes (from highest cardinality) 
-- -> Dates Attributes (when) -> minor attributes (hierarchical, lookup codes) 
SELECT
-- standard_hash() -> _sk,
bos_operation_sequence_id,
bos_routing_sequence_id,
bos_operation_seq_num,
bor_assembly_item_id,

bos_effectivity_date,
bor_last_update_date,
bor_creation_date,

bos_department_id,
bos_operation_description,
bor_completion_subinventory
FROM dbt__cte__stg_bos_bor__ base