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
) SELECT
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