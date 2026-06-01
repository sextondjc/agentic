---
name: web-ux-experimentation-evidence
description: Use when implementing or reviewing web UX experimentation outcomes with deterministic hypothesis checks, guardrail metrics, and evidence-backed decision logging.
---

# Web UX Experimentation Evidence

## Specialization

Use this skill to produce expert-level, agent-usable UX experimentation outcomes for web changes.

## Objective

Improve decision quality by enforcing hypothesis rigor, metric guardrails, and auditable experiment outcomes before rollout decisions.

## Trigger Conditions

- A UX change is evaluated using A/B or multivariate experimentation.
- Teams need deterministic evidence quality before adopting variant results.
- Release decisions depend on experiment outcomes and guardrail constraints.

## Scope Boundaries

In scope:

- Hypothesis quality, metric selection, segmentation, guardrails, and decision logging.
- Experiment-result interpretation with risk-aware recommendation.

Out of scope:

- Runtime experimentation platform implementation.

## Inputs

- Experiment objective and hypothesis.
- Primary and guardrail metrics.
- Segment definitions and test duration assumptions.
- Evaluation date in ISO format (`YYYY-MM-DD`) for source freshness checks.

## Required Outputs

- Experiment quality assessment with severity and confidence rationale.
- Decision log including hypothesis, metric outcomes, and guardrail status.
- Risk disposition for rollout, iteration, or rollback.
- Final recommendation: `adopt`, `iterate`, `reject`, or `extend`.

## Deterministic Workflow

1. Validate hypothesis clarity and falsifiability.
2. Confirm metric plan includes one primary outcome and explicit guardrails.
3. Validate segment and exposure assumptions.
4. Review result quality and check guardrail breaches.
5. Classify evidence strength and decision risk.
6. Record decision disposition with owner and follow-up.
7. Publish auditable artifact set.

## Experiment Gate Checklist

- [ ] Hypothesis is explicit, testable, and outcome-focused.
- [ ] Primary and guardrail metrics are defined before launch.
- [ ] Segment assumptions are documented and justified.
- [ ] Guardrail breaches are resolved or dispositioned with owner.
- [ ] Final decision is evidence-backed and logged.

## Evidence Contract

- `.docs/changes/<workstream-id>/experiment-quality-assessment.md`
- `.docs/changes/<workstream-id>/experiment-decision-log.md`
- `.docs/changes/<workstream-id>/release-recommendation.md`

## Done Criteria

- Required outputs are complete and linked.
- Source ledger is current.
- Final decision is explicit and auditable.

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
