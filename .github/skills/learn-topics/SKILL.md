---
name: learn-topics
description: Use when building a specialist learning path that must decompose a topic by depth, keep source traceability, and optionally route new skill/customization generation for validated gaps.
---

# Learn Topics

## Singular Purpose

Build a depth-calibrated, specialist learning map for a requested domain and maintain a source ledger that justifies every major recommendation.

## Required Collaborators

- `task-research` for broad and deep source-backed research.
- `critical-thinking` for assumption checks and depth-right-sizing.
- `route-customization` when a capability gap appears.
- `skills-authoring` when the gap is a reusable workflow skill.
- `customization-authoring` when the gap requires a new agent or instruction.

## Depth Levels

Use one level unless the user asks for mixed depth.

| Level | Intent | Typical Output |
|---|---|---|
| L1 Broad | Good-enough domain orientation | Domain map and top concepts only |
| L2 Practical | Hands-on competency | Concepts plus applied checklist |
| L3 Specialist | Deep subtopic capability | Subdomain drill-down with edge cases |
| L4 Expert | Advanced mastery path | Research-grade roadmap and trade-off matrix |

## Workflow

1. Confirm topic, outcome, and target depth (`L1` to `L4`).
2. Produce an initial topic tree (domain -> subdomain -> specialization).
3. Run `task-research` to validate each branch with authoritative sources.
4. Run `critical-thinking` to remove over-specialization that does not serve the stated outcome.
5. Generate a final learning map with explicit stop points for "good enough" completion.
6. Record all sources in a source ledger using `./references/source-ledger-template.md`.
7. Identify capability gaps and route through `route-customization`.
8. If approved, generate missing assets via `skills-authoring` or `customization-authoring`.

## Output Contract

Always include:
- Learning scope and selected depth level.
- Hierarchical learning map.
- Pragmatic stop rule defining what counts as sufficient mastery.
- Source ledger with links and relevance notes.
- Gap-to-artifact routing decision when new assets are needed.

## Done Criteria

This skill is complete when the user receives a source-backed learning map that matches the requested depth and includes explicit next steps or asset-generation decisions.

## Inputs

- User request context and target scope for this skill invocation.

## Required Outputs

- A concrete, workspace-applicable result aligned with this skill purpose.

