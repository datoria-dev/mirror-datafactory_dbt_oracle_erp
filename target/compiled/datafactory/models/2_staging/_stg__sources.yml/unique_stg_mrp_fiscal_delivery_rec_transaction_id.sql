
    
    

with dbt__cte__src_mrp_recommendations__ as (
SELECT
    transaction_id AS rec_transaction_id,
    last_update_date AS rec_last_update_date,
    last_updated_by AS rec_last_updated_by,
    creation_date AS rec_creation_date,
    created_by AS rec_created_by,
    last_update_login AS rec_last_update_login,
    inventory_item_id AS rec_inventory_item_id,
    organization_id AS rec_organization_id,
    compile_designator AS rec_compile_designator,
    new_schedule_date AS rec_new_schedule_date,
    old_schedule_date AS rec_old_schedule_date,
    new_wip_start_date AS rec_new_wip_start_date,
    old_wip_start_date AS rec_old_wip_start_date,
    disposition_id AS rec_disposition_id,
    disposition_status_type AS rec_disposition_status_type,
    order_type AS rec_order_type,
    vendor_id AS rec_vendor_id,
    vendor_site_id AS rec_vendor_site_id,
    new_order_quantity AS rec_new_order_quantity,
    old_order_quantity AS rec_old_order_quantity,
    new_order_placement_date AS rec_new_order_placement_date,
    old_order_placement_date AS rec_old_order_placement_date,
    firm_planned_type AS rec_firm_planned_type,
    rescheduled_flag AS rec_rescheduled_flag,
    schedule_compression_days AS rec_schedule_compression_days,
    new_processing_days AS rec_new_processing_days,
    implemented_quantity AS rec_implemented_quantity,
    purch_line_num AS rec_purch_line_num,
    revision AS rec_revision,
    last_unit_completion_date AS rec_last_unit_completion_date,
    first_unit_start_date AS rec_first_unit_start_date,
    last_unit_start_date AS rec_last_unit_start_date,
    daily_rate AS rec_daily_rate,
    old_dock_date AS rec_old_dock_date,
    new_dock_date AS rec_new_dock_date,
    supply_avail_date AS rec_supply_avail_date,
    reschedule_days AS rec_reschedule_days,
    request_id AS rec_request_id,
    program_id AS rec_program_id,
    program_update_date AS rec_program_update_date,
    quantity_in_process AS rec_quantity_in_process,
    firm_quantity AS rec_firm_quantity,
    firm_date AS rec_firm_date,
    netting_date AS rec_netting_date,
    planning_make_buy_code AS rec_planning_make_buy_code,
    updated AS rec_updated,
    status AS rec_status,
    applied AS rec_applied,
    implement_demand_class AS rec_implement_demand_class,
    implement_date AS rec_implement_date,
    implement_quantity AS rec_implement_quantity,
    implement_firm AS rec_implement_firm,
    implement_wip_class_code AS rec_implement_wip_class_code,
    implement_job_name AS rec_implement_job_name,
    implement_dock_date AS rec_implement_dock_date,
    implement_status_code AS rec_implement_status_code,
    implement_employee_id AS rec_implement_employee_id,
    implement_uom_code AS rec_implement_uom_code,
    implement_location_id AS rec_implement_location_id,
    implement_source_org_id AS rec_implement_source_org_id,
    implement_vendor_id AS rec_implement_vendor_id,
    implement_vendor_site_id AS rec_implement_vendor_site_id,
    release_status AS rec_release_status,
    load_type AS rec_load_type,
    implement_as AS rec_implement_as,
    demand_class AS rec_demand_class,
    alternate_bom_designator AS rec_alternate_bom_designator,
    alternate_routing_designator AS rec_alternate_routing_designator,
    line_id AS rec_line_id,
    source AS rec_source,
    by_product_using_assy_id AS rec_by_product_using_assy_id,
    source_organization_id AS rec_source_organization_id,
    source_vendor_site_id AS rec_source_vendor_site_id,
    source_vendor_id AS rec_source_vendor_id,
    source_supply_schedule_name AS rec_source_supply_schedule_name,
    new_ship_date AS rec_new_ship_date,
    project_id AS rec_project_id,
    task_id AS rec_task_id,
    planning_group AS rec_planning_group,
    implement_project_id AS rec_implement_project_id,
    implement_task_id AS rec_implement_task_id,
    implement_schedule_group_id AS rec_implement_schedule_group_id,
    implement_build_sequence AS rec_implement_build_sequence,
    implement_alternate_bom AS rec_implement_alternate_bom,
    implement_alternate_routing AS rec_implement_alternate_routing,
    implement_line_id AS rec_implement_line_id,
    source_item_id AS rec_source_item_id,
    release_errors AS rec_release_errors,
    number1 AS rec_number1,
    end_item_unit_number AS rec_end_item_unit_number,
    implement_end_item_unit_number AS rec_implement_end_item_unit_number,
    program_application_id AS rec_program_application_id
FROM
    apps.mrp_recommendations
WHERE
    organization_id = 1213
    AND compile_designator = 'MRP_NSS'
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
),  dbt__cte__stg_mrp_fiscal_delivery__ as (
select 
stg_base.*,
stg_join1.fiscal_month
FROM dbt__cte__src_mrp_recommendations__ stg_base
join dbt__cte__stg_bom_cal_fiscal_30days__ stg_join1
on TRUNC(stg_base.rec_new_schedule_date) = TRUNC(stg_join1.bcal_calendar_date)
) select
    rec_transaction_id as unique_field,
    count(*) as n_records

from dbt__cte__stg_mrp_fiscal_delivery__
where rec_transaction_id is not null
group by rec_transaction_id
having count(*) > 1


