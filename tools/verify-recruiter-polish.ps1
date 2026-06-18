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

function Assert-NotContains {
    param(
        [string]$Content,
        [string]$Pattern,
        [string]$Message
    )

    if ($Content -match $Pattern) {
        Add-Failure $Message
    }
}

$faviconPath = Join-Path $root "assets/favicon.svg"
if (-not (Test-Path -LiteralPath $faviconPath)) {
    Add-Failure "Portfolio must include assets/favicon.svg."
}

$pageChecks = @(
    @{
        Path = "index.html"
        Canonical = "https://kent-macalam-portfolio.onrender.com/"
        Favicon = "assets/favicon.svg"
        Type = "website"
    },
    @{
        Path = "projects/life-of-a-bill.html"
        Canonical = "https://kent-macalam-portfolio.onrender.com/projects/life-of-a-bill.html"
        Favicon = "../assets/favicon.svg"
        Type = "article"
    },
    @{
        Path = "projects/from-farm-to-cup.html"
        Canonical = "https://kent-macalam-portfolio.onrender.com/projects/from-farm-to-cup.html"
        Favicon = "../assets/favicon.svg"
        Type = "article"
    },
    @{
        Path = "projects/smartrip-cdo.html"
        Canonical = "https://kent-macalam-portfolio.onrender.com/projects/smartrip-cdo.html"
        Favicon = "../assets/favicon.svg"
        Type = "article"
    }
)

foreach ($pageCheck in $pageChecks) {
    $pagePath = Join-Path $root $pageCheck.Path
    if (-not (Test-Path -LiteralPath $pagePath)) {
        Add-Failure "Missing $($pageCheck.Path)."
        continue
    }

    $page = Read-Text $pagePath
    Assert-Contains $page '<meta\s+name="description"\s+content="[^"]{40,}">' "$($pageCheck.Path) must include a useful meta description."
    Assert-Contains $page ('<link\s+rel="canonical"\s+href="' + [regex]::Escape($pageCheck.Canonical) + '">') "$($pageCheck.Path) must include the correct canonical URL."
    Assert-Contains $page ('<link\s+rel="icon"\s+type="image/svg\+xml"\s+href="' + [regex]::Escape($pageCheck.Favicon) + '">') "$($pageCheck.Path) must use the portfolio SVG favicon."
    Assert-Contains $page '<meta\s+property="og:title"\s+content="[^"]+">' "$($pageCheck.Path) must include an Open Graph title."
    Assert-Contains $page '<meta\s+property="og:description"\s+content="[^"]{40,}">' "$($pageCheck.Path) must include an Open Graph description."
    Assert-Contains $page ('<meta\s+property="og:type"\s+content="' + $pageCheck.Type + '">') "$($pageCheck.Path) must include the correct Open Graph type."
    Assert-Contains $page ('<meta\s+property="og:url"\s+content="' + [regex]::Escape($pageCheck.Canonical) + '">') "$($pageCheck.Path) must include the correct Open Graph URL."
    Assert-Contains $page '<meta\s+property="og:image"\s+content="https://kent-macalam-portfolio\.onrender\.com/[^"]+">' "$($pageCheck.Path) must include an absolute Open Graph image."
    Assert-Contains $page '<meta\s+name="twitter:card"\s+content="summary_large_image">' "$($pageCheck.Path) must include a large Twitter card."
    Assert-Contains $page '<meta\s+name="twitter:title"\s+content="[^"]+">' "$($pageCheck.Path) must include a Twitter title."
    Assert-Contains $page '<meta\s+name="twitter:description"\s+content="[^"]{40,}">' "$($pageCheck.Path) must include a Twitter description."
    Assert-Contains $page '<meta\s+name="twitter:image"\s+content="https://kent-macalam-portfolio\.onrender\.com/[^"]+">' "$($pageCheck.Path) must include an absolute Twitter image."
    Assert-NotContains $page '<link\s+rel="icon"\s+href="data:,' "$($pageCheck.Path) must not use an empty data favicon."
}

