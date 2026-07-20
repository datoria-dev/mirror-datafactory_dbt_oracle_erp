with dbt__cte__src_qa_results_ri__ as (
select
    collection_id as ri_collection_id,
    occurrence as ri_occurrence,
    last_update_date as ri_last_update_date,
    qa_last_update_date as ri_qa_last_update_date,
    last_updated_by as ri_last_updated_by,
    qa_last_updated_by as ri_qa_last_updated_by,
    creation_date as ri_creation_date,
    qa_creation_date as ri_qa_creation_date,
    created_by as ri_created_by,
    qa_created_by as ri_qa_created_by,
    last_update_login as ri_last_update_login,
    transaction_number as ri_transaction_number,
    txn_header_id as ri_txn_header_id,
    organization_id as ri_organization_id,
    plan_id as ri_plan_id,
    spec_id as ri_spec_id,
    transaction_id as ri_transaction_id,
    quantity as ri_quantity,
    item_id as ri_item_id,
    revision as ri_revision,
    subinventory as ri_subinventory,
    locator_id as ri_locator_id,
    vendor_id as ri_vendor_id,
    receipt_num as ri_receipt_num,
    po_header_id as ri_po_header_id,
    po_line_num as ri_po_line_num,
    status as ri_status,
    transaction_date as ri_transaction_date,
    character1 AS ri_skip_lot_process,
    character2 AS ri_description,
    character3 AS ri_revision_received,
    character4 AS ri_conditional_release,
    character5 AS ri_ordered_quantity,
    character6 AS ri_uom,
    character7 AS ri_insp_res,
    character8 AS ri_qty_defect,
    character9 AS ri_responsibility,
    character10 AS ri_oem_date_code,
    character13 AS ri_vpn_occurrence,
    character14 AS ri_manufacturer_name,
    character15 AS ri_manufacturer_part_number,
    character16 AS ri_cage,
    character17 AS ri_qir_status,
    character18 AS ri_fai_status,
    character19 AS ri_save_allowed,
    character21 AS ri_source_owner,
    character22 AS ri_source_owner_email,
    character24 AS ri_plm_qal_status,
    character25 AS ri_sap_qms_codes,
    character26 AS ri_vendor_type_meaning,
    character27 AS ri_shelf_life,
    character29 AS ri_shelf_life_days,
    character32 AS ri_sl_process_id,
    character33 AS ri_sl_criteria_id,
    character34 AS ri_sl_txn_id,
    character35 AS ri_skip_lot_status,
    character36 AS ri_supplier_site,
    character100 AS ri_qd_num,
    comment1 AS ri_folder_notes,
    comment2 AS ri_material_po_text,
    comment3 AS ri_vpn_info
from
    apps.qa_results
where
    organization_id = 1213
    and plan_id = 5178
    and (
        status is null
        or status = 2
    )
),  dbt__cte__src_ap_suppliers__ as (
SELECT
    always_take_disc_flag AS s_always_take_disc_flag,
    pay_date_basis_lookup_code AS s_pay_date_basis_lookup_code,
    pay_group_lookup_code AS s_pay_group_lookup_code,
    payment_priority AS s_payment_priority,
    invoice_currency_code AS s_invoice_currency_code,
    payment_currency_code AS s_payment_currency_code,
    hold_all_payments_flag AS s_hold_all_payments_flag,
    hold_future_payments_flag AS s_hold_future_payments_flag,
    vendor_id AS s_vendor_id,
    last_update_date AS s_last_update_date,
    last_updated_by AS s_last_updated_by,
    vendor_name AS s_vendor_name,
    vendor_name_alt AS s_vendor_name_alt,
    segment1 AS s_segment1,
    summary_flag AS s_summary_flag,
    enabled_flag AS s_enabled_flag,
    last_update_login AS s_last_update_login,
    creation_date AS s_creation_date,
    created_by AS s_created_by,
    vendor_type_lookup_code AS s_vendor_type_lookup_code,
    one_time_flag AS s_one_time_flag,
    bill_to_location_id AS s_bill_to_location_id,
    terms_id AS s_terms_id,
    set_of_books_id AS s_set_of_books_id,
    auto_calculate_interest_flag AS s_auto_calculate_interest_flag,
    exclude_freight_from_discount AS s_exclude_freight_from_discount,
    allow_awt_flag AS s_allow_awt_flag,
    bank_charge_bearer AS s_bank_charge_bearer,
    match_option AS s_match_option,
    create_debit_memo_flag AS s_create_debit_memo_flag,
    offset_tax_flag AS s_offset_tax_flag,
    party_id AS s_party_id,
    tca_sync_num_1099 AS s_tca_sync_num_1099,
    tca_sync_vendor_name AS s_tca_sync_vendor_name,
    request_id AS s_request_id,
    program_application_id AS s_program_application_id,
    program_id AS s_program_id,
    program_update_date AS s_program_update_date,
    accts_pay_code_combination_id AS s_accts_pay_code_combination_id,
    prepay_code_combination_id AS s_prepay_code_combination_id,
    num_1099 AS s_num_1099,
    organization_type_lookup_code AS s_organization_type_lookup_code,
    start_date_active AS s_start_date_active,
    end_date_active AS s_end_date_active,
    payment_method_lookup_code AS s_payment_method_lookup_code,
    women_owned_flag AS s_women_owned_flag,
    small_business_flag AS s_small_business_flag,
    hold_flag AS s_hold_flag,
    hold_by AS s_hold_by,
    hold_date AS s_hold_date,
    terms_date_basis AS s_terms_date_basis,
    price_tolerance AS s_price_tolerance,
    inspection_required_flag AS s_inspection_required_flag,
    receipt_required_flag AS s_receipt_required_flag,
    allow_substitute_receipts_flag AS s_allow_substitute_receipts_flag,
    allow_unordered_receipts_flag AS s_allow_unordered_receipts_flag,
    hold_unmatched_invoices_flag AS s_hold_unmatched_invoices_flag,
    exclusive_payment_flag AS s_exclusive_payment_flag,
    ap_tax_rounding_rule AS s_ap_tax_rounding_rule,
    auto_tax_calc_flag AS s_auto_tax_calc_flag,
    auto_tax_calc_override AS s_auto_tax_calc_override,
    amount_includes_tax_flag AS s_amount_includes_tax_flag,
    tax_verification_date AS s_tax_verification_date,
    state_reportable_flag AS s_state_reportable_flag,
    federal_reportable_flag AS s_federal_reportable_flag,
    attribute1 AS s_attribute1
FROM
    apps.ap_suppliers
),  dbt__cte__stg_qa_ri_s__ as (
select 
src_ri.*,
src_s.*
from dbt__cte__src_qa_results_ri__ src_ri
left join dbt__cte__src_ap_suppliers__ src_s
on src_ri.ri_vendor_id = src_s.s_vendor_id
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
) select distinct
stg.ri_item_id,
stg.s_vendor_id,
stg.s_vendor_name,
stg.s_vendor_name_alt,
stg.ri_sap_qms_codes,
stg.ri_folder_notes,
j."Part Number"
from dbt__cte__stg_qa_ri_s__ stg
join dbt__cte__dim_item_master__ j
on stg.ri_item_id = j.msib_inventory_item_id