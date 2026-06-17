# Credibility Polish Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Improve the portfolio's credibility by cleaning hero copy, adding Inventory DSS, sharpening preview panels, and strengthening the contact CTA.

**Architecture:** Keep the static single-page site. Modify `index.html` for content and structure, and modify `style.css` only for the contact availability list and any layout adjustments needed by the new content.

**Tech Stack:** Static HTML, CSS, Font Awesome, local assets, local HTTP server, Render deployment verification.

---

### Task 1: Hero Copy

**Files:**
- Modify: `index.html`
- Modify: `style.css`

**Step 1: Replace hero copy**

Update the hero paragraph to mention clean insights, ML models, dashboards, and decision-ready stories.

**Step 2: Replace animated keyword rail**

Replace the rotating word list with one static sentence:

`Focused on Data Science, Machine Learning, Dashboards, and AI-powered analytics.`

Remove unused keyword animation CSS if it becomes unused.

---

### Task 2: Project Alignment

**Files:**
- Modify: `index.html`

**Step 1: Add Inventory DSS project card**

Add a compact card after The Life of a Bill:

- Title: Inventory Decision Support System
- Tags: Dashboard, Business Analytics, DSS
- Summary: Practical inventory monitoring and decision-support dashboard work.
- Action: mailto asking about the project, because no repo or asset is currently available.

**Step 2: Preserve existing project links**

Keep The Life of a Bill, From Farm to Cup, E-Eye, and SmartTripCDO.

---

### Task 3: Preview and Contact Copy

**Files:**
- Modify: `index.html`
- Modify: `style.css`

**Step 1: Improve preview panel copy**

Make each tab more concrete:

- EDA: quality checks, distributions, segment comparison.
- Model: model comparison, validation, explainability.
- Dashboard: KPI cards, trends, status summaries.
- Insights: recommendation, limitation, next action.

**Step 2: Improve contact CTA**

Update footer headline to:

`Have a dataset, dashboard idea, or internship opportunity? Let's turn it into a clear data project.`

**Step 3: Add availability list**

Add visible availability chips for:

- Data Science Internship
- Analytics Internship
- ML Internship
- Dashboard / Reporting Projects

---

### Task 4: Verification and Deploy

**Files:**
- Verify: `index.html`
- Verify: `style.css`

**Step 1: Local verification**

Run local server and verify:

- Site returns HTTP 200.
- Old repeated animated focus content is gone.
- Static focus sentence is present.
- Inventory DSS card is present.
- Footer availability list is present.
- Existing resume PDF remains linked.

**Step 2: Browser verification**

Verify:

- No horizontal overflow.
- Preview tabs still switch.
- No console errors.

**Step 3: GitHub and Render**

Commit, push to `main`, then poll Render until the updated content is live.
