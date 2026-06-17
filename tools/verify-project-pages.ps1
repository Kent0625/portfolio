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

$indexPath = Join-Path $root "index.html"
if (-not (Test-Path -LiteralPath $indexPath)) {
    Add-Failure "Missing index.html"
} else {
    $index = Read-Text $indexPath
    Assert-Contains $index 'href="projects/life-of-a-bill\.html"' "Homepage must link The Life of a Bill card to its detail page."
    Assert-Contains $index 'href="projects/from-farm-to-cup\.html"' "Homepage must link From Farm to Cup card to its detail page."
    Assert-Contains $index 'href="projects/smartrip-cdo\.html"' "Homepage must link SmartTripCDO card to its detail page."

    foreach ($destination in @(
        "projects/life-of-a-bill.html",
        "projects/from-farm-to-cup.html",
        "projects/smartrip-cdo.html"
    )) {
        $cardPattern = '<article(?=[^>]*class="project-card featured")(?=[^>]*data-detail-href="' + [regex]::Escape($destination) + '")(?=[^>]*role="link")(?=[^>]*tabindex="0")'
        Assert-Contains $index $cardPattern "Homepage featured card must make the full card clickable for $destination."
    }

    Assert-Contains $index "querySelectorAll\('\[data-detail-href\]'\)" "Homepage must initialize clickable project cards."
    Assert-Contains $index "closest\('a, button, summary'\)" "Clickable cards must preserve nested action links."
    Assert-Contains $index "addEventListener\('keydown'" "Clickable cards must support keyboard navigation."
}

$projects = @(
    @{
        Path = "projects/life-of-a-bill.html"
        Title = "The Life of a Bill"
        Image = "../assets/projects/legislative-ml-pubmat.png"
        External = "https://github.com/Kent0625/ML_FINAL_PROJECT"
    },
    @{
        Path = "projects/from-farm-to-cup.html"
        Title = "From Farm to Cup"
        Image = "../assets/projects/coffee-income-poster.png"
        External = "https://github.com/Kent0625/bootstrap-coffee-farmers-income"
    },
    @{
        Path = "projects/smartrip-cdo.html"
        Title = "SmartTripCDO"
        Image = "../GEN_AI/FINAL%20Research%20Poster%20.png"
        External = "https://kent0625-smartrip-cdo.hf.space"
        SecondaryExternal = "https://github.com/Kent0625/smartrip_cdo"
    }
)

foreach ($project in $projects) {
    $pagePath = Join-Path $root $project.Path

    if (-not (Test-Path -LiteralPath $pagePath)) {
        Add-Failure "Missing $($project.Path)"
        continue
    }

    $page = Read-Text $pagePath
    $escapedTitle = [regex]::Escape($project.Title)

    Assert-Contains $page "<title>.*$escapedTitle" "$($project.Path) must include a matching page title."
    Assert-Contains $page 'class="case-study-page"' "$($project.Path) must use the case-study-page body class."
    Assert-Contains $page 'href="../index\.html#projects"' "$($project.Path) must link back to the projects section."
    Assert-Contains $page ([regex]::Escape($project.Image)) "$($project.Path) must render its visual proof image."
    Assert-Contains $page ([regex]::Escape($project.External)) "$($project.Path) must include its primary external proof link."

    if ($project.ContainsKey("SecondaryExternal")) {
        Assert-Contains $page ([regex]::Escape($project.SecondaryExternal)) "$($project.Path) must include its secondary external proof link."
    }

    foreach ($section in @("Problem", "Data", "Method", "Result", "Impact")) {
        Assert-Contains $page "<h2>$section</h2>" "$($project.Path) must include a $section section."
    }
}

if ($failures.Count -gt 0) {
    Write-Host "Project detail page verification failed:" -ForegroundColor Red
    foreach ($failure in $failures) {
        Write-Host "- $failure" -ForegroundColor Red
    }
    exit 1
}

Write-Host "Project detail page verification passed." -ForegroundColor Green
