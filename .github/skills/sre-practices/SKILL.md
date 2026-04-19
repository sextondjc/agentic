---
name: sre-practices
description: Use when defining SLOs, designing error budget policy, planning reliability engineering, or structuring chaos and toil-reduction work for a system or service.
---

# SRE Practices

## Specialization

Define Service Level Objectives, design error budget policy, structure reliability engineering work, and plan toil-reduction initiatives. Produces artefacts that make reliability targets explicit, measurable, and actionable for both engineering and operations teams.

This skill is distinct from incident response and triage (`support-triage`), runbook authoring (`support-runbook-generator`), and generic operability design (`operability-design`). Those skills handle incident handling and day-to-day operational readiness. SRE Practices handles the reliability engineering layer: how reliability targets are defined, how budget is allocated, and how the system is engineered to meet those targets.

## Trigger Conditions

- A service has no defined SLOs or its existing SLOs are informal or unmeasured.
- An error budget policy does not exist or is not being enforced.
- Toil is accumulating in operations and must be inventoried and reduced systematically.
- A release or architecture change may impact reliability targets and the impact must be assessed before promotion.
- Chaos experiments or reliability regression tests must be designed before execution.
- A production incident has revealed that reliability engineering was not part of the original design.

## Inputs

- Service description: what the service does, its user base, and its business criticality.
- Existing SLAs or informal reliability expectations (if any).
- Observability signals available: metrics, logs, traces, and their current tooling.
- Incident history (if available): recent incidents, their severity, duration, and frequency.
- Toil inventory (if available): known manual, repetitive, automatable work.
- Originating plan or workstream ID for traceability.

## Required Outputs

| Output | Description |
|---|---|
| SLO definitions | Named SLOs per critical user journey or service capability: metric, target threshold, measurement window, and rationale. |
| Error budget policy | How error budget is calculated, how it is tracked, and what actions are triggered when budget is consumed (slow down, feature freeze, reliability sprint). |
| Reliability risk register | Known reliability risks: probability, impact, current mitigation, and residual risk. |
| Toil inventory and reduction plan | Enumerated toil items with effort estimate, automation potential, and reduction priority. |
| Chaos experiment designs | For each critical failure mode: hypothesis, success criteria, scope boundary, time-box, and rollback criteria. Approved before execution begins. |
| SRE gate checklist | Conditions that must be met before a release is approved from an SRE perspective: SLO budget status, toil impact, and reliability regression check. |

## Workflow

1. Identify critical user journeys and service capabilities that require SLO coverage.
2. Define SLOs: for each journey or capability, define the metric, target, measurement window, and rationale. Prefer user-visible metrics (latency, availability, error rate) over internal metrics.
3. Design the error budget policy: calculate the budget for each SLO, define tracking cadence, and define the action triggers for budget consumption.
4. Build the reliability risk register: identify failure modes, estimate probability and impact, document current mitigations, and record residual risk.
5. Inventory toil: enumerate manual, repetitive, automatable work. Score by effort and automation potential. Prioritise reduction candidates.
6. Design chaos experiments for the highest-risk failure modes. For each experiment, define inline: (a) hypothesis — the failure condition being tested; (b) success criteria — what a passing outcome looks like; (c) scope boundary — which systems and environments are in scope; (d) time-box — maximum duration; (e) rollback criteria — conditions that trigger immediate abort and recovery steps. Document and approve each experiment design before execution begins.
7. Produce the SRE gate checklist for release readiness integration.
8. Record the originating plan or workstream ID on all outputs.

## SLO Definition Guidance

- SLOs must be measurable from existing signals or require explicit new instrumentation (which must be added before the SLO is live).
- SLO targets should be set based on actual user impact thresholds, not aspirational targets.
- Avoid SLO proliferation: prefer 3–5 high-signal SLOs over 20 low-signal SLOs.
- SLO targets must be achievable — an SLO that is never met destroys team credibility.
- Do not conflate SLOs with SLAs — SLOs are internal reliability targets; SLAs are contractual obligations. Design SLOs with headroom above SLAs.

## Done Criteria

- SLO definitions cover all identified critical user journeys with metric, target, and measurement window.
- Error budget policy defines tracking cadence and action triggers.
- Reliability risk register covers all identified failure modes.
- Toil inventory exists with at least one prioritised reduction candidate.
- Chaos experiment designs exist for the top two reliability risks.
- SRE gate checklist is present and references SLO budget and toil impact.
- Originating plan or workstream ID is on the output.

## Guardrails

- Do not define SLOs without measurement signals — if the metric cannot be measured, the SLO cannot be managed.
- Do not set SLO targets above current performance without a defined improvement plan.
- Do not run chaos experiments in production without an `experiment-design` output defining scope, time-box, and rollback criteria.

## References
