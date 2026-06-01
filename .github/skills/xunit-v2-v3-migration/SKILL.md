---
name: xunit-v2-v3-migration
description: Use when upgrading xUnit test assets from v2 to v3 requires deterministic compatibility checks, migration sequencing, and risk-controlled rollout decisions.
---

# xUnit v2 to v3 Migration

## Specialization

Use this skill to plan and validate risk-controlled migration from xUnit v2 to v3 across repositories.

This skill is specialized for migration planning and compatibility evidence.

## Objective

Produce one deterministic migration contract with compatibility checks, phased rollout sequencing, and explicit go/no-go criteria.

## Trigger Conditions

- Repository still uses xUnit v2 and needs modernization.
- Mixed v2/v3 assumptions cause tooling or runner confusion.
- Teams need cross-project migration consistency and rollback posture.

## Scope Boundaries

In scope:

- Dependency and tooling compatibility mapping.
- Breaking-change risk assessment and sequencing.
- Phased migration and rollback checkpoints.
- Migration evidence and gate criteria.

Out of scope:

- Full code implementation of migration changes.
- Non-xUnit framework migration.
- CI provider infrastructure redesign.

## Inputs

- Current package versions and runner adapters.
- Target runtime and SDK constraints.
- Test suite scale and risk classification.
- Evaluation date in ISO format (`YYYY-MM-DD`) for source freshness checks.

## Required Outputs

- Compatibility and blocker matrix.
- Phased migration sequence with checkpoints.
- Rollback and contingency plan.
- Migration gate criteria and final recommendation.

## Deterministic Workflow

1. Inventory current xUnit packages, adapters, and runner integrations.
2. Build compatibility matrix against target v3 posture.
3. Identify breaking-change risks and categorize by severity.
4. Define phased rollout with measurable checkpoints.
5. Define rollback triggers and owner responsibilities.
6. Publish migration recommendation with unresolved blockers.

## Decision Rules

- No migration phase starts without compatibility evidence for that phase.
- Rollback plan must be executable without in-flight context.
- Fail closed when critical blockers remain unresolved.

## Done Criteria

- Trigger conditions are satisfied.
- Required outputs are complete.
- Migration and rollback decisions are explicit.
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
