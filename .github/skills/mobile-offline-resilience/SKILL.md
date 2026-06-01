---
name: mobile-offline-resilience
description: Use when a MAUI mobile change affects network-dependent flows and you need deterministic offline, retry, sync-conflict, and recovery evidence before sign-off.
---

# Mobile Offline Resilience

## Specialization

Use this skill to produce expert-level, agent-usable offline and resilience outcomes for MAUI mobile experiences.

This skill is specialized for degraded-network, local-state, retry, sync-conflict, and recovery behavior from the user perspective. It does not replace deeper infrastructure reliability engineering.

## Objective

Protect task continuity under degraded conditions by validating offline behavior, retry models, stale-data handling, lifecycle interruption, and recovery UX with deterministic evidence.

## Trigger Conditions

- A release affects network-dependent workflows or offline-capable mobile surfaces.
- Teams need objective resilience evidence before sign-off.
- Product scope includes intermittent connectivity, retries, caching, queueing, or sync behavior.
- Mobile lifecycle events such as suspend, resume, or background interruption may affect task continuity.

## Scope Boundaries

In scope:

- Offline indicators, degraded-network behavior, retry paths, sync conflict handling, stale data signaling, and recovery messaging.
- Lifecycle interruption and resume continuity where it affects task completion.
- User confidence and continuity during disruption.

Out of scope:

- Infrastructure resilience engineering without mobile UX implications.
- Backend retry logic with no user-visible consequence.

## Inputs

- In-scope journeys and network-dependency assumptions.
- Offline behavior expectations and retry policy.
- Local persistence, cache, queue, and conflict scenarios.
- Evaluation date in ISO format (`YYYY-MM-DD`) for source freshness checks.

## Required Outputs

- Offline and resilience findings with severity and user-impact rationale.
- Resilience evidence matrix for disruption, retry, resume, and recovery paths.
- Prioritized remediation backlog for task-continuity blockers.
- Final recommendation: `go`, `go-with-exceptions`, or `no-go`.

## Deterministic Workflow

1. Lock in-scope disruption, cache, retry, and recovery scenarios.
2. Define pass or fail checks for offline signaling, retry quality, stale-data clarity, and conflict resolution.
3. Validate degraded-state behavior during loss of connectivity, high latency, and app interruption or resume.
4. Verify task context is preserved across retries, resume, and recoverable failures.
5. Classify findings by severity and continuity risk.
6. Assign remediation disposition with owner and due date.
7. Re-check high and critical issues after remediation.
8. Publish evidence artifacts and final recommendation.

## Offline Resilience Gate Checklist

- [ ] Users are informed when the app is offline or degraded.
- [ ] Retry behavior is explicit and preserves task context.
- [ ] Stale data and sync conflicts are understandable and recoverable.
- [ ] Critical user work is protected from silent loss where possible.
- [ ] Resume after interruption preserves task continuity or clearly signals recovery.
- [ ] High and critical issues are resolved or deferred with owner and due date.

## Severity Model

- Critical: users lose critical work or cannot recover essential tasks under disruption.
- High: degraded conditions materially block task continuity.
- Medium: resilience behavior is recoverable but confusing or inefficient.
- Low: minor resilience UX improvements.

## Evidence Contract

- `.docs/changes/<workstream-id>/mobile-offline-resilience-findings.md`
- `.docs/changes/<workstream-id>/mobile-offline-resilience-matrix.md`
- `.docs/changes/<workstream-id>/mobile-offline-remediation-backlog.md`
- `.docs/changes/<workstream-id>/mobile-offline-release-recommendation.md`

## Done Criteria

- Required outputs are complete and linked.
- Source catalog is current.
- Final recommendation is explicit and evidence-backed.

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
