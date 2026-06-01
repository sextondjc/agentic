---
name: opportunity-mapping
description: Use when turning desired outcomes into opportunity maps, solution hypotheses, and assumption-test plans that agents and teams can execute without discovery ambiguity.
---

# Opportunity Mapping

## Specialization

Convert a desired business or user outcome into a structured opportunity map, a bounded solution-hypothesis set, and an assumption-test plan.

This skill is the discovery-side entry point for agent-usable delivery work. It makes the reasoning chain explicit: outcome -> opportunities -> solution options -> tests -> decision. It does not approve roadmap priority or execute implementation.

## Objective

Produce a durable discovery artifact set that reduces flat feature-backlog thinking and gives downstream planning work a traceable problem structure.

## Trigger Conditions

- A team has goals, ideas, or requested features but no structured opportunity map.
- Discovery inputs exist, but the problem tree and test plan are still implicit.
- Solution debates are recurring because assumptions and rejection logic were never written down.
- An agent needs a bounded discovery artifact before backlog or implementation planning can start.

## Scope Boundaries

In scope:

- Outcome framing.
- Opportunity decomposition.
- Solution-hypothesis enumeration.
- Assumption and evidence mapping.
- Test design for the highest-risk assumptions.

Out of scope:

- Implementation planning.
- Detailed delivery slicing.
- Tool-specific backlog administration.
- Go-live approval.

## Inputs

- Outcome statement or business objective.
- Source evidence: research notes, support patterns, analytics, stakeholder requests, or incident learnings.
- Known constraints: time, compliance, technical feasibility, dependency boundaries.
- Decision horizon: near-term, release-bound, or exploratory.
- Evaluation date in ISO format (`YYYY-MM-DD`) for source freshness checks.

## Required Outputs

- Outcome framing record with success signal, boundary, and non-goals.
- Opportunity map showing primary outcome, opportunity branches, and evidence confidence.
- Solution-hypothesis register with rationale and rejection notes.
- Assumption-test matrix listing hypothesis, evidence gap, test method, owner, and stop condition.
- Decision log naming promoted, deferred, and rejected solution paths.

## Deterministic Workflow

1. Lock the outcome statement: define success measure, time horizon, and non-goals.
2. Gather evidence inputs and classify each by source type, freshness, and confidence.
3. Build the opportunity branches beneath the outcome. Each branch must describe a user or system problem, not a preselected feature.
4. Score each opportunity for impact, confidence, and urgency.
5. Generate bounded solution hypotheses per opportunity. Do not allow unlimited ideation.
6. Record assumptions that must be true for each solution hypothesis to succeed.
7. Design the smallest useful test for each high-risk assumption: experiment, interview, prototype, metric review, or technical spike.
8. Promote, defer, or reject each solution path. Record rationale and unresolved risks.
9. Publish the final artifact set so downstream planning can consume the map without reopening discovery from scratch.

## Artifact Contract

| Artifact | Minimum Fields |
|---|---|
| Outcome framing record | Outcome, success signal, deadline or review window, non-goals, constraints |
| Opportunity map | Opportunity ID, description, evidence basis, confidence, parent outcome |
| Solution-hypothesis register | Hypothesis ID, target opportunity, expected result, main assumption, status |
| Assumption-test matrix | Assumption ID, related hypothesis, test method, owner, pass signal, stop rule |
| Decision log | Item ID, disposition, rationale, next trigger |

## Decision Rules

- If an opportunity cannot be tied to evidence, mark it low confidence and do not treat it as committed scope.
- If a solution hypothesis has no falsifiable assumption, it is too vague to promote.
- If multiple hypotheses target the same opportunity, rank by learning value first, implementation effort second.
- If no test can be defined within the decision horizon, record the item as deferred rather than pretending it is ready.

## Anti-Patterns

- Writing feature ideas directly under the outcome without opportunity decomposition.
- Treating stakeholder preference as evidence.
- Promoting every hypothesis instead of forcing explicit rejection or deferral.
- Running broad discovery with no stop rule.

## Done Criteria

- All required outputs exist.
- Opportunity branches are problem-based, not feature-labeled.
- High-risk hypotheses have explicit tests or explicit deferral.
- Decision log records promoted, deferred, and rejected paths.
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
