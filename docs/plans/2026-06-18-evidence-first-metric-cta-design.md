# Evidence-First Metric and Contact CTA Design

## Goal

Improve portfolio credibility by replacing unsupported preview scores with documented project evidence and strengthening the contact message without changing the layout.

## Approved Changes

### Model preview

Replace the illustrative model comparison values with three documented facts from The Life of a Bill case study:

- XGBoost — Selected model
- 0.51 — Holdout macro F1
- Holdout — Evaluation set

Keep the existing score-card visual structure and feature-importance bars. Do not imply that the three cards are competing model scores.

### Contact CTA

Use the explicit availability statement:

> Available for Data Science Internships, Analytics Projects, and ML Prototype Work.

Place it as the primary footer heading so recruiters can immediately understand the desired opportunities.

### Deferred work

Do not add mockups, placeholders, or generated visuals for Inventory DSS or E-Eye. Additional project visuals remain deferred until authentic screenshots are supplied.

## Verification

- Add automated checks for the documented metric labels and exact contact CTA.
- Confirm the unsupported values `0.71`, `0.84`, and `0.78` no longer appear.
- Run all existing portfolio verification scripts.
- Check the homepage at desktop and mobile widths without changing the layout.
