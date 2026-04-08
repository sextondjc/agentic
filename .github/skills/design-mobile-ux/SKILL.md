---
name: design-mobile-ux
description: Use when defining or improving mobile app UX for iOS and Android and you need a practical flow from user research through wireframes, validation, and engineering handoff.
---

# Design Mobile UX

## Specialization

This skill is specialized for the workflow described in this file and should remain narrowly bounded to that responsibility.

It should not absorb adjacent planning, execution, or review responsibilities that belong to other assets.

## Scope

Design and validate mobile UX for iOS and Android across phones and tablets, from discovery through tested handoff artifacts.

## Outcomes

- Problem statement, user goals, and prioritized experience risks.
- Low-fidelity to mid-fidelity wireframes for core journeys.
- Accessibility and usability findings with concrete fixes.
- Implementation-ready handoff notes and validation plan.

## Workflow

1. Define the target users, business goal, and success criteria for the feature.
2. Gather evidence: analytics, support tickets, app reviews, and 5-8 user interviews or session reviews.
3. Map top tasks and current pain points; write clear journey assumptions to test.
4. Produce task flows and low-fidelity wireframes for primary, edge, and error states.
5. Apply platform-aware patterns (iOS and Android) without fragmenting core interaction logic.
6. Evolve to mid-fidelity wireframes with content hierarchy, tap targets, and state behavior.
7. Run quick usability tests (5+ participants), capture severity-ranked issues, and iterate.
8. Prepare handoff package: annotated wireframes, behavior specs, acceptance cues, and test scenarios.
9. Define instrumentation and launch validation loop before implementation sign-off.

## Accessibility and Usability Heuristics

- Maintain readable typography, sufficient contrast, and clear visual hierarchy.
- Ensure touch targets are comfortably tappable and spacing prevents accidental taps.
- Keep navigation predictable, back behavior consistent, and system gestures respected.
- Provide visible feedback for loading, success, and failure states.
- Support screen readers with meaningful labels, focus order, and announced state changes.
- Minimize cognitive load: one primary action per screen and plain-language microcopy.

## Responsive and Adaptive Guidance

- Design for common phone classes first, then adapt for tablets with expanded layouts.
- Handle portrait and landscape orientation intentionally; do not rely on automatic stretch.
- Use thumb-reach-aware placement for primary actions on large phones.
- Preserve task continuity across device sizes with consistent information architecture.
- Use adaptive components for split views, side panels, and keyboard-safe interactions.

## Instrumentation and Validation Loop

Track these metrics per key flow:

- Task completion rate.
- Time to complete task.
- Error rate and recovery rate.
- Drop-off by step.
- Feature adoption and repeat usage.
- Accessibility issue count from audits and user feedback.

Validation loop:

1. Establish baseline metrics before UX change.
2. Ship with event tracking tied to critical journey steps.
3. Compare post-release metrics against baseline and success criteria.
4. Run targeted follow-up tests on weak steps.
5. Feed findings into the next wireframe iteration.

## Checklist

- Success criteria and target users are explicit.
- Core flows include empty, loading, success, and failure states.
- iOS and Android interaction differences are handled intentionally.
- Phone and tablet layouts are validated in both orientations.
- Accessibility and usability issues are logged with severity and owner.
- Handoff includes annotated wireframes, behavior rules, and analytics events.
- Post-release validation cadence is scheduled.

## Trigger Conditions

Invoke this skill when any of the following is true:

- The user asks for mobile UX design guidance rather than direct UI implementation.
- Discovery, wireframing, validation, or handoff artifacts are needed for iOS or Android experiences.
- UX work must be structured before engineering execution begins.

## Inputs

- User request context and target scope for this skill invocation.

## Required Outputs

- A concrete, workspace-applicable result aligned with this skill purpose.
