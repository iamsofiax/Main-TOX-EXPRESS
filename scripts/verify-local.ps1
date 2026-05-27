# Quick check before migrating — run in PowerShell:
#   cd "C:\Users\MY PC\Desktop\TRANSPORT WORLD"
#   .\scripts\verify-local.ps1

$ErrorActionPreference = "Stop"
$root = (Resolve-Path (Join-Path $PSScriptRoot "..")).Path

Write-Host "`n=== TOX Express pre-migration check ===" -ForegroundColor Cyan
Write-Host "Project folder: $root`n"

$required = @("index.html", "server.js", "package.json", "js\script.js")
foreach ($f in $required) {
    $p = Join-Path $root $f
    if (Test-Path $p) { Write-Host "  OK  $f" -ForegroundColor Green }
    else { Write-Host "  MISSING  $f" -ForegroundColor Red }
}

$envPath = Join-Path $root ".env"
if (Test-Path $envPath) {
    Write-Host "`n  OK  .env found (secrets ready to copy to new host)" -ForegroundColor Green
} else {
    Write-Host "`n  WARN  No .env — copy .env.example to .env and fill in values" -ForegroundColor Yellow
}

Write-Host "`nYour OLD Render service name: the-tox-express" -ForegroundColor Yellow
Write-Host "GitHub repo: https://github.com/iamsofiax/Main-TOX-EXPRESS" -ForegroundColor Yellow
Write-Host "`nNext: read MIGRATE_OFF_RENDER.md in this folder.`n" -ForegroundColor Cyan

if (-not (Get-Command node -ErrorAction SilentlyContinue)) {
    Write-Host "Node.js not installed. Install from https://nodejs.org then run: npm install; npm start" -ForegroundColor Red
    exit 1
}

Set-Location $root
if (-not (Test-Path "node_modules")) {
    Write-Host "Running npm install..." -ForegroundColor Gray
    npm install --silent
}

Write-Host "Starting server for 5 seconds on http://localhost:3000 ..." -ForegroundColor Gray
$job = Start-Job { param($d) Set-Location $d; node server.js } -ArgumentList $root
Start-Sleep -Seconds 5
try {
    $r = Invoke-WebRequest -Uri "http://localhost:3000/" -UseBasicParsing -TimeoutSec 5
    if ($r.StatusCode -eq 200) {
        Write-Host "  OK  Local site responds (ready to deploy elsewhere)" -ForegroundColor Green
    }
} catch {
    Write-Host "  WARN  Could not reach localhost:3000 — check firewall or port in use" -ForegroundColor Yellow
}
Stop-Job $job -ErrorAction SilentlyContinue
Remove-Job $job -Force -ErrorAction SilentlyContinue

Write-Host ""
