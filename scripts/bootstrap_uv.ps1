param(
    [switch]$SkipDbtChecks
)

$ErrorActionPreference = "Stop"

function Assert-UvInstalled {
    if (-not (Get-Command uv -ErrorAction SilentlyContinue)) {
        throw "uv is not installed. Install it first: https://docs.astral.sh/uv/getting-started/installation/"
    }
}

Assert-UvInstalled

Write-Host "Installing Python 3.11 via uv if needed..."
uv python install 3.11

Write-Host "Syncing project dependencies into .venv..."
uv sync --dev

if ($SkipDbtChecks) {
    Write-Host "Skipping dbt validation checks."
    exit 0
}

if (-not $env:DBT_ORACLE_PASSWORD) {
    Write-Warning "DBT_ORACLE_PASSWORD is not set. Skipping dbt debug/parse."
    Write-Host "Set DBT_ORACLE_PASSWORD and rerun this script to validate the connection."
    exit 0
}

Write-Host "Running dbt debug..."
uv run dbt debug --profiles-dir .

Write-Host "Running dbt parse..."
uv run dbt parse --profiles-dir .

Write-Host "Bootstrap complete."
