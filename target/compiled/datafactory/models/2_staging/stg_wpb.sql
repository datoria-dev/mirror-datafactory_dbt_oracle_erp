with dbt__cte__src_wip_period_balances__ as (
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
) SELECT 
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