# Project Detail Pages Design

## Goal

Make the three strongest featured projects open dedicated case-study pages from the homepage so recruiters and clients can inspect the full story without leaving the portfolio immediately.

## Options Considered

1. **Expandable sections on the homepage**
   - Fastest to build, but the homepage would become heavier and harder to scan.

2. **Modal case studies**
   - Keeps visitors on the same page, but modals are weaker for sharing, browser history, and mobile reading.

3. **Dedicated static project pages**
   - Best fit for a static portfolio. Each project gets a clean URL, full content, visual proof, and clear buttons to GitHub or the deployed app.

## Approved Direction

Use dedicated static project pages:

- `projects/life-of-a-bill.html`
- `projects/from-farm-to-cup.html`
- `projects/smartrip-cdo.html`

The homepage project image and title should link to the detail page. External GitHub/live-app buttons remain available from the homepage where useful, but the primary card interaction becomes "open case study."

## Page Structure

Each project detail page should include:

- A top navigation bar with a back link to the portfolio.
- A strong project hero with category tags, title, summary, and proof metrics.
- A visual proof area using the existing poster/app image.
- Full sections for Problem, Data, Method, Result, and Impact.
- A tools/evidence section.
- Clear calls to action for GitHub, live app, and returning to all projects.

## Visual Direction

Reuse the current premium navy/cyan/emerald design system. Detail pages should feel like polished case studies rather than separate templates. They should use restrained cards, readable spacing, and real project assets as the first visual proof.

## Testing

Verify:

- Homepage cards navigate to the new local pages.
- Each detail page loads with HTTP 200.
- Visual assets render.
- External buttons still point to the correct GitHub/live URLs.
- No horizontal overflow on desktop or mobile.