$indexPath = Join-Path $root "index.html"
if (Test-Path -LiteralPath $indexPath) {
    $index = Read-Text $indexPath
    Assert-Contains $index '<li><a href="#projects">Projects</a></li>' "Mobile navigation must retain the Projects link."
    Assert-Contains $index '<li><a href="#contact">Contact</a></li>' "Mobile navigation must retain the Contact link."
    Assert-Contains $index '<li class="nav-optional"><a href="#preview">Preview</a></li>' "Preview must be marked as optional on mobile."
    Assert-Contains $index '<li class="nav-optional"><a href="#skills">Skills</a></li>' "Skills must be marked as optional on mobile."
    Assert-Contains $index '<li class="nav-optional"><a href="#services">Services</a></li>' "Services must be marked as optional on mobile."
    Assert-Contains $index 'class="nav-action"[^>]+Kent_John_Macalam_RESUME\.pdf' "Resume must remain the primary navigation action."
    Assert-NotContains $index 'Selected tools, project areas, and links gathered in one place\.' "Snapshot copy must be shortened."
    Assert-NotContains $index 'Start here for my project source, resume, project mix, and availability in one place\.' "Proof section copy must be shortened."
    Assert-NotContains $index 'Selected project outputs showing how I move from raw records to explainable models, dashboards, and decision-ready findings\.' "Preview copy must be shortened."
    Assert-Contains $index '<small>Selected model</small><strong>XGBoost</strong>' "Model preview must name XGBoost as the selected model."
    Assert-Contains $index '<small>Holdout macro F1</small><strong>0\.51</strong>' "Model preview must show the documented holdout macro F1."
    Assert-Contains $index '<small>Evaluation set</small><strong>Holdout</strong>' "Model preview must identify the holdout evaluation set."
    Assert-Contains $index 'Available for Data Science Internships, Analytics Projects, and ML Prototype Work\.' "Footer must use the approved availability CTA."
    Assert-NotContains $index '<strong>0\.71</strong>' "Homepage must not include the unsupported 0.71 preview score."
    Assert-NotContains $index '<strong>0\.84</strong>' "Homepage must not include the unsupported 0.84 preview score."
    Assert-NotContains $index '<strong>0\.78</strong>' "Homepage must not include the unsupported 0.78 preview score."
}

$stylePath = Join-Path $root "style.css"
if (Test-Path -LiteralPath $stylePath) {
    $style = Read-Text $stylePath
    Assert-Contains $style '(?s)@media\s*\(max-width:\s*650px\).*?\.nav-links\s*\{[^}]*display:\s*flex' "Mobile CSS must keep navigation links visible."
    Assert-Contains $style '(?s)@media\s*\(max-width:\s*650px\).*?\.nav-links\s+\.nav-optional\s*\{[^}]*display:\s*none' "Mobile CSS must hide only optional navigation links."
    Assert-NotContains $style '(?s)@media\s*\(max-width:\s*650px\).*?\.nav-links\s*\{[^}]*display:\s*none' "Mobile CSS must not hide the complete navigation."
}

$readmePath = Join-Path $root "README.md"
if (-not (Test-Path -LiteralPath $readmePath)) {
    Add-Failure "Missing README.md."
} else {
    $readme = Read-Text $readmePath
    foreach ($heading in @("About", "Featured Projects", "Tech Stack", "Local Usage", "Contact")) {
        Assert-Contains $readme ("(?m)^##\s+" + [regex]::Escape($heading) + "\s*$") "README must include a $heading section."
    }
    Assert-Contains $readme 'https://kent-macalam-portfolio\.onrender\.com/' "README must link to the live portfolio."
}

$smartTripPath = Join-Path $root "projects/smartrip-cdo.html"
if (Test-Path -LiteralPath $smartTripPath) {
    $smartTrip = Read-Text $smartTripPath
    Assert-Contains $smartTrip '0%</strong>reported hallucination in controlled test prompts' "SmartTripCDO must qualify the reported hallucination result."
    Assert-Contains $smartTrip '76\.32%</strong>clustering efficiency in project evaluation' "SmartTripCDO must qualify the clustering result."
    Assert-Contains $smartTrip 'controlled (test|project evaluation)' "SmartTripCDO result copy must explain the controlled evaluation context."
    Assert-NotContains $smartTrip 'The project reported a 0% hallucination rate and 76\.32% clustering efficiency, showing that grounded local data can support coherent regional travel planning\.' "SmartTripCDO must not retain the broad unqualified result sentence."
}

if ($failures.Count -gt 0) {
    Write-Host "Recruiter polish verification failed:" -ForegroundColor Red
    foreach ($failure in $failures) {
        Write-Host "- $failure" -ForegroundColor Red
    }
    exit 1
}

Write-Host "Recruiter polish verification passed." -ForegroundColor Green
