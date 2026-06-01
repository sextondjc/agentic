---
name: kendo-ui-export-printing
description: Use when Kendo UI Excel/PDF export and print workflows require deterministic output quality, secure data handling, and reproducible delivery across environments.
---

# Kendo UI Export and Printing

## Specialization

Design and review export and print workflows for Kendo Grid and reporting surfaces using Kendo Excel/PDF capabilities, including formatting integrity, data governance, and runtime reliability.

## Trigger Conditions

- Grid data must export to Excel or PDF.
- Print-ready layouts are required for operational reports.
- Export behavior differs between browser, role, or environment.
- Exporting large datasets causes timeouts or memory pressure.
- Compliance requirements constrain what may be exported.

## Scope Boundaries

In scope:

- Excel/PDF export option contracts and formatting rules.
- Export scope controls (selected rows vs full dataset).
- File naming and metadata conventions.
- Print layout strategy and style isolation.
- Failure handling for large or restricted exports.

Out of scope:

- Server-side authorization policy authoring.
- Vulnerability analysis details (see `kendo-ui-security`).
- CI pipeline orchestration (see `kendo-ui-ci-integration`).

## Inputs

- Export targets (Excel, PDF, print) and user roles.
- Dataset size and required columns/aggregates.
- Compliance constraints and redaction rules.
- Performance and timeout limits.

## Required Outputs

- Export configuration with deterministic formatting and scope.
- Data inclusion/exclusion rules mapped to roles.
- Error handling and retry guidance for heavy exports.
- Print style contract and pagination strategy.
- Validation checklist for cross-browser export behavior.

## Core Patterns

### Grid Excel Export

```javascript
$("#orders").kendoGrid({
    toolbar: ["excel"],
    excel: {
        fileName: "orders-export.xlsx",
        allPages: false,
        filterable: true
    }
});
```

### Grid PDF Export

```javascript
pdf: {
    fileName: "orders-report.pdf",
    allPages: true,
    landscape: true,
    repeatHeaders: true,
    paperSize: "A4"
}
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
