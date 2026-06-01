---
name: csharp-release-quality-gate
description: Use when C# release candidates need one expert, evidence-first go or no-go decision that consolidates language, async, architecture, testing, and data-access quality outcomes.
---

# C# Release Quality Gate

## Specialization

Use this skill to deliver a unified C# release decision by consolidating quality evidence across language integrity, async behavior, architecture boundaries, testing adequacy, and data-access safety.

This skill is specialized for final quality synthesis and release disposition. It does not implement product features.

## Objective

Produce one deterministic C# release recommendation with explicit gate status, residual-risk accounting, and approval-ready evidence.

## Trigger Conditions

- A C# change set is a release candidate requiring final quality disposition.
- Multiple quality assessments exist and need one unified decision.
- Teams need an auditable go or no-go artifact before promotion.

## Scope Boundaries

In scope:

- Consolidation of quality findings into one release decision.
- Gate status evaluation across language, async, architecture, testing, and data-access evidence.
- Residual-risk, owner, and due-date accounting for unresolved items.

Out of scope:

- New feature implementation.
- Deep specialist investigation of unresolved findings.
- Deployment execution.

## Inputs

- Evidence artifacts and findings summaries for all in-scope quality dimensions.
- Release policy thresholds and exception rules.
- Candidate build metadata and target environment.
- Evaluation date in ISO format (`YYYY-MM-DD`) for source freshness checks.

## Required Outputs

- Unified gate matrix with pass/fail/conditional status per quality dimension.
- Consolidated findings table with severity, owner, and due date.
- Residual-risk summary and exception log.
- Final recommendation: go, go-with-exceptions, hold, or no-go.

## Deterministic Workflow

1. Confirm the release scope and required quality dimensions.
2. Validate that each required dimension has current evidence artifacts.
3. Normalize severity and disposition semantics across findings.
4. Build one gate matrix assigning status per dimension.
5. Identify unresolved risks and verify ownership with due dates.
6. Apply policy thresholds and exception rules to derive one recommendation.
7. Publish an approval-ready decision artifact with residual risks.

## Decision Rules

- `go`: all required dimensions pass or are formally waived with acceptable risk.
- `go-with-exceptions`: limited medium or low risks remain with approved exceptions.
- `hold`: at least one high-risk item is open but remediable in-cycle.
- `no-go`: unresolved critical risk, or unresolved high risk without approved exception.

## Done Criteria

- Trigger conditions are satisfied.
- Required outputs are complete.
- Decision mode is explicit.
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
