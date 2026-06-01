---
name: acceptance-criteria
description: Use when turning backlog items or delivery slices into testable acceptance criteria, scenario boundaries, and done gates that agents can validate without guessing intent.
---

# Acceptance Criteria

## Specialization

Convert backlog items, slices, or feature requests into explicit acceptance criteria and completion gates.

This skill is the boundary between planning intent and executable verification. It removes ambiguity that would otherwise force agents or engineers to infer what done means.

## Objective

Produce testable, outcome-oriented acceptance artifacts that can be used for planning, implementation, QA, and sign-off without rewriting the requirement each time.

## Trigger Conditions

- A work item exists, but completion conditions are vague or implied.
- Teams are debating whether an item is done after implementation starts.
- Stories or slices have user intent but no testable confirmation.
- An agent needs binary validation rules before it can plan or execute safely.

## Scope Boundaries

In scope:

- Acceptance criteria authoring.
- Scenario boundary definition.
- Negative and edge-condition capture.
- Done-gate design.
- Ambiguity detection.

Out of scope:

- Full test-suite implementation.
- Backlog hierarchy design.
- Workflow metrics and WIP policy.
- Release approval sign-off.

## Inputs

- Source work item: story, slice, request, or change statement.
- User outcome and non-goals.
- Known dependencies, constraints, or compliance requirements.
- Existing examples or prototypes when available.
- Evaluation date in ISO format (`YYYY-MM-DD`) for source freshness checks.

## Required Outputs

- Acceptance criteria set with numbered, testable statements.
- Scenario matrix covering primary, edge, negative, and recovery cases.
- Done gate summarizing mandatory pass conditions.
- Ambiguity log recording unresolved questions or deferred clarifications.
- Traceability note linking each criterion back to the source work item or outcome.

## Deterministic Workflow

1. Normalize the source item into one clear outcome statement.
2. Separate mandatory outcomes from optional enhancements and non-goals.
3. Write acceptance criteria as observable behaviors or states, not implementation instructions.
4. Expand the scenario matrix: primary path, edge conditions, negative cases, and recovery behavior.
5. Define the done gate: the minimum set of criteria that must pass before the item can close.
6. Record ambiguities that cannot be resolved from the input. Do not hide them inside vague criteria.
7. Run a clarity check: each criterion must be testable, singular, and traceable.
8. Publish the acceptance pack alongside the source work item.

## Criteria Rules

- One criterion should express one observable outcome.
- If a criterion includes multiple independent outcomes, split it.
- Avoid implementation-specific language unless it is itself the required behavior.
- If a criterion cannot be verified by observation, measurement, or state inspection, rewrite it.

## Artifact Contract

| Artifact | Minimum Fields |
|---|---|
| Acceptance criteria set | Criterion ID, statement, priority, traceability link |
| Scenario matrix | Scenario ID, type, precondition, expected outcome |
| Done gate | Mandatory criteria IDs, blocking conditions, owner |
| Ambiguity log | Question, impact, decision owner, next trigger |

## Decision Rules

- If a source item cannot support testable criteria, it is not ready for execution.
- If a criterion depends on a future clarification, move it to the ambiguity log rather than pretending it is settled.
- If edge or negative behavior matters operationally, it must be in the scenario matrix even if it is not in the title of the work item.
- If done cannot be expressed as a small gate, the item is probably too large.

## Anti-Patterns

- Writing criteria that restate the title without adding verification value.
- Smuggling implementation details into every criterion.
- Ignoring negative and recovery behavior.
- Closing items with unresolved ambiguities and no owner.

## Done Criteria

- All required outputs exist.
- Criteria are numbered, testable, and traceable.
- Done gate is explicit.
- Ambiguity log exists when unresolved questions remain.
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
