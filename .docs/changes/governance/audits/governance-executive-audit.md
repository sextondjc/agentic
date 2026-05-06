# Governance Executive Audit: Reconciled Health Overview

| Metric | Value |
|---|---|
| Audit Date | 2026-05-06 |
| Scope | Full Workspace |
| Prior Audit | 2026-04-18 |
| Overall Disposition | **FAILED** |
| Total MUST Failures | 5 (2 distinct root causes) |
| Total SHOULD Advisories | 46 |
| Total Assets in Scope | 196 |

## Report Navigation Grid

| Level | Report | Purpose | Path |
|---|---|---|---|
| L1: Executive | This file | Reconciled health overview and final disposition | `.docs/changes/governance/audits/governance-executive-audit.md` |
| L1: Executive | Execute Customization Audit | Aggregated source audit outcomes and ranked recommendations | [execute-customization-audit.md](./execute-customization-audit.md) |
| L2: Type-level | Governance Audit | Core workspace scan — lane coverage, frontmatter, catalog, evidence | [governance-audit.md](./governance-audit.md) |
| L2: Type-level | Skill Type Audit | Per-skill quality assessment | [governance-audit-types-skills.md](./../../skill/reviews/governance-audit-types-skills.md) |
| L2: Type-level | Agent Audit | Per-agent quality assessment | [audit-agents.md](./audit-agents.md) |
| L2: Type-level | Instruction Audit | Per-instruction quality assessment | [audit-instructions.md](./audit-instructions.md) |
| L2: Type-level | Prompt Audit | Per-prompt quality assessment | [audit-prompts.md](./audit-prompts.md) |
| L2: Type-level | Cross-Type Audit | Cross-type interaction assessment | [governance-audit-types-customizations.md](./../../customization/reviews/governance-audit-types-customizations.md) |
| L2: Type-level | Optimization Audit | Scope purity, determinism, non-contradiction | [governance-audit-types-optimization-2026-05-06.md](./../../customization/reviews/governance-audit-types-optimization-2026-05-06.md) |
| L3: Domain-detail | Naming Audit | Asset naming taxonomy conformance | [audit-naming.md](./audit-naming.md) |
| L3: Domain-detail | Docs Hygiene Audit | Stale artifact identification and archive candidates | [audit-docs-hygiene.md](./audit-docs-hygiene.md) |

## Coverage Grid

| Asset Type | Registered Count | Audited | Coverage % |
|---|---:|---:|---:|
| Agents | 18 | 18 | 100% |
| Instructions | 21 | 21 | 100% |
| Prompts | 21 | 21 | 100% |
| Skills (registered) | 130 | 130 | 100% |
| Skills (unregistered/blocked) | 6 | 6 (identified, not auditable) | Blocked |
| Docs Corpus | ~180 files | ~180 | 100% |
| **Total** | **196 registered + 6 blocked** | **196** | **100%** |

## Standards Health Grid

| Standard Family | Status | Failures | Advisories |
|---|---|---:|---:|
| Governance (GOV-M*) | **FAILED** | 1 | 11 |
| Skill Quality (SKR-M*) | **FAILED** | 2 | 18 |
| Agent Quality (AGR-M*) | **FAILED** | 1 | 4 |
| Instruction Quality (INR-M*) | Pass | 0 | 5 |
| Prompt Quality (PRR-M*) | Pass | 0 | 5 |
| Cross-Type Interaction (TYP-M*) | Pass | 0 | 6 |
| Optimization (OPR-M*) | **FAILED** | 2 | 12 |
| Naming Taxonomy | Pass | 0 | 5 |
| Docs Hygiene | Pass | 0 | 4 |

## Aggregate Metrics Grid

| Metric | Count |
|---|---:|
| Source audits produced | 9 |
| Asset types covered | 4 |
| Assets in scope | 196 |
| MUST Failures | 5 |
| SHOULD Advisories | 46 |
| Open Conflicts | 0 |
| Archive Candidates | 8 |
| Removal Candidates | 0 |
| Unregistered Skills | 6 |
| Distinct Root Causes | 2 |

## Failure Detail Grid

| Failure ID | Type | Severity | Root Cause | Owner | Target |
|---|---|---|---|---|---|
| F-2026-001 | Skill Registration | **CRITICAL** | 6 capacitor skills unregistered in skill-discovery-index.md | Skills Owner | 2026-05-10 |
| F-2026-002 | Skill Description | **HIGH** | `orchestrate-capacitor` index description mismatches SKILL.md (9 vs 19 domains) | Skills Owner | 2026-05-10 |
| F-2026-003 | Agent Description | **HIGH** | `csharp-engineer` description lacks invocation conditions | Skills Owner | 2026-05-10 |
| F-2026-004 | Index Contradiction | **HIGH** | `skill-discovery-index.md` `orchestrate-capacitor` entry contradicts SKILL.md (OPR-M3) | Skills Owner | 2026-05-10 |
| F-2026-005 | Agent Determinism | **HIGH** | `csharp-engineer` description fails determinism check (OPR-M2) | Skills Owner | 2026-05-10 |

All 5 failures have a common structural cause: assets were added or modified without corresponding catalog/index updates. Enforcement of the update-in-same-change rule would prevent recurrence.

