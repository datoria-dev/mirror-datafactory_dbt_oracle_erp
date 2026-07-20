# Tableau Migration Handoff To-Do

## Where We Left Off

The next step is to finish the full list of Tableau workbooks on the work laptop, give that workbook set to Codex, run the documentation and lineage algorithm across the complete list, summarize the outputs, and assign traffic signals.

This scorecard is meant to track the Tableau migration process and the handoff between the user and another employee. It should give the next person enough workbook docs, lineage notes, source references, and status signals to continue the migration without guessing.

## Current Usage Baseline

- `dashboard_inventory_with_estimates.csv` is the working dashboard utilization baseline.
- It includes 49 listed rows, 48 meaningful dashboards, and 1 invalid `Null` record excluded from the dashboard baseline.
- It contains 7 verified dashboard-level screenshot counts and 41 provisional utilization/bar-chart counts.
- Current totals are 247,543 authoritative/base views, 266,070 conservative planning views, and 371,324 in the 50% estimate scenario.
- The 30% and 50% uplift columns are estimates for planning only, not observed actual counts.

## Current Starting Dashboards

Start with these dashboard workstreams:

| Priority | Dashboard Workstream | Current Repo Reference | Scorecard Row |
| --- | --- | --- | --- |
| 1 | MDS Calculations | `docs/tableau_workbook_analysis/mds-calculations-current-month-daily/README.md` | `11` |
| 2 | Move Transactions | `docs/tableau_workbook_analysis/prod-move-transactions/README.md` | `20` |
| 2 | Move Transactions Daily Refresh | `docs/tableau_workbook_analysis/prod-move-transactions-daily-refresh/README.md` | `21` |

## To-Do List

- [ ] Export or copy the full Tableau workbook list from the work laptop.
- [ ] Confirm which files are migration candidates and which are archive/reference only.
- [ ] Add the complete workbook set under `tableau/my-tableau-dashboards/`.
- [ ] Add matching dashboard screenshots under `tableau/my-tableau-screenshots/`.
- [ ] Run `scripts/generate_tableau_workbook_docs.py` against the complete workbook set.
- [ ] Regenerate `docs/tableau_workbook_analysis/` and validate every workbook has the expected document structure.
- [ ] Update `SCORECARD.md` with one row per workbook or dashboard workstream.
- [ ] Review each workbook with the handoff employee and record the final traffic signal.
- [ ] Use the appendix lineage links to explain likely dbt models, seeds, and Oracle source tables.
- [ ] Push the final migration scorecard and workbook docs to GitHub.

## Traffic Signal Instructions

- `🟢` good: workbook is documented, screenshot is matched, lineage has likely dbt/source coverage, and the handoff employee has enough context to migrate or validate it.
- `🟡` so-so: workbook is partially documented, has missing screenshots, ambiguous lineage, duplicate workbook variants, or needs human review before migration.
- `🔴` bad: workbook is blocked, missing, cannot be parsed, has no usable lineage, or requires private/company-only access before the handoff can proceed.

## Handoff Notes

Keep the scorecard concise. The main table should show status and counts only. Put long dbt model, seed, and Oracle source lists in appendix sections with links back to the table of contents.
