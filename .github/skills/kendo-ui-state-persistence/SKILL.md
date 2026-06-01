---
name: kendo-ui-state-persistence
description: Use when Kendo UI component state (filters, sorting, grouping, paging, column layout) must persist and restore reliably across sessions, routes, or devices.
---

# Kendo UI State Persistence

## Specialization

Implement deterministic save and restore patterns for Kendo UI component state so user context survives reloads, navigation, and multi-session usage without corrupting layout or query semantics.

## Trigger Conditions

- Users need Grid state retained after refresh or navigation.
- State must be sharable by URL or synced server-side.
- Column order, width, visibility, sort, or filters must persist.
- Persisted state breaks after version upgrades or schema changes.

## Scope Boundaries

In scope:

- State capture and restore contracts for supported widgets.
- Storage strategy selection (URL, localStorage, server profile).
- Backward-compatible state versioning and migration rules.
- Guardrails for invalid or stale persisted state.

Out of scope:

- Backend profile implementation details.
- Security policy authoring for user profile stores.
- Generic routing architecture.

## Inputs

- Target widget list and state elements to persist.
- Persistence medium requirements.
- Session model and identity constraints.
- Upgrade compatibility expectations.

## Required Outputs

- Versioned state schema and serialization contract.
- Save and restore lifecycle hook plan.
- State migration policy for schema changes.
- Recovery behavior for corrupted or stale state.
- Test matrix for persistence scenarios.

## Core Patterns

### Grid State Save and Restore

```javascript
var grid = $("#ordersGrid").data("kendoGrid");
var stateKey = "orders-grid-state-v1";

function saveState() {
    localStorage.setItem(stateKey, kendo.stringify(grid.getOptions()));
}

function restoreState() {
    var raw = localStorage.getItem(stateKey);
    if (!raw) return;
    grid.setOptions(JSON.parse(raw));
}
```

### State Version Guard

```javascript
// Include a version token in persisted payload to support migrations.
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
