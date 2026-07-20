with dbt__cte__lu_mtl_transaction_types__ as (
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
),  dbt__cte__src_inv_mtl_material_transactions_wip_issuances__ as (
SELECT
    transaction_id AS mt_transaction_id,
    last_update_date AS mt_last_update_date,
    last_updated_by AS mt_last_updated_by,
    creation_date AS mt_creation_date,
    created_by AS mt_created_by,
    last_update_login AS mt_last_update_login,
    request_id AS mt_request_id,
    program_application_id AS mt_program_application_id,
    program_id AS mt_program_id,
    program_update_date AS mt_program_update_date,
    inventory_item_id AS mt_inventory_item_id,
    organization_id AS mt_organization_id,
    subinventory_code AS mt_subinventory_code,
    locator_id AS mt_locator_id,
    transaction_type_id AS mt_transaction_type_id,
    transaction_action_id AS mt_transaction_action_id,
    transaction_source_type_id AS mt_transaction_source_type_id,
    transaction_source_id AS mt_transaction_source_id,
    transaction_source_name AS mt_transaction_source_name,
    transaction_quantity AS mt_transaction_quantity,
    transaction_uom AS mt_transaction_uom,
    primary_quantity AS mt_primary_quantity,
    transaction_date AS mt_transaction_date,
    acct_period_id AS mt_acct_period_id,
    transaction_reference AS mt_transaction_reference,
    cost_update_id AS mt_cost_update_id,
    actual_cost AS mt_actual_cost,
    prior_cost AS mt_prior_cost,
    new_cost AS mt_new_cost,
    currency_conversion_type AS mt_currency_conversion_type,
    quantity_adjusted AS mt_quantity_adjusted,
    department_id AS mt_department_id,
    operation_seq_num AS mt_operation_seq_num,
    trx_source_line_id AS mt_trx_source_line_id,
    transfer_transaction_id AS mt_transfer_transaction_id,
    transaction_set_id AS mt_transaction_set_id,
    move_transaction_id AS mt_move_transaction_id,
    source_code AS mt_source_code,
    source_line_id AS mt_source_line_id,
    transfer_organization_id AS mt_transfer_organization_id,
    transfer_subinventory AS mt_transfer_subinventory,
    cost_group_id AS mt_cost_group_id,
    transfer_cost_group_id AS mt_transfer_cost_group_id,
    mvt_stat_status AS mt_mvt_stat_status,
    move_order_line_id AS mt_move_order_line_id,
    pick_rule_id AS mt_pick_rule_id,
    organization_type AS mt_organization_type,
    transfer_organization_type AS mt_transfer_organization_type,
    owning_organization_id AS mt_owning_organization_id,
    owning_tp_type AS mt_owning_tp_type,
    xfr_owning_organization_id AS mt_xfr_owning_organization_id,
    transfer_owning_tp_type AS mt_transfer_owning_tp_type,
    planning_organization_id AS mt_planning_organization_id,
    planning_tp_type AS mt_planning_tp_type,
    xfr_planning_organization_id AS mt_xfr_planning_organization_id,
    transfer_planning_tp_type AS mt_transfer_planning_tp_type,
    transaction_mode AS mt_transaction_mode,
    transaction_batch_id AS mt_transaction_batch_id,
    transaction_batch_seq AS mt_transaction_batch_seq,
    reason_id AS mt_reason_id,
    transfer_price AS mt_transfer_price,
    lu_mtl_tt_transaction_type_name,
    lu_mtl_tt_description
FROM
    apps.mtl_material_transactions
LEFT JOIN dbt__cte__lu_mtl_transaction_types__ lu
ON transaction_type_id = lu.lu_mtl_tt_transaction_type_id
WHERE
    organization_id = 1213
    and transaction_date >= sysdate - 365
    and transaction_type_id = 35 -- wip issuance (consumptions)
),  dbt__cte__stg_mt_wip_issuance_daily__ as (
select
sum(mt_transaction_quantity) mt_transaction_quantity,
mt_inventory_item_id,
trunc(mt_transaction_date) mt_transaction_date
from dbt__cte__src_inv_mtl_material_transactions_wip_issuances__ src

group by mt_inventory_item_id,
trunc(mt_transaction_date)
),  dbt__cte__lu_bom_structure_types_b__ as (
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
),  dbt__cte__int_material_transactions_bom_components__ as (
select *
from dbt__cte__stg_mt_wip_issuance_daily__ stg
join ( select distinct bcomp_pk1_value from dbt__cte__stg_boms_bcomp__ ) bom_components
on stg.mt_inventory_item_id = bom_components.bcomp_pk1_value
),  dbt__cte__src_inv_mtl_item_categories__ as (
SELECT
    inventory_item_id AS mic_inventory_item_id,
    organization_id AS mic_organization_id,
    category_set_id AS mic_category_set_id,
    category_id AS mic_category_id,
    last_update_date AS mic_last_update_date,
    creation_date AS mic_creation_date
FROM
    apps.mtl_item_categories
WHERE
    organization_id = 1213
),  dbt__cte__src_inv_mtl_category_sets_b__ as (
SELECT
    category_set_id AS mcs_category_set_id,
    structure_id AS mcs_structure_id,
    validate_flag AS mcs_validate_flag,
    control_level AS mcs_control_level,
    default_category_id AS mcs_default_category_id,
    last_update_date AS mcs_last_update_date,
    creation_date AS mcs_creation_date,
    mult_item_cat_assign_flag AS mcs_mult_item_cat_assign_flag
FROM
    apps.mtl_category_sets_b
),  dbt__cte__src_inv_mtl_category_sets_tl__ as (
SELECT
    category_set_id AS mcst_category_set_id,
    LANGUAGE AS mcst_language,
    source_lang AS mcst_source_lang,
    category_set_name AS mcst_category_set_name,
    description AS mcst_description,
    last_update_date AS mcst_last_update_date,
    creation_date AS mcst_creation_date
FROM
    apps.mtl_category_sets_tl
),  dbt__cte__src_inv_mtl_categories_b__ as (
SELECT
    category_id AS mc_category_id,
    structure_id AS mc_structure_id,
    description AS mc_description,
    disable_date AS mc_disable_date,
    segment1 AS mc_segment1,
    segment2 AS mc_segment2,
    summary_flag AS mc_summary_flag,
    enabled_flag AS mc_enabled_flag,
    last_update_date AS mc_last_update_date,
    creation_date AS mc_creation_date
FROM
    apps.mtl_categories_b
),  dbt__cte__src_fnd_lookup_values__ as (
SELECT
    lookup_code,
    lookup_type,
    meaning
FROM apps.fnd_lookup_values
),  dbt__cte__stg_mtl_mic_mcs_mcst_mc__ as (
-- declare grain (without the group by): One row per item id per category set name
-- with the group by: one row per item id
SELECT
src_mic.mic_inventory_item_id,
src_mic.mic_organization_id, 
max(case when mcst_category_set_name like 'PROGRAM_DEFAULT' then mc_segment1 end ) as  program_name,
max(case when mcst_category_set_name like 'MATERIAL HANDLING CODE' then mc_segment1 end ) as  material_handling_code,
max(case when mcst_category_set_name like 'PO ITEMS CATEGORY' then mc_segment1 end ) as  purchasing_commodity_code,
max(case when mcst_category_set_name like 'LAB OFFICE CODE' then mc_segment1 end ) as  lab_office_code,
max(case when mcst_category_set_name like 'ESD CODE' then mc_segment1 end ) as  esd_code,
max(case when mcst_category_set_name like 'FAI Program Code' then mc_segment1 end ) as  fai_program_code,
max(case when mcst_category_set_name like 'EQUIPMENT DESCRIPTION' then mc_segment1 end ) as  equipment_description,
max(case when mcst_category_set_name like 'CONFIG RECORD COMPONENT' then mc_segment1 end ) as  config_record_component,
max(case when mcst_category_set_name like 'TINNING CODE' then mc_segment1 end ) as  tinning_code,
max(case when mcst_category_set_name like 'Key Characteristic' then mc_segment1 end ) as  key_characteristic
FROM dbt__cte__src_inv_mtl_item_categories__ src_mic
INNER JOIN dbt__cte__src_inv_mtl_category_sets_b__ src_mcs
ON src_mic.mic_category_set_id = src_mcs.mcs_category_set_id
INNER JOIN dbt__cte__src_inv_mtl_category_sets_tl__ src_mcst
ON src_mcs.mcs_category_set_id = src_mcst.mcst_category_set_id
and src_mcst.mcst_language = userenv('LANG') -- PK mcst.language
INNER JOIN dbt__cte__src_inv_mtl_categories_b__ src_mc
ON src_mic.mic_category_id = src_mc.mc_category_id
INNER JOIN dbt__cte__src_fnd_lookup_values__ LU1
ON src_mcs.mcs_control_level = lu1.lookup_code
AND lu1.lookup_type = 'ITEM_CONTROL_LEVEL_GUI'
WHERE
src_mic.mic_organization_id = 1213
and src_mcst.mcst_category_set_name IN  
('PROGRAM_DEFAULT','MATERIAL HANDLING CODE', 
'PO ITEMS CATEGORY','LAB OFFICE CODE','ESD CODE','FAI Program Code',
'EQUIPMENT DESCRIPTION','CONFIG RECORD COMPONENT','TINNING CODE','Key Characteristic')
group by 
src_mic.mic_inventory_item_id,
src_mic.mic_organization_id
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
),  dbt__cte__int_item_program_details__ as (
select 
int_base.*,
case when int_base.material_handling_code like 'OUTPUT CREDIT' then 1 else 0 end is_plus_tl,
stg_join1.msib_organization_id,
stg_join1.msib_inventory_item_id,
stg_join1.msib_segment1,
stg_join1.msib_description,
stg_join1.msib_end_assembly_pegging_flag,
stg_join1.msib_inventory_item_status_code,
stg_join1.msib_planner_code,
stg_join1.msib_planning_make_buy_code,
stg_join1.msib_full_lead_time,
stg_join1.mp_planner_code,
stg_join1.mp_description

FROM dbt__cte__stg_mtl_mic_mcs_mcst_mc__ int_base
JOIN dbt__cte__stg_msib_lf_mp__ stg_join1
on int_base.mic_inventory_item_id = stg_join1.msib_inventory_item_id
and int_base.mic_organization_id = stg_join1.msib_organization_id
),  dbt__cte__dim_item_master__ as (
-- dimension grain: one row per inventory item id per organization id
-- Column ordering: Surrogate Keys, Business/Natural Keys, major descriptive attribute (highest cardinality), Date Attributes (the when), Hierarchical attributes (lower cardinality)
select
standard_hash(base.msib_inventory_item_id || base.msib_organization_id, 'MD5') item_master_sk,
msib_inventory_item_id,
msib_organization_id,
msib_segment1 AS "Part Number",
msib_description AS "Part Description",
mp_description  AS "Planner",
program_name AS "Program",
is_plus_tl AS "Plus TL Flag",
msib_inventory_item_status_code AS "Item Status",
purchasing_commodity_code AS "Purchasing Commodity Code",
lab_office_code AS "Lab Office Code",
mp_planner_code AS "Planner Code",
msib_full_lead_time AS "Full Lead Time",
msib_planning_make_buy_code AS "Make Buy Code",
msib_end_assembly_pegging_flag AS "End Assy Pegging Flag",
esd_code,
fai_program_code,
equipment_description,
config_record_component,
tinning_code,
key_characteristic
from dbt__cte__int_item_program_details__ base
) -- one row per part number per day
select
j."Part Number",
int.mt_transaction_date,
int.mt_transaction_quantity
from dbt__cte__int_material_transactions_bom_components__ int
join dbt__cte__dim_item_master__ j
on int.mt_inventory_item_id = j.msib_inventory_item_id