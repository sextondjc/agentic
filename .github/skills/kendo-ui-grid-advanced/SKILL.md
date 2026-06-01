---
name: kendo-ui-grid-advanced
description: Use when Kendo UI Grid implementations need advanced editing modes, virtualization combinations, grouping aggregates, locked columns, and deterministic behavior at scale.
---

# Kendo UI Grid Advanced

## Specialization

Implement and review advanced Kendo UI Grid behavior for high-complexity scenarios: inline and popup editing, batch operations, grouping with aggregates, column locking and reordering, detail templates, and virtualization-safe configuration.

## Trigger Conditions

- Grid supports more than one editing mode or complex CRUD behavior.
- Grid handles large datasets with paging, endless scroll, or virtual scrolling.
- Grouping, aggregates, and custom group headers are in scope.
- Locked columns, column menu customization, or dynamic column layout is required.
- Master-detail Grids or nested Grid composition is being introduced.
- Existing Grid implementation shows regressions after feature expansion.

## Scope Boundaries

In scope:

- Grid configuration contracts for advanced behaviors.
- Editing workflows: inline, popup, batch edit, and command customization.
- Grouping/aggregate integrity and summary rendering.
- Virtualization and feature compatibility decisions.
- Column state handling and deterministic Grid lifecycle teardown.

Out of scope:

- Generic DataSource transport design (see `kendo-ui-data-binding`).
- Generic widget security posture (see `kendo-ui-security`).
- Cross-component quality disposition (see `kendo-ui-quality-gate`).

## Inputs

- Kendo UI version and framework variant.
- Target Grid features and data volume profile.
- CRUD rules, validation rules, and business constraints.
- Existing Grid configuration and known defects.

## Required Outputs

- Approved advanced Grid configuration with rationale for each major option.
- Feature compatibility matrix (editing, grouping, virtual scroll, locked columns).
- Failure-mode checklist (stale selection, broken aggregates, command state drift).
- Performance guardrails for row count, render latency, and interaction latency.
- Test scenarios mapped to key Grid user journeys.

## Core Patterns

### Batch Editing with Aggregates

```javascript
$("#ordersGrid").kendoGrid({
    dataSource: {
        transport: { /* configured elsewhere */ },
        schema: { model: { id: "id" } },
        pageSize: 50,
        batch: true,
        aggregate: [{ field: "total", aggregate: "sum" }]
    },
    editable: true,
    toolbar: ["save", "cancel"],
    columns: [
        { field: "customer" },
        { field: "total", format: "{0:c}", aggregates: ["sum"], footerTemplate: "Sum: #=kendo.toString(sum, 'c')#" },
        { command: ["edit", "destroy"] }
    ],
    pageable: true,
    groupable: true,
    sortable: true
});
```

### Virtualization Guardrail

```javascript
// Virtual scrolling should be paired with server paging for large datasets.
scrollable: { virtual: true },
pageable: true,
height: 600
```

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
