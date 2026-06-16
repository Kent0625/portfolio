# Hybrid Proof-of-Work Portfolio Design

## Goal

Redesign Kent John U. Macalam's portfolio into a professional proof-of-work site for two audiences:

- Recruiters hiring for data internships, part-time roles, or junior analytics work.
- Project-based clients looking for help with data cleaning, dashboards, statistical analysis, and machine learning prototypes.

## Positioning

The site should present Kent as a data science student who can turn messy datasets into clear, explainable, useful outputs. The voice should be confident but not inflated. The portfolio should make the projects easy to scan, then provide enough context for technical readers to inspect the work on GitHub.

## Page Structure

1. Header
   - Logo/name.
   - Navigation to Projects, Skills, Services, and Contact.
   - Resume or GitHub call to action.

2. Hero
   - Clear role statement: Data Science Student and Analytics Project Builder.
   - Short value proposition focused on analytics, machine learning, statistical modeling, and decision support.
   - Calls to action for projects, resume, and GitHub.

3. Featured Projects
   - Primary proof section with stronger cards and plain-language outcomes.
   - Include the new GitHub projects:
     - Legislative ML project: Philippine Senate bill status prediction using machine learning and XGBoost.
     - Coffee farmers income project: bootstrap confidence intervals for farmer income uncertainty.
   - Keep selected existing projects where they support the data science narrative.
   - Each card should show the problem, methods/tools, result/value, and direct project link.

4. Skills
   - Group skills by practical capability:
     - Data Analysis
     - Machine Learning
     - Statistical Modeling
     - Visualization
     - Web/Data Tools

5. Services-Style Value
   - A concise client-facing section that explains what Kent can help with:
     - Dashboard and report building.
     - Data cleaning and exploratory analysis.
     - Machine learning prototypes.
     - Statistical analysis and uncertainty reporting.

6. Contact
   - Email, GitHub, LinkedIn, and resume links.
   - Clear invitation for internships, part-time roles, and project-based work.

## Visual Direction

Move away from a generic dark tech template toward a polished data portfolio:

- Professional dark base with better contrast and warmer neutral surfaces.
- Sharper content hierarchy for project cards.
- Responsive grid that works cleanly on mobile and desktop.
- Project cards with compact metadata, outcome-driven copy, and visible action links.
- Subtle visual accents only where they clarify structure.

## Content Rules

- Prioritize proof over claims.
- Use plain language for project summaries.
- Avoid long academic descriptions on the homepage.
- Make GitHub links visible and easy to open.
- Keep all sections scannable for busy recruiters.

## Technical Approach

Keep the site as static HTML and CSS:

- Update `index.html` for content and structure.
- Update `style.css` for the redesigned layout and visual system.
- Reuse existing Font Awesome icons.
- Add local project image assets only when they are practical and lightweight.
- Verify the final site in a browser at desktop and mobile widths.
