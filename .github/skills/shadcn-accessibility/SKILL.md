---
name: shadcn-accessibility
description: Use when building accessible shadcn/ui components from the start — covering per-component Radix ARIA contracts, WCAG 2.2 success criteria mapping, keyboard interaction implementation, focus management, and screen reader announcement patterns.
---

# shadcn/ui Accessibility

## Specialization

Provide expert-level guidance for building WCAG 2.2 AA-compliant shadcn/ui components — covering per-component Radix ARIA role/state contracts, keyboard interaction implementation, focus management strategies, `aria-live` announcement patterns for async components, reduced-motion compliance, and screen reader testing sequences.

This skill is for building accessibility in from the start. Pre-merge gate checks are handled by `shadcn-quality-gate`. Component design patterns and CVA variants are handled by `shadcn-component-design`. Testing keyboard and ARIA behavior is handled by `shadcn-testing`.

## Trigger Conditions

- Implementing a shadcn/ui component that must pass WCAG 2.2 AA for a production feature.
- A Dialog, Sheet, Tooltip, Popover, Select, Combobox, or DataTable component needs correct ARIA role and state implementation.
- Focus management is needed: trapping focus in dialogs, restoring focus on close, managing focus in multi-step flows.
- An async component (Command palette, Combobox, async DataTable) needs `aria-live` region announcements for screen readers.
- A component uses `tailwindcss-animate` or Framer Motion and needs `prefers-reduced-motion` compliance.
- Icon-only buttons, decorative images, or visually hidden labels need correct ARIA patterns.
- An accessibility audit has returned failures that need remediation guidance.
- Designing skip links, landmark regions, and page-level accessibility scaffolding.

## When Not to Use

- Automated pre-merge accessibility gate (use `shadcn-quality-gate`).
- Writing test cases for ARIA behavior (use `shadcn-testing`).
- Deep accessibility audit across an entire app surface (use `web-ux-accessibility`).
- Mobile-specific accessibility for MAUI/Capacitor (use `capacitor-accessibility` or `mobile-accessibility-quality-gate`).

## Inputs

- Component name and Radix primitive base.
- Feature context: what user action does this component enable?
- WCAG target level: AA (default) or AAA.
- Whether `prefers-reduced-motion` support is required.
- Whether `aria-live` announcements are needed (async filter, loading state, toast/alert).
- Framework and RSC context.
- Evaluation date in ISO format (`YYYY-MM-DD`).

## Required Outputs

| Output | Description |
|---|---|
| ARIA contract | Complete role, state, property, and relationship requirements for the component per WAI-ARIA APG |
| WCAG mapping | SC identifiers and pass criteria for each accessibility requirement |
| Keyboard interaction table | Full key sequence for all interactive states |
| Focus management spec | Focus-on-open, focus-trap, and focus-on-close behavior defined |
| `aria-live` contract (if async) | Region role, `aria-atomic`, `aria-relevant`, and trigger timing defined |
| Reduced-motion implementation | CSS `@media (prefers-reduced-motion: reduce)` rules or Framer Motion `useReducedMotion` usage |
| Visually hidden pattern | `sr-only` utility application for labels that should be off-screen but accessible |
| Screen reader test sequence | Manual verification steps for VoiceOver (macOS/iOS) and NVDA/JAWS (Windows) |
| Open findings | Known gaps, browser/AT quirks, and deferred items with rationale |

## Workflow

1. Capture inputs and constraints.
2. Execute this skill's deterministic steps.
3. Publish outputs with status and next actions.

## Execution Context
### Input Context

- Request objective and scope boundary.
- Applicable constraints and required outputs.

### Process Context

- Follow this skill's deterministic workflow from intake to closure.
- Record ownership and decisions for required outputs.

### Output Context

- Deliverables with explicit completion status.
- Residual risks and next actions.
## References Assets

- [Reference assets](./references/README.md)
