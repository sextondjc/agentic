---
name: xunit-source-curation
description: Use when xUnit guidance must be grounded in authoritative, current sources and converted into reusable, agent-usable testing guidance.
---

# xUnit Source Curation

## Specialization

Use this skill to curate xUnit testing references for deterministic test-design policy, runner behavior, fixture lifecycle patterns, and v2/v3 migration readiness.

This skill curates testing-governance sources only. It does not author production tests.

## Objective

Produce an xUnit evidence baseline that supports stable guidance for Facts/Theories, fixtures, async assertions, traits, and cross-runner consistency.

## Trigger Conditions

- xUnit guidance is needed for test authoring standards, runner behavior, or fixture lifecycle decisions.
- A test-quality gate needs refreshed references for Theory data stability, async/cancellation testing, or Moq collaboration boundaries.
- xUnit v2/v3 compatibility questions require source-backed migration position.
- CI test-selection or trait taxonomy guidance needs authoritative grounding.

## Scope Boundaries

In scope:

- Source selection, authority checks, and freshness checks for xUnit-related materials.
- Mapping source content into actionable xUnit guidance deltas.
- Rejected-source recording with explicit reason codes.
- Version-position capture for xUnit v2/v3 and runner compatibility constraints.

Out of scope:

- Direct implementation of test code.
- Non-testing content curation.
- Framework migration execution.

## Inputs

- Target xUnit topics and expected output artifacts.
- Evaluation date in ISO format (`YYYY-MM-DD`).
- Freshness threshold in days (default: 30).
- Existing source inventory if available.

## Required Outputs

- Updated source catalog with authority, freshness, relevance, and actionability fields.
- xUnit topic-to-source coverage matrix.
- Rejected-source table with deterministic reason codes.
- Prioritized xUnit guidance deltas grouped by: design patterns, fixture lifecycle, async behavior, runner/CI, and migration readiness.
- Runner and version compatibility notes for IDE/CLI/CI execution contexts.

## Deterministic Workflow

1. Enumerate target xUnit topics that must be covered.
2. Collect candidate sources from first-party xUnit and Microsoft documentation.
3. Score each source for authority, freshness, relevance, and actionability.
4. Reject weak sources and record reason codes.
5. Build an xUnit topic-to-source coverage matrix to expose gaps.
6. Produce prioritized xUnit deltas by testing dimension (design, fixture, async, runner, migration).
7. Publish closure status, unresolved gaps, and runner/version compatibility notes.

## Source Decision Rules

- `accept`: authoritative source, freshness within threshold, and directly actionable.
- `accept-with-watch`: authoritative and relevant but partial, stale, or pending update.
- `reject`: not authoritative, too stale, redundant, or non-actionable.

## Rejected Source Reasons

- `R1`: Not authoritative for xUnit behavior.
- `R2`: Older than freshness threshold without durable applicability.
- `R3`: Redundant with no new actionable guidance.
- `R4`: Opinion-heavy with low implementation specificity.
- `R5`: Outside xUnit testing scope.

## Done Criteria

- Trigger conditions are satisfied.
- Required outputs are complete.
- Source decision outcomes are explicit.
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
