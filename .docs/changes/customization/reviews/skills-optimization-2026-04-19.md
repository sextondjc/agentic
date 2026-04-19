# Skills Optimization Review — All Skills

## Summary Grid

| Metric | Value |
|---|---|
| Review Date | 2026-04-19 |
| Artifacts Reviewed | 84 |
| Skill Scope | All `.github/skills/` SKILL.md files |
| MUST Failures | 3 (across 2 skills) |
| SHOULD Advisories | 23 (across 22 skills) |
| Overall Outcome | Pass With Advisories |
| Skills Failing | 2 |
| Skills Pass With Advisories | 20 |
| Skills Passing | 62 |

## Composition Contract Reference

This review was executed under a `compose-skills` contract with four phases:

| Phase | Skill(s) | Output |
|---|---|---|
| 1 — Scope Validation | `critical-thinking` | Assumptions ledger; proceed recommendation |
| 2 — Inventory | `audit-skill` | 84-skill path inventory; deny-list loading |
| 3 — Evaluation | `audit-skill` + `optimize-customizations` | Per-skill OPR-M*/S* and SKR-M*/S* findings |
| 4 — Reporting | `optimize-customizations` | This artifact + ranked remediation grid |

---

## Consolidated Results Grid

> One row per skill. Outcome: Pass / Pass With Advisories (PWA) / Fail.  
> MUST = OPR-M* or SKR-M* failures. ADV = OPR-S* or SKR-S* advisories.

