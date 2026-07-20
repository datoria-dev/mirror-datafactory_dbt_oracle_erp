with dbt__cte__lu_we_entity_type__ as (
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
),  dbt__cte__stg_we_wdj__ as (
SELECT
    src_we.*,
    src_wdj.* 

FROM
    dbt__cte__src_wip_entities__
    src_we
    JOIN dbt__cte__src_wip_discrete_jobs__
    src_wdj
    ON src_we.we_wip_entity_id = src_wdj.wdj_wip_entity_id
    AND src_we.we_organization_id = src_wdj.wdj_organization_id
where 1=1
),  dbt__cte__src_wip_period_balances__ as (
select
    tl_outside_processing_var as wpb_tl_outside_processing_var,
    tl_overhead_var as wpb_tl_overhead_var,
    pl_material_var as wpb_pl_material_var,
    pl_material_overhead_var as wpb_pl_material_overhead_var,
    pl_resource_var as wpb_pl_resource_var,
    pl_overhead_var as wpb_pl_overhead_var,
    pl_outside_processing_var as wpb_pl_outside_processing_var,
    tl_scrap_out as wpb_tl_scrap_out,
    acct_period_id as wpb_acct_period_id,
    wip_entity_id as wpb_wip_entity_id,
    last_update_date as wpb_last_update_date,
    last_updated_by as wpb_last_updated_by,
    creation_date as wpb_creation_date,
    created_by as wpb_created_by,
    last_update_login as wpb_last_update_login,
    organization_id as wpb_organization_id,
    class_type as wpb_class_type,
    tl_resource_in as wpb_tl_resource_in,
    tl_overhead_in as wpb_tl_overhead_in,
    tl_outside_processing_in as wpb_tl_outside_processing_in,
    pl_material_in as wpb_pl_material_in,
    pl_material_overhead_in as wpb_pl_material_overhead_in,
    pl_resource_in as wpb_pl_resource_in,
    pl_overhead_in as wpb_pl_overhead_in,
    pl_outside_processing_in as wpb_pl_outside_processing_in,
    tl_material_out as wpb_tl_material_out,
    tl_material_overhead_out as wpb_tl_material_overhead_out,
    tl_resource_out as wpb_tl_resource_out,
    tl_overhead_out as wpb_tl_overhead_out,
    tl_outside_processing_out as wpb_tl_outside_processing_out,
    pl_material_out as wpb_pl_material_out,
    pl_material_overhead_out as wpb_pl_material_overhead_out,
    pl_resource_out as wpb_pl_resource_out,
    pl_overhead_out as wpb_pl_overhead_out,
    pl_outside_processing_out as wpb_pl_outside_processing_out,
    request_id as wpb_request_id,
    program_application_id as wpb_program_application_id,
    program_id as wpb_program_id,
    program_update_date as wpb_program_update_date,
    tl_material_var as wpb_tl_material_var,
    tl_material_overhead_var as wpb_tl_material_overhead_var,
    tl_resource_var as wpb_tl_resource_var
FROM
    apps.wip_period_balances
WHERE
    organization_id = 1213
),  dbt__cte__stg_wpb__ as (
SELECT 
stg_base.wpb_wip_entity_id,
stg_base.wpb_organization_id,
---------------------------
---------------------------
--variance not yet cleared
---------------------------
---------------------------
SUM(
    stg_base.wpb_pl_material_in -
        (stg_base.wpb_tl_material_out + stg_base.wpb_pl_material_out + stg_base.wpb_tl_material_var + stg_base.wpb_pl_material_var)
  ) cur_material_var,

SUM(
    stg_base.wpb_pl_material_overhead_in -
        (stg_base.wpb_tl_material_overhead_out + stg_base.wpb_pl_material_overhead_out + stg_base.wpb_tl_material_overhead_var + stg_base.wpb_pl_material_overhead_var)
  ) cur_moh_var,
SUM(
    (stg_base.wpb_tl_resource_in + stg_base.wpb_pl_resource_in) -
    (stg_base.wpb_tl_resource_out + stg_base.wpb_pl_resource_out + stg_base.wpb_tl_resource_var + stg_base.wpb_pl_resource_var)
    ) cur_resource_var,
SUM(
    stg_base.wpb_tl_outside_processing_in + stg_base.wpb_pl_outside_processing_in -
  stg_base.wpb_tl_outside_processing_out + stg_base.wpb_pl_outside_processing_out + stg_base.wpb_tl_outside_processing_var 
  + stg_base.wpb_pl_outside_processing_var
  ) cur_osp_var,
SUM(NVL(stg_base.wpb_tl_overhead_in, 0) + NVL(stg_base.wpb_pl_overhead_in, 0) 
  -(NVL(stg_base.wpb_tl_overhead_out, 0) + NVL(stg_base.wpb_pl_overhead_out, 0) + NVL(stg_base.wpb_tl_overhead_var, 0) + NVL(stg_base.wpb_pl_overhead_var, 0))
  ) cur_overhead_var,

( SUM(nvl(stg_base.wpb_pl_material_in, 0) -(nvl(stg_base.wpb_tl_material_out, 0) + nvl(stg_base.wpb_pl_material_out, 0) + nvl(stg_base.wpb_tl_material_var
  , 0) + nvl(stg_base.wpb_pl_material_var, 0))) + SUM(nvl(stg_base.wpb_pl_material_overhead_in, 0) -(nvl(stg_base.wpb_tl_material_overhead_out, 0)
  + nvl(stg_base.wpb_pl_material_overhead_out, 0) + nvl(stg_base.wpb_tl_material_overhead_var, 0) + nvl(stg_base.wpb_pl_material_overhead_var, 0))
  ) + SUM(nvl(stg_base.wpb_tl_resource_in, 0) + nvl(stg_base.wpb_pl_resource_in, 0) -(nvl(stg_base.wpb_tl_resource_out, 0) + nvl(stg_base.wpb_pl_resource_out
  , 0) + nvl(stg_base.wpb_tl_resource_var, 0) + nvl(stg_base.wpb_pl_resource_var, 0))) + SUM(nvl(stg_base.wpb_tl_outside_processing_in, 0) + nvl(stg_base.wpb_pl_outside_processing_in
  , 0) -(nvl(stg_base.wpb_tl_outside_processing_out, 0) + nvl(stg_base.wpb_pl_outside_processing_out, 0) + nvl(stg_base.wpb_tl_outside_processing_var
  , 0) + nvl(stg_base.wpb_pl_outside_processing_var, 0))) + SUM(nvl(stg_base.wpb_tl_overhead_in, 0) + nvl(stg_base.wpb_pl_overhead_in
  , 0) -(nvl(stg_base.wpb_tl_overhead_out, 0) + nvl(stg_base.wpb_pl_overhead_out, 0) + nvl(stg_base.wpb_tl_overhead_var, 0) + nvl(stg_base.wpb_pl_overhead_var, 0))) 
  ) cur_shop_cost_var,
---------------------------
---------------------------
-- Costs In: Total charges to job (Debit into WIP)
---------------------------
---------------------------
SUM(nvl(stg_base.wpb_pl_material_in, 0)) material_in,
SUM(nvl(stg_base.wpb_pl_material_overhead_in, 0)) moh_in,
SUM(nvl(stg_base.wpb_tl_resource_in, 0) + nvl(stg_base.wpb_pl_resource_in, 0)) resource_in,
SUM(nvl(stg_base.wpb_tl_outside_processing_in, 0) + nvl(stg_base.wpb_pl_outside_processing_in, 0)) osp_in,
SUM(nvl(stg_base.wpb_tl_overhead_in, 0) + nvl(stg_base.wpb_pl_overhead_in, 0)) overhead_in,
( SUM(nvl(stg_base.wpb_pl_material_in, 0)) + SUM(nvl(stg_base.wpb_pl_material_overhead_in, 0)) + SUM(nvl(stg_base.wpb_tl_resource_in, 0) + nvl(stg_base.wpb_pl_resource_in, 0)) + SUM(nvl(stg_base.wpb_tl_outside_processing_in
  , 0) + nvl(stg_base.wpb_pl_outside_processing_in, 0)) + SUM(nvl(stg_base.wpb_tl_overhead_in, 0) + nvl(stg_base.wpb_pl_overhead_in, 0)) 
  ) shop_cost_in, 
---------------------------
---------------------------
-- Costs Out: Charges liquidated upon job completion (Credit out of WIP)
---------------------------
--------------------------- 
SUM(nvl(stg_base.wpb_tl_material_out, 0) + nvl(stg_base.wpb_pl_material_out, 0)) material_out,
SUM(nvl(stg_base.wpb_tl_material_overhead_out, 0) + nvl(stg_base.wpb_pl_material_overhead_out, 0)) moh_out,
SUM(nvl(stg_base.wpb_tl_resource_out, 0) + nvl(stg_base.wpb_pl_resource_out, 0)) resource_out,
SUM(nvl(stg_base.wpb_tl_outside_processing_out, 0) + nvl(stg_base.wpb_pl_outside_processing_out, 0)) osp_out,
SUM(nvl(stg_base.wpb_tl_overhead_out, 0) + nvl(stg_base.wpb_pl_overhead_out, 0)) overhead_out,
( SUM(nvl(stg_base.wpb_tl_material_out, 0) + nvl(stg_base.wpb_pl_material_out, 0)) + SUM(nvl(stg_base.wpb_tl_material_overhead_out, 0) + nvl(stg_base.wpb_pl_material_overhead_out
  , 0)) + SUM(nvl(stg_base.wpb_tl_resource_out, 0) + nvl(stg_base.wpb_pl_resource_out, 0)) + SUM(nvl(stg_base.wpb_tl_outside_processing_out, 0) + nvl(stg_base.wpb_pl_outside_processing_out
  , 0)) + SUM(nvl(stg_base.wpb_tl_overhead_out, 0) + nvl(stg_base.wpb_pl_overhead_out, 0)) 
  ) shop_cost_out,
---------------------------
---------------------------
-- Original Variances
---------------------------
--------------------------- 
SUM(nvl(stg_base.wpb_pl_material_in, 0) -(nvl(stg_base.wpb_tl_material_out, 0) + nvl(stg_base.wpb_pl_material_out, 0))) material_var_orig,
SUM(nvl(stg_base.wpb_pl_material_overhead_in, 0) -(nvl(stg_base.wpb_tl_material_overhead_out, 0) + nvl(stg_base.wpb_pl_material_overhead_out, 0))) moh_var_orig,
SUM(nvl(stg_base.wpb_tl_resource_in, 0) + nvl(stg_base.wpb_pl_resource_in, 0) -(nvl(stg_base.wpb_tl_resource_out, 0) + nvl(stg_base.wpb_pl_resource_out, 0))) resource_var_orig,
SUM(nvl(stg_base.wpb_tl_outside_processing_in, 0) + nvl(stg_base.wpb_pl_outside_processing_in, 0) -(nvl(stg_base.wpb_tl_outside_processing_out, 0) + nvl(stg_base.wpb_pl_outside_processing_out, 0))
  ) osp_var_orig,
SUM(nvl(stg_base.wpb_tl_overhead_in, 0) + nvl(stg_base.wpb_pl_overhead_in, 0) -(nvl(stg_base.wpb_tl_overhead_out, 0) + nvl(stg_base.wpb_pl_overhead_out, 0))
  ) overhead_var_orig,
( SUM(nvl(stg_base.wpb_pl_material_in, 0) -(nvl(stg_base.wpb_tl_material_out, 0) + nvl(stg_base.wpb_pl_material_out, 0))) + SUM(nvl(stg_base.wpb_pl_material_overhead_in, 0) -(nvl(stg_base.wpb_tl_material_overhead_out
  , 0) + nvl(stg_base.wpb_pl_material_overhead_out, 0))) + SUM(nvl(stg_base.wpb_tl_resource_in, 0) + nvl(stg_base.wpb_pl_resource_in, 0) -(nvl(stg_base.wpb_tl_resource_out, 0) + nvl(stg_base.wpb_pl_resource_out
  , 0))) + SUM(nvl(stg_base.wpb_tl_outside_processing_in, 0) + nvl(stg_base.wpb_pl_outside_processing_in, 0) -(nvl(stg_base.wpb_tl_outside_processing_out, 0) + nvl(stg_base.wpb_pl_outside_processing_out
  , 0))) + SUM(nvl(stg_base.wpb_tl_overhead_in, 0) + nvl(stg_base.wpb_pl_overhead_in, 0) -(nvl(stg_base.wpb_tl_overhead_out, 0) + nvl(stg_base.wpb_pl_overhead_out, 0))) 
  ) shop_cost_var_orig,                 
---------------------------
---------------------------
-- Variances Relieved
---------------------------
--------------------------- 
SUM(nvl(stg_base.wpb_tl_material_var, 0) + nvl(stg_base.wpb_pl_material_var, 0)) mtl_var_rlvd,
SUM(nvl(stg_base.wpb_tl_material_overhead_var, 0) + nvl(stg_base.wpb_pl_material_overhead_var, 0)) mtl_ovhd_var_rlvd,
SUM(nvl(stg_base.wpb_tl_resource_var, 0) + nvl(stg_base.wpb_pl_resource_var, 0)) res_var_rlvd,
SUM(nvl(stg_base.wpb_tl_outside_processing_var, 0) + nvl(stg_base.wpb_pl_outside_processing_var, 0)) osp_var_rlvd,
SUM(nvl(stg_base.wpb_tl_overhead_var, 0) + nvl(stg_base.wpb_pl_overhead_var, 0)) ovhd_var_rlvd,
( SUM(+ nvl(stg_base.wpb_tl_material_var, 0) + nvl(stg_base.wpb_pl_material_var, 0)) + SUM(+ nvl(stg_base.wpb_tl_material_overhead_var, 0) + nvl(stg_base.wpb_pl_material_overhead_var
  , 0)) ) + SUM(+ nvl(stg_base.wpb_tl_resource_var, 0) + nvl(stg_base.wpb_pl_resource_var, 0)) + SUM(+ nvl(stg_base.wpb_tl_outside_processing_var, 0) + nvl(stg_base.wpb_pl_outside_processing_var
  , 0)) + SUM(+ nvl(stg_base.wpb_tl_overhead_var, 0) + nvl(stg_base.wpb_pl_overhead_var, 0)
  ) shop_cost_var_rlvd
FROM
dbt__cte__src_wip_period_balances__ stg_base
GROUP BY 
   stg_base.wpb_wip_entity_id,
   stg_base.wpb_organization_id
) select
stg_base.*,
join1.*
from dbt__cte__stg_we_wdj__ stg_base
join dbt__cte__stg_wpb__ join1 
on stg_base.we_wip_entity_id = join1.wpb_wip_entity_id