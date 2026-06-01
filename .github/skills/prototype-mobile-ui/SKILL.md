---
name: prototype-mobile-ui
description: Use when evolving approved mobile wireframes into expert-level, annotated high-fidelity prototypes with design tokens, state behavior, and engineering-ready handoff assets.
---

# Mobile UI Prototyping

## Specialization

Convert approved mobile wireframes into high-fidelity prototype deliverables with clear platform-aware behavior, tokenized visual rules, and implementation-ready annotations.

## Objective

Produce a prototype package that communicates look, feel, motion, state behavior, and accessibility expectations well enough to reduce engineering interpretation risk.

## Scope Boundaries

In scope:

- High-fidelity visual system application to approved wireframes.
- Interactive or annotated prototype creation.
- State, token, and component documentation.
- Platform-aware annotation for iOS and Android differences.
- Handoff packaging for engineering.

Out of scope:

- Upstream discovery or raw wireframe creation.
- Production UI implementation.
- Release governance beyond prototype readiness.

## Trigger Conditions

- Approved wireframes need visual and interaction fidelity.
- Engineering needs a concrete design-to-code handoff package.
- A mobile feature needs tokens, motion, and state behavior captured before implementation.

## Inputs

- Approved wireframes.
- Platform scope and device classes.
- Visual system constraints such as brand, typography, color, spacing, and iconography.
- Tool constraints such as Figma, Penpot, or static annotated artifacts.
- Evaluation date in ISO format (`YYYY-MM-DD`).

## Required Outputs

- Prototype artifact, interactive when possible or annotated static when not.
- Design token summary covering color, typography, spacing, component rules, and motion cues.
- Screen-level annotations for states, validation, accessibility, and platform differences.
- Handoff package with implementation notes, open risks, and unresolved decisions.

## Deterministic Workflow

1. Confirm approved wireframe scope, prototype depth, and platform constraints.
2. Apply the visual system to each screen using explicit tokens and component rules.
3. Document state coverage for empty, loading, success, warning, error, disabled, and retry where relevant.
4. Add motion, transition, and feedback annotations only where they meaningfully affect understanding or implementation.
5. Capture platform deltas for navigation chrome, action placement, typography scaling, and input behavior.
6. Add accessibility annotations for labels, focus order, touch targets, contrast, and announced state changes.
7. Package the prototype with implementation notes, design risks, and unresolved decisions.

## Prototype Quality Checklist

- Every target screen has a named purpose and primary action.
- Tokens are explicit rather than inferred from screenshots.
- State behavior is documented for system and network failure cases.
- Motion is purposeful, sparse, and safe for reduced-motion contexts.
- Platform differences are captured where they affect engineering choices.
- Accessibility notes are attached at the screen or component level.

## Done Criteria

- All target screens are represented with required states.
- Tokens, annotations, and platform deltas are implementation-ready.
- Handoff package is complete and unambiguous.
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
