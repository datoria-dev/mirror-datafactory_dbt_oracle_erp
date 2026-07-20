select distinct
stg.ri_item_id,
stg.s_vendor_id,
stg.s_vendor_name,
stg.s_vendor_name_alt,
stg.ri_sap_qms_codes,
stg.ri_folder_notes,
j."Part Number"
from {{ ref('stg_qa_ri_s') }} stg
join {{ ref('dim_item_master') }} j
on stg.ri_item_id = j.msib_inventory_item_id