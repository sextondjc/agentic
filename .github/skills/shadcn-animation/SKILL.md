---
name: shadcn-animation
description: Use when adding animations to shadcn/ui components — covering Framer Motion + Radix integration, tailwindcss-animate keyframes aligned to Radix data-state attributes, AnimatePresence with forceMount for exit animations, and prefers-reduced-motion compliance.
---

# shadcn/ui Animation

## Specialization

Provide expert-level guidance for animating shadcn/ui components using `tailwindcss-animate` and Framer Motion — covering Radix `data-state` attribute-driven CSS keyframes, `AnimatePresence` + `forceMount` patterns required for exit animations on Radix overlays, route transition patterns, reduced-motion compliance, and performance-safe animation practices.

This skill is specialized for animation implementation with Radix/shadcn. Theming and CSS variable tokens are handled by `shadcn-theming`. Component design and CVA variants are handled by `shadcn-component-design`. Accessibility compliance including reduced-motion is also covered in `shadcn-accessibility`.

## Trigger Conditions

- A Dialog, Sheet, Popover, Tooltip, DropdownMenu, or other Radix overlay component needs custom enter/exit animations beyond the shadcn defaults.
- Exit animations on Radix components are not running because Radix unmounts the element immediately on close.
- Framer Motion `AnimatePresence` is needed to animate the unmount of a Radix component.
- `tailwindcss-animate` keyframes need to be synchronized with Radix `data-state="open"` / `data-state="closed"` attributes.
- Route transitions between Next.js App Router pages or SvelteKit routes need animation.
- A component's animation conflicts with `prefers-reduced-motion` user preference.
- Staggered list animations, presence animations, or skeleton-to-content transitions are needed.

## When Not to Use

- Theming and CSS variable token design (use `shadcn-theming`).
- Accessibility-only reduced-motion compliance without animation implementation (use `shadcn-accessibility`).
- Component structural design without animation (use `shadcn-component-design`).
- Tailwind utility animations on non-shadcn surfaces (use `tailwind-component-design`).

## Inputs

- Component name and animation goal (enter, exit, layout shift, stagger, route transition).
- Animation library in use or preferred: `tailwindcss-animate`, Framer Motion, or both.
- Radix `data-state` values for the component (open/closed, checked/unchecked, etc.).
- Whether `prefers-reduced-motion` compliance is required.
- Performance budget: animation must not cause layout recalculation (compositor-only preferred).
- Framework: Next.js App Router, Vite + React, SvelteKit, Remix.
- Evaluation date in ISO format (`YYYY-MM-DD`).

## Required Outputs

| Output | Description |
|---|---|
| Animation implementation | Working CSS keyframes or Framer Motion variants with correct Radix `data-state` integration |
| `forceMount` pattern (if exit animation) | `forceMount` + `AnimatePresence` setup so Radix does not unmount before exit animation completes |
| `tailwindcss-animate` keyframe map | Custom keyframe definitions keyed to `data-state` attribute values |
| Reduced-motion compliance | `@media (prefers-reduced-motion: reduce)` rules or `useReducedMotion()` conditional |
| Performance annotation | Confirmation that animated properties are `transform` and `opacity` only (compositor-safe) |
| Variant library (if applicable) | Reusable Framer Motion `Variants` object for use across multiple components |
| Route transition pattern (if applicable) | Page-level animation wrapping strategy for the target framework |
| Open items | Deferred scenarios, known AT interaction concerns, and browser quirks |

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
