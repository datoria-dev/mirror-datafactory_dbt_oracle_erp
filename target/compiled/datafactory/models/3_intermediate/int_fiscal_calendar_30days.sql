with dbt__cte__src_bom_calendar_dates_30days__ as (
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
) SELECT 
int_base.*,
standard_hash(int_base.bcal_calendar_date || int_base.fiscal_month,'MD5') AS sk_fiscal_calendar
FROM
dbt__cte__stg_bom_cal_fiscal_30days__ int_base