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
),  dbt__cte__src_bom_reference_designators__ as (
SELECT
    attribute14 AS bref_attribute14,
    original_system_reference AS bref_original_system_reference,
    component_reference_designator AS bref_component_reference_designator,
    last_update_date AS bref_last_update_date,
    last_updated_by AS bref_last_updated_by,
    creation_date AS bref_creation_date,
    created_by AS bref_created_by,
    last_update_login AS bref_last_update_login,
    ref_designator_comment AS bref_ref_designator_comment,
    change_notice AS bref_change_notice,
    acd_type as bref_acd_type,
    component_sequence_id AS bref_component_sequence_id,
    request_id AS bref_request_id,
    program_application_id AS bref_program_application_id,
    program_id AS bref_program_id,
    program_update_date AS bref_program_update_date
FROM
    apps.bom_reference_designators
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
),  dbt__cte__stg_msib_mp__ as (
SELECT
  src_msib.*,
  src_mp.*

FROM
    dbt__cte__src_inv_mtl_system_items_b__ src_msib
    JOIN dbt__cte__src_inv_mtl_planners__ src_mp
    on src_msib.msib_planner_code = src_mp.mp_planner_code
    and src_msib.msib_organization_id = src_mp.mp_organization_id
) SELECT
boms.boms_assembly_item_id,
boms.boms_assembly_type,
assy.msib_segment1,
assy.msib_description,
assy.msib_end_assembly_pegging_flag,
assy.mp_description,
boms.boms_bill_sequence_id,
boms.boms_common_bill_sequence_id,
bcomp.bcomp_operation_seq_num,
bcomp.bcomp_component_item_id,
bcomp_component_sequence_id,
comp.msib_segment1,
comp.msib_description,
bref.bref_component_reference_designator,
bref.bref_ref_designator_comment,
bref.bref_attribute14,
comp.msib_end_assembly_pegging_flag,
comp.mp_description,
boms.boms_implementation_date,
boms.boms_last_update_date,
boms.boms_original_system_reference,
boms.boms_effectivity_control,
boms.boms_is_preferred,
assy.mp_planner_code
FROM
dbt__cte__src_bom_structures_b__ boms
JOIN dbt__cte__src_bom_components_b__ bcomp
on boms.boms_bill_sequence_id = bcomp.bcomp_bill_sequence_id
JOIN dbt__cte__src_bom_reference_designators__ bref 
on bcomp.bcomp_component_sequence_id = bref_component_sequence_id
JOIN dbt__cte__stg_msib_mp__ assy
on boms.boms_assembly_item_id = assy.msib_inventory_item_id
and boms.boms_organization_id = assy.msib_organization_id
JOIN dbt__cte__stg_msib_mp__ comp
on bcomp.bcomp_component_item_id = comp.msib_inventory_item_id
where 1=1
and assy.msib_segment1 like '987-2094-004'