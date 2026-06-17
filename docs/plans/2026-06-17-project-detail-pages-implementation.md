# Project Detail Pages Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Add dedicated case-study pages for The Life of a Bill, From Farm to Cup, and SmartTripCDO, and make the homepage cards open those pages.

**Architecture:** Keep the portfolio as a static HTML/CSS site. Add three files under `projects/`, extend `style.css` with reusable case-study page styles, and update the featured project card links in `index.html`.

**Tech Stack:** Static HTML, CSS, PowerShell verification, local Python HTTP server for browser checks.

---

### Task 1: Add A Failing Project Detail Page Verifier

**Files:**
- Create: `tools/verify-project-pages.ps1`

**Step 1: Write the failing verifier**

Create a PowerShell script that checks:

- `index.html` links featured project images/titles to:
  - `projects/life-of-a-bill.html`
  - `projects/from-farm-to-cup.html`
  - `projects/smartrip-cdo.html`
- Each detail page exists.
- Each detail page includes:
  - a matching `<title>`
  - a `case-study-page` body class
  - sections for Problem, Data, Method, Result, and Impact
  - a visual proof image
  - a backlink to `../index.html#projects`
  - expected external project links

**Step 2: Run verifier to confirm RED**

Run:

```powershell
powershell -ExecutionPolicy Bypass -File tools/verify-project-pages.ps1
```

Expected: FAIL because the `projects/*.html` pages and homepage case-study links do not exist yet.

**Step 3: Commit the failing verifier**

```powershell
git add tools/verify-project-pages.ps1
git commit -m "test: add project detail page verifier"
```

### Task 2: Create The Three Case-Study Pages

**Files:**
- Create: `projects/life-of-a-bill.html`
- Create: `projects/from-farm-to-cup.html`
- Create: `projects/smartrip-cdo.html`
- Modify: `style.css`

**Step 1: Add minimal HTML pages**

Each page should reuse the portfolio design language and include:

- Header/back navigation
- Project hero
- Tags
- Proof metrics
- Visual proof image
- Problem/Data/Method/Result/Impact content
- Tools/evidence cards
- GitHub/live app buttons as appropriate

**Step 2: Add shared CSS**

Add reusable styles for:

- `.case-study-page`
- `.case-hero`
- `.case-nav`
- `.case-proof-grid`
- `.case-visual`
- `.case-section-grid`
- `.case-panel`
- `.case-metrics`
- `.case-actions`

**Step 3: Run verifier**

Run:

```powershell
powershell -ExecutionPolicy Bypass -File tools/verify-project-pages.ps1
```

Expected: Still FAIL until homepage links are updated.

### Task 3: Wire Homepage Cards To Detail Pages

**Files:**
- Modify: `index.html`

**Step 1: Update featured project image/title links**

Change the primary card interaction:

- The Life of a Bill image/title -> `projects/life-of-a-bill.html`
- From Farm to Cup image/title -> `projects/from-farm-to-cup.html`
- SmartTripCDO image/title -> `projects/smartrip-cdo.html`

Keep external GitHub/live-app buttons available as secondary actions.

**Step 2: Run verifier to confirm GREEN**

Run:

```powershell
powershell -ExecutionPolicy Bypass -File tools/verify-project-pages.ps1
```

Expected: PASS.

### Task 4: Browser And Deployment Verification

**Files:**
- No additional files unless verification reveals a bug.

**Step 1: Local HTTP check**

Start or reuse a local server from the feature worktree and check:

- `/`
- `/projects/life-of-a-bill.html`
- `/projects/from-farm-to-cup.html`
- `/projects/smartrip-cdo.html`

Expected: all return HTTP 200.

**Step 2: Browser responsive check**

Use the in-app browser to verify:

- homepage project card links resolve to local detail pages
- desktop has no horizontal overflow
- mobile has no horizontal overflow
- visual proof images are rendered
- console has no errors

**Step 3: Commit implementation**

```powershell
git add index.html style.css projects tools
git commit -m "feat: add project case study pages"
```

**Step 4: Merge, push, and verify Render**

Fast-forward `main`, push to GitHub, then verify Render serves the new pages.
