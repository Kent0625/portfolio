$ErrorActionPreference = "Stop"

$root = Split-Path -Parent $PSScriptRoot
$failures = New-Object System.Collections.Generic.List[string]

function Add-Failure {
    param([string]$Message)
    $failures.Add($Message) | Out-Null
}

function Read-Text {
    param([string]$Path)
    return Get-Content -LiteralPath $Path -Raw
}

function Assert-Contains {
    param(
        [string]$Content,
        [string]$Pattern,
        [string]$Message
    )

    if ($Content -notmatch $Pattern) {
        Add-Failure $Message
    }
}

$stylePath = Join-Path $root "style.css"
if (-not (Test-Path -LiteralPath $stylePath)) {
    Add-Failure "Missing style.css"
} else {
    $style = Read-Text $stylePath
    Assert-Contains $style '--bg:\s*#f5f7fb;' "Style tokens must use a light page background."
    Assert-Contains $style '--hero-bg:\s*#173454;' "Style tokens must include a deep enterprise-blue hero background."
    Assert-Contains $style '--surface:\s*#ffffff;' "Style tokens must use white card surfaces."
    Assert-Contains $style '--accent:\s*#ffe16a;' "Style tokens must use a yellow primary CTA accent."
    Assert-Contains $style '--accent-rgb:\s*255,\s*225,\s*106;' "Style tokens must expose yellow RGB values."
    Assert-Contains $style '\.top-status-bar' "CSS must style the top status bar."
    Assert-Contains $style '\.hero-section[^\{]*\{' "CSS must keep a styled hero section."
    Assert-Contains $style 'background:\s*var\(--hero-bg\)' "Hero/header surfaces must use the enterprise-blue token."
    Assert-Contains $style '\.project-card\.featured\s*\{' "Featured project cards must keep a dedicated style block."
    Assert-Contains $style 'box-shadow:\s*var\(--shadow\)' "Cards must use the refreshed product-card shadow token."
}

$pages = @(
    "index.html",
    "projects/life-of-a-bill.html",
    "projects/from-farm-to-cup.html",
    "projects/smartrip-cdo.html"
)

foreach ($page in $pages) {
    $path = Join-Path $root $page
    if (-not (Test-Path -LiteralPath $path)) {
        Add-Failure "Missing $page"
        continue
    }

    $content = Read-Text $path
    Assert-Contains $content 'class="top-status-bar"' "$page must include the new top status bar."
    Assert-Contains $content 'Data portfolio' "$page top status bar should identify the site as a data portfolio."
}

$indexPath = Join-Path $root "index.html"
if (Test-Path -LiteralPath $indexPath) {
    $index = Read-Text $indexPath
    Assert-Contains $index 'data-detail-href="projects/life-of-a-bill\.html"' "Homepage must keep full-card link for The Life of a Bill."
    Assert-Contains $index 'data-detail-href="projects/from-farm-to-cup\.html"' "Homepage must keep full-card link for From Farm to Cup."
    Assert-Contains $index 'data-detail-href="projects/smartrip-cdo\.html"' "Homepage must keep full-card link for SmartTripCDO."
}

if ($failures.Count -gt 0) {
    Write-Host "data.world-inspired style verification failed:" -ForegroundColor Red
    foreach ($failure in $failures) {
        Write-Host "- $failure" -ForegroundColor Red
    }
    exit 1
}

Write-Host "data.world-inspired style verification passed." -ForegroundColor Green
