with dbt__cte__src_bom_departments__ as (
SELECT
    pa_expenditure_org_id AS bd_pa_expenditure_org_id,
    department_id AS bd_department_id,
    department_code AS bd_department_code,
    organization_id AS bd_organization_id,
    last_update_date AS bd_last_update_date,
    last_updated_by AS bd_last_updated_by,
    creation_date AS bd_creation_date,
    created_by AS bd_created_by,
    last_update_login AS bd_last_update_login,
    description AS bd_description,
    department_class_code AS bd_department_class_code
FROM
    apps.bom_departments
WHERE
    organization_id = 1213
) -- declare grain: one row per departmant
-- Colomn ordering: from high cardinality to lowest cardinality
-- Surrogate keys - Business keys - Major Descriptive Attributes - Date Attributes (when) - Minor Descriptive Attributes
select
standard_hash(base.bd_department_id, 'MD5') departments_from_sk,
base.bd_department_id,
base.bd_organization_id,
base.bd_department_code AS "Department",
base.bd_description,
base.bd_department_class_code
from dbt__cte__src_bom_departments__ base