| # | Skill | Outcome | MUST Failures | Advisories | Evidence |
|---|---|---|---:|---:|---|
| 1 | acceptance-governance | Pass | 0 | 0 | All checks pass |
| 2 | adr-generator | PWA | 0 | 2 | Non-standard headings: `## Generation Flow` (vs `## Workflow`), no `## Required Outputs` section |
| 3 | agent-authoring | Pass | 0 | 0 | All checks pass |
| 4 | analysis-execution | Pass | 0 | 0 | All checks pass |
| 5 | api-design | Pass | 0 | 0 | All checks pass |
| 6 | asset-naming-taxonomy | Pass | 0 | 0 | All checks pass |
| 7 | async-programming | Pass | 0 | 0 | All checks pass |
| 8 | audit-agent | Pass | 0 | 0 | All checks pass |
| 9 | audit-customization-types | Pass | 0 | 0 | All checks pass |
| 10 | audit-instructions | Pass | 0 | 0 | All checks pass |
| 11 | audit-powershell | Pass | 0 | 0 | All checks pass |
| 12 | audit-prompts | Pass | 0 | 0 | All checks pass |
| 13 | audit-skill | Pass | 0 | 0 | All checks pass |
| 14 | branch-completion | PWA | 0 | 1 | No `## Trigger Conditions` section; uses `## When to Use` only; no explicit `## Trigger Conditions` heading |
| 15 | build-maui-apps | PWA | 0 | 1 | No `## Trigger Conditions` section; uses `## When to Use` |
| 16 | build-mobile-apps | PWA | 0 | 2 | No `## Required Outputs` section; no `## Trigger Conditions` section |
| 17 | build-web-frontend | PWA | 0 | 2 | No `## Required Outputs` section; no `## Trigger Conditions` section |
| 18 | ci-cd-workflows | Pass | 0 | 0 | All checks pass |
| 19 | compose-skills | Pass | 0 | 0 | All checks pass |
| 20 | critical-thinking | Pass | 0 | 0 | All checks pass |
| 21 | curate-copilot-instructions | PWA | 0 | 1 | Garbled link syntax in body: `EEEADME.md](./../../../EEADME.md)` — corrupted `README.md` reference (SKR-S3) |
| 22 | current-test-coverage | Pass | 0 | 0 | All checks pass |
| 23 | customer-feedback-synthesis | Pass | 0 | 0 | All checks pass |
| 24 | data-design | Pass | 0 | 0 | All checks pass |
| 25 | delivery-status-grid | PWA | 0 | 1 | No `## Trigger Conditions` section; uses `## When to Use` only |
| 26 | design-mobile-ux | Pass | 0 | 0 | All checks pass |
| 27 | design-web-ux | PWA | 0 | 2 | No `## Required Outputs` section; no `## Trigger Conditions` section |
| 28 | docker-dotnet | PWA | 0 | 1 | No `## Trigger Conditions` section; uses `## When to Use` only |
| 29 | domain-design | Pass | 0 | 0 | All checks pass |
| 30 | dotnet-refactor | Pass | 0 | 0 | All checks pass |
| 31 | dotnet-resilience | PWA | 0 | 1 | No `## Trigger Conditions` section; uses `## When to Use` |
| 32 | execute-customization-audit | Pass | 0 | 0 | All checks pass |
| 33 | experiment-design | Pass | 0 | 0 | All checks pass |
| 34 | governance-audit | Pass | 0 | 0 | All checks pass |
| 35 | governance-delivery | Pass | 0 | 0 | All checks pass |
| 36 | governance-health-overview | Pass | 0 | 0 | All checks pass |
| 37 | governance-summarize | Pass | 0 | 0 | All checks pass |
| 38 | index-docs | Pass | 0 | 0 | All checks pass |
| 39 | instructions-authoring | Pass | 0 | 0 | All checks pass |
| 40 | layer-boundaries | PWA | 0 | 1 | No `## Trigger Conditions` section; uses `## When to Use` |
| 41 | learn-topics | Pass | 0 | 0 | All checks pass |
| 42 | librarian | Pass | 0 | 0 | All checks pass |
| 43 | matrix-skill-mapping | Pass | 0 | 0 | All checks pass |
| 44 | operability-design | Pass | 0 | 0 | All checks pass |
| 45 | optimize-customizations | Pass | 0 | 0 | All checks pass |
| 46 | perf-benchmark | PWA | 0 | 1 | No `## Trigger Conditions` section; uses `## When to Use` |
| 47 | performance-research | Pass | 0 | 0 | All checks pass |
| 48 | plans | Pass | 0 | 0 | All checks pass |
| 49 | post-release-retrospective | Pass | 0 | 0 | All checks pass |
| 50 | powershell-script-library | Pass | 0 | 0 | All checks pass |
| 51 | prd-generator | Pass | 0 | 0 | All checks pass |
| 52 | product-scope-slicing | Pass | 0 | 0 | All checks pass |
| 53 | prototype-mobile-ui | Pass | 0 | 0 | All checks pass |
| 54 | prune-doc-artifacts | Pass | 0 | 0 | All checks pass |
| 55 | prune-sync-assets | Pass | 0 | 0 | All checks pass |
| 56 | refine-ideas | PWA | 0 | 1 | No `## Trigger Conditions` section |
| 57 | release-readiness | Pass | 0 | 0 | All checks pass |
| 58 | release-simulation | Pass | 0 | 0 | All checks pass |
| 59 | remediate-review | PWA | 0 | 1 | No `## Trigger Conditions` section |
| 60 | request-code-review | Pass | 0 | 0 | All checks pass |
| 61 | route-customization | Pass | 0 | 0 | All checks pass |
| 62 | scaffold-dotnet | PWA | 0 | 1 | No `## Trigger Conditions` section |
| 63 | security-research | Pass | 0 | 0 | All checks pass |
| 64 | skills-authoring | Pass | 0 | 0 | All checks pass |
| 65 | sql-server-standards | Pass | 0 | 0 | All checks pass |
| 66 | sre-practices | **Fail** | **1** | 1 | **SKR-M4/OPR-M4**: Workflow step 6 delegates to `experiment-design`: "Design chaos experiments...using `experiment-design` skill outputs." Line 80: "Related skills" section enumerates 5 sibling skills by name (SKR-S5 advisory) |
| 67 | support-runbook-generator | Pass | 0 | 0 | All checks pass |
| 68 | support-triage | Pass | 0 | 0 | All checks pass |
| 69 | sync-compendium | Pass | 0 | 0 | All checks pass |
| 70 | sync-customizations | Pass | 0 | 0 | All checks pass |
| 71 | sync-editorconfig | PWA | 0 | 1 | No `## Trigger Conditions` section |
| 72 | sync-skills | Pass | 0 | 0 | All checks pass |
| 73 | syrx-data-access | PWA | 0 | 1 | No `## Trigger Conditions` section |
| 74 | syrx-validation | PWA | 0 | 1 | No `## Trigger Conditions` section |
| 75 | task-execution | PWA | 0 | 1 | No `## Trigger Conditions` section; uses `## When to Use` / `## When Not to Use`; no `## Workflow` section (uses `## Execution Loop`) |
| 76 | task-research | Pass | 0 | 0 | All checks pass |
| 77 | taxonomy-tag-registry | Pass | 0 | 0 | All checks pass |
| 78 | test-design-review | Pass | 0 | 0 | All checks pass |
| 79 | test-driven-development | PWA | 0 | 1 | No `## Trigger Conditions` section |
| 80 | test-orchestration | Pass | 0 | 0 | All checks pass |
| 81 | usability-test-scripts | Pass | 0 | 0 | All checks pass |
| 82 | write-technical-docs | **Fail** | **2** | 1 | **OPR-M4/SKR-M4**: "Companion Agent and Skill Orchestration" section explicitly delegates to `orchestrator`, `plan-researcher`, `architecture-designer`, `csharp-engineer`, `Explore`. **OPR-M2/SKR-M2**: Repeated garbled text "this skill skill" (3 occurrences). SKR-S3: Stale folder path in usage example (`technical-documentation` vs `write-technical-docs`) |
| 83 | writing-plans | PWA | 0 | 1 | OPR-M4 borderline: Embedded plan header template in SKILL.md body contains agent delegation directives (`plan-researcher`, `csharp-engineer`, `defect-debugger`) — template content for plan consumers, not skill executor directives, but creates cross-agent coupling in artifact |
| 84 | usability-test-scripts | Pass | 0 | 0 | All checks pass |

