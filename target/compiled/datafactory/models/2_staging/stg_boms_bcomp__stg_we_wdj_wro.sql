with dbt__cte__lu_bom_structure_types_b__ as (
SELECT
    structure_type_id AS lu_bstb_structure_type_id,
    structure_type_name AS lu_bstb_structure_type_name,
    effective_date AS lu_bstb_effective_date,
    disable_date AS lu_bstb_disable_date,
    parent_structure_type_id AS lu_bstb_parent_structure_type_id,
    allow_subtypes AS lu_bstb_allow_subtypes
FROM
apps.bom_structure_types_b
),  dbt__cte__src_bom_structures_b__ as (
SELECT
    source_bill_sequence_id AS boms_source_bill_sequence_id,
    assembly_item_id AS boms_assembly_item_id,
    organization_id AS boms_organization_id,
    last_update_date AS boms_last_update_date,
    last_updated_by AS boms_last_updated_by,
    creation_date AS boms_creation_date,
    created_by AS boms_created_by,
    last_update_login AS boms_last_update_login,
    assembly_type AS boms_assembly_type,
    common_bill_sequence_id AS boms_common_bill_sequence_id,
    bill_sequence_id AS boms_bill_sequence_id,
    request_id AS boms_request_id,
    program_application_id AS boms_program_application_id,
    program_id AS boms_program_id,
    program_update_date AS boms_program_update_date,
    original_system_reference AS boms_original_system_reference,
    structure_type_id AS boms_structure_type_id,
    lu_bstb_structure_type_name,
    implementation_date AS boms_implementation_date,
    pk1_value AS boms_pk1_value,
    pk2_value AS boms_pk2_value,
    effectivity_control AS boms_effectivity_control,
    is_preferred AS boms_is_preferred
FROM
    apps.bom_structures_b
join dbt__cte__lu_bom_structure_types_b__ 
on structure_type_id = lu_bstb_structure_type_id
WHERE
    organization_id = 1213
),  dbt__cte__src_bom_components_b__ as (
SELECT
    pk2_value AS bcomp_pk2_value,
    from_object_revision_id AS bcomp_from_object_revision_id,
    from_minor_revision_id AS bcomp_from_minor_revision_id,
    operation_seq_num AS bcomp_operation_seq_num,
    component_item_id AS bcomp_component_item_id,
    last_update_date AS bcomp_last_update_date,
    last_updated_by AS bcomp_last_updated_by,
    creation_date AS bcomp_creation_date,
    created_by AS bcomp_created_by,
    last_update_login AS bcomp_last_update_login,
    item_num AS bcomp_item_num,
    component_quantity AS bcomp_component_quantity,
    component_yield_factor AS bcomp_component_yield_factor,
    effectivity_date AS bcomp_effectivity_date,
    change_notice AS bcomp_change_notice,
    implementation_date AS bcomp_implementation_date,
    disable_date AS bcomp_disable_date,
    attribute13 AS bcomp_attribute13,
    attribute14 AS bcomp_attribute14,
    attribute15 AS bcomp_attribute15,
    planning_factor AS bcomp_planning_factor,
    quantity_related AS bcomp_quantity_related,
    so_basis AS bcomp_so_basis,
    optional AS bcomp_optional,
    mutually_exclusive_options AS bcomp_mutually_exclusive_options,
    include_in_cost_rollup AS bcomp_include_in_cost_rollup,
    check_atp AS bcomp_check_atp,
    shipping_allowed AS bcomp_shipping_allowed,
    required_to_ship AS bcomp_required_to_ship,
    required_for_revenue AS bcomp_required_for_revenue,
    include_on_ship_docs AS bcomp_include_on_ship_docs,
    acd_type AS bcomp_acd_type,
    component_sequence_id AS bcomp_component_sequence_id,
    bill_sequence_id AS bcomp_bill_sequence_id,
    request_id AS bcomp_request_id,
    program_application_id AS bcomp_program_application_id,
    program_id AS bcomp_program_id,
    program_update_date AS bcomp_program_update_date,
    pick_components AS bcomp_pick_components,
    revised_item_sequence_id AS bcomp_revised_item_sequence_id,
    bom_item_type AS bcomp_bom_item_type,
    original_system_reference AS bcomp_original_system_reference,
    eco_for_production AS bcomp_eco_for_production,
    enforce_int_requirements AS bcomp_enforce_int_requirements,
    auto_request_material AS bcomp_auto_request_material,
    obj_name as bcomp_obj_name, -- >90% nulls. added due to eTRM indicating as PK
    overlapping_changes as bcomp_overlapping_changes, -- >90% nulls. added due to eTRM indicating as PK
    pk1_value AS bcomp_pk1_value
FROM
    apps.bom_components_b
),  dbt__cte__stg_boms_bcomp__ as (
SELECT
boms.*,
bcomp.*
FROM
dbt__cte__src_bom_structures_b__ boms
JOIN dbt__cte__src_bom_components_b__ bcomp
on boms.boms_bill_sequence_id = bcomp.bcomp_bill_sequence_id
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
),  dbt__cte__src_wip_requirement_operations__ as (
SELECT
  inventory_item_id wro_inventory_item_id,
  organization_id wro_organization_id,
  wip_entity_id wro_wip_entity_id,
  operation_seq_num wro_operation_seq_num,
  last_update_date wro_last_update_date,
  last_updated_by wro_last_updated_by,
  creation_date wro_creation_date,
  created_by wro_created_by,
  department_id wro_department_id,
  wip_supply_type wro_wip_supply_type,
  date_required wro_date_required,
  required_quantity wro_required_quantity,
  quantity_issued wro_quantity_issued,
  quantity_per_assembly wro_quantity_per_assembly,
  supply_subinventory wro_supply_subinventory,
  supply_locator_id wro_supply_locator_id,
  mrp_net_flag wro_mrp_net_flag,
  mps_required_quantity wro_mps_required_quantity,
  mps_date_required wro_mps_date_required,
  quantity_allocated wro_quantity_allocated,
  quantity_backordered wro_quantity_backordered,
  quantity_relieved wro_quantity_relieved,
  released_quantity wro_released_quantity,
  suggested_vendor_name wro_suggested_vendor_name,
  vendor_id wro_vendor_id,
  primary_component_id wro_primary_component_id,
  component_sequence_id wro_component_sequence_id,
  component_yield_factor wro_component_yield_factor
FROM
  apps.wip_requirement_operations
WHERE
  organization_id = 1213
),  dbt__cte__stg_we_wdj_wro__ as (
SELECT
    stg_base.*,
    src_wro.* 

FROM
    dbt__cte__stg_we_wdj__
    stg_base
    JOIN dbt__cte__src_wip_requirement_operations__
    src_wro
    ON stg_base.we_wip_entity_id = src_wro.wro_wip_entity_id
    AND stg_base.we_organization_id = src_wro.wro_organization_id
) SELECT
stg_base.*,
join1.*

FROM
dbt__cte__stg_boms_bcomp__ stg_base
JOIN dbt__cte__stg_we_wdj_wro__ join1
on stg_base.bcomp_component_sequence_id = join1.wro_component_sequence_id