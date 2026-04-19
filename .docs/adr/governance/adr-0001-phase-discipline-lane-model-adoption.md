---
title: "ADR-0001: Phase / Discipline / Lane Model Adoption"
status: "Approved"
date: "2026-04-17"
authors: "User + GitHub Copilot"
tags: ["governance", "taxonomy", "delivery-model"]
supersedes: ""
superseded_by: ""
---

## Context

The workspace needed a structured way to classify delivery work so that agentic routing coordinates, coverage gaps, and customisation priorities could be made explicit. A 3-dimensional model using Phase, Discipline, and Lane was proposed and evaluated against two independent agent responses. Both identified a shared risk: treating all 135 combinations as a first-class customisation mandate would create thin specialists, noisy catalogs, and high maintenance burden.

The user approved a blended approach that retains the coverage-map value of the full matrix while constraining it from becoming a customisation factory.

## Decision

Adopt the Phase / Discipline / Lane model as a **coverage map and routing taxonomy**, not a customisation mandate.

- **Phase** (ANALYSIS, DESIGN, IMPLEMENTATION, TEST, RELEASE) is a contextual modifier. It does not justify a separate asset unless it materially changes outputs or toolset.
- **Discipline** (Engineering, UX, Analysis, Architecture, Security, Performance, Support, Product Management, Project Management, Governance, Data / DBA, Platform / DevOps, QA / Test Automation, Operations / SRE, Documentation / Knowledge) is the specialisation axis and the primary routing differentiator.
- **Lane** (Plan, Execute, Review) is the primary routing axis.
- A cell is promoted to a first-class customisation asset only when at least two cells cite it and the deliverable shape or toolset differs materially from any existing bundle.
- Intentionally unsupported combinations are recorded as `tagged only`, not silently unserved.
- Any change to the Discipline list (addition or removal) must trigger a full matrix revisit before adoption.

## Consequences

### Positive

- **POS-001**: Coverage gaps across Release, Support, Product Management, and Project Management become visible without mandating 135 new assets.
- **POS-002**: Existing bundles (X01–X12) cover the majority of cells via composition, reducing immediate creation pressure.
- **POS-003**: The Discipline-change protocol (DEC-PDL-07) prevents silent drift when the team's organisational structure evolves.
- **POS-004**: The adoption protocol gate (two cells + ADR) keeps the customisation catalog lean and evidence-backed.
- **POS-005**: High-signal governance monitors (bundle drift, stale matrix, promotion without evidence) surface misalignment automatically.

### Negative

- **NEG-001**: The bundle abstraction hides per-cell asset details; reviewers must cross-reference the legend to understand exact coverage.
- **NEG-002**: The Discipline-change revisit requirement adds overhead when disciplines evolve quickly.

## Alternatives Considered

| Alternative | Reason rejected |
|---|---|
| 135 first-class customisations (one per cell) | Creates thin specialists, bloated catalogs, and unsustainable maintenance burden. Rejected per DEC-PDL-01 and DEC-PDL-02. |
| Phase-only taxonomy (5 lanes) | Loses discipline-level routing specificity needed for agentic dispatch. |
| Ignore Phase entirely | Phase still matters as contextual metadata for handoff traceability and evidence labelling even when it does not change the asset used. |
| Separate model for each discipline | Creates isolated silos and breaks cross-discipline composition. |

## Approved Operating Rules

| ID | Rule |
|---|---|
| DEC-PDL-01 | Use the model first as a classification and planning tool, not as a customisation factory. |
| DEC-PDL-02 | Require a distinct toolset, deliverable shape, or review standard before promoting a cell to a first-class agent. |
| DEC-PDL-03 | Prefer extending an existing skill before creating a new agent for a sparse combination. |
| DEC-PDL-04 | Reserve instructions for mandatory, path-scoped policy; do not use them to represent situational workflows. |
| DEC-PDL-05 | Record intentionally unsupported combinations as `tagged only` rather than letting them appear accidentally unserved. |
| DEC-PDL-06 | Use composition for most cells: a small agent layer, a broader skill layer, and an always-on instruction layer. |
| DEC-PDL-07 | Any change to the Discipline list must trigger a full matrix revisit before the change is treated as adopted. |

## Priority Customisation Backlog

The following new assets are approved for creation in a future execution phase. They are not part of this decision record — they are surfaced here for traceability.

| Priority | Asset | Cells served |
|---|---|---|
| P0 | `analysis-execution` skill (N01) | 1, 10, 19, 46, 55, 64, 91, 100, 109 |
| P0 | `release-readiness` skill (N02) | All Release phase cells (28–36, 73–81, 118–126) |
| P1 | `test-design-review` skill (N04) | All TEST Plan and Review cells |
| P1 | `governance-delivery` skill (N06) | All Project Management cells |
| P1 | `operability-design` skill (N07) | Support discipline across all phases |

## Governance Artifact

The canonical matrix artifact lives at:
[phase-discipline-lane-agentic-delivery-matrix.md](../../plans/governance/taxonomy-tag-registry/phase-discipline-lane-agentic-delivery-matrix.md)

## Implementation Notes

- This ADR must be referenced when creating any new customisation that claims to serve a matrix cell.
- The adoption protocol is embedded in the matrix document; this ADR is the authoritative decision record behind it.
- When the Discipline list changes, a new ADR entry or amendment must be created before the matrix is regenerated.

---

## Amendment: 2026-04-18 — Five Additional Disciplines Adopted

**Trigger:** DEC-PDL-07 revisit. User approval granted 2026-04-18.

**Disciplines adopted:**

| Discipline | Rationale |
|---|---|
| Data / DBA | Distinguishes schema, migrations, query tuning, and operational data work from general Engineering. |
| Platform / DevOps | Separates CI/CD, environment automation, and infrastructure from product code delivery. |
| QA / Test Automation | Makes test design, automation strategy, and evidence ownership explicit as a distinct function. |
| Operations / SRE | Distinguishes service health, observability, reliability, and incident response from generic Support. |
| Documentation / Knowledge | Captures reference docs, runbooks, onboarding, and corpus curation as a first-class function. |

**New assets created:**

| Code | Asset | Discipline served |
|---|---|---|
| N11 | `data-design` skill | Data / DBA |
| N12 | `sre-practices` skill | Operations / SRE |
| X13 | Documentation and knowledge bundle | Documentation / Knowledge |

**Matrix impact:** 75 rows added (rows 151–225). Total: 225 rows, 15 disciplines, 5 phases, 3 lanes.

**Governance reference:** Canonical matrix at `.github/skills/matrix-skill-mapping/references/phase-discipline-lane-agentic-delivery-matrix.md`.
