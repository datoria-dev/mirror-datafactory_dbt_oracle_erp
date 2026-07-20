# UV Setup Guide

## What UV Is

`uv` is a modern Python workflow tool from Astral. It combines Python version management, virtual environment creation, dependency installation, dependency locking, command execution, and CLI tool installs into one toolchain.

For a team, the practical value is consistency:

- one command to install the right Python version
- one command to create the project environment
- one lockfile for reproducible installs
- one standard way to run project commands

## What UV Replaces

`uv` can cover work that teams often split across several tools:

- `python -m venv` or `virtualenv` for environment creation
- `pip` for dependency installation
- `pip-tools` for pinned dependency resolution
- `pipx` for standalone CLI tools
- parts of `pyenv` or manual Python installs for Python version management

That does not mean every team must use every UV feature at once. A common adoption path is:

1. Use `uv` to install Python.
2. Use `uv` to create and sync the local environment.
3. Use `uv run` to execute project commands.
4. Use `uv.lock` to keep installs reproducible across machines.

## Mental Model

Think of `uv` in four layers:

1. `uv python ...`
Installs and manages Python versions.

2. `uv sync`
Creates or updates the project virtual environment from `pyproject.toml` and `uv.lock`.

3. `uv run ...`
Runs commands inside the project environment without needing manual activation.

4. `uv add`, `uv remove`, `uv lock`
Maintains project dependencies and the lockfile.

## Why We Want It In This Repo

For this dbt project, `uv` gives us:

- a standard Python version for every teammate
- a committed lockfile so installs are repeatable
- a cleaner onboarding flow for GitLab contributors
- fewer machine-specific setup steps
- less drift from manual `pip install` workflows

## Repo Standard

This repo uses:

- `pyproject.toml` as the source of truth for Python and dbt dependencies
- `uv.lock` as the exact resolved dependency set
- `.python-version` to recommend Python `3.11`
- `.venv/` as the local virtual environment

The dbt stack is pinned to the dbt 1.10 line:

- `dbt-core >=1.10,<1.11`
- `dbt-oracle >=1.10,<1.11`

## First-Time Installation

### 1. Install UV

Windows PowerShell:

```powershell
powershell -ExecutionPolicy Bypass -c "irm https://astral.sh/uv/install.ps1 | iex"
```

Verify:

```powershell
uv --version
```

### 2. Install the project Python version

```powershell
uv python install 3.11
```

Optional verification:

```powershell
uv python list
```

### 3. Clone the repository

```powershell
git clone <repo-url>
cd datafactory_dbt_oracle_erp
```

### 4. Sync the project environment

```powershell
uv sync --dev
```

This will:

- create `.venv/` if it does not exist
- install the locked dependency set from `uv.lock`
- install the development tools defined in `pyproject.toml`

### 5. Confirm dbt is available

```powershell
uv run dbt --version
```

## Oracle Environment Variables

The repo uses environment variables for the Oracle connection. Shared non-secret defaults can stay in tracked files, but passwords should stay local.

Use `.env.example` as a reference.

Windows PowerShell example:

```powershell
$env:DBT_ORACLE_HOST="your-oracle-host"
$env:DBT_ORACLE_PORT="1521"
$env:DBT_ORACLE_USER="your_user"
$env:DBT_ORACLE_PASSWORD="your_password"
$env:DBT_ORACLE_SERVICE="your_service_name"
$env:DBT_ORACLE_SCHEMA="your_schema"
$env:DBT_ORACLE_DATABASE="your_database_tns_name"
```

## Day-One Commands For Teammates

### Validate the environment

```powershell
uv run dbt debug --profiles-dir .
```

### Install dbt packages if enabled

```powershell
uv run dbt deps --profiles-dir .
```

### Parse the project without running models

```powershell
uv run dbt parse --profiles-dir .
```

### Run models

```powershell
uv run dbt run --profiles-dir .
```

### Run tests

```powershell
uv run dbt test --profiles-dir .
```

### Generate docs

```powershell
uv run dbt docs generate --profiles-dir .
uv run dbt docs serve --profiles-dir .
```

## Daily Workflow

Typical teammate workflow:

1. Pull the latest branch changes.
2. Run `uv sync --dev`.
3. Set Oracle environment variables if needed.
4. Run `uv run dbt parse --profiles-dir .` before bigger changes.
5. Run the specific dbt commands needed for the task.

## Dependency Management

### Add a new dependency

```powershell
uv add <package>
```

### Add a development-only dependency

```powershell
uv add --dev <package>
```

### Remove a dependency

```powershell
uv remove <package>
```

### Refresh the lockfile

```powershell
uv lock
```

### Re-sync after dependency changes

```powershell
uv sync --dev
```

## Do We Need To Activate The Virtual Environment

Usually, no.

The preferred approach is to run commands with `uv run ...`, because it guarantees the command uses the project environment.

If someone wants to activate it manually, they still can:

```powershell
.\.venv\Scripts\Activate.ps1
```

After activation:

```powershell
dbt --version
```

## UV Compared To The Older Python Workflow

Older flow:

```powershell
python -m venv .venv
.\.venv\Scripts\Activate.ps1
pip install -r requirements.txt
dbt --version
```

UV flow:

```powershell
uv python install 3.11
uv sync --dev
uv run dbt --version
```

The UV flow is shorter, more reproducible, and easier to standardize.

## Common Troubleshooting

### `uv` is not recognized

Close and reopen the terminal after installation, or add the UV install directory to `PATH`.

### Wrong Python version

Run:

```powershell
uv python install 3.11
uv sync --dev
```

### dbt command not found

Use:

```powershell
uv run dbt --version
```

If that fails, run:

```powershell
uv sync --dev
```

### Oracle connection errors

Check:

- `DBT_ORACLE_PASSWORD` is set
- host, service, schema, and username are correct
- network or Oracle client prerequisites on the machine are satisfied

### Dependency drift across machines

Use the committed `uv.lock` file and re-run:

```powershell
uv sync --dev
```

## Recommended Team Rule

For this repo, the safest standard is:

- do not manually `pip install` project dependencies
- do not hand-build ad hoc local environments
- use `uv sync --dev` for setup and updates
- use `uv run ...` for project commands
- commit dependency changes through `pyproject.toml` and `uv.lock`

## Quick Start Checklist

```powershell
uv python install 3.11
git clone <repo-url>
cd datafactory_dbt_oracle_erp
uv sync --dev
uv run dbt --version
uv run dbt parse --profiles-dir .
```

## Official References

- UV docs: <https://docs.astral.sh/uv/>
- Installing Python with UV: <https://docs.astral.sh/uv/guides/install-python/>
- UV projects: <https://docs.astral.sh/uv/concepts/projects/>
- UV environments: <https://docs.astral.sh/uv/pip/environments/>