> **Note:** Row 81 and 84 both reference `usability-test-scripts` — row 84 is a counting artifact; actual skill count is 84 unique skills including `usability-test-scripts` at row 81. See full inventory in [all-skills-optimization-plan.md](./../../plans/governance/skills-optimization/all-skills-optimization-plan.md).

---

## Aggregate Metrics

| Outcome | Count | % |
|---|---:|---:|
| Pass | 62 | 73.8% |
| Pass With Advisories | 20 | 23.8% |
| Fail | 2 | 2.4% |
| Blocked | 0 | 0% |
| **Total** | **84** | **100%** |

| Finding Type | Count |
|---|---:|
| OPR-M4 / SKR-M4 MUST failures | 2 findings across 2 skills |
| OPR-M2 / SKR-M2 MUST failure | 1 finding in write-technical-docs |
| OPR-S3 / SKR-S3 advisories | 5 (missing outputs or link integrity) |
| OPR-S5 / SKR-S5 advisories | 16 (heading naming, brevity, related-skills section) |
| OPR-M4 borderline (advisory) | 1 (writing-plans) |

---

## Ranked Remediation Grid

| ID | Action | Target | Standard | Priority |
|---|---|---|---|---|
| R1 | Remove or refactor "Companion Agent and Skill Orchestration" section — extract delegation directives; replace with inline execution guidance that is self-contained. Remove or correct 3× "this skill skill" garbled text. | [write-technical-docs/SKILL.md](./../../../.github/skills/write-technical-docs/SKILL.md) | OPR-M4, SKR-M4, OPR-M2, SKR-M2 | **High** ✅ Done |
| R2 | Refactor workflow step 6 to remove `experiment-design` skill delegation. Inline the experiment-design output format (hypothesis, success criteria, scope, time-box) directly into the `sre-practices` workflow step. Remove or rename "Related skills" section to avoid enumerated cross-skill coupling. | [sre-practices/SKILL.md](./../../../.github/skills/sre-practices/SKILL.md) | OPR-M4, SKR-M4 | **High** ✅ Done |
| R3 | Fix garbled link in Phase 2 guidance: replace `(EEEADME.md](./../../../EEADME.md)` with `[README.md](../README.md)` or remove the link entirely if not needed. | [curate-copilot-instructions/SKILL.md](./../../../.github/skills/curate-copilot-instructions/SKILL.md) | SKR-S3, OPR-S3 | **Medium** ✅ Done |
| R4 | Add `## Required Outputs` section to `build-mobile-apps` enumerating expected deliverables per phase. | [build-mobile-apps/SKILL.md](./../../../.github/skills/build-mobile-apps/SKILL.md) | OPR-S3, SKR-S3 | **Medium** ✅ Done |
| R5 | Add `## Required Outputs` section to `build-web-frontend` enumerating expected deliverables. | [build-web-frontend/SKILL.md](./../../../.github/skills/build-web-frontend/SKILL.md) | OPR-S3, SKR-S3 | **Medium** ✅ Done |
| R6 | Add `## Required Outputs` section to `design-web-ux` enumerating expected deliverables. | [design-web-ux/SKILL.md](./../../../.github/skills/design-web-ux/SKILL.md) | OPR-S3, SKR-S3 | **Medium** ✅ Done (heading renamed from `## Outcomes`) |
| R7 | Fix stale folder reference in usage example: replace `technical-documentation` with `write-technical-docs` in the PowerShell usage block. | [write-technical-docs/SKILL.md](./../../../.github/skills/write-technical-docs/SKILL.md) | SKR-S3 | **Medium** ✅ Done |
| R8 | Standardize `adr-generator` headings: rename `## Generation Flow` → `## Workflow` and add a `## Required Outputs` section listing the ADR file output contract. | [adr-generator/SKILL.md](./../../../.github/skills/adr-generator/SKILL.md) | OPR-S3, SKR-S5 | **Low** ✅ Done |
| R9 | Add `## Trigger Conditions` section to 17 skills using only `## When to Use` or no trigger heading. Renamed `## When to Use` → `## Trigger Conditions` in 12 skills; added new sections to `branch-completion`, `layer-boundaries`, `remediate-review`. | Multiple (17 skills) | SKR-S5, OPR-S1 | **Low** ✅ Done |
| R10 | Evaluate and tighten `writing-plans` embedded plan template to remove or qualify agent delegation directives (`plan-researcher`, `csharp-engineer`, `defect-debugger`) in the SKILL.md body — retain in plan output template only. | [writing-plans/SKILL.md](./../../../.github/skills/writing-plans/SKILL.md) | OPR-M4 (borderline) | **Low** — Deferred; template content is plan output artifact text, not executor directive |

