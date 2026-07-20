with dbt__cte__src_bom_calendar_dates_365days__ as (
SELECT
    calendar_date as bcal_calendar_date,
        CASE
        WHEN seq_num IS NULL THEN next_date
        ELSE calendar_date
    END as bcal_next_working_dates,
    CASE
        WHEN seq_num IS NULL THEN prior_date
        ELSE calendar_date
    END as bcal_prev_working_dates,
    next_date as bcal_next_date,
    prior_date as bcal_prior_date,
    seq_num as bcal_seq_num,
    next_seq_num as bcal_next_seq_num

FROM
    apps.bom_calendar_dates
WHERE
    calendar_code = 'NSS'
    AND calendar_date BETWEEN TRUNC(sysdate - 365, 'YYYY') -- truncates to the first day of the year: 01-JAN-YYYY
    AND TRUNC(sysdate + 365, 'YYYY') -- truncates to the first day of the year: 01-JAN-YYYY
),  dbt__cte__src_gl_periods_365days__ as (
SELECT
    start_date AS fiscal_start_date,
    end_date AS fiscal_end_date,
    entered_period_name AS fiscal_month,
    period_year AS fiscal_year,
    'Week ' || period_num AS fiscal_week,
    quarter_num AS fiscal_quarter,
    period_set_name AS fiscal_period_set_name,
    year_start_date AS fiscal_year_start_date
FROM
    apps.gl_periods
WHERE 1=1
    AND period_set_name = 'BAE_FW' -- FW: Full Week
    --AND period_set_name = 'BAE_CALENDAR' -- Returns Monthly records
    AND start_date BETWEEN TRUNC(sysdate - 365, 'YYYY') -- truncates to the first day of the year: 01-JAN-YYYY
    AND TRUNC(sysdate + 365, 'YYYY') -- truncates to the first day of the year: 01-JAN-YYYY
),  dbt__cte__stg_bom_cal_fiscal_365days__ as (
SELECT
trunc(src_bcal.bcal_calendar_date) bcal_calendar_date,
src_bcal.bcal_next_date,
src_bcal.bcal_prior_date,
src_bcal.bcal_next_working_dates,
src_bcal.bcal_prev_working_dates,
src_bcal.bcal_seq_num,
src_bcal.bcal_next_seq_num,
src_fiscal.fiscal_start_date,
src_fiscal.fiscal_end_date,
src_fiscal.fiscal_month,
src_fiscal.fiscal_year,
src_fiscal.fiscal_week,
src_fiscal.fiscal_quarter,
to_char(src_bcal.bcal_calendar_date,'Dy') day_abbreviated,
trunc(src_bcal.bcal_calendar_date,'IW') oracle_monday_of_week,
next_day(src_bcal.bcal_calendar_date, 'MONDAY') next_monday,
row_number() over (partition by src_fiscal.fiscal_year, src_fiscal.fiscal_month order by trunc(src_bcal.bcal_calendar_date)) index_monthly,
standard_hash(src_bcal.bcal_calendar_date || src_fiscal.fiscal_month,'MD5') AS sk_fiscal_calendar
FROM
    dbt__cte__src_bom_calendar_dates_365days__
    src_bcal
    JOIN dbt__cte__src_gl_periods_365days__
    src_fiscal
    ON src_bcal.bcal_calendar_date BETWEEN src_fiscal.fiscal_start_date
    AND src_fiscal.fiscal_end_date
),  dbt__cte__int_fiscal_calendar_365days__ as (
SELECT 
int_base.*,
case
  -- fiscal 2024
  when int_base.fiscal_month = 'Jan24' then to_date('2024-01-01','YYYY-MM-DD')
  when int_base.fiscal_month = 'Feb24' then to_date('2024-02-01','YYYY-MM-DD')
  when int_base.fiscal_month = 'Mar24' then to_date('2024-03-01','YYYY-MM-DD')
  when int_base.fiscal_month = 'Apr24' then to_date('2024-04-01','YYYY-MM-DD')
  when int_base.fiscal_month = 'May24' then to_date('2024-05-01','YYYY-MM-DD')
  when int_base.fiscal_month = 'Jun24' then to_date('2024-06-01','YYYY-MM-DD')
  when int_base.fiscal_month = 'Jul24' then to_date('2024-07-01','YYYY-MM-DD')
  when int_base.fiscal_month = 'Aug24' then to_date('2024-08-01','YYYY-MM-DD')
  when int_base.fiscal_month = 'Sep24' then to_date('2024-09-01','YYYY-MM-DD')
  when int_base.fiscal_month = 'Oct24' then to_date('2024-10-01','YYYY-MM-DD')
  when int_base.fiscal_month = 'Nov24' then to_date('2024-11-01','YYYY-MM-DD')
  when int_base.fiscal_month = 'Dec24' then to_date('2024-12-01','YYYY-MM-DD')
  -- fiscal 2025
  when int_base.fiscal_month = 'Jan25' then to_date('2025-01-01','YYYY-MM-DD')
  when int_base.fiscal_month = 'Feb25' then to_date('2025-02-01','YYYY-MM-DD')
  when int_base.fiscal_month = 'Mar25' then to_date('2025-03-01','YYYY-MM-DD')
  when int_base.fiscal_month = 'Apr25' then to_date('2025-04-01','YYYY-MM-DD')
  when int_base.fiscal_month = 'May25' then to_date('2025-05-01','YYYY-MM-DD')
  when int_base.fiscal_month = 'Jun25' then to_date('2025-06-01','YYYY-MM-DD')
  when int_base.fiscal_month = 'Jul25' then to_date('2025-07-01','YYYY-MM-DD')
  when int_base.fiscal_month = 'Aug25' then to_date('2025-08-01','YYYY-MM-DD')
  when int_base.fiscal_month = 'Sep25' then to_date('2025-09-01','YYYY-MM-DD')
  when int_base.fiscal_month = 'Oct25' then to_date('2025-10-01','YYYY-MM-DD')
  when int_base.fiscal_month = 'Nov25' then to_date('2025-11-01','YYYY-MM-DD')
  when int_base.fiscal_month = 'Dec25' then to_date('2025-12-01','YYYY-MM-DD')
  -- fiscal 2026
  when int_base.fiscal_month = 'Jan26' then to_date('2026-01-01','YYYY-MM-DD')
  when int_base.fiscal_month = 'Feb26' then to_date('2026-02-01','YYYY-MM-DD')
  when int_base.fiscal_month = 'Mar26' then to_date('2026-03-01','YYYY-MM-DD')
  when int_base.fiscal_month = 'Apr26' then to_date('2026-04-01','YYYY-MM-DD')
  when int_base.fiscal_month = 'May26' then to_date('2026-05-01','YYYY-MM-DD')
  when int_base.fiscal_month = 'Jun26' then to_date('2026-06-01','YYYY-MM-DD')
  when int_base.fiscal_month = 'Jul26' then to_date('2026-07-01','YYYY-MM-DD')
  when int_base.fiscal_month = 'Aug26' then to_date('2026-08-01','YYYY-MM-DD')
  when int_base.fiscal_month = 'Sep26' then to_date('2026-09-01','YYYY-MM-DD')
  when int_base.fiscal_month = 'Oct26' then to_date('2026-10-01','YYYY-MM-DD')
  when int_base.fiscal_month = 'Nov26' then to_date('2026-11-01','YYYY-MM-DD')
  when int_base.fiscal_month = 'Dec26' then to_date('2026-12-01','YYYY-MM-DD')
    -- fiscal 2027
  when int_base.fiscal_month = 'Jan27' then to_date('2027-01-01','YYYY-MM-DD')
  when int_base.fiscal_month = 'Feb27' then to_date('2027-02-01','YYYY-MM-DD')
  when int_base.fiscal_month = 'Mar27' then to_date('2027-03-01','YYYY-MM-DD')
  when int_base.fiscal_month = 'Apr27' then to_date('2027-04-01','YYYY-MM-DD')
  when int_base.fiscal_month = 'May27' then to_date('2027-05-01','YYYY-MM-DD')
  when int_base.fiscal_month = 'Jun27' then to_date('2027-06-01','YYYY-MM-DD')
  when int_base.fiscal_month = 'Jul27' then to_date('2027-07-01','YYYY-MM-DD')
  when int_base.fiscal_month = 'Aug27' then to_date('2027-08-01','YYYY-MM-DD')
  when int_base.fiscal_month = 'Sep27' then to_date('2027-09-01','YYYY-MM-DD')
  when int_base.fiscal_month = 'Oct27' then to_date('2027-10-01','YYYY-MM-DD')
  when int_base.fiscal_month = 'Nov27' then to_date('2027-11-01','YYYY-MM-DD')
  when int_base.fiscal_month = 'Dec27' then to_date('2027-12-01','YYYY-MM-DD')
else null
end AS fiscal_date_placeholder
FROM
dbt__cte__stg_bom_cal_fiscal_365days__ int_base
),  dbt__cte__dim_fiscal_and_calendar_dates__ as (
-- dimension grain: one row per calendar date

-- From High Cardinality to Low Cardinality.
-- From Surrogate Keys to Business/Natural Keys to Major descriptive attributes to Date Attributes to Flags/Booleans
select 
standard_hash(to_number(to_char(base.bcal_calendar_date,'YYYYMMDD')),'MD5') fiscal_and_calendar_dates_sk,
to_number(to_char(base.bcal_calendar_date,'YYYYMMDD')) bcal_calendar_date_id,
base.bcal_calendar_date "Calendar Date",
case 
  when day_abbreviated = 'Mon' then bcal_calendar_date - 3 
  when day_abbreviated = 'Sun' then bcal_calendar_date - 2 
  else bcal_calendar_date - 1 
end yesterday_business_date,
base.fiscal_month "Fiscal Month",
base.fiscal_year "Fiscal Year",
base.bcal_seq_num "Work Dates Index",
base.index_monthly "Day Fiscal Month Index",
base.day_abbreviated "Day of Calendar Date",
to_char(base.bcal_calendar_date,'Mon') "Month of Calendar Date",
base.oracle_monday_of_week "Monday of the current week",
base.next_monday "Following Monday of current day",
base.fiscal_date_placeholder
from dbt__cte__int_fiscal_calendar_365days__ base
where fiscal_year = 2026
order by bcal_calendar_date asc
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
),  dbt__cte__int_scf_wip_valuation_conv_oh__ as (
SELECT wt_primary_item_id, wt_usage_rate_or_amount
FROM dbt__cte__src_wip_transactions__ src_wt
LEFT JOIN dbt__cte__src_wip_transaction_accounts__ src_wta
ON src_wt.wt_transaction_id = src_wta.wta_transaction_id
WHERE 
wt_organization_id = 1213
and src_wta.wta_lu_br_resource_code = 'ConvOH'
and src_wta.meaning_wta_cst_accounting_line_type = 'WIP valuation'
) SELECT
*
FROM
(
SELECT
MIN("Calendar Date") "First Day of Fiscal Month",
"Fiscal Month",
"Fiscal Year",
fiscal_date_placeholder
FROM dbt__cte__dim_fiscal_and_calendar_dates__ scf_base
where "Fiscal Year" = EXTRACT(YEAR from sysdate)
GROUP BY 
"Fiscal Month",
"Fiscal Year",
fiscal_date_placeholder) scf_base
CROSS JOIN 
(select distinct wt_primary_item_id, wt_usage_rate_or_amount from dbt__cte__int_scf_wip_valuation_conv_oh__ int_base)