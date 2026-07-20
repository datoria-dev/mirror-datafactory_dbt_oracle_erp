
    
    

with dbt__cte__src_wsh_delivery_details__ as (
SELECT
    created_by AS wsh_dd_created_by,
    last_update_date AS wsh_dd_last_update_date,
    last_updated_by AS wsh_dd_last_updated_by,
    last_update_login AS wsh_dd_last_update_login,
    request_id AS wsh_dd_request_id,
    split_from_delivery_detail_id AS wsh_dd_split_from_delivery_detail_id,
    inv_interfaced_flag AS wsh_dd_inv_interfaced_flag,
    container_flag AS wsh_dd_container_flag,
    cycle_count_quantity2 AS wsh_dd_cycle_count_quantity2,
    unit_price AS wsh_dd_unit_price,
    currency_code AS wsh_dd_currency_code,
    ship_to_site_use_id AS wsh_dd_ship_to_site_use_id,
    inspection_flag AS wsh_dd_inspection_flag,
    pickable_flag AS wsh_dd_pickable_flag,
    source_header_number AS wsh_dd_source_header_number,
    source_line_number AS wsh_dd_source_line_number,
    picked_quantity AS wsh_dd_picked_quantity,
    source_line_set_id AS wsh_dd_source_line_set_id,
    batch_id AS wsh_dd_batch_id,
    transaction_id AS wsh_dd_transaction_id,
    service_level AS wsh_dd_service_level,
    mode_of_transport AS wsh_dd_mode_of_transport,
    earliest_pickup_date AS wsh_dd_earliest_pickup_date,
    latest_pickup_date AS wsh_dd_latest_pickup_date,
    latest_dropoff_date AS wsh_dd_latest_dropoff_date,
    request_date_type_code AS wsh_dd_request_date_type_code,
    source_document_type_id AS wsh_dd_source_document_type_id,
    ignore_for_planning AS wsh_dd_ignore_for_planning,
    line_direction AS wsh_dd_line_direction,
    wv_frozen_flag AS wsh_dd_wv_frozen_flag,
    delivery_detail_id AS wsh_dd_delivery_detail_id,
    source_code AS wsh_dd_source_code,
    source_header_id AS wsh_dd_source_header_id,
    source_line_id AS wsh_dd_source_line_id,
    source_header_type_id AS wsh_dd_source_header_type_id,
    source_header_type_name AS wsh_dd_source_header_type_name,
    cust_po_number AS wsh_dd_cust_po_number,
    customer_id AS wsh_dd_customer_id,
    inventory_item_id AS wsh_dd_inventory_item_id,
    item_description AS wsh_dd_item_description,
    ato_line_id AS wsh_dd_ato_line_id,
    ship_from_location_id AS wsh_dd_ship_from_location_id,
    organization_id AS wsh_dd_organization_id,
    ship_to_location_id AS wsh_dd_ship_to_location_id,
    deliver_to_location_id AS wsh_dd_deliver_to_location_id,
    ship_tolerance_above AS wsh_dd_ship_tolerance_above,
    ship_tolerance_below AS wsh_dd_ship_tolerance_below,
    src_requested_quantity AS wsh_dd_src_requested_quantity,
    src_requested_quantity_uom AS wsh_dd_src_requested_quantity_uom,
    requested_quantity AS wsh_dd_requested_quantity,
    requested_quantity_uom AS wsh_dd_requested_quantity_uom,
    shipped_quantity AS wsh_dd_shipped_quantity,
    cycle_count_quantity AS wsh_dd_cycle_count_quantity,
    move_order_line_id AS wsh_dd_move_order_line_id,
    subinventory AS wsh_dd_subinventory,
    released_status AS wsh_dd_released_status,
    date_requested AS wsh_dd_date_requested,
    date_scheduled AS wsh_dd_date_scheduled,
    ship_method_code AS wsh_dd_ship_method_code,
    carrier_id AS wsh_dd_carrier_id,
    freight_terms_code AS wsh_dd_freight_terms_code,
    shipment_priority_code AS wsh_dd_shipment_priority_code,
    fob_code AS wsh_dd_fob_code,
    org_id AS wsh_dd_org_id,
    oe_interfaced_flag AS wsh_dd_oe_interfaced_flag,
    mvt_stat_status AS wsh_dd_mvt_stat_status,
    transaction_temp_id AS wsh_dd_transaction_temp_id,
    creation_date AS wsh_dd_creation_date
FROM
    apps.wsh_delivery_details
WHERE
    organization_id = 1213
),  dbt__cte__src_wsh_delivery_assignments__ as (
SELECT
    TYPE AS wsh_da_type,
    delivery_assignment_id AS wsh_da_delivery_assignment_id,
    delivery_id AS wsh_da_delivery_id,
    delivery_detail_id AS wsh_da_delivery_detail_id,
    creation_date AS wsh_da_creation_date,
    created_by AS wsh_da_created_by,
    last_update_date AS wsh_da_last_update_date,
    last_updated_by AS wsh_da_last_updated_by,
    last_update_login AS wsh_da_last_update_login
FROM
    apps.wsh_delivery_assignments
),  dbt__cte__src_wsh_new_deliveries__ as (
SELECT
    delivery_id AS wsh_nd_delivery_id,
    name AS wsh_nd_name,
    planned_flag AS wsh_nd_planned_flag,
    status_code AS wsh_nd_status_code,
    initial_pickup_date AS wsh_nd_initial_pickup_date,
    initial_pickup_location_id AS wsh_nd_initial_pickup_location_id,
    ultimate_dropoff_location_id AS wsh_nd_ultimate_dropoff_location_id,
    ultimate_dropoff_date AS wsh_nd_ultimate_dropoff_date,
    customer_id AS wsh_nd_customer_id,
    freight_terms_code AS wsh_nd_freight_terms_code,
    fob_code AS wsh_nd_fob_code,
    waybill AS wsh_nd_waybill,
    confirmed_by AS wsh_nd_confirmed_by,
    gross_weight AS wsh_nd_gross_weight,
    net_weight AS wsh_nd_net_weight,
    weight_uom_code AS wsh_nd_weight_uom_code,
    volume_uom_code AS wsh_nd_volume_uom_code,
    attribute2 AS wsh_nd_attribute2,
    attribute4 AS wsh_nd_attribute4,
    creation_date AS wsh_nd_creation_date,
    created_by AS wsh_nd_created_by,
    last_update_date AS wsh_nd_last_update_date,
    last_updated_by AS wsh_nd_last_updated_by,
    last_update_login AS wsh_nd_last_update_login,
    del_wf_intransit_attr AS wsh_nd_del_wf_intransit_attr,
    del_wf_interface_attr AS wsh_nd_del_wf_interface_attr,
    del_wf_close_attr AS wsh_nd_del_wf_close_attr,
    confirm_date AS wsh_nd_confirm_date,
    ship_method_code AS wsh_nd_ship_method_code,
    delivery_type AS wsh_nd_delivery_type,
    carrier_id AS wsh_nd_carrier_id,
    organization_id AS wsh_nd_organization_id,
    hash_value AS wsh_nd_hash_value,
    service_level AS wsh_nd_service_level,
    mode_of_transport AS wsh_nd_mode_of_transport,
    earliest_pickup_date AS wsh_nd_earliest_pickup_date,
    latest_pickup_date AS wsh_nd_latest_pickup_date,
    latest_dropoff_date AS wsh_nd_latest_dropoff_date,
    ignore_for_planning AS wsh_nd_ignore_for_planning,
    shipment_direction AS wsh_nd_shipment_direction,
    wv_frozen_flag AS wsh_nd_wv_frozen_flag,
    hash_string AS wsh_nd_hash_string,
    itinerary_complete AS wsh_nd_itinerary_complete,
    tms_version_number AS wsh_nd_tms_version_number,
    tms_interface_flag AS wsh_nd_tms_interface_flag
FROM
    apps.wsh_new_deliveries
WHERE
    organization_id = 1213
),  dbt__cte__stg_wsh_dd_da_nd__ as (
SELECT
    src_wsh_dd.*,
    src_wsh_da.*,
    src_wsh_nd.*
FROM
    dbt__cte__src_wsh_delivery_details__
    src_wsh_dd
    JOIN dbt__cte__src_wsh_delivery_assignments__
    src_wsh_da
    ON src_wsh_dd.wsh_dd_delivery_detail_id = src_wsh_da.wsh_da_delivery_detail_id
    JOIN dbt__cte__src_wsh_new_deliveries__
    src_wsh_nd
    ON src_wsh_da.wsh_da_delivery_id = src_wsh_nd.wsh_nd_delivery_id
) select
    wsh_dd_delivery_detail_id as unique_field,
    count(*) as n_records

from dbt__cte__stg_wsh_dd_da_nd__
where wsh_dd_delivery_detail_id is not null
group by wsh_dd_delivery_detail_id
having count(*) > 1


