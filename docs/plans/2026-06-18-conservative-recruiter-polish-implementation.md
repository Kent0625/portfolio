# Conservative Recruiter Polish Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Implement and publish six targeted portfolio improvements covering mobile navigation, metadata, README quality, homepage density, claim qualification, and GitHub repository presentation.

**Architecture:** Keep the site as a dependency-free static HTML/CSS portfolio. Add one PowerShell verification script for the new requirements, use semantic HTML and responsive CSS for the mobile navigation, reuse the existing project artwork for social previews, and use GitHub repository settings for the external presentation updates.

**Tech Stack:** HTML5, CSS3, inline vanilla JavaScript already present in the site, SVG favicon, PowerShell verification scripts, Git, GitHub CLI/app.

---

### Task 1: Add recruiter-polish verification

**Files:**
- Create: `tools/verify-recruiter-polish.ps1`

**Step 1: Write the failing verification script**

Add assertions that:

- `index.html` contains meta description, canonical URL, Open Graph tags, Twitter card tags, and a real favicon.
- all three case-study pages contain descriptions, canonical URLs, Open Graph tags, Twitter card tags, and the favicon.
- mobile CSS no longer hides `.nav-links` and explicitly hides only `.nav-optional`.
- the mobile navigation contains Projects and Contact while Resume remains the action.
- `README.md` includes About, Featured Projects, Tech Stack, Local Usage, and Contact.
- SmartTripCDO claims include controlled evaluation language.
- the old unqualified SmartTripCDO result sentence is absent.

**Step 2: Run the verifier to prove it fails**

Run:

```powershell
powershell -ExecutionPolicy Bypass -File tools/verify-recruiter-polish.ps1
```

Expected: FAIL because the metadata, mobile behavior, README, and claim wording have not yet been updated.

**Step 3: Commit the failing verification**

```powershell
git add tools/verify-recruiter-polish.ps1
git commit -m "test: define recruiter polish requirements"
```

### Task 2: Implement CSS-only mobile navigation

**Files:**
- Modify: `index.html`
- Modify: `style.css`

**Step 1: Mark lower-priority links**

Add `class="nav-optional"` to Preview, Skills, and Services. Keep Projects and Contact unmarked and directly visible.

**Step 2: Replace the mobile hide rule**

Within `@media (max-width: 650px)`:

```css
.nav-shell {
    grid-template-columns: minmax(0, 1fr) auto;
    gap: 0.55rem;
}

.nav-links {
    display: flex;
    gap: 0.7rem;
    overflow: visible;
    padding: 0;
}

.nav-links .nav-optional {
    display: none;
}
```

Use compact link and Resume padding while retaining minimum tap height and focus visibility.

**Step 3: Run focused verification**

Run:

```powershell
powershell -ExecutionPolicy Bypass -File tools/verify-recruiter-polish.ps1
powershell -ExecutionPolicy Bypass -File tools/verify-responsive-layout.ps1
```

Expected: recruiter verifier still fails only for unimplemented metadata, README, and claims; responsive verifier passes.

**Step 4: Commit**

```powershell
git add index.html style.css
git commit -m "fix: keep key navigation visible on mobile"
```

### Task 3: Add SEO, social sharing, and favicon metadata

**Files:**
- Create: `assets/favicon.svg`
- Modify: `index.html`
- Modify: `projects/life-of-a-bill.html`
- Modify: `projects/from-farm-to-cup.html`
- Modify: `projects/smartrip-cdo.html`

**Step 1: Create the favicon**

Create a compact SVG favicon with a navy background and yellow/cyan data bars matching the existing visual system.

**Step 2: Add homepage metadata**

Add:

```html
<meta name="description" content="Kent John U. Macalam's data science portfolio featuring machine learning, analytics, dashboards, statistics, and AI projects.">
<link rel="canonical" href="https://kent-macalam-portfolio.onrender.com/">
<link rel="icon" type="image/svg+xml" href="assets/favicon.svg">
<meta property="og:title" content="Kent John U. Macalam | Data Science Portfolio">
<meta property="og:description" content="Machine learning, analytics, dashboard, statistics, and AI projects with clear evidence and case studies.">
<meta property="og:type" content="website">
<meta property="og:url" content="https://kent-macalam-portfolio.onrender.com/">
<meta property="og:image" content="https://kent-macalam-portfolio.onrender.com/assets/projects/legislative-ml-pubmat.png">
<meta name="twitter:card" content="summary_large_image">
<meta name="twitter:title" content="Kent John U. Macalam | Data Science Portfolio">
<meta name="twitter:description" content="Machine learning, analytics, dashboard, statistics, and AI projects with clear evidence and case studies.">
<meta name="twitter:image" content="https://kent-macalam-portfolio.onrender.com/assets/projects/legislative-ml-pubmat.png">
```

**Step 3: Add project-specific metadata**

For each case-study page, use:

