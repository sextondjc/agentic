# Governance Audit

| Metric | Value |
|---|---|
| Audit Date | 2026-04-25 |
| Auditor | governance-audit skill |
| Scope | Post-remediation refresh including REC-002 closure |
| Required Script Set | Targeted revalidation executed for remediated controls and deferred catalog fixes |
| Final Disposition | **PASS WITH ADVISORIES** |
| MUST Failures | 0 |
| SHOULD Advisories | 2 |
| GOV-SK Outcome | Pass With Advisories |
| GOV-CUS Outcome | Pass |
| GOV-OPT Outcome | Pass With Advisories |
| Prior Audit | 2026-04-19 |

## Evidence Bundle

| Artifact | Purpose |
|---|---|
| [raw-script-output.txt](./raw-script-output.txt) | Full script outputs and exit codes for all required checks |
| [raw-script-output-post-remediation.txt](./raw-script-output-post-remediation.txt) | Post-remediation validation outputs and exit codes for applied recommendations |
| [governance-type-audit-skills.md](./../../../skill/reviews/governance-type-audit-skills.md) | GOV-SK companion outcome evidence |
| [governance-type-audit-customizations.md](./../../../customization/reviews/governance-type-audit-customizations.md) | GOV-CUS companion outcome evidence |
| [governance-type-audit-optimization.md](./../../../customization/reviews/governance-type-audit-optimization.md) | GOV-OPT companion outcome evidence |

## Asset Inventory

| Asset Type | On-Disk Count | Catalog Integrity Result | Evidence |
|---|---:|---|---|
| Agents | 18 | Pass | `test-catalog-integrity:agents` |
| Instructions | 21 | Pass | `test-catalog-integrity:instructions` |
| Prompts | 21 | Pass | `test-catalog-integrity:prompts`, `test-hub-file-sync` |
| Skills | 121 | Pass | `test-catalog-integrity:skills` |

## Coverage Grid by Lane

| Lane | Agents | Instructions | Prompts | Skills | Coverage Outcome |
|---|---:|---:|---:|---:|---|
| Planning | 5 | 4 | 0 | 28 | Covered |
| Execution | 6 | 14 | 9 | 65 | Covered |
| Review | 7 | 0 | 11 | 27 | Covered |

Lane evidence from `get-lane-counts.ps1` indicates all three lanes are represented across the full workspace corpus.

## GOV-M Standards Grid (Mandatory)

| Code | Check | Evidence | Outcome | Severity | Findings |
|---|---|---|---|---|---|
| GOV-M1 | Lane coverage | `get-lane-counts.ps1` | **PASS** | — | All lanes represented (Planning, Execution, Review). |
| GOV-M2 | Frontmatter validity | `test-frontmatter-validity.ps1` | **PASS** | — | Prompts, agents, and instructions all pass. Instruction global `applyTo` warnings remain advisory and intentional per policy rationale. |
| GOV-M3 | Catalog integrity | `test-catalog-integrity.ps1` | **PASS** | — | Agents, instructions, prompts, and skills all pass after REC-002 catalog path and lifecycle catalog updates. |
| GOV-M4 | Lifecycle-governance coverage | `test-governance-artifact-contract.ps1` | **PASS** | — | Artifact contract check passes. |
| GOV-M5 | Skill self-containment | `test-utilization-coverage.ps1` + spot inspection | **PASS** | — | No script-reported utilization/self-containment violation in this run. |

**MUST failure count: 0 -> Final Disposition: PASS WITH ADVISORIES**

## GOV-S Standards Grid (Advisory)

| Code | Check | Evidence | Outcome | Findings |
|---|---|---|---|---|
| GOV-S1 | Lane assignment appropriateness | `get-lane-counts.ps1` + catalog spot-check | PASS | Lane assignments produce balanced global lane coverage. |
| GOV-S2 | Agent role boundary tightness | `test-responsibility-overlap.ps1` | PASS | No agent-agent duplicate pairs surfaced above threshold in this run. |
| GOV-S3 | Instruction applyTo specificity | `test-frontmatter-validity:instructions` | ADVISORY | 3 global `applyTo: '**'` warnings (`governance-release`, `request-economy`, `secure-coding`), each with rationale in file body. |
| GOV-S4 | Skill specialization | `test-responsibility-overlap.ps1` | PASS | Remediation applied to overlap pairs; duplicate pair count is now 0 at threshold 0.85. |
| GOV-S5 | Prompt task specificity | `test-frontmatter-validity:prompts` + prompt catalog review | PASS | Prompt frontmatter and prompt lifecycle catalog alignment both pass in this run. |
| GOV-S6 | Cross-type interaction coverage | companion GOV-CUS evidence | PASS | Customization type audit outcome is Pass with 0 open conflicts. |
| GOV-S7 | Hub file sync | `test-hub-file-sync.ps1` | PASS | Hub file sync passes; prompt and instruction catalogs match assets. |
| GOV-S8 | Link graph integrity | `test-governance-link-graph.ps1` | ADVISORY | Reduced from 645 to 123 broken links across 1,699 checked links (794 files scanned) after targeted cluster burn-down. |
| GOV-S9 | Utilization coverage | `test-utilization-coverage.ps1` | PASS | Script exits cleanly with no violations reported. |
| GOV-S10 | Review recency threshold coverage | `test-review-recency.ps1` | PASS | Discovery contract updated; review records are found and all tracked artifacts are current within 90 days. |
| GOV-S11 | Responsibility overlap threshold | `test-responsibility-overlap.ps1` | PASS | Duplicate pair count = 0 (threshold 0). |

