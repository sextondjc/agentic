---
name: capacitor-offline-resilience
description: Use when CapacitorJS features must remain reliable through network loss, retries, sync recovery, and conflict handling with deterministic offline-first behavior and evidence.
---

# Capacitor Offline Resilience

## Specialization

Design and verify offline-first behavior for CapacitorJS apps so users can continue critical workflows during connection loss and recover without data corruption.

## Trigger Conditions

- A feature depends on network availability and needs offline continuity.
- Users report data loss or duplicate writes after reconnect.
- Sync conflicts occur across device and backend state.

## Inputs

- Network-dependent feature boundaries.
- Local persistence approach and sync model.
- Conflict policy (client wins, server wins, merge).
- Retry/backoff expectations and SLA constraints.

## Required Outputs

- Offline behavior contract per critical journey.
- Retry, queueing, and reconciliation strategy.
- Conflict-resolution policy with user-visible UX rules.
- Recovery test matrix and findings.

## Deterministic Workflow

1. Classify operations as offline-safe, deferred-sync, or online-required.
2. Define local write queue with idempotency keys.
3. Implement retry with bounded exponential backoff.
4. Define conflict detection and resolution behavior.
5. Validate interruption scenarios: airplane mode, flaky network, reconnect storms.
6. Publish resilience findings and unresolved risks.

## Recovery Rules

- Never discard unsynced user intent silently.
- Use idempotency keys for retried mutations.
- Distinguish transient vs permanent failures.
- Surface stale data status and sync state in UI.

## Quality Gates

- Critical journeys remain usable offline where required.
- Reconnect does not duplicate writes or corrupt state.
- Conflict outcomes are deterministic and user-comprehensible.
- Recovery behavior is validated with repeatable scenario tests.

## Done Criteria

- Offline contract is documented for all in-scope journeys.
- Queue, retry, and conflict handling pass resilience tests.
- Residual data integrity risks are explicit and owner-assigned.

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