## Delta vs Prior Grid

| Metric | 2026-04-18 | 2026-05-06 | Delta | Trend |
|---|---:|---:|---:|---|
| MUST Failures | 0 | 5 | +5 | ↑ Degraded |
| SHOULD Advisories | 44 | 46 | +2 | ↑ Minor Increase |
| Source Audits | 4 | 9 | +5 | ↑ Expanded |
| Skills On Disk | 130 | 136 | +6 | ↑ Growth |
| Skills Registered | 130 | 130 | 0 | → Flat |
| Unregistered Skills | 0 | 6 | +6 | ↑ Degraded |
| Open Conflicts | 0 | 0 | 0 | → Stable |
| Archive Candidates | Unknown | 8 | — | New measure |
| Overall Disposition | PASSED | FAILED | — | ↓ Degraded |

Key insight: The workspace grew by 6 skills between audits, but the index was not updated. No new SHOULD advisory categories were introduced — the advisory delta (+2) is noise within existing categories. The regression is entirely attributable to the registration gap.

## Responsibility Overlap Summary

| Overlap Area | Involved Assets | Severity | Action |
|---|---|---|---|
| `orchestrate-capacitor` description drift | skill-discovery-index.md + orchestrate-capacitor/SKILL.md | HIGH | Fix index; verify SKILL.md is authoritative |
| `csharp-engineer` routing ambiguity | csharp-engineer.agent.md + orchestrator.agent.md | HIGH | Fix csharp-engineer description; no change to orchestrator |
| `review-project` / `review-technical-docs` trigger overlap | review-project.prompt.md + review-technical-docs.prompt.md | MEDIUM | Add explicit disambiguation clause to both descriptions |
| Global `applyTo: '**'` instruction scope | governance-release + request-economy + secure-coding | LOW | Monitor; rationale documented in each file |

## Docs Corpus Hygiene Grid

| File | Category | Action | Source |
|---|---|---|---|
| `raw-script-output.txt` | Archive Candidate | Move to archive/ | [audit-docs-hygiene.md](./audit-docs-hygiene.md) |
| `raw-script-output-post-remediation.txt` | Archive Candidate | Move to archive/ | [audit-docs-hygiene.md](./audit-docs-hygiene.md) |
| `phase-1-baseline-lock.md` | Archive Candidate | Move to archive/ | [audit-docs-hygiene.md](./audit-docs-hygiene.md) |
| `phase-1-status.md` | Archive Candidate | Move to archive/ | [audit-docs-hygiene.md](./audit-docs-hygiene.md) |
| `phase-1-audit-entry-checklist.md` | Archive Candidate | Move to archive/ | [audit-docs-hygiene.md](./audit-docs-hygiene.md) |
| `librarian-curation-report.md` | Archive Candidate | Move to archive/ or domain subdir | [audit-docs-hygiene.md](./audit-docs-hygiene.md) |
| `customization-taxonomy-promotion-changes.md` | Archive Candidate | Move to archive/ or domain subdir | [audit-docs-hygiene.md](./audit-docs-hygiene.md) |
| `ux-quality-gate-examples-index.md` | Archive Candidate | Move to domain subdir | [audit-docs-hygiene.md](./audit-docs-hygiene.md) |

No removal candidates. No empty files remain.

## Ranked Recommendations

| Rank | Priority | Recommendation | Owner | Target |
|---|---:|---|---|---|
| 1 | CRITICAL | Register 6 unregistered capacitor skills in skill-discovery-index.md | Skills Owner | 2026-05-10 |
| 2 | HIGH | Update `orchestrate-capacitor` discovery description to list all 19 sub-domains | Skills Owner | 2026-05-10 |
| 3 | HIGH | Replace `csharp-engineer` description with concrete invocation conditions | Skills Owner | 2026-05-10 |
| 4 | HIGH | Enforce update-in-same-change rule for all future skill additions | Governance Owner | 2026-05-10 |
| 5 | MEDIUM | Complete Output Contract sections for `governance-audit-types` and `governance-item-audit` prompts | Governance Owner | 2026-05-17 |
| 6 | MEDIUM | Archive 8 stale docs corpus candidates | Governance Owner | 2026-05-17 |
| 7 | MEDIUM | Relocate 3 misplaced root-level `.docs/changes/` files to domain subdirectories | Governance Owner | 2026-05-17 |
| 8 | MEDIUM | Add context qualifier to .NET-specific rules in `secure-coding.instructions.md` | Governance Owner | 2026-05-17 |
| 9 | LOW | Remove duplicate Hard Constraints in `governance-briefer.agent.md` | Skills Owner | 2026-05-24 |
| 10 | LOW | Consolidate verbosity in `governance-health-overview` and `audit-agent` SKILL.md | Skills Owner | 2026-05-24 |

## Closure Disposition

**FAILED.** The workspace cannot be promoted past review gate with open MUST failures. All 5 MUST failures trace to 2 root causes, both owned by Skills Owner, both actionable by 2026-05-10. No open cross-type conflicts block execution. Remediation is focused and low-risk.

Re-audit recommended after 2026-05-10 remediation to confirm disposition recovery.
