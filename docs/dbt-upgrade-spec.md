# dbt Upgrade Specification: Phase 1 (1.11) and Phase 2 (1.12)

## 1. Overview & Background

This project is currently on **dbt-core v1.0.9** and is targeting a Databricks adapter path via **`dbt-databricks`**.

Upgrade strategy is intentionally split into two tracks:

- **Phase 1 (immediate, production path):** upgrade to
  - `dbt-core==1.11.11`
  - `dbt-databricks==1.11.8`
- **Phase 2 (parallel, exploratory):** prepare for
  - `dbt-core==1.12.0`
  - `dbt-databricks==1.12.0`
  - execute only after dbt-core 1.12 stable GA (currently only `v1.12.0b1` beta exists)

Dependency management and environments must use **UV only** (not pip as the primary workflow), including lockfiles and reproducible installs.

Primary motivator for the Phase 2 dbt-core 1.12 upgrade is native **`.env` auto-loading** for `env_var()` support in local/CLI workflows.

---

## 2. Environment Variable Strategy

### 2.1 `env_var()` behavior and supported locations

`env_var()` reads operating system environment variables into dbt Jinja contexts. It is available anywhere dbt evaluates Jinja, including:

- `profiles.yml`
- `dbt_project.yml`
- `sources.yml`
- `schema.yml`
- model `.sql` files

If a referenced variable is missing and no default is provided, dbt raises a compilation error.

### 2.2 dbt-core v1.12 `.env` auto-loading mechanics

In dbt-core v1.12, dbt loads `.env` automatically at CLI startup using python-dotenv in `core/dbt/cli/main.py`:

```python
load_dotenv(find_dotenv(usecwd=True), override=False)
```

Implications:

- `.env` lookup is from the **current working directory (cwd)** where command is executed.
- `.env` is loaded **before Click processes CLI parameters**.
- `override=False` means shell variables always win over `.env` values.
- This does **not** load from `--project-dir`; CI/CD scripts must run from intended cwd or inject env vars directly.
- dbt starter project `.gitignore` includes `.env` by default.

### 2.3 `DBT_` env var namespace validation and warnings

`dbt-core` `env_vars.py` contains engine validation guardrails:

- `KNOWN_ENGINE_ENV_VARS`
- `_ALLOWED_ENV_VARS`
- `validate_engine_env_vars()`

In 1.11+, `DBT_`-prefixed environment variables not in the allowlist raise deprecation warnings.

Additional allowlisted vars include `_ADDITIONAL_ENGINE_ENV_VARS`, including:

- `DBT_INVOCATION_ENV`
- `DBT_PACKAGE_HUB_URL`
- `DBT_DOWNLOAD_DIR`
- `DBT_ENGINE_STATE_*` variables
- and related engine-managed keys

**Rule:** avoid introducing custom `DBT_*` variable names unless explicitly supported.

### 2.4 Type conversion requirements in Jinja

All environment variables are strings. Convert explicitly when typed config is required:

- Integers: `| int` or `| as_number`
- Booleans: `| as_bool`

Examples:

```jinja
{{ env_var('DBT_THREADS', '4') | int }}
{{ env_var('DB_PORT', '1521') | as_number }}
{{ env_var('DBT_PERSIST_DOCS_RELATION', False) | as_bool }}
```

### 2.5 Example `.env` and `profiles.yml` usage pattern

```dotenv
# .env (never commit)
DBT_USER=myuser
DBT_PASSWORD=mysecretpassword
DBT_SCHEMA=dbt_dev
DBT_HOST=my-databricks-host.azuredatabricks.net
DBT_HTTP_PATH=/sql/1.0/warehouses/abc123
DBT_TOKEN=dapi_abc123
DBT_THREADS=4
```

