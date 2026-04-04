---
name: mobile-ui-prototyping
description: Use when evolving low-fidelity wireframes into high-fidelity interactive prototypes with production-ready visual systems, component tokens, and annotated handoff artifacts.
---

# Mobile UI Prototyping

## Scope

Bridge the gap between wireframe and implementation by producing polished, interactive prototypes with design system alignment, behavioral annotations, and clear handoff contracts for mobile app development.

## Outcomes

- Mid to high-fidelity mockups with typography, spacing, color, and platform-specific polish applied.
- Interactive clickable prototypes or annotated static deliverables matched to tool choice.
- Component token library (colors, type scales, shadows, animations) mapped to implementation tokens.
- Per-screen annotations: copy, validation rules, error states, loading skeleton patterns, and platform-specific guidance.
- Handoff package: design-to-code contract, copy strings, dark mode / responsive variants, and implementation risks flagged.

## When to Use

- You have approved wireframes and need production-ready mockups.
- You must create a design system bridge for consistent mobile components.
- You want to capture interaction behavior (tap feedback, transitions, state changes) before code.
- Engineering needs annotated acceptance criteria and visual specifications per screen.
- You need to validate responsive/landscape behavior or multi-platform consistency.

## When NOT to Use

- This skill is NOT a replacement for user research or usability testing; use `design-mobile-ux` first to validate wireframe assumptions.
- This skill is NOT for real-time collaborative design sprints; use design tools directly for those (Figma, Penpot).
- This skill is NOT for component implementation; handoff is to engineering, not production code.

## Required Collaborators

- `design-mobile-ux` — Ensures wireframe foundation is usable before visual polish.
- `critical-thinking` — Pressure-tests design system choices and visual consistency rules.
- `api-design` — Aligns prototype interactions with realistic backend response patterns (loading, error, retry states).
- `test-driven-development` — Frames acceptance criteria as testable visual + behavioral contracts.

## Workflow

### 1. Set prototyping scope and tool
Define target platforms (iOS + Android, same visual language or platform-specific?), screen count, interaction depth, and tool choice:
- **Static annotated mockups** (fast, low overhead): Figma, Penpot, or Miro with annotation overlays.
- **Interactive prototypes** (higher fidelity): Figma proto, Penpot proto, or Framer.
- **Code-based prototypes** (.NET MAUI Storybook, React Native Storybook): best for pixel-perfect alignment with production.

Record your choice and rationale.

### 2. Build or adapt a design system starter
Define the minimal visual language for V1:
- **Type scale**: 2–3 font sizes (display, body, caption) with line heights and weights.
- **Color palette**: Primary (brand), secondary, grays, semantic colors (success, error, warning), dark mode variants.
- **Spacing scale**: 4px–8px–16px–24px grid; apply consistently to padding, margins, gaps.
- **Components**: Button styles (primary, secondary, disabled), input fields, chips/tags, status cards, modals.
- **Animations**: State transitions (fade, slide, scale) and duration rules (fast: 200ms, normal: 400ms, slow: 600ms).

Reuse workspace standards where they exist; cite them in the handoff.

### 3. Create visual specifications per screen
For each approved wireframe:
- Apply color, typography, and spacing from design system.
- Add detail: button sizes, input placeholder copy, card shadows, dividers, and background textures.
- Show multiple states: empty, loading (skeleton or spinner), success, error, disabled, focus/hover.
- Mark safe areas for notch/status bar (iOS) and system gesture zones.
- Annotate micro-interactions: what happens on tap, how long does loading spin, when does error dismiss.

### 4. Annotate for implementation
Add non-visual contract details to each screen:
- **Input validation rules** (e.g., "ISBN must be 10–13 digits; reject on blur if invalid").
- **Error copy** (e.g., "ISBN not found. Check and retry or enter details manually.").
- **Copy strings** (all text from header to footer, including pluralization rules for counts).
- **Accessibility labels** (screen reader text for icon buttons, form fields).
- **Backend contract** (what payloads trigger this screen state; what fields are required/optional).
- **Platform differences** (iOS back-swipe vs Android back button; home indicator spacing).
- **Network timeouts and retry** (e.g., "Max 30s load before error; offer retry.").

### 5. Create variant matrices
Document responsive and state coverage:
- **Phone portrait** (375px and 428px widths; common breakpoints).
- **Phone landscape** (if relevant: how does layout reflow?).
- **Tablet** (if in V1 scope: split-view layouts, larger tap targets).
- **Dark mode** (all screens; apply semantic color overrides).
- **Accessibility**: minimum 18px tap targets, 4.5:1 contrast ratio for text.

Create or reference a matrix table showing which variants are covered.

### 6. Build interactive prototype (if tool chosen supports it)
If using Figma proto, Penpot proto, or Framer:
- Link screens with navigation flows matching approved wireframe journeys.
- Attach transitions and micro-interactions (tap feedback, modal entry/exit).
- Test all happy paths and one critical error path in each tab.
- Publish and share read-only link for review.

