select *
from {{ ref('stg_mt_wip_issuance_daily') }} stg
join ( select distinct bcomp_pk1_value from {{ ref('stg_boms_bcomp') }} ) bom_components
on stg.mt_inventory_item_id = bom_components.bcomp_pk1_value