```yaml
datafactory_dbt_oracle_erp:
  target: dev
  outputs:
    dev:
      type: databricks
      host: "{{ env_var('DBT_HOST') }}"
      http_path: "{{ env_var('DBT_HTTP_PATH') }}"
      token: "{{ env_var('DBT_TOKEN') }}"
      schema: "{{ env_var('DBT_SCHEMA') }}"
      threads: "{{ env_var('DBT_THREADS', '4') | int }}"
    prod:
      type: databricks
      host: "{{ env_var('DBT_HOST') }}"
      http_path: "{{ env_var('DBT_HTTP_PATH') }}"
      token: "{{ env_var('DBT_TOKEN') }}"
      schema: "{{ env_var('DBT_PROD_SCHEMA') }}"
      threads: "{{ env_var('DBT_THREADS', '8') | int }}"
```

---

## 3. dbt-core v1.11 → Production Upgrade (Phase 1)

### 3.1 Breaking changes and required migration steps (v1.0.9 → v1.11)

#### Step A — 1.0.9 → 1.3 (Adapter decoupling)

- dbt adapters moved to separate packages.
- `dbt-databricks` must be installed explicitly.
- `dbt-databricks` is canonical Databricks adapter (replacing earlier `dbt-spark` + `method: odbc` patterns).

#### Step B — 1.3 → 1.5 (Python models + groups/contracts)

- Python models introduced (no migration work if project does not use Python models).
- Model contracts/constraints introduced under `constraints:`.
- Access control model config introduced with `access: private|protected|public`.

#### Step C — 1.5 → 1.6/1.7 (MetricFlow transition)

- Metric syntax changed significantly.
- Legacy `metrics:` YAML definitions are not drop-in compatible.
- `dbt-semantic-interfaces` introduced as a dependency during this era.

#### Step D — 1.7 → 1.8 (Unit tests key rename)

- `tests:` key renamed to `data_tests:` in `dbt_project.yml` and schema YAML.
- Legacy `tests:` still runs in 1.8/1.9/1.10 but emits deprecations.

#### Step E — 1.8 → 1.9 (Microbatch + snapshot updates)

- `microbatch` incremental strategy introduced.
- Snapshot strategy behavior updated.

#### Step F — 1.9 → 1.10 → 1.11 (stabilization)

- `vars.yml` support added in 1.11.
- `data_tests:` enforcement is complete in 1.11; old `tests:` is fully deprecated.
- Python 3.9 dropped in 1.11 (must run Python 3.10+).

### 3.2 Pre-upgrade checklist

1. [ ] Confirm Python version is 3.10+
2. [ ] Rename all `tests:` → `data_tests:` in `dbt_project.yml` and all schema `.yml` files
3. [ ] Remove/update `dbt-semantic-interfaces` pins if metrics are used; verify MetricFlow compatibility
4. [ ] Clear `target/` directory before first run on the new version
5. [ ] Save current `target/manifest.json` as production artifact for `state:modified` deferral
6. [ ] Check for `quoting:` configurations that may behave differently
7. [ ] Audit all metrics YAML definitions if metrics are used; rewrite to MetricFlow-compatible format
8. [ ] Tag the current state in git: `git tag dbt-v109-last-known-good`

### 3.3 UV setup and virtual environment configuration

```bash
# Install UV if not already installed
curl -LsSf https://astral.sh/uv/install.sh | sh

# Create isolated envs
uv venv .venv-dbt111
uv venv .venv-dbt112

# Activate 1.11 env
source .venv-dbt111/bin/activate  # Linux/Mac
# .venv-dbt111\Scripts\activate  # Windows

# Install dbt 1.11
uv pip install "dbt-core>=1.11,<1.12" "dbt-databricks>=1.11,<1.12"

# Generate lockfile
uv pip compile requirements-dbt111.in -o requirements-dbt111.lock

# Install from lockfile (reproducible)
uv pip sync requirements-dbt111.lock
```

`pyproject.toml` target structure:

```toml
[project]
name = "datafactory-dbt-oracle-erp"
requires-python = ">=3.10"

[dependency-groups]
dbt111 = [
    "dbt-core>=1.11.0,<1.12",
    "dbt-databricks>=1.11.0,<1.12",
    "python-dotenv>=1.0.0",
]
dbt112 = [
    "dbt-core>=1.12.0b1",
    "dbt-databricks>=1.12.0",
    "python-dotenv>=1.0.0",
]
```

