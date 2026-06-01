---
name: mobile-accessibility-quality-gate
description: Use when a MAUI mobile change needs an expert, evidence-first accessibility decision with deterministic checks, durable artifacts, and release-ready sign-off.
---

# Mobile Accessibility Quality Gate

## Specialization

Use this skill to deliver expert-level, agent-usable accessibility execution for MAUI mobile surfaces, from design handoff validation through release-ready evidence and sign-off.

This skill is specialized for native mobile accessibility execution and review. It does not perform product implementation and it does not replace general UX design work.

## Objective

Produce accessibility-complete MAUI mobile outcomes with explicit pass or fail gates, durable evidence artifacts, and deterministic release readiness decisions.

## Trigger Conditions

- A MAUI mobile flow, screen, or component must be validated for accessibility before merge or release.
- A mobile implementation needs objective evidence for labels, focus behavior, touch targets, dynamic type, and state announcements.
- Accessibility defects must be severity-ranked and converted into actionable remediation.
- Accessibility sign-off is required for a release artifact.

## Scope Boundaries

In scope:

- Screen reader, switch, voice, and keyboard-adjacent accessibility behavior where applicable.
- Focus order, semantic naming, labels, hints, and announced state changes.
- Touch-target sizing, contrast, dynamic type or larger text, and motion sensitivity checks.
- Severity-ranked findings, remediation decisions, and evidence bundle generation.

Out of scope:

- Broad visual redesign.
- Backend API changes.
- Non-mobile web accessibility validation.

## Inputs

- Target flow, screen, or component list.
- Intended interaction behavior and UX handoff notes.
- Runtime environment and device mix for validation.
- Acceptance threshold policy (default: no unresolved critical or serious issues).
- Evaluation date in ISO format (`YYYY-MM-DD`) for source freshness checks.

## Required Outputs

- Accessibility findings report with severity tags and disposition per issue.
- Pass or fail checklist mapped to criteria used in scope.
- Assistive-technology verification notes for screen readers, larger text, and focus order.
- Evidence bundle references for automated and manual validation.
- Explicit sign-off recommendation: `go`, `go-with-exceptions`, or `no-go`.

## Deterministic Workflow

1. Confirm scope boundary: screens, components, states, and representative device classes.
2. Build criteria set from active mobile accessibility guidance and map each criterion to a check.
3. Run automated accessibility checks where available and capture raw outputs.
4. Run manual verification for screen-reader order, visible focus where applicable, labels, hints, and announced state changes.
5. Validate larger text or dynamic type behavior, reduced-motion handling, and touch-target sizing.
6. Validate critical interactions with native assistive technologies and platform inspectors where available.
7. Classify findings by severity and create remediation disposition for each finding.
8. Re-run verification after fixes and record residual risk.
9. Produce release recommendation: `go`, `go-with-exceptions`, or `no-go` with rationale.
10. Publish durable evidence artifact paths.

## Accessibility Gate Checklist

- [ ] Text remains readable under larger text settings and does not truncate critical content.
- [ ] All actionable elements expose meaningful labels or hints.
- [ ] Focus order and announcement order match the intended task flow.
- [ ] Touch targets meet policy threshold and are not crowded.
- [ ] Dynamic state updates are conveyed to assistive technologies when required.
- [ ] Critical and serious findings are resolved or explicitly deferred with owner and due date.

## Severity Model

- Critical: blocks completion for assistive technology users or creates severe compliance risk.
- Serious: materially degrades completion success or introduces significant accessibility friction.
- Moderate: usability degradation with an available workaround.
- Minor: low-impact issue with minimal task risk.

## Evidence Contract

Capture artifacts under one change scope path:

- `.docs/changes/<workstream-id>/mobile-accessibility-findings.md`
- `.docs/changes/<workstream-id>/mobile-accessibility-checklist.md`
- `.docs/changes/<workstream-id>/mobile-accessibility-scan-results.json`
- `.docs/changes/<workstream-id>/mobile-accessibility-release-recommendation.md`

## Anti-Patterns

- Relying on automated scans only.
- Declaring accessibility sign-off without durable artifacts.
- Deferring critical or serious findings without named owner and follow-up date.
- Mixing broad redesign goals into accessibility verification scope.

## Done Criteria

- Trigger conditions are satisfied for the request.
- Required outputs are complete and linked to durable artifacts.
- L4 coverage matrix remains fully mapped.
- Source catalog has current evaluation date and disposition.
- Final recommendation is explicit and evidence-backed.

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
