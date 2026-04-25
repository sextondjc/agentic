---
name: xunit-source-curation
description: Use when xUnit guidance must be grounded in authoritative, current sources and converted into reusable, agent-usable testing guidance.
---

# xUnit Source Curation

## Specialization

Use this skill to establish and maintain a high-confidence xUnit source baseline before authoring or revising reusable testing guidance.

This skill is specialized for source governance and content synthesis readiness. It does not implement test code.

## Objective

Produce a source-governed xUnit baseline with explicit relevance, freshness, and actionability decisions that can safely drive cross-project skill outputs.

## Trigger Conditions

- xUnit guidance needs to be authored, refreshed, or audited.
- Existing testing guidance may be stale or inconsistent across projects.
- A compendium update requires authoritative provenance before skill edits.

## Scope Boundaries

In scope:

- Source selection, authority checks, and freshness checks.
- Mapping source content into actionable guidance deltas.
- Rejected-source recording with explicit reason codes.

Out of scope:

- Direct implementation of test code.
- Non-testing content curation.
- Framework migration execution.

## Inputs

- Target xUnit topics and expected output artifacts.
- Evaluation date in ISO format (`YYYY-MM-DD`).
- Freshness threshold in days (default: 30).
- Existing source inventory if available.

## Required Outputs

- Updated source catalog with authority, freshness, relevance, and actionability fields.
- Topic-to-source coverage matrix.
- Rejected-source table with deterministic reason codes.
- Prioritized guidance delta list for downstream authoring.

## Deterministic Workflow

1. Enumerate target xUnit topics that must be covered.
2. Collect candidate sources from first-party xUnit and Microsoft documentation.
3. Score each source for authority, freshness, relevance, and actionability.
4. Reject weak sources and record reason codes.
5. Build a topic-to-source coverage matrix to expose gaps.
6. Produce prioritized deltas that downstream skills can consume.
7. Publish closure status and unresolved source gaps.

## Source Decision Rules

- `accept`: authoritative source, freshness within threshold, and directly actionable.
- `accept-with-watch`: authoritative and relevant but partial, stale, or pending update.
- `reject`: not authoritative, too stale, redundant, or non-actionable.

## Rejected Source Reasons

- `R1`: Not authoritative for xUnit behavior.
- `R2`: Older than freshness threshold without durable applicability.
- `R3`: Redundant with no new actionable guidance.
- `R4`: Opinion-heavy with low implementation specificity.
- `R5`: Outside xUnit testing scope.

## L4 Coverage Matrix

| Requested Outcome | Skill Section |
|---|---|
| Expert source baseline | Deterministic Workflow |
| Deterministic source decisions | Source Decision Rules |
| Auditability of exclusions | Rejected Source Reasons |
| Cross-project portability | Required Outputs + Pragmatic Stop Rule |

## Reasoning Package

Assumptions:

- Cross-project testing guidance remains stable only when anchored to authoritative sources.
- Source freshness must be explicit to prevent silent drift.

Trade-offs:

- Strict source filtering improves confidence but may exclude useful niche patterns.
- Including broader sources improves coverage but can reduce determinism.

Open blockers:

- Missing first-party guidance for edge behavior can force temporary `accept-with-watch` status.
- Incomplete topic boundaries can hide source coverage gaps.

Recommendation:

- Use first-party xUnit and Microsoft sources as default, and allow external sources only with explicit actionability proof.

## Source Governance Summary

- Active sources and status are tracked in [source-catalog.md](./references/source-catalog.md).

## Pragmatic Stop Rule

Stop when each target topic has at least one accepted source, all rejected candidates are reason-coded, and unresolved gaps are explicit.

## Done Criteria

- Trigger conditions are satisfied.
- Required outputs are complete.
- Source decision outcomes are explicit.
- Source catalog is current for this evaluation cycle.
