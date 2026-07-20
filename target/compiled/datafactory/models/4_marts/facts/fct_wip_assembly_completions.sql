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
j1."Part Number",
base.mt44_transaction_date,
base.mt44_transaction_quantity
from dbt__cte__int_wip_assembly_completions__ base
join dbt__cte__dim_item_master__ j
on base.wdj_primary_item_id = j.msib_inventory_item_id
and base.we_organization_id = j.msib_organization_id