# Repository Guidelines

## Project Structure & Module Organization

This is a public reference and templating copy of a dbt project for Oracle EBS analytics engineering. Use `README.md` as the primary root map before editing. Core SQL lives in `models/`: `1_sources/` for raw extracts, `2_staging/` for cleaned joins, `3_intermediate/` for business logic, `4_marts/` for reporting marts, and `9_optimized_compiled_sql/` for report SQL. Put Jinja in `macros/`, inputs in `seeds/`, exploratory SQL in `analyses/`, and generic tests in `tests/generic/`. Tableau workbooks and lineage notes live under `tableau/` and `knowledgebase/`.

## Reference-Only Execution Boundary

Do not run dbt, Oracle SQL, Tableau, Colibri, seed, test, docs, deployment, or warehouse commands from this checkout. This repo is outside the company private environment, so contributors and agents lack Oracle, data warehouse, Tableau Server, and production credentials. Work through static inspection only: `rg`, `find`, `sed`, `jq`, and editor search are appropriate. Treat existing names and patterns as working truth; do not require live validation.

## Static Lineage References

For lineage and referential context, inspect dbt SQL and YAML for `ref()`, `source()`, model names, and key aliases. Also use generated artifacts when present: `docs/index.html`, `docs/manifest.json`, `docs/catalog.json`, `target/manifest.json`, `target/catalog.json`, and Colibri output such as `dist/` or `colibri-manifest.json`.

For Tableau metadata documentation or workbook XML analysis, also reference local materials in `/Users/aguerra/Documents/Tableau/tableau-complexity` and `/Users/aguerra/Documents/Tableau/document-api-python`. Use them as static documentation and example sources; do not assume access to Tableau Server.

## Coding Style & Naming Conventions

Write dbt SQL with clear CTEs, lowercase file names, and layer prefixes: `src_`, `stg_`, `int_`, `dim_`, `fct_`, `agg_`, and `scf_`. Prefer `ref()` and `source()` over hard-coded dependencies. Keep YAML beside the relevant layer, for example `_marts__sources.yml`, and use `data_tests:` for schema tests. Match existing Oracle aliases and domain abbreviations even when unverified.

## Testing Guidelines

Do not execute tests in this repo. Instead, make changes test-ready: add uniqueness, not-null, relationship, or accepted-values tests for new keys or constrained status fields. In notes or PRs, list dbt selectors to validate later inside the private environment.

## Commit & Pull Request Guidelines

Recent commits use short imperative summaries, sometimes with a prefix such as `docs:`. Keep subjects specific, for example `docs: add dbt upgrade notes` or `Add supplier defects mart tests`. PRs should explain intent, affected layers, public-repo assumptions, and validation to perform later on the company laptop or private repo.

## Security & Configuration Tips

Do not commit credentials, `.env` files, `secrets/`, local config, warehouse extracts, or company-only Tableau Server details. Keep this repo suitable for public GitHub use: templates and SQL patterns are acceptable, but private data and executable environment assumptions are not.