If using static mockups:
- Create a visual flow diagram overlaid on mockups showing navigation links.
- Document interaction behavior in text annotations.

### 7. Run async design review
Share prototype draft with stakeholders:
- Include a brief design rationale (why this visual system, how it aligns with brand/constraints).
- Ask for feedback on: visual clarity, usability (tap targets, hierarchy), platform alignment, copy tone.
- Gather feedback into severity buckets: blocker (ship halts), major (must fix before handoff), minor (polish, can iterate post-launch).

Iterate blockers and majors inline; defer minor feedback to post-launch backlog.

### 8. Prepare handoff package
Bundle all artifacts:
- **Prototype link** (read-only Figma/Penpot/Framer share or static mockups).
- **Design system spec**: complete with color hex codes, type family/weight/size, spacing tokens, component styles.
- **Copy strings spreadsheet or .resx file**: all UI text with context (screen, field, state).
- **Annotation collage**: one PDF or markdown doc per screen with visual specs + implementation contract.
- **Responsive matrix**: documented coverage for phone/tablet, portrait/landscape, dark mode, a11y.
- **Implementation risks**: known gaps, deferred features, and assumptions to validate with engineers.

### 9. Gate for implementation readiness
Check:
- [ ] All wireframe screens are represented in prototype.
- [ ] All states (empty, loading, error, success) are shown for at least one per tab.
- [ ] Color, typography, and spacing are consistent across all screens.
- [ ] All copy is finalized and proofread.
- [ ] Tap targets are 44pt minimum (iOS) or 48dp minimum (Android).
- [ ] Dark mode variant is complete.
- [ ] Accessibility contrast and labels are specified.
- [ ] No ambiguity remains between designer intent and engineering interpretation.

If gate fails, iterate. If gate passes, mark ready for engineering handoff.

## Design System Token Mapping (Optional Advanced Step)

If your project has a living component library or tokens system (e.g., Figma tokens plugin, CSS custom properties):
- Map prototype colors to token names: `--color-primary` ↔ `#0F766E`.
- Map type scales to token names: `--type-body-16-medium` ↔ `16px Poppins 500`.
- Export token JSON and include in handoff so engineering can consume tokens programmatically.

## Checklist

- [ ] Design system starter is defined: type scale, color palette, spacing, components, animations.
- [ ] All wireframe screens are mockup-ready with visual hierarchy applied.
- [ ] All states (empty, loading, success, error, disabled) are represented for critical flows.
- [ ] Copy is finalized, proofread, and includes validation/error messaging.
- [ ] Responsive behavior is documented for phone/tablet and portrait/landscape.
- [ ] Dark mode is complete or explicitly deferred to post-launch.
- [ ] Accessibility: minimum 18px tap targets, 4.5:1 contrast, screen reader labels documented.
- [ ] Platform-specific guidance (iOS notch/home indicator, Android gestures) is noted.
- [ ] Interactive prototype is testable or static mockup is annotated with interaction copy.
- [ ] Design review feedback is incorporated and blockers resolved.
- [ ] Handoff package is assembled and ready for engineering intake.
- [ ] Implementation risks are identified and flagged.

## Common Mistakes

- **Treating design as polish only** — Design system tokens and annotations are contracts, not decoration. Skipping them causes misalignment in code.
- **Ignoring platform playbooks** — iOS and Android have different conventions (navigation patterns, back behavior, system gestures). Ignoring these creates friction for users.
- **Deferring dark mode "until later"** — Dark mode is 2–3x complexity if bolted on post-launch. Build it into the prototype.
- **Skipping error and loading states** — Most users experience these states more than success states. Prototype them thoroughly.
- **Over-animating interactions** — Animations add delight but also latency and battery drain. Stick to 200–400ms rule. Test on target devices.
- **Not validating copy length** — Long copy breaks layouts. Test translations and plural forms in the prototype.
- **Underspecifying accessibility** — WCAG-AA compliance is table stakes; annotate this from the start, don't retrofit.

## Inputs

- Approved low-fidelity wireframes (from `design-mobile-ux` completed workflow).
- Brand or company visual system guidelines (colors, type, tone).
- Target platforms (iOS, Android, both; single visual language or platform-distinct).
- Tool preference or constraints (Figma/Penpot available and licensed, or static mockups only).
- Stakeholder review criteria (what must be validated before handoff).

## Required Outputs

- A concrete, workspace-applicable prototype artifact (interactive or annotated mockups).
- Design system specification with tokens, color codes, type scales, spacing grid.
- Per-screen implementation annotations: copy, validation rules, error states, accessibility labels.
- Handoff package: prototype link/file, design specs, copy strings, responsive matrix, implementation risks.

## Workflow

1. Gather required context and constraints from the workspace and user request.
2. Execute the skill-specific steps and produce the required artifacts or decisions.
3. Validate outputs for completeness and consistency with active workspace instructions.
