---
name: flow-metrics
description: Use when defining workflow states, WIP policy, delivery metrics, and improvement rules so agents and teams can manage flow with explicit signals instead of intuition.
---

# Flow Metrics

## Specialization

Define the delivery-flow operating model: workflow states, WIP limits, service expectations, and measurement rules.

This skill turns work execution into an observable system. It is not for backlog design or release approval; it is for managing flow quality once work is in motion.

## Objective

Produce an explicit workflow and measurement contract that supports daily execution decisions, escalation, and continuous improvement.

## Trigger Conditions

- Work is moving, but bottlenecks and aging items are hard to reason about.
- Teams want Kanban discipline or DORA-style measurement without vague metric theater.
- An agent needs explicit workflow policies before it can report or optimize delivery reliably.
- Throughput, WIP, and lead time are being discussed without stable definitions.

## Scope Boundaries

In scope:

- Workflow state definition.
- Started and finished rules.
- WIP policy.
- Service level expectations.
- Flow and delivery metrics.
- Improvement review cadence.

Out of scope:

- Backlog hierarchy design.
- Acceptance-criteria authoring.
- Release evidence collation.
- Team-structure redesign beyond necessary ownership signals.

## Inputs

- Current workflow or board states.
- Item types and service classes.
- Historical delivery data if available.
- Operational constraints and escalation expectations.
- Evaluation date in ISO format (`YYYY-MM-DD`) for source freshness checks.

## Required Outputs

- Workflow definition including each state, entry rule, and exit rule.
- WIP and service policy table.
- Metrics contract covering flow metrics and delivery outcome metrics.
- Breach and escalation playbook for aging, blocked, or failing work.
- Improvement review template with metric interpretation guardrails.

## Deterministic Workflow

1. Define the workflow states and remove duplicate or ambiguous labels.
2. Set explicit entry and exit rules for each state, including what counts as started and finished.
3. Assign service classes or item types only when they change workflow policy.
4. Set WIP limits and service level expectations that reflect real operating capacity.
5. Define the metrics contract: WIP, throughput, work item age, cycle time, lead time, change failure rate, deployment frequency, and recovery signal where relevant.
6. Add metric guardrails so no single proxy is used as the whole story.
7. Publish the breach playbook for blocked items, aged items, and SLE misses.
8. Run the review cadence with one action-focused improvement decision per cycle.

## Metrics Rules

- Do not track a metric unless it drives a decision.
- Use flow metrics for local execution control and delivery metrics for system improvement; do not confuse them.
- If a metric can be gamed easily, pair it with a balancing signal.
- Do not change state definitions midstream without recording the date of change.

## Artifact Contract

| Artifact | Minimum Fields |
|---|---|
| Workflow definition | State, purpose, entry rule, exit rule, owner |
| Policy table | Item class, WIP limit, SLE, escalation trigger |
| Metrics contract | Metric, definition, purpose, review cadence, balancing signal |
| Breach playbook | Trigger, owner, action, escalation path |
| Improvement review template | Review date, signals observed, change proposed, next checkpoint |

## Decision Rules

- If a state has no distinct entry or exit rule, remove or merge it.
- If a WIP limit is never acted on, it is decoration, not policy.
- If a metric lacks a balancing signal and can distort behavior, downgrade its use.
- If a breach trigger has no owner, it is not an escalation path.

## Anti-Patterns

- Collecting dashboards with no decision usage.
- Treating throughput as the only success metric.
- Running WIP limits with no escalation behavior.
- Redefining states after misses to hide flow problems.

## Done Criteria

- Workflow definition, policy table, metrics contract, and breach playbook all exist.
- Each metric has a purpose and review cadence.
- Escalation ownership is explicit.
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
