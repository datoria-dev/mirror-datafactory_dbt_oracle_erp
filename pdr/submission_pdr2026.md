# PDR 2026 Submission Draft

## Enhance Analytics Alignment

- Completed a working Tableau dashboard inventory baseline across 8 functional areas, identifying **48 meaningful dashboards** and excluding 1 invalid `Null` item.
- Identified early dashboard reduction and consolidation candidates, including **Dynamic Daily Rates**, **Employee WIP Moves**, **WIP quantities**, and DEV dashboards that should be moved into the Tableau Server DEV environment.
- Established a traffic-signal scorecard to track dashboard handoff readiness, migration status, documentation gaps, and technical debt.
- Summarized and documented approximately **90%** of the Tableau workbook and dbt model relationships, including workbook metadata, likely dbt dependencies, Oracle source tables, Airflow-supported refresh patterns, and production data assets. Connected this work to the corporate GitLab project `ES / ESDATA / dbt` to support version-controlled analytics engineering instead of isolated Tableau or Excel point solutions.
- Confirmed three dashboards are in active HUB analyst handoff scope: **MDS Calculations**, **WIP Quality Summary**, and **Dynamic Daily Rates**.
- Created a defensible dashboard reduction baseline: with 48 dashboards, the 10% reduction goal equals approximately **5 dashboards** for consolidation, retirement, or ownership transition.
- Second-half focus is to validate at least 5 reduction candidates, continue handoff readiness tracking, and expand governance beyond dashboard count into lineage, ownership, and calculated-field complexity.

## Mature Manufacturing HUB Analytics

- Led HUB analyst enablement by coaching the analyst from primarily Excel/workbook-style analysis into a source-controlled analytics engineering workflow.
- Supported setup of the corporate GitLab/dbt environment, including repository cloning, Oracle credentials, environment variables, Python installation, dbt repo setup, and SQL execution.
- Coached the analyst through data model review and helped connect dashboard outputs back to governed source logic, dbt models, and production data assets.
- Supported creation of a new forecasting on-hand MRP model that summarizes balance of supply and demand and shows how far available supply can support demand.
- Established MDS Calculations as the strongest handoff example; the HUB analyst can now explain MDS Calculations fully and WIP Quality Summary partially.
- Used the scorecard to make handoff readiness visible, including which dashboards are officially handed off, ready but not complete, or blocked by documentation, governance, or technical debt.
- Current blockers are SQL confidence and data model complexity, which are being addressed through continued coaching, documentation, and hands-on review.
- Second-half focus is to continue building HUB analyst independence so they can support MDS Calculations, expand support for WIP Quality Summary, and take on additional dashboard families as lineage and documentation mature.

## Migrate Front-End Analytics Tools

- Supported migration of front-end Tableau dashboards toward governed production-backed sources using dbt, Airflow/Linux workflows, Jarvis PROD tables, stored procedures, and Tableau Server data sources.
- Confirmed current dashboard sources in this scope are PROD-backed and supported by Kimball-style dimensional modeling where appropriate, including facts, dimensions, and reporting views.
- Used **MDS Calculations** as the strongest migration example by decoupling the dashboard from multiple direct connections and organizing logic into modular SQL files and dbt models.
- Connected dashboard migration work to the corporate GitLab repository structure, including `docs`, `dist`, `knowledgebase`, `analyses`, `.vscode`, and `macros`, showing the work is organized as a repeatable engineering system.
- Prioritized **MDS Calculations**, **WIP Quality Summary**, and **Dynamic Daily Rates** as first handoff examples, while treating broader Move Transactions and WIP dashboard families as migration and reduction candidates.
- Identified Tableau calculated fields as a technical-debt target. No calculated fields are being claimed as migrated upstream yet, but several appear redundant or unclear and should be removed or governed in dbt where appropriate.
- Current Medallion migration goal is on track as I understand it, but needs clarification with management because bronze/silver/gold is not yet a general practice across the group.
- In my current dbt project structure, bronze aligns to sources and staging, silver aligns to intermediate models and marts, and gold aligns to Kimball-style facts and dimensions.
- Second-half focus is to clarify Medallion expectations, continue moving dashboard dependencies toward governed sources, and reduce workbook-level technical debt.

## Automate Functional Scorecards

- Supported functional scorecard modernization through dashboards and governed detail layers built around **Cost of Poor Quality (COPQ)**, **Automated On Time Delivery (AOTD)**, and related operational analysis.
- Built and supported dashboards that allow users to drill from summary-level metrics into governed detail data for self-service analysis and root-cause investigation.
- Established implemented dashboard outputs with meaningful user activity and view counts, showing the work is being used in practice rather than remaining theoretical.
- Since I have partial ownership of these dashboards, goal clarification is needed on who owns the official functional scorecards and how supporting dashboard implementations should count toward the PDR measure. Second-half focus is to clarify ownership, continue supporting governed drilldown capability, and align scorecard-related dashboards to documented source-of-truth logic.

## Support Special Initiatives

- Supported modernization efforts including Alteryx migration, Python data engineering transport, and the corporate Windsurf pilot for code auto-completion, with a focus on moving work away from isolated desktop processes and toward repeatable, source-controlled engineering practices.
- Built Collibra-style lineage and governance documentation patterns that connect Tableau workbook metadata, dashboard fields, dbt models, SQL dependencies, Oracle source tables, and production data assets into a clearer source-of-truth story.
- Used the HTML lineage tool and Tableau utilization dashboard to make lineage, usage, migration priority, handoff readiness, and technical debt visible for governance and manager-level discussion.

## HUB Analyst Transition

- Created a traffic-signal handoff scorecard to make dashboard transition status explicit: `🟢` means officially handed off, `🟡` means ready for handoff but not complete, and `🔴` means not ready because documentation, governance, or technical debt prevents HUB analyst ownership.
- Identified **MDS Calculations**, **WIP Quality Summary**, and **Dynamic Daily Rates** as the first handoff examples, while keeping broader Move Transactions and WIP dashboard families in candidate/review status.
- Positioned dashboard documentation, lineage notes, dbt model references, Oracle source-table mapping, and Tableau workbook metadata as handoff artifacts so another employee can understand and support the dashboard rather than only open it.
- Second-half focus is to continue using the scorecard to validate ownership, data-source understanding, documentation completeness, and support readiness before additional dashboards move to HUB analyst ownership.
