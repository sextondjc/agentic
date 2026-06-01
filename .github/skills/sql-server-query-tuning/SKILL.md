---
name: sql-server-query-tuning
description: Use when diagnosing or improving SQL Server query performance with execution-plan evidence, indexing trade-offs, Query Store signals, and regression-safe validation.
---

# SQL Server Query Tuning

## Specialization

Use this skill to tune slow or regressed SQL Server queries with plan-level evidence, workload context, and the smallest safe change that materially improves performance.

This skill is specialized for query tuning, not broad server-health triage or general SQL standards review.

## Objective

Produce one evidence-backed tuning recommendation, apply the smallest viable change, and prove whether it improved the targeted query or workload slice without introducing uncontrolled regressions.

## Trigger Conditions

- A query, stored procedure, or workload slice is slow, regressed, or unstable.
- Query Store, wait stats, or execution plans indicate a query-level bottleneck.
- Indexing, parameter sensitivity, or cardinality-estimation choices need expert review.
- A team needs a repeatable query-tuning workflow that is safe across projects.

## Scope Boundaries

In scope:

- Query text, stored procedures, views, and indexing decisions tied to the target workload.
- Query Store, estimated/actual plan, memory grant, cardinality, and parameter sensitivity evidence.
- One chosen tuning path with regression-aware validation.

Out of scope:

- Broad estate inventory and server build checks.
- Identity, encryption, and audit hardening.
- Full HA/DR design.
- Generic SQL style guidance when no performance issue exists.

## Inputs

- Target query, procedure, or workload slice.
- Engine version, compatibility level, and database settings.
- Baseline symptoms: duration, CPU, reads, waits, concurrency profile, or user-visible impact.
- Available evidence: Query Store, plans, XE traces, wait data, or reproducible test case.

## Required Outputs

- Bottleneck classification with explicit evidence.
- One recommended tuning path with rejected alternatives.
- Validation plan and success criteria.
- Residual regression risks and rollback path.
- Pragmatic stop decision that states whether the tuning pass is complete.

## Evidence Contract

Collect the strongest available combination of:

- Query text or procedure body.
- Actual execution plan when possible; estimated plan only when actual is unavailable.
- Query Store runtime and plan-history evidence when available.
- Baseline metrics: duration, CPU, reads, writes, memory grant, row counts, and waits.
- Index footprint and write-side trade-offs for every index proposal.

## Deterministic Workflow

1. Lock scope to one target query or tightly bounded workload slice.
2. Establish baseline metrics and the user-visible failure mode.
3. Classify the dominant bottleneck: bad cardinality, poor indexing, parameter sensitivity, excessive memory grant, spills, parallelism friction, or blocking side effect.
4. Build a short option set and reject weak options early.
5. Choose one smallest viable change: query rewrite, index change, stats action, compatibility adjustment, or plan-stability action.
6. Validate improvement against baseline using the same measurement surface.
7. Check regression risk: write amplification, storage growth, plan stability, and adjacent query behavior.
8. Publish one recommendation with evidence, rejected options, and rollback notes.

## Option Selection Rules

- Prefer query and predicate correctness before adding indexes.
- Prefer one targeted index over overlapping index sprawl.
- Treat forced plans and hints as controlled exceptions, not defaults.
- Do not accept superficial gains that materially worsen write cost or plan stability without explicit approval.
- Require selectivity, cardinality, and row-goal reasoning for significant indexing or rewrite recommendations.

## Rejected Candidate Reasons

Use these deterministic reason codes when pruning options:

- `R1`: Fixes the symptom but not the dominant bottleneck.
- `R2`: Adds excessive write or storage cost.
- `R3`: Depends on unstable hints or brittle plan forcing.
- `R4`: Requires scope expansion beyond the agreed slice.
- `R5`: Evidence is too weak to justify the change.

## Reference Assets

- Use [query-tuning-evidence-template.md](./references/query-tuning-evidence-template.md) to capture baseline metrics, chosen change, rejected options, and before/after validation.

## Done Criteria

- Trigger conditions are satisfied.
- Required outputs are complete and evidence-backed.
- One recommendation is chosen and rejected options are recorded.
- Validation and rollback expectations are explicit.
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
