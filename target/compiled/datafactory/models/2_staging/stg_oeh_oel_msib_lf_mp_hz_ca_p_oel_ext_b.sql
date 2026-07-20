with dbt__cte__src_oe_order_headers_all__ as (
SELECT
    cancel_unshipped_lines AS oeh_cancel_unshipped_lines,
    cancelled_flag AS oeh_cancelled_flag,
    open_flag AS oeh_open_flag,
    booked_flag AS oeh_booked_flag,
    salesrep_id AS oeh_salesrep_id,
    order_date_type_code AS oeh_order_date_type_code,
    sales_channel_code AS oeh_sales_channel_code,
    order_category_code AS oeh_order_category_code,
    flow_status_code AS oeh_flow_status_code,
    booked_date AS oeh_booked_date,
    lock_control AS oeh_lock_control,
    xml_message_id AS oeh_xml_message_id,
    attribute18 AS oeh_attribute18,
    attribute19 AS oeh_attribute19,
    fulfillment_set_name AS oeh_fulfillment_set_name,
    line_set_name AS oeh_line_set_name,
    default_fulfillment_set AS oeh_default_fulfillment_set,
    transaction_phase_code AS oeh_transaction_phase_code,
    header_id AS oeh_header_id,
    org_id AS oeh_org_id,
    order_type_id AS oeh_order_type_id,
    order_number AS oeh_order_number,
    version_number AS oeh_version_number,
    order_source_id AS oeh_order_source_id,
    source_document_type_id AS oeh_source_document_type_id,
    orig_sys_document_ref AS oeh_orig_sys_document_ref,
    source_document_id AS oeh_source_document_id,
    ordered_date AS oeh_ordered_date,
    request_date AS oeh_request_date,
    pricing_date AS oeh_pricing_date,
    shipment_priority_code AS oeh_shipment_priority_code,
    price_list_id AS oeh_price_list_id,
    tax_exempt_flag AS oeh_tax_exempt_flag,
    transactional_curr_code AS oeh_transactional_curr_code,
    cust_po_number AS oeh_cust_po_number,
    invoicing_rule_id AS oeh_invoicing_rule_id,
    accounting_rule_id AS oeh_accounting_rule_id,
    payment_term_id AS oeh_payment_term_id,
    shipping_method_code AS oeh_shipping_method_code,
    freight_carrier_code AS oeh_freight_carrier_code,
    fob_point_code AS oeh_fob_point_code,
    freight_terms_code AS oeh_freight_terms_code,
    sold_from_org_id AS oeh_sold_from_org_id,
    sold_to_org_id AS oeh_sold_to_org_id,
    ship_from_org_id AS oeh_ship_from_org_id,
    ship_to_org_id AS oeh_ship_to_org_id,
    invoice_to_org_id AS oeh_invoice_to_org_id,
    creation_date AS oeh_creation_date,
    created_by AS oeh_created_by,
    last_updated_by AS oeh_last_updated_by,
    last_update_date AS oeh_last_update_date,
    last_update_login AS oeh_last_update_login,
    CONTEXT AS oeh_context,
    attribute1 AS oeh_attribute1,
    attribute3 AS oeh_attribute3,
    attribute4 AS oeh_attribute4,
    attribute5 AS oeh_attribute5,
    attribute6 AS oeh_attribute6,
    attribute7 AS oeh_attribute7,
    attribute9 AS oeh_attribute9,
    attribute11 AS oeh_attribute11,
    attribute12 AS oeh_attribute12,
    attribute13 AS oeh_attribute13,
    attribute15 AS oeh_attribute15,
    global_attribute1 AS oeh_global_attribute1,
    global_attribute2 AS oeh_global_attribute2,
    global_attribute3 AS oeh_global_attribute3,
    global_attribute4 AS oeh_global_attribute4
FROM
    apps.oe_order_headers_all
WHERE
    ship_from_org_id = 1213
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
),  dbt__cte__stg_oeh_oel__ as (
select
src_oeh.*,
src_oel.*,
standard_hash(src_oeh.oeh_header_id||src_oel.oel_line_id, 'MD5') as stg_oeh_oel_sk,
standard_hash(src_oeh.oeh_order_number||'.' ||src_oel.oel_line_number, 'MD5') as stg_oeh_oel_sk2
from dbt__cte__src_oe_order_headers_all__ src_oeh
join dbt__cte__src_oe_order_lines_all__ src_oel
on src_oeh.oeh_header_id = src_oel.oel_header_id
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
),  dbt__cte__stg_oeh_oel_msib_lf_mp__ as (
SELECT
    stg_base.*,
    stg_join1.*
FROM
    dbt__cte__stg_oeh_oel__
    stg_base
    JOIN dbt__cte__stg_msib_lf_mp__
    stg_join1
    ON stg_base.oel_ship_from_org_id = stg_join1.msib_organization_id
    AND stg_base.oel_inventory_item_id = stg_join1.msib_inventory_item_id
),  dbt__cte__src_hz_cust_accounts__ as (
select
    hold_bill_flag as hz_ca_hold_bill_flag,
    dormant_account_flag as hz_ca_dormant_account_flag,
    date_type_preference as hz_ca_date_type_preference,
    over_shipment_tolerance as hz_ca_over_shipment_tolerance,
    under_shipment_tolerance as hz_ca_under_shipment_tolerance,
    ship_sets_include_lines_flag as hz_ca_ship_sets_include_lines_flag,
    arrivalsets_include_lines_flag as hz_ca_arrivalsets_include_lines_flag,
    sched_date_push_flag as hz_ca_sched_date_push_flag,
    account_replication_key as hz_ca_account_replication_key,
    object_version_number as hz_ca_object_version_number,
    created_by_module as hz_ca_created_by_module,
    application_id as hz_ca_application_id,
    cust_account_id as hz_ca_cust_account_id,
    party_id as hz_ca_party_id,
    last_update_date as hz_ca_last_update_date,
    account_number as hz_ca_account_number,
    last_updated_by as hz_ca_last_updated_by,
    creation_date as hz_ca_creation_date,
    created_by as hz_ca_created_by,
    last_update_login as hz_ca_last_update_login,
    request_id as hz_ca_request_id,
    program_application_id as hz_ca_program_application_id,
    program_id as hz_ca_program_id,
    program_update_date as hz_ca_program_update_date,
    attribute2 as hz_ca_attribute2,
    orig_system_reference as hz_ca_orig_system_reference,
    status as hz_ca_status,
    customer_type as hz_ca_customer_type,
    customer_class_code as hz_ca_customer_class_code,
    price_list_id as hz_ca_price_list_id,
    fob_point as hz_ca_fob_point,
    freight_term as hz_ca_freight_term,
    warehouse_id as hz_ca_warehouse_id,
    payment_term_id as hz_ca_payment_term_id,
    tax_header_level_flag as hz_ca_tax_header_level_flag,
    account_liable_flag as hz_ca_account_liable_flag
from
    apps.hz_cust_accounts
),  dbt__cte__src_hz_parties__ as (
SELECT
    primary_phone_area_code AS hz_p_primary_phone_area_code,
    primary_phone_number AS hz_p_primary_phone_number,
    orig_system_reference AS hz_p_orig_system_reference,
    customer_key AS hz_p_customer_key,
    person_first_name AS hz_p_person_first_name,
    person_last_name AS hz_p_person_last_name,
    country AS hz_p_country,
    address1 AS hz_p_address1,
    city AS hz_p_city,
    postal_code AS hz_p_postal_code,
    status AS hz_p_status,
    email_address AS hz_p_email_address,
    object_version_number AS hz_p_object_version_number,
    created_by_module AS hz_p_created_by_module,
    application_id AS hz_p_application_id,
    primary_phone_contact_pt_id AS hz_p_primary_phone_contact_pt_id,
    primary_phone_line_type AS hz_p_primary_phone_line_type,
    party_id AS hz_p_party_id,
    party_number AS hz_p_party_number,
    party_name AS hz_p_party_name,
    party_type AS hz_p_party_type,
    validated_flag AS hz_p_validated_flag,
    last_updated_by AS hz_p_last_updated_by,
    creation_date AS hz_p_creation_date,
    last_update_login AS hz_p_last_update_login,
    created_by AS hz_p_created_by,
    last_update_date AS hz_p_last_update_date,
    program_update_date AS hz_p_program_update_date
FROM
    apps.hz_parties
),  dbt__cte__stg_hz_ca_p__ as (
select 
src_hz_ca.*,
src_hz_p.*
from dbt__cte__src_hz_cust_accounts__ src_hz_ca
join dbt__cte__src_hz_parties__ src_hz_p
on src_hz_ca.hz_ca_party_id = src_hz_p.hz_p_party_id
),  dbt__cte__stg_oeh_oel_msib_lf_mp_hz_ca_p__ as (
SELECT
    stg_base.*,
    stg_join1.*
FROM
    dbt__cte__stg_oeh_oel_msib_lf_mp__
    stg_base
    JOIN dbt__cte__stg_hz_ca_p__
    stg_join1
    ON stg_base.oeh_sold_to_org_id = stg_join1.hz_ca_cust_account_id
),  dbt__cte__src_oe_order_lines_all_ext_b__ as (
select
    n_ext_attr1 as oel_ext_b_n_ext_attr1,
    extension_id as oel_ext_b_extension_id,
    attr_group_id as oel_ext_b_attr_group_id,
    line_id as oel_ext_b_line_id,
    data_level_id as oel_ext_b_data_level_id,
    entity as oel_ext_b_entity,
    request_id as oel_ext_b_request_id,
    last_update_date as oel_ext_b_last_update_date,
    last_updated_by as oel_ext_b_last_updated_by,
    last_update_login as oel_ext_b_last_update_login,
    created_by as oel_ext_b_created_by,
    creation_date as oel_ext_b_creation_date,
    c_ext_attr1 as oel_ext_b_saasm_ops_sw_flag,
    c_ext_attr2 as oel_ext_b_saasm_country,
    c_ext_attr3 as oel_ext_b_saasm_application_type,
    c_ext_attr4 as oel_ext_b_saasm_storage,
    c_ext_attr5 as oel_ext_b_saasm_auth_control,
    c_ext_attr6 as oel_ext_b_saasm_ship_to_sac_acc,
    c_ext_attr7 as oel_ext_b_saasm_code,
    c_ext_attr8 as oel_ext_b_is_vmi,
    c_ext_attr9 as oel_ext_b_vmi_po,
    c_ext_attr10 as oel_ext_b_vmi_item_no,
    c_ext_attr11 as oel_ext_b_c_ext_attr11
from
    apps.oe_order_lines_all_ext_b
) SELECT
    stg_base.*,
    src_oel_ext_b.*
FROM
    dbt__cte__stg_oeh_oel_msib_lf_mp_hz_ca_p__
    stg_base
    JOIN dbt__cte__src_oe_order_lines_all_ext_b__
    src_oel_ext_b
    ON stg_base.oel_line_id = src_oel_ext_b.oel_ext_b_line_id