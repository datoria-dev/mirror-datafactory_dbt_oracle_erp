with dbt__cte__lu_mtl_txn_source_types__ as (
SELECT
    transaction_source_type_id tst_transaction_source_type_id,
    transaction_source_type_name tst_transaction_source_type_name,
    description tst_description,
    last_update_date tst_last_update_date,
    last_updated_by tst_last_updated_by,
    creation_date tst_creation_date,
    created_by tst_created_by,
    disable_date tst_disable_date,
    user_defined_flag tst_user_defined_flag,
    validated_flag tst_validated_flag
FROM
    inv.mtl_txn_source_types
order by transaction_source_type_id asc
),  dbt__cte__src_inv_mtl_reservations__ as (
SELECT
    reservation_id AS mr_reservation_id,
    lu2.tst_transaction_source_type_name AS mr_orig_demand_source_type_name,
    orig_demand_source_header_id AS mr_orig_demand_source_header_id,
    orig_demand_source_type_id AS mr_orig_demand_source_type_id,

    lu3.tst_transaction_source_type_name AS mr_demand_source_type_name,
    demand_source_header_id AS mr_demand_source_header_id,
    demand_source_type_id AS mr_demand_source_type_id,

    lu.tst_transaction_source_type_name AS mr_orig_supply_source_type_name,
    orig_supply_source_header_id AS mr_orig_supply_source_header_id,
    orig_supply_source_type_id AS mr_orig_supply_source_type_id,

    lu4.tst_transaction_source_type_name AS mr_supply_source_type_name,
    supply_source_header_id AS mr_supply_source_header_id,
    supply_source_type_id AS mr_supply_source_type_id,
    
    requirement_date AS mr_requirement_date,
    orig_demand_source_line_id AS mr_orig_demand_source_line_id,
    secondary_detailed_quantity AS mr_secondary_detailed_quantity,
    serial_reservation_quantity AS mr_serial_reservation_quantity,
    inventory_item_id AS mr_inventory_item_id,
    demand_source_line_id AS mr_demand_source_line_id,
    primary_uom_code AS mr_primary_uom_code,
    reservation_uom_code AS mr_reservation_uom_code,
    reservation_quantity AS mr_reservation_quantity,
    ship_ready_flag AS mr_ship_ready_flag,
    primary_reservation_quantity AS mr_primary_reservation_quantity,
    subinventory_code AS mr_subinventory_code,
    locator_id AS mr_locator_id,
    last_update_date AS mr_last_update_date,
    last_updated_by AS mr_last_updated_by,
    creation_date AS mr_creation_date,
    created_by AS mr_created_by,
    last_update_login AS mr_last_update_login,
    request_id AS mr_request_id,
    program_application_id AS mr_program_application_id,
    program_id AS mr_program_id,
    program_update_date AS mr_program_update_date,
    n_column1 AS mr_n_column1,
    detailed_quantity AS mr_detailed_quantity,
    organization_id AS mr_organization_id,
    staged_flag AS mr_staged_flag
FROM
    apps.mtl_reservations
join dbt__cte__lu_mtl_txn_source_types__ lu
on orig_supply_source_type_id = lu.tst_transaction_source_type_id
join dbt__cte__lu_mtl_txn_source_types__ lu2
on orig_demand_source_type_id = lu2.tst_transaction_source_type_id
join dbt__cte__lu_mtl_txn_source_types__ lu3
on demand_source_type_id = lu3.tst_transaction_source_type_id
join dbt__cte__lu_mtl_txn_source_types__ lu4
on supply_source_type_id = lu4.tst_transaction_source_type_id
WHERE
    organization_id = 1213
),  dbt__cte__src_inv_mtl_sales_orders__ as (
SELECT
    sales_order_id AS mso_sales_order_id,
    last_update_date AS mso_last_update_date,
    last_updated_by AS mso_last_updated_by,
    segment1 AS mso_segment1,
    segment2 AS mso_segment2,
    segment3 AS mso_segment3,
    summary_flag AS mso_summary_flag,
    enabled_flag AS mso_enabled_flag
FROM
    apps.mtl_sales_orders
) -- Business Process: Tracking inventory reservations to supply the demand coming from open sales orders with line number
select 
mso_segment1,
mso_segment2,
mso_sales_order_id,
mr_demand_source_header_id,
mr_demand_source_type_name,
mr_demand_source_type_id,
mr_demand_source_line_id,
mr_supply_source_header_id,
mr_supply_source_type_name,
mr_supply_source_type_id,
mr_requirement_date,
mr_reservation_quantity,
mr_ship_ready_flag

from dbt__cte__src_inv_mtl_reservations__ stg_base
join dbt__cte__src_inv_mtl_sales_orders__ join1 -- only demand from Sales Orders.
on stg_base.mr_demand_source_header_id = join1.mso_sales_order_id