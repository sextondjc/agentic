---
name: shadcn-orchestrator
description: Use when a shadcn/ui request spans multiple capability areas — setup, theming, component design, forms, data display, testing, accessibility, migration, animation, registry, CI integration, design system, or quality — and needs one deterministic intake, explicit phase ownership, and a unified execution contract.
---

# shadcn Orchestrator

## Specialization

Use this skill to coordinate cross-cutting shadcn/ui requests from one intake when work spans source curation, project setup, theming, component design, form patterns, and quality gating.

This skill is specialized for intake, phase ownership, and unified synthesis. It does not replace deep execution guidance — it routes to the appropriate specialist shadcn skill for each phase.

**Design language model**: shadcn/ui is the primary design language; TailwindCSS is the utility layer. Both are leveraged for their strengths. shadcn CSS variable tokens govern component color, spacing, and border-radius. Tailwind utilities govern layout, responsive breakpoints, prose styling, animation, and non-component surfaces. When both could apply, prefer the shadcn semantic token; use a Tailwind utility only when it provides a capability shadcn does not cover. Conflicts on component tokens are resolved in favor of shadcn. Use `tailwind-orchestrator` for Tailwind-specific build, pipeline, and CI concerns and coordinate with the shadcn skill family when the two surfaces intersect.

## Objective

Produce one deterministic shadcn/ui execution contract from a single intake — with explicit phase ownership, evidence expectations, and closure checks — for any request that spans more than one shadcn capability area.

## Trigger Conditions

- A shadcn/ui request spans more than one capability area (e.g., new project setup + brand theming + form implementation).
- A project is adopting shadcn/ui for the first time and needs end-to-end guidance.
- A cross-project shared component library backed by shadcn/ui must be established.
- An existing shadcn implementation needs a full-cycle review: sources → setup → theming → components → forms → gate.
- A team needs one intake instead of disconnected setup, design, and review workflows.
- A major shadcn/ui or Radix primitives update requires an impact assessment across all capability areas.

## When Not to Use

- The request is clearly scoped to one capability area — use the specialist skill directly.
- Source-only freshness verification with no implementation (use `shadcn-source-curation` directly).
- A single component needs review without a broader gate (use `shadcn-quality-gate` directly).

## Scope Boundaries

In scope:

- Deterministic shadcn intake and phased execution planning.
- Phase-output ownership with exactly one owner per required output.
- Unified execution recommendation for mixed shadcn requests.
- Cross-phase dependency mapping (source freshness → setup → theming → components → forms → gate).

Out of scope:

- Deep implementation within any one phase.
- Non-shadcn UI tooling unless it directly gates a shadcn phase.
- Generic frontend project governance unrelated to shadcn/ui.

## Inputs

- User objective and target shadcn surface (new project, component library, theming, form audit, quality gate).
- Framework and shadcn/ui version in use or target version.
- Scope boundaries, environments, and risk level.
- Required outputs, known constraints, and delivery timeline.
- Evaluation date in ISO format (`YYYY-MM-DD`) for source freshness.

## Required Outputs

- Intake contract with objective, boundaries, and required outputs.
- Phase-output ownership matrix.
- Unified shadcn/ui execution recommendation.
- Rejected-phase table with deterministic reason codes (phases excluded from scope).
- Closure check stating whether all required outputs are owned.

## Deterministic Workflow

1. Lock objective, risk boundary, target framework, and required outputs.
2. Classify the request into one or more capability phases from the catalog above.
3. Assign exactly one owner per required output using the phase assignment table below.
4. Map cross-phase dependencies: source freshness must precede setup; setup must precede theming and components; theming and components must precede gate.
5. Identify phases not active and record them in the rejected-phase table with reason codes.
6. Confirm closure: every required output has an owner.
7. Emit the execution contract.

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
