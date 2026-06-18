# SmartTrip Live-First Case Study Design

## Goal

Make SmartTripCDO behave like The Life of a Bill: visitors open the portfolio case-study page and encounter the deployed app before the poster and written project details.

## Selected Approach

Keep the existing SmartTrip portfolio card linked to `projects/smartrip-cdo.html`. On that page, place a responsive embedded Hugging Face app directly after the hero. This preserves the case study, metrics, research poster, GitHub source, and project narrative while giving recruiters an immediate product experience.

The alternative of sending the card directly to Hugging Face was rejected because it would remove the portfolio context and make returning to the other projects less convenient.

## Page Structure

1. Case-study navigation and hero
2. Interactive SmartTrip app
3. Research poster and project summary
4. Problem, data, method, result, and impact
5. Tools and evidence

The hero primary action scrolls to the embedded app. The header action and the live section both retain external full-screen links.

## Shared Live-Demo Component

SmartTrip reuses the existing:

- `case-live-demo`
- `case-live-heading`
- `case-live-frame-shell`
- `case-live-frame`
- `case-live-note`

The SmartTrip iframe uses:

`https://kent0625-smartrip-cdo.hf.space/?embed=true`

It includes an accessible title and a cold-start note.

## Contrast Fix

The current `button secondary` style was designed for the dark hero and uses white text with a translucent white background. Inside the light live-demo section, this produces a washed-out button.

Add a dedicated `case-live-action` class for full-screen links in light sections. It uses a white surface, dark navy text, visible border, and a teal hover/focus treatment. Hero secondary buttons keep their existing dark-background appearance.

## Responsive Behavior

- Desktop: app heading and full-screen action share a row; iframe uses the existing desktop height.
- Tablet: heading stacks and the iframe receives the existing tablet height.
- Mobile: the full-screen action becomes full width and the iframe receives the existing mobile height.

## Verification

Automated checks require:

- SmartTrip live-demo section before the poster proof grid
- SmartTrip embedded Hugging Face URL
- Accessible iframe title
- Full-screen fallback
- `case-live-action` on both Life of a Bill and SmartTrip
- Explicit dark text and light background for the live action

Browser verification confirms the deployed iframe URLs, readable button colors, no console errors, and no horizontal overflow.

