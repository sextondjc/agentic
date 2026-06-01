---
name: sql-server-orchestrator
description: Use when one SQL Server request spans multiple capability areas and needs deterministic intake, phased ownership, and a unified cross-project execution contract.
---

# SQL Server Orchestrator

## Specialization

Use this skill to coordinate multi-surface SQL Server work from one intake when the request spans standards, diagnostics, tuning, security, and operations.

This skill is specialized for intake, phase ownership, and unified synthesis. It is not a replacement for deeper single-objective execution guidance.

## Objective

Produce one deterministic SQL Server execution contract from a single intake, with explicit phase ownership, evidence expectations, and completion checks.

## Trigger Conditions

- A SQL Server request spans more than one capability area.
- Teams want one SQL Server intake instead of separate disconnected workflows.
- Cross-project reuse matters more than one-off local optimization.
- A change or investigation needs explicit ownership across diagnostics, standards, security, tuning, or operations.

## Scope Boundaries

In scope:

- Deterministic SQL Server intake and phased execution planning.
- Phase-output ownership with exactly one owner per required output.
- Unified recommendation or execution contract for multi-surface SQL Server work.

Out of scope:

- Deep execution of any one specialized phase.
- Non-SQL domains unless they materially constrain the SQL work.
- Generic project governance unrelated to the SQL Server slice.

## Inputs

- User objective and target SQL Server surface.
- Scope boundaries, environments, and risk level.
- Required outputs, known evidence, and time sensitivity.
- Evaluation date in ISO format (`YYYY-MM-DD`) for source freshness checks.

## Required Outputs

- Intake contract with objective, boundaries, and required outputs.
- Phase-output ownership matrix.
- Unified SQL Server execution recommendation.
- Rejected-candidate table with deterministic reason codes.
- Closure check stating whether all required outputs are owned.

## Capability Catalog

Use one or more phases based on request shape:

- Standards and Compatibility
- Diagnostics and Evidence
- Query Tuning and Plan Review
- Security and Least Privilege
- Operations and Automation
- Recovery and Rollback

## Deterministic Workflow

1. Lock the SQL Server objective, risk boundary, and required outputs.
2. Classify the request into one or more capability phases from the catalog.
3. Assign exactly one owner per required output.
4. Reject any phase plan with unowned or multiply owned outputs.
5. Define evidence expectations and handoff criteria between phases.
6. Produce one unified execution recommendation: narrow execution, phased execution, or stop pending blockers.
7. Publish closure status with residual risks and unresolved blockers.

## Phase-Output Ownership Matrix Template

| Required Output | Owning Phase | Evidence Expectation |
|---|---|---|
| SQL safety and compatibility decision | Standards and Compatibility | Parameterization, naming, version, and risk notes |
| Symptom classification and ranked findings | Diagnostics and Evidence | Waits, plans, Query Store, XE, or DMV evidence |
| Performance recommendation | Query Tuning and Plan Review | Baseline, chosen change, and regression notes |
| Security posture or hardening decision | Security and Least Privilege | Principal inventory, control summary, and residual risks |
| Operational rollout or automation path | Operations and Automation | Prerequisites, evidence outputs, and rollback notes |
| Recovery path or safety fallback | Recovery and Rollback | Backup, restore, failback, or validation expectations |

## Unified Decision Rules

- `narrow-execution`: one phase owns the meaningful work and adjacent phases are only informational.
- `phased-execution`: two or more phases are required and ownership is unambiguous.
- `stop-pending-blockers`: required outputs are unowned, evidence is materially missing, or risk cannot be bounded.

## Rejected Candidate Reasons

- `R1`: Outside the SQL Server slice.
- `R2`: Adds overlap without adding required output coverage.
- `R3`: Expands scope beyond the bounded objective.
- `R4`: Requires evidence or privileges that are not currently available.
- `R5`: Better handled by a narrower single-phase workflow.

## Reference Assets

- Use [sql-server-execution-contract-template.md](./references/sql-server-execution-contract-template.md) when one SQL request needs a single intake, explicit phase ownership, and a unified execution mode.

## Done Criteria

- Trigger conditions are satisfied.
- Required outputs are complete.
- Ownership matrix has no unowned or multiply owned outputs.
- Decision mode is explicit.
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
