# Premium Proof Polish Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Improve project proof density, visual hierarchy, spacing, and palette polish without changing the static site architecture.

**Architecture:** Update static HTML with project fact badges and small proof details. Update CSS variables and component styles for a navy/cyan/emerald visual system.

**Tech Stack:** HTML, CSS, static assets, Python HTTP server, browser layout checks.

---

### Task 1: Project Fact Badges

**Files:**
- Modify: `index.html`
- Modify: `style.css`

**Steps:**
1. Add a `.project-facts` group to all five project cards.
2. Keep badges factual: dataset, model/method, output, deployment, proof.
3. Style badges as compact two-line proof chips.

### Task 2: Compact Proof Visuals

**Files:**
- Modify: `index.html`
- Modify: `style.css`

**Steps:**
1. Add dashboard status chips to Inventory DSS.
2. Add prototype output cards to E-Eye.
3. Ensure mobile layout stacks without overflow.

### Task 3: Premium Palette and CTA Hierarchy

**Files:**
- Modify: `style.css`

**Steps:**
1. Update CSS variables to deep navy, cyan, emerald, amber.
2. Make `.button.primary` visually stronger with shadow and contrast.
3. Increase project grid and repeated-card gaps slightly.

### Task 4: Verification and Deploy

**Commands:**
- `git diff --check`
- `Invoke-WebRequest http://localhost:4173/`
- Browser desktop/mobile layout checks
- `git push origin main`
- Render HTML polling

**Expected:**
- Five project fact groups present.
- No old removed content returns.
- No horizontal overflow.
- Render live site contains the new proof polish.