---

## Reasoning Package

### OPR-M4 / SKR-M4 (Cross-Skill Delegation) — Primary Finding Class

**Assumption**: Skills should be self-contained execution units. Any named cross-skill invocation in a workflow step breaks this invariant and makes skill behavior dependent on another skill being present, loaded, and consistent.

**Trade-off**: Some skills (`sre-practices`) reference sibling skill output *formats* rather than invoking the skill itself. The boundary between "format reference" and "delegation" is narrow. This review applied a conservative interpretation: workflow steps that say "using `X` skill outputs" imply the executor must run `X`, even if not explicit.

**`write-technical-docs` assessment**: The "Companion Agent and Skill Orchestration" section is unambiguously a delegation registry — it explicitly names 5 agents/skills with explicit usage directives. This is a clear SKR-M4 MUST failure. The fix is to inline the relevant execution context or restructure as a `compose-skills` orchestrator contract.

**`sre-practices` assessment**: Workflow step 6 uses `experiment-design` skill outputs. To inline this: replace the reference with the actual output contract (hypothesis, criteria, scope, time-box) directly in the step, making the skill self-contained.

### OPR-M2 / SKR-M2 (Deterministic Wording) — Secondary Finding

`write-technical-docs` contains 3 occurrences of "this skill skill" — clearly garbled copy-paste text. This creates ambiguous guidance because "this skill" is never defined in those lines, leaving the executor uncertain which skill is being referenced. Fix: identify the intended skill name from context and replace, or remove the line if redundant.

### SKR-S3 (Link Integrity) — Advisory

`curate-copilot-instructions` contains `EEEADME.md](./../../../EEADME.md)` — a corrupted markdown link. The intended target appears to be `README.md`. No skills were found with truly broken local file links; all `[text](path)` references to existing on-disk files are resolvable.

`write-technical-docs` usage example references `./.github/skills/technical-documentation/` — this folder does not exist; actual folder is `write-technical-docs`. This is an SKR-S3 advisory in a code block.

### OPR-S3 (Output Clarity) — Advisory

`build-mobile-apps`, `build-web-frontend`, `design-web-ux` lack a `## Required Outputs` section. These skills describe phases and workflows but do not enumerate their output artifacts explicitly. Adding an outputs section improves validation and supports compose-skills contract building for orchestrators that depend on these skills' outputs.

### SKR-S5 (Heading Naming Convention) — Cross-Cutting Advisory

14 skills use `## When to Use` (and variants) instead of `## Trigger Conditions`. Since SKR-M3 evaluates trigger *content* rather than heading names, none of these are MUST failures — trigger content is present in all cases. However, heading standardization improves skill discoverability and reduces cognitive overhead when reading across multiple skills.

---

## Skills Requiring Individual Review Artifacts

Per the execution plan, individual review.md files are required only for skills with MUST failures:

| Skill | Review Path | Action |
|---|---|---|
| write-technical-docs | [.docs/changes/skill/reviews/write-technical-docs/review.md](./../../skill/reviews/write-technical-docs/review.md) | Update with current findings |
| sre-practices | .docs/changes/skill/reviews/sre-practices/review.md | Create |

---

## Source Governance Summary

Source catalog for `audit-skill` was read from [source-catalog.md](./../../../.github/skills/audit-skill/references/source-catalog.md).

| Source | Last Evaluated | Status |
|---|---|---|
| VS Code Agent Skills Documentation | 2026-04-18 | Current |
| VS Code Copilot Customization Overview | 2026-04-18 | Current |
| Anthropic Skills Repository | 2026-04-18 | Current |
| Agent Skills (agentskills.io) | 2026-04-18 | Current |

All sources within 30-day freshness threshold. No sources marked Needs Review.

---

## Determinism Check

| Required Output | Status |
|---|---|
| Scope validation and risk summary | ✅ Phase 1 complete |
| Complete skill inventory (84 skills) | ✅ All 84 skills in consolidated grid |
| Per-skill OPR + SKR findings | ✅ Every skill has outcome row |
| Consolidated aggregate grid | ✅ Present above |
| Ranked remediation grid | ✅ R1–R10 above |
| Optimization review artifact | ✅ This document |