## Source Catalog Freshness (Required)

| Catalog | Source Family | Last Evaluated | Status |
|---|---|---|---|
| `.github/skills/sync-customizations/references/source-catalog.md` | Customizations sources | 2026-04-07 | Current |
| `.github/skills/sync-skills/references/source-catalog.md` | Skills sources | 2026-04-12 | Current |

Freshness evidence from `test-source-catalog-freshness.ps1` shows no threshold drift.

## Companion Evidence Grid (GOV-SK / GOV-CUS / GOV-OPT)

| Code | Source Audit | Outcome | MUST Failures | SHOULD Advisories | Evidence |
|---|---|---|---:|---:|---|
| GOV-SK | Skill Type Audit | Pass With Advisories | 0 | 22 | [governance-type-audit-skills.md](./../../../skill/reviews/governance-type-audit-skills.md) |
| GOV-CUS | Customization Type Audit | Pass | 0 | 0 | [governance-type-audit-customizations.md](./../../../customization/reviews/governance-type-audit-customizations.md) |
| GOV-OPT | Optimization Factor Audit | Pass With Advisories | 0 | 11 | [governance-type-audit-optimization.md](./../../../customization/reviews/governance-type-audit-optimization.md) |

## Ranked Recommendations

| Rank | ID | Priority | Mapped Check(s) | Recommendation | Status | Evidence |
|---|---|---:|---|---|---|
| 1 | REC-001 | P1 | GOV-M2 | Remove or formally register prompt frontmatter key `argument-hint` in `test-frontmatter-validity.ps1` contract; align prompt metadata to validator schema. | Completed | `test-frontmatter-validity:prompts` |
| 2 | REC-002 | P1 | GOV-M3, GOV-S7 | Fix agent catalog path in `test-catalog-integrity.ps1` to `.github/agent-lifecycle-catalog.md`; add missing instruction and prompt entries to lifecycle catalogs. | Completed | `test-catalog-integrity:*`, `test-hub-file-sync` |
| 3 | REC-003 | P2 | GOV-M3 | Add missing skill `governance-health-overview` to [skill-discovery-index.md](../../../../.github/skills/skill-discovery-index.md). | Completed | `test-catalog-integrity:skills` |
| 4 | REC-004 | P2 | GOV-S8 | Prioritize top broken-link clusters for repair: taxonomy review docs, skill history links, and template placeholders. | Partial (burn-down executed) | `test-governance-link-graph` |
| 5 | REC-005 | P2 | GOV-S11, GOV-S4 | Define tighter specialization boundaries for overlap pairs (`audit-*` family and `performance-research` vs `security-research`) and re-run overlap check. | Completed | `test-responsibility-overlap` |
| 6 | REC-006 | P3 | GOV-S10 | Validate `test-review-recency.ps1` discovery path/contract against existing history artifacts and update script logic if necessary. | Completed | `test-review-recency` |
| 7 | REC-007 | P3 | GOV-SK, GOV-OPT | Execute targeted advisory burn-down on companion audit advisories (22 skill advisories, 11 optimization advisories) after P1/P2 governance fixes. | In progress (governance advisory burn-down applied; companion bundles still open) | companion evidence grid |

## Post-Remediation Delta (This Session)

| Control | Before | After | Delta |
|---|---:|---:|---:|
| GOV-M2 (frontmatter) | Fail | Pass | +1 control cleared |
| GOV-M3 skills slice | Fail | Pass | +1 catalog slice cleared |
| GOV-M3 remaining slices (agents/instructions/prompts) | Fail | Pass | +3 catalog slices cleared |
| GOV-S11 (overlap) | 3 duplicate pairs | 0 duplicate pairs | -3 |
| GOV-S10 (review recency) | No records found | Pass | Contract fixed |
| GOV-S8 (link graph) | 645 broken links | 123 broken links | -522 |

Residual work is limited to advisory burn-down tracked under REC-004 and REC-007.

