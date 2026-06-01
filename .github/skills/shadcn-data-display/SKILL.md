---
name: shadcn-data-display
description: Use when implementing data-heavy shadcn/ui surfaces — covering TanStack Table DataTable patterns, shadcn Charts (Recharts), Command palette, Combobox, and complex list/grid compositions with sorting, filtering, pagination, and accessibility.
---

# shadcn/ui Data Display

## Specialization

Provide expert-level guidance for implementing data-heavy UI surfaces using shadcn/ui — covering `DataTable` with TanStack Table v8, `Chart` components with Recharts, `Command` palette and `Combobox` for search and selection, and complex list and grid compositions with sorting, filtering, pagination, virtualization, and full accessibility.

This skill covers data display patterns. General component design and CVA variants are handled by `shadcn-component-design`. Form inputs and validation are handled by `shadcn-forms`. Quality gate review is handled by `shadcn-quality-gate`.

## Trigger Conditions

- Implementing a `DataTable` with sorting, filtering, column visibility, row selection, or pagination.
- Building a `Command` palette or `Combobox` with search, async loading, grouping, or custom rendering.
- Implementing shadcn `Chart` components (bar, line, area, pie, radar, radial) with Recharts.
- Building a data grid or list with virtualization requirements (> 500 rows).
- Composing complex multi-select, tag input, or search-driven selection patterns.
- Auditing an existing data table or chart for accessibility, performance, or pattern correctness.

## When Not to Use

- Simple static lists or display cards without interactivity (use `shadcn-component-design`).
- Form inputs including basic `Select` with static options (use `shadcn-forms`).
- Chart data sourcing, API design, or server-side aggregation logic.
- Quality gate sign-off for a completed implementation (use `shadcn-quality-gate`).

## Inputs

- Data shape and volume (row count, column count, update frequency).
- Required interactive features: sorting, filtering, pagination, row selection, column visibility.
- Chart type and data series structure.
- Framework in use and RSC constraints.
- Accessibility requirements (default: WCAG 2.2 AA).
- Virtualization requirements if applicable (row count threshold, scrollable container constraints).
- Evaluation date in ISO format (`YYYY-MM-DD`).

## Required Outputs

| Output | Description |
|---|---|
| Column definition schema | TanStack Table `ColumnDef<TData>[]` with typed accessors, headers, and cell renderers |
| Table component | Fully typed `DataTable` using shadcn `Table` primitives with feature flags for sorting, filtering, and pagination |
| Filter implementation | Column filter or global filter wired to `useReactTable` state; debounced input |
| Pagination implementation | `PaginationState` managed in table; shadcn `Pagination` component wired to table API |
| Chart component | Recharts chart wrapped in shadcn `ChartContainer` with `ChartConfig`, tooltips, and legend |
| Command/Combobox implementation | `Command` or `Combobox` with correct open/close state, search, keyboard navigation, and selection model |
| Accessibility annotation | ARIA roles, keyboard navigation, and screen-reader labels for all interactive data components |
| Performance assessment | Virtualization decision, re-render strategy, and memoization plan for large datasets |
| Readiness summary | Open items, deferred features, and known edge cases |

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
