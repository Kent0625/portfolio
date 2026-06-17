# Visual Proof Upgrade Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Add visible project proof and stronger recruiter-facing credibility to the portfolio.

**Architecture:** Keep the portfolio as a static one-page HTML/CSS site. Use existing images where available and CSS-built proof mockups for missing screenshots.

**Tech Stack:** HTML, CSS, Font Awesome, static assets, Python HTTP server for local verification.

---

### Task 1: Project CTAs and Proof Mockups

**Files:**
- Modify: `index.html`
- Modify: `style.css`

**Steps:**
1. Replace "Ask about DSS project" with "View Project Details".
2. Replace "Ask about capstone" with "View AI Capstone".
3. Add visual proof blocks to Inventory DSS, E-Eye, and SmartTripCDO.
4. Keep project labels factual and avoid fake deployment claims.

### Task 2: Case-Study Scan Cards

**Files:**
- Modify: `style.css`
- Modify: `index.html`

**Steps:**
1. Restyle `.story-steps` into compact evidence cards.
2. Add short story steps to compact projects where useful.
3. Confirm mobile cards stack without overflow.

### Task 3: Workflow Preview Visuals

**Files:**
- Modify: `index.html`
- Modify: `style.css`

**Steps:**
1. Improve EDA visual with missing-value and distribution elements.
2. Improve Model visual with score cards and feature bars.
3. Improve Dashboard visual with KPI and trend elements.
4. Improve Insights visual with recommendation, limitation, and next-step elements.

### Task 4: Proof of Work Section

**Files:**
- Modify: `index.html`
- Modify: `style.css`

**Steps:**
1. Add a compact Proof of Work section after projects.
2. Include GitHub, resume, project mix, and availability proof points.
3. Link GitHub and resume without adding extra claims.

### Task 5: Verification and Deployment

**Commands:**
- `git diff --check`
- `Invoke-WebRequest http://localhost:4173/`
- Browser desktop/mobile layout checks
- `git push origin main`
- Render HTML poll at `https://kent-macalam-portfolio.onrender.com/`

**Expected:**
- HTTP 200 locally and on Render.
- No horizontal overflow on desktop or mobile.
- New proof section and visual proof text present.
- Weak labels and stale removed sections absent.
