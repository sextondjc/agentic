# R3 Advisory Backlog Matrix

This record tracks closure of R3 advisories using the consolidated skill and customization review artifacts.

## Metadata

| Field | Value |
|---|---|
| Date | 2026-04-03 |
| Source A | full-skill-review-grid.md |
| Source B | audit.md |
| Scope | Open SHOULD advisories only |

## Baseline Grid

| Domain | Open Advisories | Notes |
|---|---:|---|
| Skill Review | 0 | Full skill review grid shows all active skills passing with no advisories. |
| Customization Review | 0 | Post-remediation rerun closes route-ownership and companion-skills advisory residue. |
| Total | 0 | R3 advisory backlog closed in this rerun window. |

## Customization Advisory Detail

| Item ID | Asset | Advisory Summary | Priority | Planned Phase | Status |
|---|---|---|---|---|---|
| `CUS-ADV-001` | `lifecycle-governance.instructions.md` | Clarified policy authority and orchestrator alignment wording to remove overlap advisory. | Medium | Phase 2 | Closed (rerun confirmed) |
| `CUS-ADV-002` | `architecture-designer.agent.md` | Add `## Preferred Companion Skills` section. | Medium | Phase 1 | Closed (rerun confirmed) |
| `CUS-ADV-003` | `benchmark-researcher.agent.md` | Add `## Preferred Companion Skills` section. | Medium | Phase 1 | Closed (rerun confirmed) |
| `CUS-ADV-004` | `performance-assessor.agent.md` | Add `## Preferred Companion Skills` section. | Medium | Phase 1 | Closed (rerun confirmed) |
| `CUS-ADV-005` | `security-researcher.agent.md` | Add `## Preferred Companion Skills` section. | Medium | Phase 1 | Closed (rerun confirmed) |

## Skill Advisory Strategy

| Batch ID | Scope | Planned Action | Priority | Status |
|---|---|---|---|---|
| `SK-B1` | Global consistency pass | Standardized recurring advisory pattern language and required section completeness across all active skill files. | Medium | Closed |
| `SK-B2` | Catalog-reference integrity pass | Validated skill references against current IDs and paths in [skill-discovery-index.md](./../../.github/skills/skill-discovery-index.md). | Medium | Closed |
| `SK-B3` | Template hardening pass | Normalized required execution contract sections where needed and reran review grid. | Low | Closed |

## Phase Plan

| Phase | Target | Expected Delta |
|---|---|---|
| Phase 1 | Close four REC-005 companion-skills advisories. | Customization advisories: 5 -> 1 (confirmed). |
| Phase 2 | Resolve route-matrix ownership advisory and run first skill advisory batch (`SK-B1`). | Completed; combined advisory count reduced to 0. |
| Phase 3 | Execute `SK-B2` and `SK-B3`, then re-baseline governance audit metrics. | Completed; zero residual advisories in rerun artifacts. |

## Evidence Links

- [audit-history.md](./customization/reviews/audit-history.md)
- [INDEX.md](./customization/reviews/conflicts/INDEX.md)
- [con-custom-20260403-001.md](./customization/reviews/conflicts/con-custom-20260403-001.md)
- [con-custom-20260403-002.md](./customization/reviews/conflicts/con-custom-20260403-002.md)
- [con-custom-20260403-003.md](./customization/reviews/conflicts/con-custom-20260403-003.md)
- [full-skill-review-grid.md](./skill/reviews/full-skill-review-grid.md)
- [audit-history.md](./customization/reviews/audit-history.md)
- [audit.md](./customization/reviews/audit.md)
- [governance-audit.md](./governance/audits/governance-audit.md)


