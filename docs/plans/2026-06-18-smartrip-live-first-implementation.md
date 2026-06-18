# SmartTrip Live-First Case Study Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Embed the deployed SmartTripCDO app before its poster and make live-demo full-screen actions readable on light backgrounds.

**Architecture:** Reuse the existing static live-demo HTML/CSS component from The Life of a Bill. Add one context-specific action class rather than changing the global secondary-button style, then extend the existing PowerShell verifier to protect the interaction and contrast requirements.

**Tech Stack:** Static HTML, CSS, Font Awesome, Hugging Face Spaces iframe, PowerShell verification scripts.

---

### Task 1: Add Failing SmartTrip and Contrast Checks

**Files:**
- Modify: `tools/verify-project-pages.ps1`

**Step 1: Require SmartTrip live-first markup**

Add checks for:

- `id="live-app"`
- `https://kent0625-smartrip-cdo.hf.space/?embed=true`
- `title="Interactive SmartTripCDO travel planner"`
- `Try Live App`
- `Open full-screen`
- live-demo markup occurring before `case-proof-grid`

**Step 2: Require the light-section action style**

Require `case-live-action` in both interactive project pages and CSS declarations with a dark text color and light background.

**Step 3: Run the verifier**

Run:

```powershell
powershell -ExecutionPolicy Bypass -File tools\verify-project-pages.ps1
```

Expected: FAIL because SmartTrip has no embedded section and the action class does not exist.

### Task 2: Implement SmartTrip Live-First Experience

**Files:**
- Modify: `projects/smartrip-cdo.html`
- Modify: `projects/life-of-a-bill.html`
- Modify: `style.css`

**Step 1: Update SmartTrip hero actions**

Change the primary action to `href="#live-app"` with label `Try Live App`. Keep GitHub as the secondary action.

**Step 2: Add the SmartTrip live section**

Insert the shared live-demo section immediately after the hero and before the proof grid. Embed:

```html
<iframe
    class="case-live-frame"
    src="https://kent0625-smartrip-cdo.hf.space/?embed=true"
    title="Interactive SmartTripCDO travel planner"
    loading="eager"
></iframe>
```

**Step 3: Add the dedicated action class**

Add `case-live-action` to the full-screen links on both interactive case studies.

**Step 4: Style the light-section action**

Use a white background, visible gray-blue border, dark navy text, and teal hover/focus colors. Do not alter `.button.secondary`.

**Step 5: Run verification**

```powershell
powershell -ExecutionPolicy Bypass -File tools\verify-project-pages.ps1
powershell -ExecutionPolicy Bypass -File tools\verify-responsive-layout.ps1
powershell -ExecutionPolicy Bypass -File tools\verify-dataworld-inspired-style.ps1
git diff --check
```

Expected: all checks pass.

### Task 3: Browser and Deployment Verification

**Step 1: Run the static site locally**

```powershell
python -m http.server 4174 --bind 127.0.0.1
```

**Step 2: Verify Life of a Bill**

Confirm the full-screen action has dark readable text and a light background.

**Step 3: Verify SmartTrip**

Confirm the app section is directly after the hero, the iframe points to the live Space, the full-screen fallback works, and the poster remains below the app.

**Step 4: Commit and push**

```powershell
git add docs/plans projects style.css tools/verify-project-pages.ps1
git commit -m "feat: make SmartTrip case study live first"
git push origin main
```

**Step 5: Verify Render**

Confirm the live SmartTrip case-study page exposes the embedded app and both public URLs return HTTP 200.

