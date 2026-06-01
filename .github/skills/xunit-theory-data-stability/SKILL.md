---
name: xunit-theory-data-stability
description: Use when xUnit Theory data must remain deterministic, reproducible, and stable across IDE, local CLI, and CI execution contexts.
---

# xUnit Theory Data Stability

## Specialization

Use this skill to design theory data sources that are deterministic, diagnosable, and stable across platforms and runners.

This skill is specialized for data-driven test stability.

## Objective

Produce one deterministic theory-data contract that defines data identity, ordering posture, generation controls, and reproducibility checks.

## Trigger Conditions

- Theory tests are flaky or inconsistent across environments.
- Data rows are generated dynamically with unstable ordering or identity.
- Test explorers show inconsistent case identities or duplication.

## Scope Boundaries

In scope:

- Theory data source selection and stability checks.
- Data row identity and naming contracts.
- Ordering and reproducibility constraints.
- Randomized or generated data control strategy.

Out of scope:

- Property-based testing framework implementation.
- Integration data environment provisioning.
- Non-xUnit data-driven frameworks.

## Inputs

- Target theory suites and data source types.
- Current instability symptoms and repro notes.
- Data generation and seeding expectations.
- Evaluation date in ISO format (`YYYY-MM-DD`) for source freshness checks.

## Required Outputs

- Theory data contract for source type and identity rules.
- Reproducibility checklist (ordering, seeding, determinism).
- Instability risk table with mitigations.
- Final recommendation with residual risk notes.

## Deterministic Workflow

1. Inventory all theory data sources in scope.
2. Evaluate each source for identity stability and ordering guarantees.
3. Define deterministic naming and row identity expectations.
4. Define randomization or generation controls (seed strategy, bounds, repeatability).
5. Add reproducibility checks for IDE, local CLI, and CI execution.
6. Publish one recommendation and unresolved stability risks.

## Decision Rules

- Prefer static, explicit data when behavior does not require generated variability.
- Generated data must have explicit seed and bounded domain controls.
- Test case identity must be stable across runs and environments.

## Done Criteria

- Trigger conditions are satisfied.
- Required outputs are complete.
- Data stability rules are explicit.
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