`requirements-dbt111.in`:

```text
dbt-core>=1.11.0,<1.12
dbt-databricks>=1.11.0,<1.12
python-dotenv>=1.0.0
```

Expected lock pins:

```text
dbt-core==1.11.11
dbt-databricks==1.11.8
```

### 3.4 Validation pipeline (Local → CI → Staging → Prod)

#### Stage 1 — Local dev

```bash
source .venv-dbt111/bin/activate
dbt parse --profiles-dir ./profiles
dbt compile
dbt parse 2>&1 | grep -i "deprecat"
dbt run --target dev --select state:modified+
dbt test --target dev
```

#### Stage 2 — CI (GitHub Actions)

Use dedicated workflow (`.github/workflows/dbt-upgrade-validation.yml`) with:

- Trigger on push to `upgrade/dbt-1.11` and PRs to `main`
- `astral-sh/setup-uv@v3`
- Install from lockfile: `uv pip sync requirements-dbt111.lock`
- Run:
  - `dbt parse`
  - `dbt compile`
  - `dbt build --target ci --select state:modified+ --defer --state ./prod-artifacts`
- UV cache enabled

#### Stage 3 — Staging

- Deploy to staging target that mirrors production schema shape.
- Execute full `dbt build` (not only modified nodes).
- Compare row counts and key aggregates between old and new versions.

#### Stage 4 — Production promotion

- Merge `upgrade/dbt-1.11` into `main` after validation signoff.
- Update CI/CD to consume `requirements-dbt111.lock`.
- Monitor first production run for warning spikes and runtime regressions.

### 3.5 Compiled SQL diff process

```bash
# Save compiled output on current version (1.0.9)
dbt compile --target prod
cp -r target/compiled ./artifacts/compiled-v109

# After upgrade to 1.11
dbt compile --target prod
cp -r target/compiled ./artifacts/compiled-v111

# Diff
diff -r artifacts/compiled-v109 artifacts/compiled-v111
```

### 3.6 Rollback plan

```bash
# Rollback steps
git checkout dbt-v109-last-known-good
uv pip sync requirements-dbt109.lock
dbt run --full-refresh --select <affected_models>
```

---

## 4. dbt-core v1.12 Upgrade Preparation (Phase 2 — Parallel Track)

### 4.1 Current status

- **dbt-core v1.12:** only `v1.12.0b1` beta available as of 2026-05-13.
- **dbt-databricks v1.12.0:** stable as of 2026-05-18.
- Production use is blocked until dbt-core `1.12.x` stable GA is available.

### 4.2 New 1.12 features relevant to this project

| Feature | Detail |
|---|---|
| **`.env` auto-loading** | `load_dotenv(find_dotenv(usecwd=True), override=False)` in `cli/main.py` loads `.env` from cwd automatically |
| **`vars.yml`** | Project variables can move outside `dbt_project.yml` |
| **`--continue-on-error`** | Continue DAG execution for child nodes when a parent node errors |
| **`dbt seed --empty`** | Create seed tables without loading data (useful in CI scaffolding) |
| **`--sql` for `run-operation`** | Execute ad-hoc SQL/Jinja inline |
| **JS UDF support** | JavaScript UDF support added |
| **Python 3.14 support** | Runtime compatibility update |
| **MetricFlow direct dependency** | Replaces legacy `dbt-semantic-interfaces` expectations |
| **`click` minimum 8.3.0** | CLI dependency floor increases |
| **Semantic Layer YAML v2** | New metric/semantic model schema |

### 4.3 Breaking changes in `dbt-databricks` v1.12.0

- `databricks_tags` hierarchy behavior changed.
- Tags now merge additively across configuration levels instead of full child override.
- This is breaking where previous override semantics were assumed.

New adapter capabilities include:

