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
),  dbt__cte__src_bom_calendar_dates_30days__ as (
SELECT
    calendar_date as bcal_calendar_date,
    next_date as bcal_next_date,
    seq_num as bcal_seq_num,
    next_seq_num as bcal_next_seq_num,
    CASE
        WHEN seq_num IS NULL THEN next_date
        ELSE calendar_date
    END as bcal_working_dates
FROM
    apps.bom_calendar_dates
WHERE
    calendar_code = 'NSS'
    AND calendar_date BETWEEN sysdate-30
    AND sysdate+30
),  dbt__cte__src_gl_periods__ as (
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
    AND start_date BETWEEN sysdate-30
    AND sysdate+30
),  dbt__cte__stg_bom_cal_fiscal_30days__ as (
SELECT
    src_bcal.*,
    src_fiscal.*
FROM
    dbt__cte__src_bom_calendar_dates_30days__
    src_bcal
    JOIN dbt__cte__src_gl_periods__
    src_fiscal
    ON src_bcal.bcal_calendar_date BETWEEN src_fiscal.fiscal_start_date
    AND src_fiscal.fiscal_end_date
),  dbt__cte__int_fiscal_calendar_current_year__ as (
SELECT
    int_base.fiscal_year,
    TRUNC(SYSDATE) AS "update_at"
FROM
    dbt__cte__stg_bom_cal_fiscal_30days__
    int_base
WHERE
    TRUNC(SYSDATE) BETWEEN TRUNC(int_base.fiscal_start_date) AND TRUNC(int_base.fiscal_end_date) 
    AND ROWNUM = 1
) SELECT
trunc(base.bcal_calendar_date) AS "Fiscal Date",
base.fiscal_month AS "Fiscal Month",
base.fiscal_week AS "Fiscal Week",
base.fiscal_year AS "Fiscal Year"
from dbt__cte__int_fiscal_calendar_365days__ base
where base.fiscal_year = 
(
    select x.fiscal_year from dbt__cte__int_fiscal_calendar_current_year__ x
)
order by "Fiscal Date"