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

    Assert-Contains $style '@media\s*\(max-width:\s*1100px\)' "CSS must include a tablet-width breakpoint before the existing mobile layout."
    Assert-Contains $style '@media\s*\(min-width:\s*651px\)\s*and\s*\(max-width:\s*900px\)' "CSS must include a tablet-only breakpoint for medium screens."
    Assert-Contains $style '(?s)@media\s*\(min-width:\s*651px\)\s*and\s*\(max-width:\s*900px\).*?\.project-grid\s*\{[^}]*grid-template-columns:\s*repeat\(2,\s*minmax\(0,\s*1fr\)\)' "Tablet project cards must use a two-column grid."
    Assert-Contains $style '(?s)@media\s*\(min-width:\s*651px\)\s*and\s*\(max-width:\s*900px\).*?\.proof-work-grid\s*\{[^}]*grid-template-columns:\s*repeat\(2,\s*minmax\(0,\s*1fr\)\)' "Tablet proof-of-work cards must use a two-column grid."
    Assert-Contains $style '(?s)@media\s*\(min-width:\s*651px\)\s*and\s*\(max-width:\s*900px\).*?\.service-grid\s*\{[^}]*grid-template-columns:\s*repeat\(2,\s*minmax\(0,\s*1fr\)\)' "Tablet service cards must use a two-column grid."
    Assert-Contains $style '(?s)@media\s*\(max-width:\s*650px\).*?h1\s*\{[^}]*font-size:\s*clamp\(' "Mobile hero headline must use clamp() sizing."
    Assert-Contains $style '(?s)@media\s*\(max-width:\s*650px\).*?\.project-grid\s*\{[^}]*grid-template-columns:\s*1fr' "Phone project cards must collapse to one column."
    Assert-Contains $style '(?s)@media\s*\(max-width:\s*650px\).*?\.proof-work-grid\s*\{[^}]*grid-template-columns:\s*1fr' "Phone proof-of-work cards must collapse to one column."
    Assert-Contains $style '(?s)@media\s*\(max-width:\s*650px\).*?\.service-grid\s*\{[^}]*grid-template-columns:\s*1fr' "Phone service cards must collapse to one column."
    Assert-Contains $style '(?s)@media\s*\(max-width:\s*650px\).*?\.project-facts\s*\{[^}]*grid-template-columns:\s*repeat\(2,\s*minmax\(0,\s*1fr\)\)' "Mobile project facts must remain scannable with two columns before narrow-phone collapse."
    Assert-Contains $style '@media\s*\(max-width:\s*420px\)' "CSS must include a narrow-phone breakpoint."
    Assert-Contains $style '(?s)@media\s*\(max-width:\s*420px\).*?\.hero-actions\s*\{[^}]*grid-template-columns:\s*1fr' "Narrow phones must collapse hero actions to one column."
    Assert-Contains $style '(?s)@media\s*\(max-width:\s*420px\).*?\.project-facts\s*\{[^}]*grid-template-columns:\s*1fr' "Narrow phones must collapse dense project facts to one column."
}

if ($failures.Count -gt 0) {
    Write-Host "Responsive layout verification failed:" -ForegroundColor Red
    foreach ($failure in $failures) {
        Write-Host "- $failure" -ForegroundColor Red
    }
    exit 1
}

Write-Host "Responsive layout verification passed." -ForegroundColor Green
