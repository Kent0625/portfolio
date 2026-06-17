# Static Interactive Data Storytelling Design

## Goal

Improve the portfolio without rebuilding the stack. The site should feel more like an interactive data-storytelling portfolio while staying fast, static, and easy to deploy.

## Direction

Use the current HTML/CSS portfolio as the base and add a premium but lightweight experience:

- Bento-style summary cards for tools, proof, GitHub, resume, and project signals.
- CSS-only scroll reveal animations using opacity and transform.
- Animated hero keywords for Data Science, Machine Learning, Dashboards, and AI.
- A subtle CSS-only data stack accent in the hero instead of heavy WebGL.
- Project storytelling sections that show problem, data, method, result, and impact.
- An interactive preview panel using accessible radio tabs for EDA, Model, Dashboard, and Insights.

## Constraints

- Keep the portfolio as static HTML and CSS.
- Do not add React, Next.js, GSAP, Motion, Three.js, or a build pipeline.
- Keep animation purposeful and lightweight.
- Avoid text overlap and horizontal overflow on mobile.
- Preserve resume download, GitHub links, and existing project links.
- Avoid a one-note neon blue/purple visual theme.

## Page Changes

1. Hero
   - Retain Kent's name and core positioning.
   - Add a rotating word rail for "Data Science", "Machine Learning", "Dashboards", and "AI".
   - Add one CSS-only data stack/accent panel on desktop.

2. Bento Summary
   - Add a compact grid after the hero.
   - Cards should highlight Python, SQL, ML, dashboards, research projects, GitHub, resume, and availability.

3. Featured Projects
   - Keep the existing project cards.
   - Add story steps to the strongest projects:
     - Problem
     - Data
     - Method
     - Result
     - Impact

4. Interactive Preview
   - Add an accessible tab-like section using radio inputs and labels.
   - Preview tabs:
     - EDA
     - Model
     - Dashboard
     - Insights

5. Motion
   - Use CSS scroll-linked reveal where supported.
   - Provide safe fallback: content remains visible even when scroll animations are unsupported.
   - Animate only transform and opacity.

## Verification

Verify in the browser:

- Desktop hero, bento grid, project stories, preview panel, skills, services, and contact render correctly.
- Mobile has no horizontal overflow.
- Resume PDF downloads from the current PDF asset.
- Project images load.
- Console has no errors.
