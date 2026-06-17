# Responsive Layout Polish Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Improve portfolio responsiveness across mobile, tablet, and desktop while preserving the approved visual style and content.

**Architecture:** Keep the static HTML/CSS structure. Add a focused PowerShell verifier for responsive CSS expectations, then update only `style.css` breakpoints and spacing.

**Tech Stack:** Static HTML, CSS media queries, PowerShell verification, local Python HTTP server, headless Chrome responsive checks.

---

### Task 1: Add Responsive Verifier

**Files:**
- Create: `tools/verify-responsive-layout.ps1`

**Steps:**
1. Check for a dedicated tablet breakpoint.
2. Check that tablet project, proof, and service grids can render as two columns.
3. Check that the mobile hero headline uses `clamp()`.
4. Check that very narrow screens collapse dense fact/metric grids.
5. Run the verifier and confirm it fails before CSS implementation.

### Task 2: Update Responsive CSS

**Files:**
- Modify: `style.css`

**Steps:**
1. Add an `@media (max-width: 1100px)` layer for tablet spacing and two-column sections.
2. Refine the existing `@media (max-width: 900px)` layer so tablet layouts do not stack too early.
3. Update the `@media (max-width: 650px)` layer for mobile headline sizing, button layout, card padding, and project fact grids.
4. Add an `@media (max-width: 420px)` layer for narrow phones.

### Task 3: Verify

**Commands:**
- `powershell -ExecutionPolicy Bypass -File tools/verify-responsive-layout.ps1`
- `powershell -ExecutionPolicy Bypass -File tools/verify-project-pages.ps1`
- `powershell -ExecutionPolicy Bypass -File tools/verify-dataworld-inspired-style.ps1`
- `git diff --check`

Then run browser checks at phone, tablet, and desktop widths for no horizontal overflow and key content visibility.
