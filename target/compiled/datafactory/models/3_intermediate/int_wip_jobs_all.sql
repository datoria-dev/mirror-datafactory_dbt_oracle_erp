with dbt__cte__src_wip_operations_from__ as (
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
),  dbt__cte__stg_we_wdj_msib__ as (
SELECT
    src_we.*,
    src_wdj.*,
    src_msib_mp.*    

FROM
    dbt__cte__src_wip_entities__
    src_we
    JOIN dbt__cte__src_wip_discrete_jobs__
    src_wdj
    ON src_we.we_wip_entity_id = src_wdj.wdj_wip_entity_id
    AND src_we.we_organization_id = src_wdj.wdj_organization_id
    JOIN dbt__cte__stg_msib_mp__ src_msib_mp
    ON src_wdj.wdj_primary_item_id = src_msib_mp.msib_inventory_item_id
    and src_wdj.wdj_organization_id = src_msib_mp.msib_organization_id
),  dbt__cte__stg_wop_we_wdj_msib__ as (
SELECT
    src_fmwop.*,
    stg_join1.*,
    standard_hash(stg_join1.wdj_wip_entity_id||stg_join1.wdj_organization_id||src_fmwop.wop_fm_operation_seq_num, 'MD5') as stg_wop_we_wdj_surrogate_key

FROM
    dbt__cte__src_wip_operations_from__
    src_fmwop
    JOIN dbt__cte__stg_we_wdj_msib__
    stg_join1
    ON src_fmwop.wop_fm_wip_entity_id = stg_join1.wdj_wip_entity_id
    AND src_fmwop.wop_fm_organization_id = stg_join1.wdj_organization_id
),  dbt__cte__src_bom_departments_from__ as (
SELECT
    pa_expenditure_org_id AS bd_fm_pa_expenditure_org_id,
    department_id AS bd_fm_department_id,
    department_code AS bd_fm_department_code,
    organization_id AS bd_fm_organization_id,
    last_update_date AS bd_fm_last_update_date,
    last_updated_by AS bd_fm_last_updated_by,
    creation_date AS bd_fm_creation_date,
    created_by AS bd_fm_created_by,
    last_update_login AS bd_fm_last_update_login,
    description AS bd_fm_description,
    department_class_code AS bd_fm_department_class_code
FROM
    apps.bom_departments
WHERE
    organization_id = 1213
),  dbt__cte__stg_wop_we_wdj_msib_mp_bd__ as (
SELECT
    stg_base.*,
    stg_join1.*
FROM
    dbt__cte__stg_wop_we_wdj_msib__
    stg_base
    JOIN dbt__cte__src_bom_departments_from__
    stg_join1
    ON stg_base.wop_fm_department_id = stg_join1.bd_fm_department_id
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
),  dbt__cte__stg_wop_we_wdj_msib_mp_bd_lf_mr_lf_mso_lf_oel__ as (
SELECT
    stg_base.*,
    stg_join1.*,
    stg_join2.*,
    stg_join3.*
FROM
    dbt__cte__stg_wop_we_wdj_msib_mp_bd__
    stg_base
    LEFT JOIN dbt__cte__src_inv_mtl_reservations__
    stg_join1
    ON stg_base.wdj_wip_entity_id = stg_join1.mr_supply_source_header_id
    and stg_join1.mr_demand_source_type_id in (2, 8) -- Reservations for Sales Orders, Internal Order demand
    and stg_join1.mr_supply_source_type_id = 5 -- Reservations for WIP Jobs
    LEFT JOIN dbt__cte__src_inv_mtl_sales_orders__
    stg_join2
    ON stg_join1.mr_demand_source_header_id = stg_join2.mso_sales_order_id
    LEFT JOIN dbt__cte__src_oe_order_lines_all__
    stg_join3
    ON stg_join1.mr_demand_source_line_id = stg_join3.oel_line_id
),  dbt__cte__src_fnd_lookup_values__ as (
SELECT
    lookup_code,
    lookup_type,
    meaning
FROM apps.fnd_lookup_values
) SELECT
int_base.mp_description,
int_base.msib_segment1,
int_base.wdj_primary_item_id,
int_base.msib_description,
lu1.meaning wip_job_status,
int_base.we_wip_entity_name,
int_base.we_wip_entity_id,
int_base.wop_fm_operation_seq_num,
int_base.wop_fm_description,
int_base.bd_fm_department_code,
int_base.wdj_scheduled_start_date,
int_base.wdj_scheduled_completion_date,
int_base.mso_segment1 sales_order,
int_base.oel_line_number,
int_base.mso_segment2 sales_order_type,
int_base.wop_fm_scheduled_quantity,
int_base.wop_fm_quantity_completed,
int_base.wop_fm_quantity_rejected,
int_base.wop_fm_quantity_scrapped,
int_base.wop_fm_quantity_in_queue,
int_base.wop_fm_quantity_waiting_to_move,
int_base.stg_wop_we_wdj_surrogate_key,
int_base.wdj_class_code,
int_base.wop_fm_date_last_moved,
( int_base.wop_fm_scheduled_quantity - int_base.wop_fm_quantity_completed 
- int_base.wop_fm_quantity_rejected - int_base.wop_fm_quantity_scrapped ) op_qty_open

FROM dbt__cte__stg_wop_we_wdj_msib_mp_bd_lf_mr_lf_mso_lf_oel__ int_base
JOIN dbt__cte__src_fnd_lookup_values__ lu1
    ON int_base.wdj_status_type = lu1.lookup_code
    AND lu1.lookup_type = 'WIP_JOB_STATUS'