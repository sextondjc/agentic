---
name: shadcn-quality-gate
description: Use when a shadcn/ui implementation needs an expert, evidence-first quality decision covering accessibility, design token conformance, bundle impact, form validation correctness, and Radix primitive integrity before merge or promotion.
---

# shadcn/ui Quality Gate

## Specialization

Produce one deterministic, evidence-first go or no-go decision for a shadcn/ui implementation — covering accessibility compliance, design token conformance, bundle health, form validation integrity, Radix primitive correctness, and RSC boundary safety.

This skill reviews completed implementations. It does not implement or fix components. It produces severity-tagged findings and a signed disposition. Remediation is owned by the implementing team.

## Trigger Conditions

- A shadcn/ui implementation is ready for merge or promotion to staging or production.
- A component library update introduces new variants, theming changes, or new Radix primitives.
- A form implementation needs a correctness check before shipping.
- A dark mode implementation is complete and needs contrast and token verification.
- A multi-theme update requires token conformance and cross-theme accessibility checks.
- A cross-project shared component package needs a gate check before consuming projects update.

## When Not to Use

- Initial project setup or `components.json` wiring (use `shadcn-setup`).
- Component design and CVA variant work in progress (use `shadcn-component-design`).
- Token and theme design in progress (use `shadcn-theming`).
- Form pattern implementation in progress (use `shadcn-forms`).
- Source freshness checks before starting new work (use `shadcn-source-curation`).

## Inputs

- Implementation scope: component files, `globals.css`, `tailwind.config`, form schemas, and server action handlers.
- Target framework and RSC usage (Next.js App Router, Vite, etc.).
- Accessibility requirement level (default: WCAG 2.2 AA).
- Bundle performance targets if established.
- Evaluation date in ISO format (`YYYY-MM-DD`).

## Required Outputs

| Output | Description |
|---|---|
| Accessibility verdict | Radix a11y inheritance confirmed; ARIA roles, keyboard navigation, focus management, and contrast checked |
| Token conformance verdict | All color, spacing, and radius utilities traced to CSS variables; no raw arbitrary color values without justification |
| Bundle health verdict | CSS and JS bundle impact from shadcn components assessed; tree-shaking confirmed |
| Form integrity verdict | Zod schema completeness, `FormField` composition correctness, error surface coverage, and server-side validation presence confirmed |
| RSC boundary verdict | All components with browser APIs, event handlers, or React state have `"use client"` directives; no server component rules violated |
| Radix primitive verdict | Primitive APIs used correctly; `asChild` usage justified; no deprecated primitive patterns |
| Findings table | All findings severity-tagged (critical, major, minor, advisory); owner assigned per finding |
| Gate recommendation | `GO`, `GO-WITH-CONDITIONS`, or `NO-GO` with explicit reason and evidence reference |

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
