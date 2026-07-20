with metric_daily_all as (
  select
  base."Component Item",
  base."QA Creation Date",
  base."DD Quantity" quantity, 
  'Defects' feature
  from {{ ref('fct_supplier_caused_defects') }} base
  
  union all
  
  select
  base.*,
  'Consumptions'
  from {{ ref('fct_component_material_transactions') }} base
),
pivot__metric_daily_all as (
  select
  mda.*,
  case when feature = 'Defects' then mda.quantity else 0 end defect_qtys,
  case when feature = 'Consumptions' then mda.quantity else 0 end consumption_qtys
  from metric_daily_all mda
)
select 
m."Component Item",
m."QA Creation Date",
sum(defect_qtys) defect_qtys,
sum(consumption_qtys) consumption_qtys
from pivot__metric_daily_all m
group by 
m."Component Item",
m."QA Creation Date"