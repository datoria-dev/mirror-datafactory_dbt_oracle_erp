with dbt__cte__src_inv_mtl_system_items_b__ as (
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
),  dbt__cte__src_inv_mtl_item_locations__ as (
SELECT
    subinventory_code AS mil_subinventory_code,
    inventory_item_id AS mil_inventory_item_id,
    availability_type AS mil_availability_type,
    inventory_atp_code AS mil_inventory_atp_code,
    reservable_type AS mil_reservable_type,
    inventory_location_id AS mil_inventory_location_id,
    organization_id AS mil_organization_id,
    last_update_date AS mil_last_update_date,
    last_updated_by AS mil_last_updated_by,
    creation_date AS mil_creation_date,
    created_by AS mil_created_by,
    last_update_login AS mil_last_update_login,
    inventory_location_type AS mil_inventory_location_type,
    segment1 AS mil_segment1,
    segment19 AS mil_segment19,
    segment20 AS mil_segment20,
    summary_flag AS mil_summary_flag,
    enabled_flag AS mil_enabled_flag,
    project_id AS mil_project_id,
    task_id AS mil_task_id,
    physical_location_id AS mil_physical_location_id,
    status_id AS mil_status_id,
    location_current_units AS mil_location_current_units,
    empty_flag AS mil_empty_flag,
    mixed_items_flag AS mil_mixed_items_flag
FROM
    apps.mtl_item_locations
WHERE
    organization_id = 1213
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
),  dbt__cte__lu_mtl_transaction_reasons__ as (
SELECT
    reason_id AS lu_mtl_tr_reason_id,
    reason_name AS lu_mtl_tr_reason_name,
    description AS lu_mtl_tr_description,
    last_update_date AS lu_mtl_tr_last_update_date,
    last_updated_by AS lu_mtl_tr_last_updated_by,
    creation_date AS lu_mtl_tr_creation_date,
    created_by AS lu_mtl_tr_created_by,
    last_update_login AS lu_mtl_tr_last_update_login
FROM
    apps.mtl_transaction_reasons
ORDER BY
    lu_mtl_tr_reason_id ASC
),  dbt__cte__src_inv_mtl_material_transactions_custowned_alltime__ as (
select 
transaction_quantity as custowned_transaction_quantity,
transaction_date as custowned_transaction_date,
organization_id as custowned_organization_id,
transaction_source_id AS custowned_transaction_source_id,
transaction_id AS custowned_transaction_id,
transaction_type_id as custowned_transaction_type_id,
locator_id AS custowned_locator_id,
subinventory_code as custowned_subinventory_code,
inventory_item_id as custowned_inventory_item_id,
transaction_reference as custowned_transaction_reference,
reason_id AS custowned_reason_id,
lu.lu_mtl_tt_transaction_type_name,
lu.lu_mtl_tt_description,
lu_mtl_tr_reason_id,
lu_mtl_tr_reason_name,
lu_mtl_tr_description
from apps.mtl_material_transactions 
left join dbt__cte__lu_mtl_transaction_types__ lu
on transaction_type_id = lu.lu_mtl_tt_transaction_type_id
left join dbt__cte__lu_mtl_transaction_reasons__
on reason_id = lu_mtl_tr_reason_id
where organization_id = 1213 and subinventory_code like 'CUSTOWNED'
),  dbt__cte__stg_mt_custowned_mil__ as (
select
src_mil.*,
src_mt_custowned_alltime.*
from dbt__cte__src_inv_mtl_item_locations__ src_mil
join dbt__cte__src_inv_mtl_material_transactions_custowned_alltime__ src_mt_custowned_alltime
on src_mil.mil_inventory_location_id = src_mt_custowned_alltime.custowned_locator_id
) SELECT
    stg_base.*,
    stg_join1.*
FROM
    dbt__cte__stg_msib_lf_mp__
    stg_base
    JOIN dbt__cte__stg_mt_custowned_mil__
    stg_join1
    ON stg_base.msib_organization_id = stg_join1.custowned_organization_id
    AND stg_base.msib_inventory_item_id = stg_join1.custowned_inventory_item_id