---
name: sql-server-automation
description: Use when automating SQL Server administration, maintenance, migration, backup, restore, configuration, or estate operations with repeatable, rollback-aware workflows.
---

# SQL Server Automation

## Specialization

Use this skill to design or review repeatable SQL Server operational automation for administration, maintenance, migration, backup, restore, inventory, and environment standardization.

This skill is for durable operational workflows, not one-off query tuning or security policy design.

## Objective

Produce one repeatable SQL Server automation path with explicit prerequisites, rollback considerations, and safe execution boundaries.

## Trigger Conditions

- A team needs repeatable SQL Server admin or DBA automation.
- Backup, restore, migration, maintenance, or estate inventory tasks need safe scripting.
- dbatools or equivalent operational tooling is the likely execution surface.
- Cross-project SQL operational workflows need a reusable playbook.

## Scope Boundaries

In scope:

- Backup and restore workflows.
- Configuration standardization and estate inventory.
- Maintenance deployment, migration support, and operator-safe rollout steps.
- Tool selection and safe automation boundaries.

Out of scope:

- Pure application data-access code.
- Deep query-plan tuning.
- Security hardening beyond operational guardrails.
- Full release governance outside the SQL operational slice.

## Inputs

- Target operational objective and environment scope.
- Instance topology, version, and connectivity constraints.
- Required execution surface: T-SQL, PowerShell, dbatools, SQL Agent, or CI runner.
- Failure tolerance, rollback needs, and approval expectations.

## Required Outputs

- One recommended automation path.
- Prerequisite and safety checklist.
- Rollback-aware execution notes.
- Evidence artifacts or output expectations.
- Rejected approaches with deterministic reasons.

## Deterministic Workflow

1. Define the operational objective, blast radius, and allowed execution surface.
2. Prefer the highest-signal reusable tool path that reduces manual steps.
3. Lock prerequisites: connectivity, permissions, storage, scheduling, and maintenance window assumptions.
4. Define the smallest safe automation path that meets the goal.
5. Add evidence expectations: logs, reports, exported metadata, or verification queries.
6. Add rollback or recovery notes for non-trivial state changes.
7. Reject weaker approaches and publish one recommended path.

## Automation Rules

- Prefer repeatable tooling over hand-run GUI procedures for recurring operational tasks.
- Prefer idempotent or validation-first actions where practical.
- Treat backup, restore, migration, and configuration changes as stateful operations with explicit recovery notes.
- Do not hide privileged prerequisites or network dependencies.
- Prefer estate-safe tooling that exposes structured outputs for later evidence or auditing.

## Rejected Candidate Reasons

- `R1`: Too manual for recurring use.
- `R2`: Privilege or connectivity assumptions are hidden.
- `R3`: Lacks rollback or recovery clarity.
- `R4`: Produces weak or non-durable evidence.
- `R5`: Broader or riskier than the stated operational goal requires.

## Reference Assets

- Use [automation-runbook-template.md](./references/automation-runbook-template.md) to define prerequisites, evidence outputs, rollback notes, and operator-safe execution steps.

## Done Criteria

- Trigger conditions are satisfied.
- Required outputs are complete.
- One recommended path is chosen and weaker paths are rejected.
- Safety, evidence, and rollback expectations are explicit.
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
