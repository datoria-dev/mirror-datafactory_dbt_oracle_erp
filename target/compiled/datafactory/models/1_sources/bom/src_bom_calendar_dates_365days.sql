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