- Python UDFs
- Row filters
- Metric views materialization
- `SCHEDULE EVERY` and `TRIGGER ON UPDATE` for streaming tables

### 4.4 1.12 beta testing setup with UV

```bash
# Separate venv — never used in CI/prod
source .venv-dbt112/bin/activate
uv pip install dbt-core==1.12.0b1 dbt-databricks==1.12.0

# Test .env loading
echo "DBT_SCHEMA=dbt_dev_112" > .env
dbt parse  # confirm .env is picked up
dbt compile
```

### 4.5 `.env` implementation for 1.12

`.env` example:

```dotenv
# .env — DO NOT COMMIT (add to .gitignore)
DBT_USER=myuser
DBT_PASSWORD=mysecretpassword
DBT_SCHEMA=dbt_dev
DBT_HOST=my-databricks-host.azuredatabricks.net
DBT_HTTP_PATH=/sql/1.0/warehouses/abc123
DBT_TOKEN=dapi_abc123
```

`profiles.yml` example:

```yaml
datafactory_dbt_oracle_erp:
  target: dev
  outputs:
    dev:
      type: databricks
      host: "{{ env_var('DBT_HOST') }}"
      http_path: "{{ env_var('DBT_HTTP_PATH') }}"
      token: "{{ env_var('DBT_TOKEN') }}"
      schema: "{{ env_var('DBT_SCHEMA') }}"
      threads: "{{ env_var('DBT_THREADS', '4') | int }}"
    prod:
      type: databricks
      host: "{{ env_var('DBT_HOST') }}"
      http_path: "{{ env_var('DBT_HTTP_PATH') }}"
      token: "{{ env_var('DBT_TOKEN') }}"
      schema: "{{ env_var('DBT_PROD_SCHEMA') }}"
      threads: "{{ env_var('DBT_THREADS', '8') | int }}"
```

### 4.6 Branch strategy for Phase 2

```text
main (production - dbt 1.11 after Phase 1)
└── upgrade/dbt-1.12-beta     ← exploratory, rebased onto main after 1.11 lands
```

Rules:

- Never merge `upgrade/dbt-1.12-beta` into `main` before dbt-core 1.12 stable GA.
- Rebase this branch onto `main` after Phase 1 completion.
- Use this branch to pre-build:
  - `vars.yml` migration
  - `.env` setup
  - `databricks_tags` behavior audit

---

## 5. Git Branch Strategy (Full)

```text
main
├── upgrade/dbt-1.11                    ← Phase 1 (merge to main when validated)
│   ├── fix/rename-data-tests
│   ├── fix/profile-updates
│   └── fix/metrics-migration
└── upgrade/dbt-1.12-beta               ← Phase 2 (never merge until 1.12 stable GA)
    ├── feat/dotenv-setup
    ├── feat/vars-yml-migration
    └── feat/databricks-tags-audit
```

---

## 6. CI/CD Configuration

Create `.github/workflows/dbt-upgrade-validation.yml` with the following content:

```yaml
name: dbt Upgrade Validation

on:
  push:
    branches:
      - "upgrade/dbt-1.11"
      - "upgrade/dbt-1.12-beta"
  pull_request:
    branches:
      - main

jobs:
  validate-dbt-111:
    if: contains(github.ref, 'dbt-1.11') || github.event_name == 'pull_request'
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4

      - name: Install uv
        uses: astral-sh/setup-uv@v3
        with:
          enable-cache: true

      - name: Install Python
        run: uv python install 3.11

      - name: Install dbt 1.11 from lockfile
        run: uv pip sync requirements-dbt111.lock

      - name: dbt parse
        run: dbt parse --profiles-dir ./ci-profiles
        env:
          DBT_TARGET: ci
          DBT_HOST: ${{ secrets.DBT_HOST }}
          DBT_HTTP_PATH: ${{ secrets.DBT_HTTP_PATH }}
          DBT_TOKEN: ${{ secrets.DBT_TOKEN }}
          DBT_SCHEMA: ci_${{ github.run_id }}

      - name: dbt compile
        run: dbt compile
        env:
          DBT_TARGET: ci

      - name: Check for deprecation warnings
        run: |
          dbt parse 2>&1 | tee parse_output.txt
          if grep -i "deprecat" parse_output.txt; then
            echo "::warning::Deprecation warnings found - review before production"
          fi

      - name: dbt build (slim CI)
        run: |
          dbt build \
            --target ci \
            --select state:modified+ \
            --defer \
            --state ./prod-artifacts
        env:
          DBT_TARGET: ci
```

