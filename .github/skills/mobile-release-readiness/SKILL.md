---
name: mobile-release-readiness
description: Use before promoting a MAUI mobile build when you need an expert, evidence-first gate for signing, store readiness, smoke evidence, rollback, and go or no-go sign-off.
---

# Mobile Release Readiness

## Specialization

Drive a MAUI mobile release from code-complete to go or no-go sign-off by producing a mobile-specific gate checklist result, evidence bundle, rollback confirmation, and named sign-off record.

This skill satisfies mobile release governance needs. It does not perform deployment. It organizes and validates the evidence that authorizes promotion.

## Objective

Produce one release-ready mobile recommendation with explicit store, signing, testing, rollback, and approval evidence before promotion begins.

## Trigger Conditions

- A MAUI build is a candidate for TestFlight, internal testing, staged rollout, or production release.
- A release or deployment window is scheduled and evidence must be collated before the go or no-go call.
- Store metadata, privacy disclosures, or mobile-specific entitlements must be confirmed before release.
- Rollback readiness must be explicitly confirmed before promotion proceeds.

## Scope Boundaries

In scope:

- Mobile release gate checklist and evidence collation.
- Signing, packaging, smoke validation, telemetry readiness, and deep-link confirmation.
- Store listing readiness, privacy disclosures, accessibility labels when required, and approval chain capture.
- Rollback and hold or no-go documentation.

Out of scope:

- Running the deployment itself.
- Replacing general product release governance outside the mobile slice.
- Implementing code fixes discovered during the gate.

## Inputs

- Release target: environment, store or distribution lane, and workstream or release ID.
- Smoke evidence or planned smoke execution details.
- Security or compliance sign-off reference when required.
- Rollback procedure or path to it.
- Approval chain with named engineering owner and product or delivery owner.
- Evaluation date in ISO format (`YYYY-MM-DD`).

## Required Outputs

- Mobile release gate checklist result.
- Evidence bundle with named artifact references.
- Rollback confirmation with owner and execution summary.
- Store-readiness matrix covering packaging, metadata, and platform-specific disclosures.
- Final sign-off record with `go`, `hold`, or `no-go` disposition.

## Deterministic Workflow

1. Confirm release target, originating workstream, and release lane.
2. Populate the mobile gate checklist and retrieve named evidence for each gate.
3. Validate signing, packaging, environment configuration, and distribution prerequisites.
4. Confirm smoke evidence, telemetry hooks, crash reporting, and deep-link handling.
5. Validate rollback procedure, named rollback owner, and executable rollback summary.
6. Review store or release metadata readiness, privacy disclosures, and accessibility labeling when applicable.
7. Obtain named approvals with role and timestamp.
8. Produce final decision: `go`, `hold`, or `no-go`.
9. If decision is not `go`, document blocking gates and required resolution before the next review.

## Mobile Release Gate Checklist

- [ ] Signed package or build artifact exists for the target lane.
- [ ] Smoke evidence is present and dated.
- [ ] Crash reporting and telemetry hooks are enabled for the release build.
- [ ] Deep links, notifications, and environment configuration are validated for the release lane.
- [ ] Store metadata, privacy disclosures, and accessibility labeling obligations are complete when applicable.
- [ ] Rollback steps are current, executable, and owned.
- [ ] Named engineering and product or delivery approvals are recorded.

## Decision Rules

- `go`: all gates pass or are formally waived with rationale.
- `hold`: one or more non-trivial gates are open but resolvable in the active release cycle.
- `no-go`: one or more blocking gates remain unresolved.

## Evidence Contract

- `.docs/changes/<workstream-id>/mobile-release-gate-checklist.md`
- `.docs/changes/<workstream-id>/mobile-release-evidence-bundle.md`
- `.docs/changes/<workstream-id>/mobile-store-readiness-matrix.md`
- `.docs/changes/<workstream-id>/mobile-release-decision.md`

## Done Criteria

- Gate checklist is complete with no hidden open items.
- Evidence bundle references all required artifacts.
- Rollback confirmation is explicit and owned.
- Final decision is recorded with approvals and rationale.
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
