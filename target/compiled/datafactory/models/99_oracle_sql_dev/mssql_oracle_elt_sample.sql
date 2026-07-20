SELECT * INTO [dbt].[oracle_wip_entities]
FROM OPENQUERY([USCEBSDG], 'SELECT * FROM apps.wip_entities WHERE ROWNUM <= 1000');

SELECT * INTO [dbt].[oracle_wip_discrete_jobs]
FROM OPENQUERY([USCEBSDG], 'SELECT * FROM apps.wip_discrete_jobs WHERE ROWNUM <= 1000');

SELECT * INTO [dbt].[oracle_wip_operations]
FROM OPENQUERY([USCEBSDG], 'SELECT * FROM apps.wip_operations WHERE ROWNUM <= 1000');

SELECT * INTO [dbt].[oracle_wip_move_transactions]
FROM OPENQUERY([USCEBSDG], 'SELECT * FROM apps.wip_move_transactions WHERE ROWNUM <= 1000');

SELECT * INTO [dbt].[oracle_wip_period_balances]
FROM OPENQUERY([USCEBSDG], 'SELECT * FROM apps.wip_period_balances WHERE ROWNUM <= 1000');

SELECT * INTO [dbt].[oracle_wip_transactions]
FROM OPENQUERY([USCEBSDG], 'SELECT * FROM apps.wip_transactions WHERE ROWNUM <= 1000');

SELECT * INTO [dbt].[oracle_wip_transaction_accounts]
FROM OPENQUERY([USCEBSDG], 'SELECT * FROM apps.wip_transaction_accounts WHERE ROWNUM <= 1000');

SELECT * INTO [dbt].[oracle_wip_requirement_operations]
FROM OPENQUERY([USCEBSDG], 'SELECT * FROM apps.wip_requirement_operations WHERE ROWNUM <= 1000');

SELECT * INTO [dbt].[oracle_mrp_recommendations]
FROM OPENQUERY([USCEBSDG], 'SELECT * FROM apps.mrp_recommendations WHERE ROWNUM <= 1000');

SELECT * INTO [dbt].[oracle_mtl_system_items_b]
FROM OPENQUERY([USCEBSDG], 'SELECT * FROM apps.mtl_system_items_b WHERE ROWNUM <= 1000');

SELECT * INTO [dbt].[oracle_mtl_planners]
FROM OPENQUERY([USCEBSDG], 'SELECT * FROM apps.mtl_planners WHERE ROWNUM <= 1000');

SELECT * INTO [dbt].[oracle_mtl_onhand_quantities_detail]
FROM OPENQUERY([USCEBSDG], 'SELECT * FROM apps.mtl_onhand_quantities_detail WHERE ROWNUM <= 1000');

SELECT * INTO [dbt].[oracle_mtl_material_transactions]
FROM OPENQUERY([USCEBSDG], 'SELECT * FROM apps.mtl_material_transactions WHERE ROWNUM <= 1000');

SELECT * INTO [dbt].[oracle_mtl_reservations]
FROM OPENQUERY([USCEBSDG], 'SELECT * FROM apps.mtl_reservations WHERE ROWNUM <= 1000');

SELECT * INTO [dbt].[oracle_mtl_sales_orders]
FROM OPENQUERY([USCEBSDG], 'SELECT * FROM apps.mtl_sales_orders WHERE ROWNUM <= 1000');