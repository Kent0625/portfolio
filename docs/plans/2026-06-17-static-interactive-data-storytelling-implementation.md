# Static Interactive Data Storytelling Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Add lightweight interactive data-storytelling polish to the static portfolio without introducing a JavaScript framework or build pipeline.

**Architecture:** Keep the one-page static site. Modify `index.html` to add hero keyword animation markup, bento summary cards, project story steps, and an accessible preview panel. Modify `style.css` to add the visual system, responsive layouts, CSS-only animation, and motion-safe fallbacks.

**Tech Stack:** Static HTML, CSS, Font Awesome, existing local assets, browser verification.

---

### Task 1: Add Storytelling Markup

**Files:**
- Modify: `index.html`

**Step 1: Update hero content**

Add a keyword rail under the hero copy:

- Data Science
- Machine Learning
- Dashboards
- AI

Add a CSS-only hero visual container with a data stack and metric chips.

**Step 2: Add bento summary section**

Add a section after the hero with cards for:

- Python
- SQL
- Machine Learning
- Dashboards
- Research Projects
- GitHub
- Resume
- Available for internships and project work

**Step 3: Add project story steps**

Add story steps for the two strongest project cards:

- The Life of a Bill: Problem, Data, Method, Result, Impact.
- From Farm to Cup: Problem, Data, Method, Result, Impact.

**Step 4: Add interactive preview panel**

Add radio inputs and labels for:

- EDA
- Model
- Dashboard
- Insights

Each tab should reveal a compact preview card with a title, description, and supporting metric.

---

### Task 2: Add CSS Interactions and Layout

**Files:**
- Modify: `style.css`

**Step 1: Add bento layout**

Create responsive bento cards with stable dimensions, 8px border radius, and no nested cards.

**Step 2: Add hero visual**

Create a CSS-only data stack accent that does not depend on WebGL.

**Step 3: Add lightweight motion**

Add:

- Hero keyword animation.
- Hover microinteractions for cards and buttons.
- Scroll reveal using `animation-timeline: view()` where supported.
- `prefers-reduced-motion` fallback.

Only animate `transform` and `opacity`.

**Step 4: Add preview tab styling**

Style radio-tab controls and panels so they work without JavaScript.

---

### Task 3: Verification

**Files:**
- Verify: `index.html`
- Verify: `style.css`
- Verify: `assets/documents/Kent_John_Macalam_RESUME.pdf`
- Verify: `assets/projects/legislative-ml-pubmat.png`
- Verify: `assets/projects/coffee-income-poster.png`

**Step 1: Serve locally**

Run:

```powershell
python -m http.server 4173
```

Expected: site is available at `http://localhost:4173`.

**Step 2: Browser desktop check**

Verify:

- Hero renders with keyword rail and CSS data visual.
- Bento summary appears after hero.
- Project story steps appear for the two featured projects.
- Preview tabs are visible.
- Project images load.

**Step 3: Browser mobile check**

Verify:

- No horizontal overflow.
- Buttons and tabs fit.
- Bento cards and project story steps stack cleanly.
- Text remains readable.

**Step 4: Link and asset check**

Verify:

- `Kent_John_Macalam_RESUME.pdf` returns `HTTP 200`.
- New HTML includes current resume PDF.
- Console has no errors.

---

### Task 4: Commit

**Files:**
- Commit: `index.html`
- Commit: `style.css`
- Commit: `docs/plans/2026-06-17-static-interactive-data-storytelling-design.md`
- Commit: `docs/plans/2026-06-17-static-interactive-data-storytelling-implementation.md`

**Step 1: Review diff**

Run:

```powershell
git status --short
git diff --stat
```

Expected: only planned files changed.

**Step 2: Commit**

Run:

```powershell
git add index.html style.css docs/plans/2026-06-17-static-interactive-data-storytelling-design.md docs/plans/2026-06-17-static-interactive-data-storytelling-implementation.md
git commit -m "feat: add interactive data storytelling polish"
```

Expected: commit succeeds and branch is clean.
