---
name: support-triage
description: Use when an incident, defect report, or support ticket arrives and needs structured intake, severity classification, repro data collection, and routing before investigation begins.
---

# Support Triage

## Specialization

Perform structured intake on an incident, defect, or support ticket. Classify severity, capture the minimal repro data needed for investigation, and route to the appropriate handler with a clear triage summary.

This skill does not perform root-cause analysis or fix implementation — those belong to `defect-debugger` and engineering execution. It ensures that every investigation starts from a complete, well-formed input rather than an ambiguous ticket.

## Trigger Conditions

- An incident, defect report, or support ticket has arrived and the investigation path is unclear.
- A ticket lacks enough information for a handler to begin root-cause analysis.
- Multiple incoming issues need severity classification and routing before engineering can prioritise.
- A support handoff requires structured incident context that can be handed to on-call or engineering teams.
- Post-release early-life monitoring has produced alerts that need triage before escalation.

## Inputs

- Raw incident or ticket: description, observed behaviour, timestamps, and any attachments.
- Environment context: service name, version, environment (production / staging / dev), and affected scope.
- Reporter information: source (user, monitoring alert, automated test, team member), and business impact statement if available.
- Runbooks or previous incident records for similar symptoms (optional but preferred).

## Required Outputs

| Output | Description |
|---|---|
| Triage summary | Structured one-page summary: incident ID, severity, affected scope, initial hypothesis, repro status, and routing decision. |
| Severity classification | Explicit severity: Critical / High / Medium / Low with rationale. Severity must consider both technical impact and business impact. |
| Repro record | Minimal reproduction case: steps, environment, expected vs actual behaviour. If not reproducible, state why and what was attempted. |
| Evidence list | List of artefacts collected: logs, traces, screenshots, error messages, monitoring snapshots. Each item with location reference. |
| Routing decision | Named handler or team, escalation path, and any time constraint (SLA target or agreed-on response window). |

## Workflow

1. Capture the raw incident input and assign a triage ID.
2. Identify the affected service, version, and environment. Confirm scope: is this isolated or systemic?
3. Classify severity using the two-axis model: technical severity (data loss, service outage, degraded, cosmetic) × business impact (revenue, compliance, user-blocking, minor).
4. Attempt or document reproduction: collect the minimal steps to reproduce. If the environment is not available, document what evidence substitutes for repro.
5. Collect available evidence: logs, traces, monitoring snapshots, error messages. Record each with its location reference.
6. Write the triage summary: all fields populated, initial hypothesis if available, repro status, and routing decision.
7. Route to the named handler with the triage summary attached.

## Severity Classification Grid

| Technical Severity | Business Impact: High | Business Impact: Medium | Business Impact: Low |
|---|---|---|---|
| Service outage / data loss | Critical | Critical | High |
| Functional degradation | Critical | High | Medium |
| Partial degradation | High | Medium | Low |
| Cosmetic / non-blocking | Medium | Low | Low |

## Done Criteria

- Triage ID assigned and referenced on all outputs.
- Severity classification recorded with rationale.
- Repro record present: either successful repro steps or a documented failed repro attempt with evidence.
- Evidence list present with location references.
- Routing decision names the handler and includes an escalation path.
- Triage summary covers all required fields.

## Guardrails

- Do not route Critical incidents without confirming an on-call owner is identified.
- Do not close a triage pass as complete if repro status is blank — unknown repro must be explicitly recorded.
- Do not conflate triage with root-cause analysis; stop at routing and hand off the triage summary to the investigator.

## References

- Related skills: `defect-debugger` (investigation), `operability-design` (runbook and monitoring design), `release-readiness` (early-life support activation)
