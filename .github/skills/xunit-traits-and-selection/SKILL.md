---
name: xunit-traits-and-selection
description: Use when xUnit suites need deterministic trait taxonomy, selective execution strategy, and release-scope test slicing across local and CI runs.
---

# xUnit Traits and Selection

## Specialization

Use this skill to define a stable trait taxonomy and selective execution policy for large xUnit suites.

This skill is specialized for test suite segmentation and execution targeting.

## Objective

Produce one deterministic traits-and-selection contract that defines trait taxonomy, filtering strategy, and release-scope execution slices.

## Trigger Conditions

- Test suites are too large for every-run execution.
- Trait usage is inconsistent or ambiguous across projects.
- CI requires deterministic selective runs for faster feedback.

## Scope Boundaries

In scope:

- Trait taxonomy and naming standards.
- Local and CI filter strategy.
- Mandatory slices for PR, nightly, and release gates.
- Trait drift controls and ownership rules.

Out of scope:

- Runtime performance optimization implementation.
- Product-level test case authoring.
- Non-xUnit trait systems.

## Inputs

- Existing trait usage and command filters.
- Pipeline stages and latency targets.
- Risk policy for release-bound behavior.
- Evaluation date in ISO format (`YYYY-MM-DD`) for source freshness checks.

## Required Outputs

- Trait taxonomy specification.
- Selection matrix by pipeline stage.
- Command/filter examples for local and CI usage.
- Drift and governance checks for trait changes.
- Final recommendation with residual risk notes.

## Deterministic Workflow

1. Inventory current trait keys, values, and usage patterns.
2. Define canonical taxonomy and deprecate ambiguous variants.
3. Define execution slices for PR, nightly, and release contexts.
4. Define deterministic filter commands per execution context.
5. Define drift controls, ownership, and exception handling.
6. Publish one recommendation and unresolved classification risks.

## Decision Rules

- One canonical taxonomy per repository; aliases must be transitional and time-bounded.
- Every pipeline stage must map to explicit required trait slices.
- Fail closed when release-critical slices are omitted from release gates.

## Done Criteria

- Trigger conditions are satisfied.
- Required outputs are complete.
- Taxonomy and slice rules are explicit.
- Source catalog is current for this evaluation cycle.

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
