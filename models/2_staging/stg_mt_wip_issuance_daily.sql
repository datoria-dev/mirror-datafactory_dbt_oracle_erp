select
sum(mt_transaction_quantity) mt_transaction_quantity,
mt_inventory_item_id,
trunc(mt_transaction_date) mt_transaction_date
from {{ ref('src_inv_mtl_material_transactions_wip_issuances') }} src

group by mt_inventory_item_id,
trunc(mt_transaction_date)