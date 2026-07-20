with dbt__cte__src_hz_cust_accounts__ as (
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
) select 
src_hz_ca.*,
src_hz_p.*
from dbt__cte__src_hz_cust_accounts__ src_hz_ca
join dbt__cte__src_hz_parties__ src_hz_p
on src_hz_ca.hz_ca_party_id = src_hz_p.hz_p_party_id