---
name: web-ux-usability
description: Use when implementing or reviewing web UX usability outcomes with deterministic task-based evidence, severity-ranked findings, and release-ready go or no-go recommendations.
---

# Web UX Usability

## Specialization

Use this skill to execute expert-level, agent-usable usability validation for web experiences using measurable task outcomes and evidence-backed decisions.

This skill is bounded to usability evidence for web surfaces. It does not cover broad visual redesign, backend implementation, or native mobile usability execution.

## Objective

Produce usability-complete decisions for web flows by converting task observations into deterministic findings, remediation priorities, and release recommendations.

## Trigger Conditions

- A web flow or component requires usability validation before merge or release.
- Team needs objective task-completion evidence and severity-ranked usability findings.
- UX handoff quality must be validated against measurable success criteria.
- Product owners require explicit go, go-with-exceptions, or no-go disposition.

## Scope Boundaries

In scope:

- Task-based validation across desktop, tablet, and mobile web breakpoints.
- Measurement of completion, time on task, error and recovery, and step drop-off.
- Severity-ranked findings, remediation disposition, and durable evidence artifacts.

Out of scope:

- Accessibility compliance certification.
- Visual rebranding and style exploration without task evidence.
- Backend behavior changes outside UX impact analysis.

## Inputs

- Target user journeys and top tasks.
- Intended behavior and acceptance cues from UX handoff.
- Test context: moderated or unmoderated, participant profile, environment.
- Measurement threshold policy.
- Evaluation date in ISO format (`YYYY-MM-DD`) for source freshness checks.

## Required Outputs

- Usability findings report with severity tags and explicit disposition for each finding.
- Task evidence matrix with completion rate, time on task, error rate, recovery rate, and step drop-off.
- Prioritized remediation backlog mapped to user impact.
- Residual risk summary with owner and follow-up window.
- Final recommendation: `go`, `go-with-exceptions`, or `no-go`.

## Deterministic Workflow

1. Lock scope: flows, tasks, environments, and participant assumptions.
2. Define measurable success criteria for each task before observation begins.
3. Build the task script with neutral prompts, start and stop rules, and bail-out criteria.
4. Execute sessions or replay evidence and capture structured observations.
5. Compute task metrics: completion, time on task, error count, recovery success, and step drop-off.
6. Classify findings by severity and map each to user-impact rationale.
7. Assign remediation disposition: fix-now, fix-next, defer-with-owner, or reject-with-rationale.
8. Re-validate high-impact tasks after remediation and update residual risk.
9. Produce recommendation: `go`, `go-with-exceptions`, or `no-go` with explicit rationale.
10. Publish durable evidence artifact paths and closure status.

## Usability Gate Checklist

- [ ] Each in-scope task has explicit success criteria and measured outcomes.
- [ ] Completion rate and error profile are recorded for all primary tasks.
- [ ] Critical and high findings are remediated or explicitly deferred with owner and due date.
- [ ] Recovery behavior is validated for at least one error path per key journey.
- [ ] Residual risk is explicit and tied to release recommendation.

## Severity Model

- Critical: users cannot complete a core task or are likely to abandon the flow.
- High: users can complete tasks only with substantial friction or repeated errors.
- Medium: measurable inefficiency or confusion with workable path to completion.
- Low: cosmetic or minor friction with low outcome impact.

## Evidence Contract

Capture artifacts under one change scope path:

- `.docs/changes/<workstream-id>/usability-findings.md`
- `.docs/changes/<workstream-id>/task-evidence-matrix.md`
- `.docs/changes/<workstream-id>/remediation-backlog.md`
- `.docs/changes/<workstream-id>/release-recommendation.md`

## Anti-Patterns

- Making go or no-go decisions without task-level evidence.
- Treating anecdotal feedback as severity-ranked findings without measurement.
- Deferring high-risk findings without owner or follow-up date.
- Expanding scope mid-run without resetting measurable criteria.

## Done Criteria

- Trigger conditions are met for the request.
- Required outputs are complete and linked to durable evidence artifacts.
- L4 coverage matrix remains complete and current.
- Source ledger is current for this evaluation cycle.
- Final recommendation is explicit, evidence-backed, and auditable.

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
