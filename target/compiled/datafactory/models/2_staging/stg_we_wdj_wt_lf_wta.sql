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
),  dbt__cte__lu_wt_transaction_type__ as (
select lookup_type as lookup_type_wt_transaction_type, lookup_code as lookup_code_wt_transaction_type, meaning as meaning_wt_transaction_type from apps.fnd_lookup_values
where lookup_type = 'WIP_TRANSACTION_TYPE'
),  dbt__cte__lu_bom_resources__ as (
SELECT
    last_updated_by AS lu_br_last_updated_by,
    creation_date AS lu_br_creation_date,
    created_by AS lu_br_created_by,
    last_update_login AS lu_br_last_update_login,
    description AS lu_br_description,
    cost_element_id AS lu_br_cost_element_id,
    purchase_item_id AS lu_br_purchase_item_id,
    cost_code_type AS lu_br_cost_code_type,
    functional_currency_flag AS lu_br_functional_currency_flag,
    unit_of_measure AS lu_br_unit_of_measure,
    resource_type AS lu_br_resource_type,
    autocharge_type AS lu_br_autocharge_type,
    standard_rate_flag AS lu_br_standard_rate_flag,
    default_basis_type AS lu_br_default_basis_type,
    absorption_account AS lu_br_absorption_account,
    allow_costs_flag AS lu_br_allow_costs_flag,
    rate_variance_account AS lu_br_rate_variance_account,
    expenditure_type AS lu_br_expenditure_type,
    batchable AS lu_br_batchable,
    resource_id AS lu_br_resource_id,
    resource_code AS lu_br_resource_code,
    organization_id AS lu_br_organization_id,
    last_update_date AS lu_br_last_update_date
FROM
    apps.bom_resources
WHERE
    organization_id = 1213
),  dbt__cte__src_wip_transactions__ as (
select
    transaction_id as wt_transaction_id,
    last_update_date as wt_last_update_date,
    last_updated_by as wt_last_updated_by,
    creation_date as wt_creation_date,
    created_by as wt_created_by,
    last_update_login as wt_last_update_login,
    organization_id as wt_organization_id,
    wip_entity_id as wt_wip_entity_id,
    primary_item_id as wt_primary_item_id,
    acct_period_id as wt_acct_period_id,
    department_id as wt_department_id,
    transaction_type as wt_transaction_type,
    meaning_wt_transaction_type,
    transaction_date as wt_transaction_date,
    group_id as wt_group_id,
    source_code as wt_source_code,
    source_line_id as wt_source_line_id,
    operation_seq_num as wt_operation_seq_num,
    resource_seq_num as wt_resource_seq_num,
    resource_id as wt_resource_id,
    lu_br_resource_code as wt_lu_br_resource_code,
    lu_br_description as wt_lu_br_description,
    autocharge_type as wt_autocharge_type,
    standard_rate_flag as wt_standard_rate_flag,
    usage_rate_or_amount as wt_usage_rate_or_amount,
    basis_type as wt_basis_type,
    transaction_quantity as wt_transaction_quantity,
    transaction_uom as wt_transaction_uom,
    primary_quantity as wt_primary_quantity,
    primary_uom as wt_primary_uom,
    actual_resource_rate as wt_actual_resource_rate,
    standard_resource_rate as wt_standard_resource_rate,
    reason_id as wt_reason_id,
    move_transaction_id as wt_move_transaction_id,
    request_id as wt_request_id,
    program_application_id as wt_program_application_id,
    program_id as wt_program_id,
    program_update_date as wt_program_update_date
from
    apps.wip_transactions
join dbt__cte__lu_wt_transaction_type__ lu
    on transaction_type = lu.lookup_code_wt_transaction_type -- Per eTRM, transaction_type is a mandatory field, thus inner join.
left join dbt__cte__lu_bom_resources__ lu2
    on resource_id = lu2.lu_br_resource_id -- Per eTRM, not mandatory field, thus, left join.
where
    organization_id = 1213
    and transaction_date >= TRUNC(sysdate, 'YYYY') -- truncates to the first day of the year: 01-JAN-YYYY
),  dbt__cte__stg_we_wdj_wt__ as (
-- declare grain: One row per job per resource transaction
SELECT
    stg_base.*,
    src_wt.* 

FROM
    dbt__cte__stg_we_wdj__
    stg_base
    JOIN dbt__cte__src_wip_transactions__
    src_wt
    ON stg_base.we_wip_entity_id = src_wt.wt_wip_entity_id
),  dbt__cte__lu_wta_cst_accounting_line_type__ as (
select lookup_type as lookup_type_wta_cst_accounting_line_type, lookup_code as lookup_code_wta_cst_accounting_line_type, meaning as meaning_wta_cst_accounting_line_type from apps.fnd_lookup_values
where lookup_type = 'CST_ACCOUNTING_LINE_TYPE'
),  dbt__cte__src_wip_transaction_accounts__ as (
select
    wip_sub_ledger_id as wta_wip_sub_ledger_id,
    transaction_id as wta_transaction_id,
    reference_account as wta_reference_account,
    last_update_date as wta_last_update_date,
    last_updated_by as wta_last_updated_by,
    creation_date as wta_creation_date,
    created_by as wta_created_by,
    last_update_login as wta_last_update_login,
    organization_id as wta_organization_id,
    transaction_date as wta_transaction_date,
    wip_entity_id as wta_wip_entity_id,
    accounting_line_type as wta_accounting_line_type,
    meaning_wta_cst_accounting_line_type,
    base_transaction_value as wta_base_transaction_value,
    contra_set_id as wta_contra_set_id,
    primary_quantity as wta_primary_quantity,
    rate_or_amount as wta_rate_or_amount,
    basis_type as wta_basis_type,
    resource_id as wta_resource_id,
    lu_br_resource_code as wta_lu_br_resource_code,
    lu_br_description as wta_lu_br_description,
    cost_element_id as wta_cost_element_id,
    request_id as wta_request_id,
    program_application_id as wta_program_application_id,
    program_id as wta_program_id,
    program_update_date as wta_program_update_date
from
    apps.wip_transaction_accounts
left join dbt__cte__lu_wta_cst_accounting_line_type__ lu
    on accounting_line_type = lu.lookup_code_wta_cst_accounting_line_type -- Per eTRM, not mandatory field, thus, left join.
left join dbt__cte__lu_bom_resources__ lu2
    on resource_id = lu2.lu_br_resource_id -- Per eTRM, not mandatory field, thus, left join.
where
    organization_id = 1213
) SELECT
    stg_base.*,
    src_wta.* 

FROM
    dbt__cte__stg_we_wdj_wt__
    stg_base
    LEFT JOIN dbt__cte__src_wip_transaction_accounts__
    src_wta
    ON stg_base.wt_transaction_id = src_wta.wta_transaction_id