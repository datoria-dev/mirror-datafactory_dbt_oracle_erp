
    
    

with dbt__cte__src_qa_results_rr__reject_reroute__opendef_greaterthan0__ as (
SELECT
    wip_entity_id as rr_wip_entity_id,
    qa_creation_date as rr_qa_creation_date,
    from_op_seq_num as rr_from_op_seq_num,
    character1 as rr_serial_number,
    character3 as rr_wip_insp_result,
    item_id as rr_item_id,
    character55 as rr_open_def,
    occurrence as rr_occurrence
FROM
    apps.qa_results
WHERE
    organization_id = 1213 AND plan_id = 5179 -- results recording nss
    AND (status = 2 OR status IS NULL)
    --and qa_creation_date >= sysdate -90
    and ((character3 = 'R' and character55 > 0) -- wip insp result, open def
    OR character3 = 'RR')
),  dbt__cte__src_wip_operations_from__ as (
SELECT
  actual_completion_date AS wop_fm_actual_completion_date,
  check_skill AS wop_fm_check_skill,
  wip_entity_id AS wop_fm_wip_entity_id,
  operation_seq_num AS wop_fm_operation_seq_num,
  organization_id AS wop_fm_organization_id,
  last_update_date AS wop_fm_last_update_date,
  last_updated_by AS wop_fm_last_updated_by,
  creation_date AS wop_fm_creation_date,
  created_by AS wop_fm_created_by,
  last_update_login AS wop_fm_last_update_login,
  request_id AS wop_fm_request_id,
  program_application_id AS wop_fm_program_application_id,
  program_id AS wop_fm_program_id,
  program_update_date AS wop_fm_program_update_date,
  operation_sequence_id AS wop_fm_operation_sequence_id,
  department_id AS wop_fm_department_id,
  description AS wop_fm_description,
  scheduled_quantity AS wop_fm_scheduled_quantity,
  quantity_in_queue AS wop_fm_quantity_in_queue,
  quantity_running AS wop_fm_quantity_running,
  quantity_waiting_to_move AS wop_fm_quantity_waiting_to_move,
  quantity_rejected AS wop_fm_quantity_rejected,
  quantity_scrapped AS wop_fm_quantity_scrapped,
  quantity_completed AS wop_fm_quantity_completed,
  first_unit_start_date AS wop_fm_first_unit_start_date,
  first_unit_completion_date AS wop_fm_first_unit_completion_date,
  last_unit_start_date AS wop_fm_last_unit_start_date,
  last_unit_completion_date AS wop_fm_last_unit_completion_date,
  previous_operation_seq_num AS wop_fm_previous_operation_seq_num,
  next_operation_seq_num AS wop_fm_next_operation_seq_num,
  count_point_type AS wop_fm_count_point_type,
  backflush_flag AS wop_fm_backflush_flag,
  minimum_transfer_quantity AS wop_fm_minimum_transfer_quantity,
  date_last_moved AS wop_fm_date_last_moved,
  attribute5 AS wop_fm_attribute5,
  cumulative_scrap_quantity AS wop_fm_cumulative_scrap_quantity
FROM
  apps.wip_operations
WHERE
  organization_id = 1213
  AND first_unit_start_date >= sysdate - 365
),  dbt__cte__stg_qa_results_reject_reroute__wop__ as (
SELECT
stg_base.*,
join1.wop_fm_operation_seq_num,
join1.wop_fm_description
FROM
dbt__cte__src_qa_results_rr__reject_reroute__opendef_greaterthan0__ stg_base
JOIN dbt__cte__src_wip_operations_from__ join1
on stg_base.rr_wip_entity_id = join1.wop_fm_wip_entity_id
and stg_base.rr_from_op_seq_num = wop_fm_operation_seq_num
),  dbt__cte__stg_wip_quality_summary_quality_rejects__ as (
-- declare grain: one row per part number per job per op seq num
SELECT 
'Rejects' feature,
stg_base.rr_item_id,
stg_base.rr_wip_entity_id,
stg_base.rr_from_op_seq_num,
stg_base.wop_fm_description,
standard_hash(stg_base.rr_item_id||stg_base.rr_wip_entity_id||stg_base.rr_from_op_seq_num, 'MD5') as rr_item_id__rr_wip_entity_id__rr_from_op_seq_num_sk,
standard_hash(to_char(stg_base.rr_item_id)||to_char(stg_base.rr_wip_entity_id)||to_char(stg_base.rr_from_op_seq_num)||stg_base.wop_fm_description, 'MD5') as rr_item_id__rr_wip_entity_id__rr_from_op_seq_num__op_desc_sk,
COUNT(stg_base.rr_serial_number) count_serial_number
FROM dbt__cte__stg_qa_results_reject_reroute__wop__ stg_base
WHERE
  rr_wip_insp_result = 'R'
GROUP BY
  stg_base.rr_item_id,
  stg_base.rr_wip_entity_id,
  stg_base.rr_from_op_seq_num,
  stg_base.wop_fm_description
),  dbt__cte__lu_mtl_txn_source_types__ as (
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
),  dbt__cte__stg_mr_mso__ as (
-- Business Process: Tracking inventory reservations to supply the demand coming from open sales orders with line number
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
),  dbt__cte__src_oe_order_lines_all__ as (
SELECT
    creation_date AS oel_creation_date,
    created_by AS oel_created_by,
    last_update_date AS oel_last_update_date,
    last_updated_by AS oel_last_updated_by,
    last_update_login AS oel_last_update_login,
    item_type_code AS oel_item_type_code,
    option_flag AS oel_option_flag,
    visible_demand_flag AS oel_visible_demand_flag,
    line_category_code AS oel_line_category_code,
    actual_shipment_date AS oel_actual_shipment_date,
    ato_line_id AS oel_ato_line_id,
    schedule_arrival_date AS oel_schedule_arrival_date,
    schedule_status_code AS oel_schedule_status_code,
    source_type_code AS oel_source_type_code,
    cancelled_flag AS oel_cancelled_flag,
    open_flag AS oel_open_flag,
    booked_flag AS oel_booked_flag,
    salesrep_id AS oel_salesrep_id,
    return_reason_code AS oel_return_reason_code,
    split_from_line_id AS oel_split_from_line_id,
    ordered_item_id AS oel_ordered_item_id,
    item_identifier_type AS oel_item_identifier_type,
    shipping_interfaced_flag AS oel_shipping_interfaced_flag,
    order_source_id AS oel_order_source_id,
    customer_line_number AS oel_customer_line_number,
    fulfilled_flag AS oel_fulfilled_flag,
    ship_tolerance_above AS oel_ship_tolerance_above,
    ship_tolerance_below AS oel_ship_tolerance_below,
    inventory_item_id AS oel_inventory_item_id,
    tax_date AS oel_tax_date,
    tax_code AS oel_tax_code,
    invoice_interface_status_code AS oel_invoice_interface_status_code,
    demand_class_code AS oel_demand_class_code,
    price_list_id AS oel_price_list_id,
    pricing_date AS oel_pricing_date,
    shipment_number AS oel_shipment_number,
    shipment_priority_code AS oel_shipment_priority_code,
    shipping_method_code AS oel_shipping_method_code,
    freight_carrier_code AS oel_freight_carrier_code,
    freight_terms_code AS oel_freight_terms_code,
    fob_point_code AS oel_fob_point_code,
    payment_term_id AS oel_payment_term_id,
    invoicing_rule_id AS oel_invoicing_rule_id,
    accounting_rule_id AS oel_accounting_rule_id,
    source_document_type_id AS oel_source_document_type_id,
    orig_sys_document_ref AS oel_orig_sys_document_ref,
    source_document_id AS oel_source_document_id,
    orig_sys_line_ref AS oel_orig_sys_line_ref,
    source_document_line_id AS oel_source_document_line_id,
    unit_selling_price AS oel_unit_selling_price,
    unit_list_price AS oel_unit_list_price,
    tax_value AS oel_tax_value,
    CONTEXT AS oel_context,
    attribute4 AS oel_attribute4,
    attribute5 AS oel_attribute5,
    attribute6 AS oel_attribute6,
    attribute8 AS oel_attribute8,
    attribute9 AS oel_attribute9,
    attribute10 AS oel_attribute10,
    attribute11 AS oel_attribute11,
    attribute15 AS oel_attribute15,
    line_id AS oel_line_id,
    org_id AS oel_org_id,
    header_id AS oel_header_id,
    line_type_id AS oel_line_type_id,
    line_number AS oel_line_number,
    ordered_item AS oel_ordered_item,
    request_date AS oel_request_date,
    promise_date AS oel_promise_date,
    schedule_ship_date AS oel_schedule_ship_date,
    order_quantity_uom AS oel_order_quantity_uom,
    pricing_quantity AS oel_pricing_quantity,
    pricing_quantity_uom AS oel_pricing_quantity_uom,
    cancelled_quantity AS oel_cancelled_quantity,
    shipped_quantity AS oel_shipped_quantity,
    ordered_quantity AS oel_ordered_quantity,
    fulfilled_quantity AS oel_fulfilled_quantity,
    shipping_quantity AS oel_shipping_quantity,
    shipping_quantity_uom AS oel_shipping_quantity_uom,
    delivery_lead_time AS oel_delivery_lead_time,
    tax_exempt_flag AS oel_tax_exempt_flag,
    ship_from_org_id AS oel_ship_from_org_id,
    ship_to_org_id AS oel_ship_to_org_id,
    invoice_to_org_id AS oel_invoice_to_org_id,
    sold_from_org_id AS oel_sold_from_org_id,
    sold_to_org_id AS oel_sold_to_org_id,
    cust_po_number AS oel_cust_po_number,
    tax_line_value AS oel_tax_line_value,
    subscription_enable_flag AS oel_subscription_enable_flag,
    invoiced_quantity AS oel_invoiced_quantity,
    split_by AS oel_split_by,
    line_set_id AS oel_line_set_id,
    unit_selling_percent AS oel_unit_selling_percent,
    shippable_flag AS oel_shippable_flag,
    re_source_flag AS oel_re_source_flag,
    flow_status_code AS oel_flow_status_code,
    calculate_price_flag AS oel_calculate_price_flag,
    fulfillment_date AS oel_fulfillment_date,
    shipping_quantity2 AS oel_shipping_quantity2,
    cancelled_quantity2 AS oel_cancelled_quantity2,
    shipped_quantity2 AS oel_shipped_quantity2,
    mfg_lead_time AS oel_mfg_lead_time,
    lock_control AS oel_lock_control,
    unit_list_price_per_pqty AS oel_unit_list_price_per_pqty,
    unit_selling_price_per_pqty AS oel_unit_selling_price_per_pqty,
    user_item_description AS oel_user_item_description,
    attribute19 AS oel_attribute19,
    transaction_phase_code AS oel_transaction_phase_code,
    actual_fulfillment_date AS oel_actual_fulfillment_date
FROM
    apps.oe_order_lines_all
WHERE
    ship_from_org_id = 1213
),  dbt__cte__stg_mr_mso_oel__ as (
-- Business Process: Tracking inventory reservations to supply the demand coming from open sales orders with line number
-- declare grain: one row per demand (ie sales order) per supply (ie wip or inventory) per reservation 
select 
stg_base.*,
join1.*
from dbt__cte__stg_mr_mso__ stg_base
join dbt__cte__src_oe_order_lines_all__ join1 
on stg_base.mr_demand_source_line_id = join1.oel_line_id
),  dbt__cte__int_wip_reservations_on_sales_orders__ as (
select 
int_base.mso_segment1,
int_base.mso_segment2,
int_base.mso_sales_order_id,
int_base.mr_demand_source_header_id,
int_base.mr_demand_source_type_name,
int_base.mr_demand_source_type_id,
int_base.mr_demand_source_line_id,
int_base.mr_supply_source_header_id,
int_base.mr_supply_source_type_name,
int_base.mr_supply_source_type_id,
int_base.mr_requirement_date,
int_base.mr_reservation_quantity,
int_base.oel_shipment_number,
int_base.oel_line_number,
int_base.oel_schedule_ship_date,
int_base.oel_request_date,
int_base.mr_ship_ready_flag 
from dbt__cte__stg_mr_mso_oel__ int_base
where int_base.mr_supply_source_type_id = 5 -- wip jobs supply
and int_base.mr_demand_source_type_id = 2 -- sales order demand
),  dbt__cte__int_wip_quality_summary_quality_rejects_and_sales_orders__ as (
--declare grain: one row per sales order per part number per job per op seq num
SELECT 
int_base.rr_item_id__rr_wip_entity_id__rr_from_op_seq_num_sk,
int_base.rr_item_id__rr_wip_entity_id__rr_from_op_seq_num__op_desc_sk,
int_base.feature,
int_base.rr_item_id,
int_base.rr_wip_entity_id,
int_base.rr_from_op_seq_num,
int_base.wop_fm_description,
int_base.count_serial_number,
join1.mso_segment1,
join1.oel_line_number,
join1.oel_shipment_number
FROM dbt__cte__stg_wip_quality_summary_quality_rejects__ int_base
left join dbt__cte__int_wip_reservations_on_sales_orders__ join1
on int_base.rr_wip_entity_id = join1.mr_supply_source_header_id
) select
    rr_item_id__rr_wip_entity_id__rr_from_op_seq_num__op_desc_sk as unique_field,
    count(*) as n_records

from dbt__cte__int_wip_quality_summary_quality_rejects_and_sales_orders__
where rr_item_id__rr_wip_entity_id__rr_from_op_seq_num__op_desc_sk is not null
group by rr_item_id__rr_wip_entity_id__rr_from_op_seq_num__op_desc_sk
having count(*) > 1


