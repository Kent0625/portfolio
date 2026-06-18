# Evidence-First Metric and Contact CTA Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Replace unsupported homepage preview scores with documented model evidence and strengthen the footer availability CTA without changing layout.

**Architecture:** Extend the existing static PowerShell verifier with exact evidence and copy assertions, then update only `index.html`. Preserve the existing score-card markup and CSS so the visual system and responsive layout remain unchanged.

**Tech Stack:** HTML5, CSS3, PowerShell verification scripts, Git.

---

### Task 1: Define the evidence-first requirements

**Files:**
- Modify: `tools/verify-recruiter-polish.ps1`

**Step 1: Add failing assertions**

Assert that `index.html` contains:

```html
<small>Selected model</small><strong>XGBoost</strong>
<small>Holdout macro F1</small><strong>0.51</strong>
<small>Evaluation set</small><strong>Holdout</strong>
```

Assert that it contains the exact CTA:

```text
Available for Data Science Internships, Analytics Projects, and ML Prototype Work.
```

Assert that `0.71`, `0.84`, and `0.78` are absent from `index.html`.

**Step 2: Run the verifier**

Run:

```powershell
powershell -ExecutionPolicy Bypass -File tools/verify-recruiter-polish.ps1
```

Expected: FAIL only for the new evidence-first assertions.

**Step 3: Commit**

```powershell
git add tools/verify-recruiter-polish.ps1
git commit -m "test: require documented preview metrics"
```

### Task 2: Update metric cards and contact CTA

**Files:**
- Modify: `index.html`

**Step 1: Replace the score cards**

Use:

```html
<div class="score-row">
    <span><small>Selected model</small><strong>XGBoost</strong></span>
    <span class="winner"><small>Holdout macro F1</small><strong>0.51</strong></span>
    <span><small>Evaluation set</small><strong>Holdout</strong></span>
</div>
```

**Step 2: Replace the footer heading**

Use:

```html
<h2>Available for Data Science Internships, Analytics Projects, and ML Prototype Work.</h2>
```

Do not modify project images, mockups, card layout, or CSS.

**Step 3: Run all verification**

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
git add index.html
git commit -m "docs: use documented model evidence"
```

### Task 3: QA and publish

**Files:**
- No source changes unless QA identifies a defect.

**Step 1: Serve the site locally**

```powershell
python -m http.server 4173 --bind 127.0.0.1
```

**Step 2: Browser QA**

At desktop and 390 by 844 mobile widths, verify:

- the three model cards remain legible;
- the footer CTA wraps cleanly;
- no horizontal overflow appears;
- the layout is otherwise unchanged.

**Step 3: Run fresh verification on a clean tree**

Run all PowerShell verification scripts and `git diff --check`.

**Step 4: Publish**

Push the verified feature branch, confirm `origin/main` is an ancestor, and fast-forward `main` without force. Verify the live Render page contains `Holdout macro F1` and the new CTA.
