---
name: sql-server-diagnostics
description: Use when diagnosing SQL Server health, bottlenecks, or regressions with evidence from waits, I/O, memory, tempdb, Query Store, Extended Events, and diagnostic query sets.
---

# SQL Server Diagnostics

## Specialization

Use this skill to triage and explain SQL Server performance or stability symptoms with evidence-first diagnostics across waits, I/O, memory, tempdb, blocking, Query Store, and Extended Events.

This skill is for diagnostic classification and evidence gathering, not direct code implementation or security-hardening design.

## Objective

Convert vague SQL Server symptoms into one bounded problem statement, a ranked evidence set, and a recommended next action path.

## Trigger Conditions

- A SQL Server instance, database, or workload is slow, unstable, or intermittently failing.
- Teams need a structured health-check or triage workflow.
- Waits, blocking, memory pressure, I/O latency, tempdb pressure, or plan regressions need classification.
- Diagnostic scripts, XE sessions, or DBA tool outputs need interpretation.

## Scope Boundaries

In scope:

- Wait stats, blocking chains, tempdb pressure, memory pressure, CPU pressure, I/O latency, Query Store, and XE evidence.
- Ranked symptom classification and next-action guidance.
- Short evidence-backed escalation decision.

Out of scope:

- Implementing permanent fixes beyond light diagnostic probes.
- Full security review or identity remediation.
- Long-form backup/restore or HA/DR design.
- Tuning a specific query in depth once the bottleneck is already isolated.

## Inputs

- Target instance, database, or workload slice.
- User-visible symptom, time window, and business impact.
- Available evidence: DMV output, Query Store, XE, diagnostic query pack, or admin tool results.
- Environment context: version, edition, HA topology, storage model, and virtualization or cloud details when known.

## Required Outputs

- Ranked diagnostic findings with one dominant current hypothesis.
- Evidence table tying each finding to concrete signals.
- Next action recommendation with smallest useful scope.
- Open unknowns that block higher-confidence diagnosis.
- Determinism check stating whether the issue is sufficiently bounded to hand off.

## Evidence Ladder

Prefer evidence in this order when available:

1. Stable first-party telemetry such as Query Store, DMVs, XE, and error logs.
2. Version-matched diagnostic query packs and platform tooling.
3. Reproducible admin-tool output from trusted utilities.
4. Anecdotal observations only when corroborated by one of the above.

## Deterministic Workflow

1. Lock the incident window, affected surface, and business symptom.
2. Build a symptom map: CPU, waits, I/O, memory, tempdb, blocking, errors, and plan regressions.
3. Collect the strongest available evidence for each plausible bottleneck class.
4. Rank hypotheses and eliminate weak ones quickly.
5. Name one dominant present-state problem and one adjacent watch item.
6. Recommend the next smallest action: deeper query tuning, storage investigation, memory review, concurrency review, or operational remediation.
7. Record open unknowns that still block high-confidence closure.

## Diagnostic Guardrails

- Do not confuse correlation with causation when using waits or transient counters.
- Prefer repeated samples or historical context over one-time spikes.
- Separate engine symptoms from infrastructure symptoms whenever possible.
- Use diagnostic probes that are safe in the target environment.
- Do not widen from one bottleneck class to estate-wide theory without evidence.

## Reference Assets

- Use [diagnostic-evidence-template.md](./references/diagnostic-evidence-template.md) to capture symptom windows, evidence surfaces, ranked hypotheses, and next action ownership.

## Done Criteria

- Trigger conditions are satisfied.
- Required outputs are complete.
- Evidence and next action are explicit.
- Open blockers are documented.
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
