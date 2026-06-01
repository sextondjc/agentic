---
name: shadcn-testing
description: Use when writing or reviewing tests for shadcn/ui components — covering Radix portal handling, keyboard interaction, async Dialog/Sheet assertions, Combobox/Command filtering, and Storybook story contracts.
---

# shadcn/ui Testing

## Specialization

Provide expert-level guidance for testing shadcn/ui components with Vitest + Testing Library, Playwright, and Storybook — covering Radix portal rendering, async state assertions, keyboard interaction sequences, `forceMount` patterns for animated components, and screen reader query strategies.

This skill covers testing authoring. Component design and CVA variants are handled by `shadcn-component-design`. Form composition and validation UX are handled by `shadcn-forms`. Quality gate pre-merge review is handled by `shadcn-quality-gate`.

## Trigger Conditions

- Writing unit or integration tests for shadcn/ui components (Button, Dialog, Sheet, Select, Combobox, Command, Popover, Tooltip, etc.).
- Radix portals (`Dialog`, `AlertDialog`, `Sheet`, `Tooltip`, `Popover`) are breaking standard `getByRole` or `getByText` queries.
- Tests need to simulate keyboard navigation across Radix-managed focus traps and roving tabindex patterns.
- `AnimatePresence` or `tailwindcss-animate` exit animations are preventing assertions on unmounted elements.
- Designing Storybook stories that serve as living component contracts with accessibility metadata.
- Writing Playwright E2E tests for multi-component flows involving dialogs, command palettes, or multi-select comboboxes.
- Auditing existing component tests for `fireEvent` misuse, missing `waitFor`, or missing ARIA query strategies.

## When Not to Use

- Quality gate evidence review before promotion (use `shadcn-quality-gate`).
- CI pipeline integration for test runs (use `shadcn-ci-integration`).
- Component authoring guidance without a test focus (use `shadcn-component-design`).
- xUnit or backend testing patterns (use `xunit-test-design`).

## Inputs

- Component name and its Radix primitive base.
- Test framework in use: Vitest + Testing Library, Jest + Testing Library, Playwright, or Storybook.
- Animation library in use: `tailwindcss-animate`, Framer Motion, or none.
- RSC/SSR context: Next.js App Router, Vite + React, or SvelteKit.
- Specific interaction to verify: open/close, keyboard nav, async filter, form submission, etc.
- Evaluation date in ISO format (`YYYY-MM-DD`).

## Required Outputs

| Output | Description |
|---|---|
| Test file(s) | Vitest/Jest + Testing Library tests with named `describe` blocks and explicit `it` intent strings |
| Portal query strategy | Confirmed approach for finding Radix portal content (`within(document.body)`, `screen.getByRole` with `hidden: false`, etc.) |
| Keyboard interaction map | Key sequence table for each interactive component under test |
| `waitFor` / `findBy` contract | All async assertions using `findBy*` or `waitFor(() => expect(...))` — no bare `getBy*` after triggers |
| `forceMount` pattern (if animated) | `AnimatePresence` or `data-state` handling so exit content can be asserted |
| Storybook stories (if applicable) | `argTypes`, `play` function with `@storybook/test` interactions, and `a11y` addon metadata |
| Playwright test (if applicable) | Page object or inline flow test for E2E scenario with explicit assertion on ARIA role and visible state |
| Coverage gaps record | Interactions that are deferred and explicit rationale |

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