- a unique description;
- its deployed canonical URL;
- `article` Open Graph type;
- its project title and proof image;
- matching Twitter card metadata;
- `../assets/favicon.svg`.

**Step 4: Run verification**

Run:

```powershell
powershell -ExecutionPolicy Bypass -File tools/verify-recruiter-polish.ps1
powershell -ExecutionPolicy Bypass -File tools/verify-project-pages.ps1
powershell -ExecutionPolicy Bypass -File tools/verify-dataworld-inspired-style.ps1
```

Expected: existing project/style scripts pass; recruiter verifier still reports only README and claim/copy work.

**Step 5: Commit**

```powershell
git add assets/favicon.svg index.html projects
git commit -m "feat: add portfolio sharing metadata"
```

### Task 4: Improve README and reduce homepage repetition

**Files:**
- Modify: `README.md`
- Modify: `index.html`

**Step 1: Replace the README**

Include:

- portfolio title and live-site link;
- About;
- Featured Projects with proof links;
- Tech Stack;
- Local Usage using a simple local static server;
- repository structure;
- Contact.

**Step 2: Tighten supporting homepage copy**

Shorten the snapshot, proof, preview, skills, and services introductory copy and supporting card descriptions. Preserve all sections, project facts, project story steps, links, and recruiter keywords.

**Step 3: Run verification**

Run:

```powershell
powershell -ExecutionPolicy Bypass -File tools/verify-recruiter-polish.ps1
powershell -ExecutionPolicy Bypass -File tools/verify-project-pages.ps1
```

Expected: README and existing project requirements pass; recruiter verifier reports only SmartTripCDO claim qualification if still pending.

**Step 4: Commit**

```powershell
git add README.md index.html
git commit -m "docs: sharpen portfolio copy and README"
```

### Task 5: Qualify SmartTripCDO evaluation claims

**Files:**
- Modify: `projects/smartrip-cdo.html`

**Step 1: Add metric context**

Change the proof metrics to:

```html
<span><strong>0%</strong>reported hallucination in controlled test prompts</span>
<span><strong>76.32%</strong>clustering efficiency in project evaluation</span>
```

**Step 2: Replace the broad result statement**

State that the project evaluation reported those values under its controlled test setup, and explicitly avoid implying a production guarantee.

**Step 3: Run all static verification**

Run:

```powershell
Get-ChildItem tools -Filter "verify-*.ps1" | ForEach-Object {
    powershell -ExecutionPolicy Bypass -File $_.FullName
    if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
}
```

Expected: all verification scripts pass.

**Step 4: Commit**

```powershell
git add projects/smartrip-cdo.html
git commit -m "docs: qualify SmartTrip evaluation claims"
```

### Task 6: Perform browser QA

**Files:**
- Modify only if visual defects are found: `index.html`, `style.css`, project pages

**Step 1: Start a local static server**

Run:

```powershell
python -m http.server 4173
```

**Step 2: Inspect desktop**

Open `http://127.0.0.1:4173/` at a desktop viewport and verify:

- full navigation is visible;
- no section layout regressed;
- all three featured cards and footer links work;
- favicon loads.

**Step 3: Inspect mobile**

Use a phone-sized viewport around 390 by 844 and verify:

- Projects, Contact, and Resume are visible without opening a menu;
- header content does not overflow;
- links have comfortable tap targets;
- project cards remain one column.

**Step 4: Inspect case studies**

Open all three project pages and verify titles, metadata source markup, proof images, navigation, and embedded app sections.

**Step 5: Fix any defects and rerun all verification**

Expected: no horizontal overflow or broken local assets.

**Step 6: Commit any QA fixes**

```powershell
git add index.html style.css projects assets
git commit -m "fix: resolve recruiter polish QA findings"
```

Skip the commit if no files changed.

### Task 7: Publish code and GitHub repository presentation

**Files:**
- No additional source files unless final verification finds an issue.

**Step 1: Verify clean, passing branch**

Run:

```powershell
git status --short
Get-ChildItem tools -Filter "verify-*.ps1" | ForEach-Object {
    powershell -ExecutionPolicy Bypass -File $_.FullName
    if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
}
```

Expected: no uncommitted changes and all scripts pass.

**Step 2: Push the feature branch**

Push `feat/recruiter-polish` to `origin`.

**Step 3: Publish through a pull request or fast-forward main**

Prefer a draft pull request for a reviewable publish flow. If repository policy or tooling makes a PR impractical and the branch is safe to integrate, fast-forward `main` only after confirming the exact commit range.

**Step 4: Update repository settings**

Set:

- description: `Data science portfolio featuring machine learning, analytics, dashboards, statistics, and AI case studies.`
- website: `https://kent-macalam-portfolio.onrender.com/`
- topics: `data-science`, `machine-learning`, `data-analytics`, `portfolio`, `html`, `css`, `javascript`

**Step 5: Confirm remote state**

Verify the remote branch/PR, repository description, website, and topics, then report the published URL and commit.
