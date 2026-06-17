# Visual Proof Upgrade Design

## Goal
Improve recruiter confidence by making the portfolio show visible evidence of each project, not only descriptions.

## Approved Approach
Use Approach B: add professional project labels, project visual proof blocks, a more visual workflow preview, and a compact factual Proof of Work section. Keep the site as a single static page with no new JavaScript.

## Scope
- Replace unfinished "Ask about..." CTAs with more professional labels.
- Keep real assets for the two featured projects.
- Add honest HTML/CSS mock visuals for projects that do not yet have screenshots.
- Convert case-study steps into clearer scan-friendly cards.
- Add a Proof of Work section after projects.
- Improve the interactive preview panels with mini visual artifacts.

## Non-goals
- Do not create separate case-study pages yet.
- Do not invent deployment links or GitHub links that are not available.
- Do not add heavy animation or frontend dependencies.

## Verification
- Confirm old weak labels are removed.
- Confirm all five projects have some form of visual proof.
- Confirm the previous removals stay removed: Financial Data Pipeline, 0 JS, and static interactions.
- Check local desktop and mobile rendering for overflow.
- Push to GitHub and confirm Render serves the updated page.
