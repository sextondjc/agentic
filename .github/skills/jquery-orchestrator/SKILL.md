---
name: jquery-orchestrator
description: Use when a jQuery request spans multiple capability areas — source curation, core DOM, events, AJAX, plugins, performance, migration, testing, security, or CI integration — and needs one deterministic intake, explicit phase ownership, and a unified execution contract.
---

# jQuery Orchestrator

## Specialization

Coordinate cross-cutting jQuery requests from one intake when work spans source curation, DOM implementation, event handling, AJAX integration, plugin development, performance optimization, version migration, testing, security review, CI enforcement, and quality gating.

This skill is specialized for intake, phase ownership, and unified synthesis. It does not replace deep execution guidance — it routes to the appropriate specialist jQuery skill for each phase.

## Objective

Produce one deterministic jQuery execution contract from a single intake — with explicit phase ownership, evidence expectations, and closure checks — for any request that spans more than one jQuery capability area.

## Trigger Conditions

- A jQuery request spans more than one capability area (e.g., new feature implementation + security audit + test coverage).
- A project is adopting jQuery for the first time and needs end-to-end implementation guidance.
- An existing jQuery codebase requires a full-cycle review: sources → DOM → events → AJAX → performance → security → gate.
- A jQuery version upgrade spans multiple remediation areas (deprecated API, plugin compatibility, test updates).
- A team needs one intake instead of disconnected implementation, security, and review workflows.
- A major jQuery release requires an impact assessment across all capability areas.

## When Not to Use

- The request is clearly scoped to one capability area — use the specialist skill directly.
- Source-only freshness check (use `jquery-source-curation` directly).
- A single security finding requires remediation (use `jquery-security` directly).
- A single quality gate is needed for a completed feature (use `jquery-quality-gate` directly).

## Scope Boundaries

In scope:

- Deterministic jQuery intake and phased execution planning.
- Phase-output ownership with exactly one owner per required output.
- Unified execution recommendation for mixed jQuery requests.
- Cross-phase dependency mapping (source freshness → core → events/ajax → performance/security → testing → gate).

Out of scope:

- Deep implementation within any one phase.
- Non-jQuery frontend tooling unless it directly gates a jQuery phase.
- Server-side endpoint implementation.
- Framework migration (jQuery → React/Vue) — this skill covers jQuery-to-jQuery-v3 migration only.

## Inputs

- User objective and target jQuery surface (new feature, version upgrade, security audit, full project review).
- jQuery version in use or target version.
- Scope boundaries, browser target matrix, and risk level.
- Required outputs, known constraints, and delivery timeline.
- Evaluation date in ISO format (`YYYY-MM-DD`) for source freshness.

## Required Outputs

- Intake contract with objective, scope boundaries, and required outputs.
- Phase-output ownership matrix.
- Unified jQuery execution recommendation.
- Rejected-phase table with deterministic reason codes.
- Closure check confirming all required outputs are owned.

## Deterministic Workflow

1. Lock objective, risk boundary, jQuery version, and required outputs.
2. Classify the request into one or more capability phases from the catalog above.
3. Assign exactly one owner per required output using the phase assignment table.
4. Map cross-phase dependencies:
   - Source freshness must precede all other phases when version context is uncertain.
   - Core, Events, and AJAX must precede Performance and Security reviews.
   - Migration must precede the Quality Gate if a version upgrade is in scope.
   - Testing must precede the Quality Gate.
5. Identify phases not active and record them in the rejected-phase table with reason codes.
6. Confirm closure: every required output has an owner.
7. Emit the execution contract.

## Done Criteria

- Intake contract exists with objective, boundaries, and required outputs.
- Phase-output ownership matrix has no unowned or multiply owned outputs.
- Deterministic phase order and handoff criteria are explicit.
- Rejected-phase table exists with reason codes for all excluded phases.
- Closure check passes.

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
