param(
    [string]$ManifestPath = "target/manifest.json",
    [string]$CatalogPath = "target/catalog.json",
    [string]$OutputDir = "dist"
)

$ErrorActionPreference = "Stop"

if (-not (Test-Path $ManifestPath)) {
    throw "Missing manifest file: $ManifestPath. Run `dbt compile` first."
}

if (-not (Test-Path $CatalogPath)) {
    throw "Missing catalog file: $CatalogPath. Run `dbt docs generate` first."
}

$colibri = Join-Path (Resolve-Path ".venv").Path "Scripts\colibri.exe"
if (-not (Test-Path $colibri)) {
    throw "Missing Colibri executable in .venv. Install dbt-colibri first."
}

$env:PYTHONIOENCODING = "utf-8"
& $colibri generate --manifest $ManifestPath --catalog $CatalogPath --output-dir $OutputDir --disable-telemetry
