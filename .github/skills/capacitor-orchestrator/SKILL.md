---
name: capacitor-orchestrator
description: Use when one CapacitorJS request spans multiple capability areas — setup, web integration, native APIs, plugin authoring, auth/session, offline resilience, observability, security, testing, CI integration, performance gates, migration upgrades, live updates, accessibility, deep linking, environment config, push notifications, privacy compliance, or release readiness — and needs one deterministic intake, explicit phase ownership, and a unified execution contract.
---

# Capacitor Orchestrator

## Specialization

Coordinate multi-surface CapacitorJS work from one intake when the request spans project setup, web framework integration, native API usage, custom plugin authoring, auth/session, offline resilience, observability, security hardening, testing, CI integration, migration upgrades, performance gating, or release readiness.

This skill provides intake, phase ownership, and unified synthesis. It is not a replacement for deep execution guidance inside any single Capacitor discipline — each specialist skill provides that depth.

## Objective

Produce one deterministic CapacitorJS execution contract from a single intake with explicit phase ownership, evidence expectations, and completion checks — eliminating disconnected, ad-hoc Capacitor work.

## Scope Boundaries

In scope:

- Deterministic Capacitor intake and phased execution planning.
- Phase-output ownership with exactly one owner per required output.
- Unified execution recommendation for mixed Capacitor design and delivery work.
- Routing to the correct specialist skill for each phase.

Out of scope:

- Deep execution of any one specialized phase (delegate to specialist skills).
- Non-Capacitor product areas unless they materially constrain the Capacitor slice.
- Generic project governance unrelated to the Capacitor objective.

## Trigger Conditions

- A Capacitor request spans more than one capability area.
- A new Capacitor project is being bootstrapped from scratch.
- A team wants one Capacitor intake instead of disconnected setup, integration, and native API work.
- A Capacitor app is being prepared for production and needs coordinated security, testing, and release hardening.
- A cross-project compendium consumer needs to understand which Capacitor skills apply to their situation.

## Inputs

- User objective and target Capacitor surface (new project, feature addition, production hardening, or release).
- Web framework in use (React, Vue, Angular, SvelteKit).
- Target platforms: iOS, Android, or both.
- Required capabilities (e.g., camera, push notifications, custom plugin, offline storage).
- Risk level: low (internal tool), medium (consumer app), high (regulated/PII).
- Required outputs and known evidence.
- Evaluation date in ISO format (`YYYY-MM-DD`).

## Required Outputs

- Intake contract: objective, scope boundaries, platforms, risk level, and required outputs.
- Phase-output ownership matrix.
- Unified Capacitor execution recommendation.
- Rejected-candidate table with deterministic reason codes.
- Closure check: all required outputs are owned.

## Deterministic Workflow

1. Lock the objective, web framework, target platforms, required capabilities, risk level, and required outputs.
2. Classify the request into one or more phases using the Request Shape → Phase Mapping table.
3. Assign exactly one owner per required output using the Phase-Output Ownership Matrix below.
4. Reject any phase plan with unowned or multiply owned outputs.
5. Define evidence expectations and handoff criteria between phases.
6. Select the unified execution path: sequential phased execution, parallel phases, or stop pending blockers.
7. Produce the intake contract with all phase assignments.
8. Publish closure status with residual risks and open blockers.

## Unified Decision Rules

- **Sequential execution** when each phase produces required inputs for the next (e.g., setup → integration → native APIs → release).
- **Parallel execution** when phases are independent (e.g., security hardening and testing can run simultaneously once setup is complete).
- **Stop pending blockers** when a required input is missing (e.g., no provisioning profile means release readiness cannot complete).

## Done Criteria

- Intake contract is documented with objective, risk level, and platform scope.
- Every required output has exactly one owning skill.
- Evidence expectations are defined for each phase.
- Execution path (sequential, parallel, or blocked) is selected and documented.
- Residual risks are explicit, prioritized, and owner-assigned.

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

## Routing References

- Specialist routing matrices and ownership templates live in [Reference assets](./references/README.md).
- Keep this skill focused on intake, phase ownership, and deterministic execution selection.
