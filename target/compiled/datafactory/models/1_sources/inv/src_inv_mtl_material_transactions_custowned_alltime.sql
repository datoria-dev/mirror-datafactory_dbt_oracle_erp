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
) select 
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