---
name: scope-change-control
description: Use when active delivery scope is under pressure from adds, swaps, descopes, or exceptions and each change must be evaluated, approved, rejected, or deferred with explicit impact analysis.
---

# Scope Change Control

## Specialization

Govern scope changes during active delivery.

This skill exists for mid-flight change pressure: additions, descopes, swaps, and exception requests. It turns scope-change requests into explicit decisions with impact analysis instead of silent divergence.

## Objective

Produce a scope-change decision record that states the requested change, delivery impact, decision, and compensating action.

## Trigger Conditions

- New work is proposed during active execution.
- A release candidate needs descoping or swapping under pressure.
- Teams are accepting silent additions or exceptions without explicit trade-offs.
- Agents need a deterministic way to handle scope pressure without drifting from plan.

## Scope Boundaries

In scope:

- Change request capture.
- Impact analysis on scope, date, confidence, and dependencies.
- Decision logging.
- Compensating descopes or swaps.
- Re-baseline trigger definition.

Out of scope:

- Initial backlog intake.
- Release gate execution.
- Root-cause defect analysis.
- Full portfolio reprioritization.

## Inputs

- Active workstream, release candidate, or plan context.
- Requested scope change and source.
- Current commitment, timeline, and dependency context.
- Existing acceptance or done assumptions.
- Evaluation date in ISO format (`YYYY-MM-DD`) for source freshness checks.

## Required Outputs

- Scope-change record with request, source, and decision owner.
- Impact analysis covering scope, date, confidence, dependency, and evidence effects.
- Decision: approve, reject, defer, or swap.
- Compensating action note when approval changes the baseline.
- Re-baseline trigger or review checkpoint.

## Deterministic Workflow

1. Record the requested change and the active delivery context it affects.
2. Classify the request as add, descope, swap, or exception.
3. Analyze impact on date, scope confidence, dependencies, and acceptance baseline.
4. Decide whether the change is approved, rejected, deferred, or requires a swap.
5. If approved, record the compensating action needed to protect the commitment.
6. If the baseline materially changes, define the re-baseline trigger and owner.
7. Publish the change record so execution does not drift silently.

## Scope Control Rules

- No approved add without explicit impact and compensating action.
- A swap must name both the incoming and outgoing scope.
- A defer is a decision, not a parking lot.
- If the change invalidates prior acceptance assumptions, the baseline must be updated explicitly.

## Artifact Contract

| Artifact | Minimum Fields |
|---|---|
| Scope-change record | Change ID, type, request, source, owner, decision |
| Impact analysis | Date effect, scope effect, confidence effect, dependency effect |
| Compensating action note | Descope, swap, mitigation, or explicit exception |
| Re-baseline trigger | Trigger event, owner, next checkpoint |

## Anti-Patterns

- Accepting scope additions with no compensating action.
- Treating swaps as invisible bookkeeping.
- Letting active work change without updating its baseline.
- Logging changes without naming an owner.

## Done Criteria

- All required outputs exist.
- Each change request has a clear decision.
- Impact analysis is explicit.
- Re-baseline triggers are recorded when needed.
- Source catalog entries are current for this evaluation cycle.

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
