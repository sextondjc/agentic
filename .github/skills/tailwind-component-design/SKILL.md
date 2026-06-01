---
name: tailwind-component-design
description: Use when designing or reviewing TailwindCSS component patterns — covering utility composition, responsive design, dark mode, design tokens, Headless UI integration, and accessibility.
---

# TailwindCSS Component Design

## Specialization

Provide expert-level guidance for designing and reviewing TailwindCSS component patterns across utility composition, responsive breakpoints, dark mode, design tokens, Headless UI integration, class ordering, and WCAG-aligned accessibility.

This skill covers component-level design patterns. Build pipeline and project setup is handled by `tailwind-setup`. Quality gate review of a completed implementation is handled by `tailwind-quality-gate`.

**Design language model**: When shadcn/ui is present in the project, use `shadcn-component-design` for shadcn-registered components. Use this skill for Tailwind-only surfaces alongside a shadcn project — layouts, prose content, marketing pages, data-dense grids, and animation — where Tailwind utilities deliver capability that shadcn does not cover. Both skills can be active in the same project; coordinate on token naming and dark mode strategy so Tailwind utilities consume shadcn CSS variables rather than defining independent tokens.

## Trigger Conditions

- Designing or reviewing a new UI component that uses TailwindCSS utilities.
- Establishing a reusable design-token strategy (`@theme` custom properties or CSS variables).
- Implementing responsive layouts, container queries, or adaptive breakpoints with Tailwind.
- Adding dark mode to an existing component library.
- Integrating Headless UI components with Tailwind styling.
- Auditing a component library for class-ordering consistency, accessibility gaps, or utility anti-patterns.

## When Not to Use

- Project setup, build pipeline, or v3 → v4 migration (use `tailwind-setup`).
- Quality gate decision for a release candidate (use `tailwind-quality-gate`).
- Source freshness check before adopting a new Tailwind feature (use `tailwind-source-curation`).

## Inputs

- Target component or component library scope.
- Design token inventory or Figma/design handoff artifacts if available.
- Framework in use (React, Vue, Svelte, Astro, Blazor, etc.).
- Accessibility requirements and target WCAG level (default: AA).
- Dark mode strategy already chosen or to be decided.
- Evaluation date in ISO format (`YYYY-MM-DD`).

## Required Outputs

| Output | Description |
|---|---|
| Component pattern set | Utility class compositions for each component, co-located or in a component file |
| Design token map | `@theme` custom properties or CSS variables mapped to semantic roles (brand, surface, border, text, status) |
| Responsive strategy | Breakpoint choices, container query adoption decision, and mobile-first composition rules |
| Dark mode implementation | Strategy choice (`dark:` class vs. `prefers-color-scheme`) with token mapping for both modes |
| Headless UI integration notes | Component wiring pattern for any interactive components (dialog, menu, combobox, listbox, tabs) |
| Class ordering record | Prettier plugin active; ordering verified for all components |
| Accessibility annotation | Contrast, focus-visible, reduced-motion, and keyboard interaction requirements met for each component |
| Readiness summary | Open risks, known edge cases, and deferred patterns |

## Done Criteria

- [ ] Design token map is complete with semantic roles covering brand, surface, border, text, and status.
- [ ] Responsive strategy is documented; mobile-first composition applied.
- [ ] Dark mode strategy is chosen and token map covers both modes.
- [ ] Headless UI used for all interactive ARIA-bearing components.
- [ ] Prettier plugin enforces class ordering across all component files.
- [ ] Accessibility checklist passes for every interactive component.
- [ ] No anti-patterns present in delivered components.
- [ ] Readiness summary written with open risks and deferred patterns.

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
