-- one row per part number per day
select
j."Part Number",
int.mt_transaction_date,
int.mt_transaction_quantity
from {{ ref('int_material_transactions_bom_components') }} int
join {{ ref('dim_item_master') }} j
on int.mt_inventory_item_id = j.msib_inventory_item_id