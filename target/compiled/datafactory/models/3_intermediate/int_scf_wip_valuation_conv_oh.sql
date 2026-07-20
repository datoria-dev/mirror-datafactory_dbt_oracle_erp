with dbt__cte__lu_wt_transaction_type__ as (
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
) SELECT wt_primary_item_id, wt_usage_rate_or_amount
FROM dbt__cte__src_wip_transactions__ src_wt
LEFT JOIN dbt__cte__src_wip_transaction_accounts__ src_wta
ON src_wt.wt_transaction_id = src_wta.wta_transaction_id
WHERE 
wt_organization_id = 1213
and src_wta.wta_lu_br_resource_code = 'ConvOH'
and src_wta.meaning_wta_cst_accounting_line_type = 'WIP valuation'