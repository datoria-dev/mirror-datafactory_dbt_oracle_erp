{% docs __overview__ %}

# DataFactory

DataFactory is the dbt documentation hub for Oracle EBS manufacturing intelligence. This catalog focuses on the governed path from Oracle source data into marts that support WIP execution, quality, inventory, supplier performance, MRP planning, and Tableau reporting.

## Marts Pilot

This pilot documents the `models/4_marts` layer first. The marts layer is where DataFactory becomes business-readable: dimensions describe the nouns of the operation, facts measure production and quality activity, aggregates speed up dashboard reporting, and scaffolding models fill the time and item grains needed for complete analysis.

## What To Use First

- Use `dim_item_master`, `dim_wip_jobs`, `dim_fiscal_and_calendar_dates`, and `dim_quality_plans_and_columns` to understand the core reporting dimensions.
- Use `fct_wip_jobs`, `fct_wip_assembly_completions`, `fct_supplier_caused_defects`, and `fct_component_material_transactions` for production and quality metrics.
- Use `supplier_defects_metric_daily`, `move_trxns_dynamic_daily_rate`, `horizontal_wip`, and `wip_valuation_conv_oh` for dashboard-ready operational views.

## Governance Notes

The project name and dbt profile are intentionally `datafactory`. The Oracle development profile keeps host, service, schema, and user metadata in source control, while the password is supplied through `DBT_ORACLE_PASSWORD`.

{% enddocs %}