---

## 7. dbt Packages Reference (Planning Context)

These packages are supplementary and **not blockers** for core upgrade execution.

### 7.1 Observability & Data Quality Monitoring

- `elementary-data/elementary` — Full observability (anomaly detection, alerting, lineage, dashboards)
- `elementary-data/dbt-data-reliability` — Reliability tests and anomaly monitoring companion package
- `re-data/re-data` + `re-data/dbt-re-data` — Automated monitoring and alerting
- `data-drift/data-drift` — Data drift tracking over time
- `data-mie/dbt-profiler` — Column profiling (nulls, cardinality, distributions)

### 7.2 CI/CD & Project Quality

- `dbt-labs/dbt-project-evaluator` — dbt Labs best-practice checks (great CI gate)
- `tnightengale/dbt-meta-testing` — Test/documentation coverage enforcement
- `kgmcquate/dbt-testgen` — Generates tests from existing data patterns
- `LewisDavies/upstream-prod` — Slim CI using production upstream references
- `Astoriel/dbt-doctor` — Project health diagnostics

### 7.3 Pipeline Architecture & Utilities

- `arnoN7/dbt-incremental-stream` — Streaming-style incremental materialization
- `everpeace/dbt-models-metadata` — Metadata table generation for governance/lineage
- `ScalefreeCOM/datavault4dbt` — Data Vault 2.0 macro framework
- `montara-io/dbt-command-center` — Pipeline management/visualization interface

### 7.4 Orchestration integration

- `yu-iskw/dbt-airflow-macros` — Airflow-oriented helper macros
- `fal-ai/dbt_feature_store` — Bridge dbt outputs to ML feature stores

### 7.5 Recommended package stack for this project

```text
Observability:     elementary-data/elementary + dbt-data-reliability
CI Quality Gates:  dbt-labs/dbt-project-evaluator + tnightengale/dbt-meta-testing
Slim CI:           LewisDavies/upstream-prod
Test Generation:   kgmcquate/dbt-testgen
```

**Execution note:** evaluate and onboard these after core dbt version upgrade completes.

---

## 8. Key Decisions & Notes

- **UV over pip:** UV is the standard for dependency management, lockfile generation, and reproducible installs.
- **`.env` file support:** native dbt `.env` auto-loading begins in dbt-core 1.12; 1.11 requires shell/CI env injection.
- **`DBT_` namespace caution:** unknown `DBT_` variables trigger deprecation warnings in 1.11+ via `validate_engine_env_vars()`.
- **Databricks tags audit:** `databricks_tags` merge behavior changes in 1.12 and must be audited before promotion.
- **MetricFlow migration:** if metrics are used, migration from old semantic interfaces is non-trivial and should be planned explicitly.
- **Python version floor:** Python 3.10+ required for dbt 1.11; Python 3.9 is unsupported.

---

## Appendix A — Agent Implementation Order (recommended)

1. Prepare branch `upgrade/dbt-1.11`.
2. Execute pre-upgrade checklist and commit each logical unit.
3. Introduce UV lockfile artifacts (`requirements-dbt111.*`) and pin versions.
4. Run local validation sequence; resolve deprecations.
5. Enable CI workflow and validate slim CI against prod artifacts.
6. Promote to staging; verify row counts and critical model parity.
7. Merge to `main` only after production readiness signoff.
8. In parallel, keep `upgrade/dbt-1.12-beta` for `.env` and 1.12 migration prep only.

