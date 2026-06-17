# data.world-Inspired Redesign Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Restyle the full static portfolio with an enterprise data-platform visual language inspired by data.world while preserving all existing portfolio functionality.

**Architecture:** Keep the static HTML/CSS architecture. Update shared HTML structure with top status bars, refresh `style.css` design tokens and component styles, and add a verifier for the new visual-system requirements.

**Tech Stack:** Static HTML, CSS, PowerShell verification, local Python HTTP server, browser/headless Chrome checks.

---

### Task 1: Add Visual-System Verifier

**Files:**
- Create: `tools/verify-dataworld-inspired-style.ps1`

**Steps:**
1. Check that `style.css` includes enterprise-blue, yellow CTA, light page background, and white card surface tokens.
2. Check that `index.html` and all three project detail pages include a `.top-status-bar`.
3. Check that the homepage still includes full-card project destinations.
4. Run the verifier and confirm it fails before implementation.

### Task 2: Update Shared HTML Structure

**Files:**
- Modify: `index.html`
- Modify: `projects/life-of-a-bill.html`
- Modify: `projects/from-farm-to-cup.html`
- Modify: `projects/smartrip-cdo.html`

**Steps:**
1. Add a slim `.top-status-bar` before each header.
2. Keep existing nav, resume, GitHub, live app, and project links.
3. Keep homepage full-card click behavior.

### Task 3: Apply CSS Redesign

**Files:**
- Modify: `style.css`

**Steps:**
1. Update root variables to deep navy, light content surfaces, yellow CTA, and blue/teal secondary accents.
2. Restyle header, hero, buttons, bento cards, project cards, proof cards, preview panels, service cards, footer, and case-study pages.
3. Keep cards at 8px border radius or less.
4. Avoid decorative gradient blobs and preserve readable spacing.

### Task 4: Verify Locally

**Commands:**
- `powershell -ExecutionPolicy Bypass -File tools/verify-project-pages.ps1`
- `powershell -ExecutionPolicy Bypass -File tools/verify-dataworld-inspired-style.ps1`
- `git diff --check`

Then serve locally and confirm:

- `/`
- `/projects/life-of-a-bill.html`
- `/projects/from-farm-to-cup.html`
- `/projects/smartrip-cdo.html`

all return HTTP 200.

### Task 5: Browser Verification

Use browser/headless Chrome checks to verify:

- Full-card click behavior still works.
- Detail page images load.
- Desktop and mobile have no horizontal overflow.
- Console errors are zero or only harmless missing favicon warnings.

### Task 6: Commit, Merge, Push, Deploy Check

Commit the branch, fast-forward main, push to GitHub, and verify Render serves:

- `.top-status-bar`
- updated card destinations
- updated `style.css` visual tokens
