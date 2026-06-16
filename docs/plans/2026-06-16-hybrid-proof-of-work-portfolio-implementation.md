# Hybrid Proof-of-Work Portfolio Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Rebuild the portfolio homepage into a polished hybrid proof-of-work site for data internships, part-time roles, and project-based clients.

**Architecture:** Keep the site as a static HTML/CSS portfolio. Update the single-page structure in `index.html`, update the visual system in `style.css`, reuse existing Font Awesome icons, and add local project poster assets where useful.

**Tech Stack:** HTML, CSS, Font Awesome, Google Fonts, static image assets, browser-based visual verification.

---

### Task 1: Add Local Project Assets

**Files:**
- Create/modify asset folder: `assets/projects/`
- Copy from sibling repo: `../ML_FINAL_PROJECT/PUBMAT.png`
- Copy from sibling repo: `../bootstrap-coffee-farmers-income/POSTER.png`

**Step 1: Create asset folder**

Run:

```powershell
New-Item -ItemType Directory -Force -Path 'assets/projects'
```

Expected: `assets/projects` exists.

**Step 2: Copy project images**

Run:

```powershell
Copy-Item -LiteralPath '..\ML_FINAL_PROJECT\PUBMAT.png' -Destination 'assets\projects\legislative-ml-pubmat.png' -Force
Copy-Item -LiteralPath '..\bootstrap-coffee-farmers-income\POSTER.png' -Destination 'assets\projects\coffee-income-poster.png' -Force
```

Expected: both images exist in `assets/projects`.

**Step 3: Verify copied files**

Run:

```powershell
Test-Path 'assets\projects\legislative-ml-pubmat.png'
Test-Path 'assets\projects\coffee-income-poster.png'
```

Expected: both commands return `True`.

---

### Task 2: Rebuild Homepage Content

**Files:**
- Modify: `index.html`

**Step 1: Replace page structure**

Update `index.html` to include:

- Header navigation: Projects, Skills, Services, Contact.
- Hero with role, value proposition, and CTAs.
- Metrics/proof strip.
- Featured projects section with cards for:
  - The Life of a Bill.
  - From Farm to Cup.
  - SmartTripCDO.
  - Financial Data Pipeline or EDA.
- Skills grouped by capability.
- Client-facing services section.
- Contact footer with email, GitHub, LinkedIn, resume.

**Step 2: Verify links**

Check that:

- New ML project links to `https://github.com/Kent0625/ML_FINAL_PROJECT`.
- New coffee project links to `https://github.com/Kent0625/bootstrap-coffee-farmers-income`.
- Existing project links still open in a new tab.
- Resume link uses an available local PDF if added later, or gracefully points to GitHub/contact.

---

### Task 3: Redesign CSS

**Files:**
- Modify: `style.css`

**Step 1: Replace visual system**

Update CSS to provide:

- Professional dark portfolio theme with improved contrast.
- Responsive header and navigation.
- Full first-viewport hero with visible next-section hint.
- Featured project cards with image, metadata, copy, and action links.
- Skills grouped into compact sections.
- Services cards for client work.
- Mobile layout with no overlapping text.

**Step 2: Verify CSS constraints**

Check that:

- Cards use border radius of 8px or less.
- Text does not scale directly with viewport width.
- No decorative orbs or one-note purple/blue gradient system dominate the page.
- Buttons and links remain readable on mobile.

---

### Task 4: Browser Verification

**Files:**
- Verify: `index.html`
- Verify: `style.css`

**Step 1: Serve locally**

Run:

```powershell
python -m http.server 4173
```

Expected: site is available at `http://localhost:4173`.

**Step 2: Desktop check**

Open the site at desktop width and verify:

- Hero is readable.
- Featured projects are visible.
- Project images load.
- Links are clickable.
- Spacing and hierarchy look professional.

**Step 3: Mobile check**

Open at mobile width and verify:

- Navigation does not overlap content.
- Project cards stack cleanly.
- Buttons wrap neatly.
- Text remains readable.

---

### Task 5: Final Git Review

**Files:**
- Review all changed files.

**Step 1: Check status and diff**

Run:

```powershell
git status --short
git diff -- index.html style.css docs/plans/2026-06-16-hybrid-proof-of-work-portfolio-implementation.md
```

Expected: only intentional portfolio redesign files changed.

**Step 2: Commit implementation**

Run:

```powershell
git add index.html style.css assets/projects docs/plans/2026-06-16-hybrid-proof-of-work-portfolio-implementation.md
git commit -m "feat: redesign portfolio proof of work homepage"
```

Expected: commit succeeds after verification.
