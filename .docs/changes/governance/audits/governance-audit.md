# Governance Audit

| Metric | Value |
|---|---|
| Audit Date | 2026-04-25 |
| Auditor | governance-audit skill (full scope) |
| Scope Filter | all |
| Final Disposition | PASS WITH ADVISORIES |
| MUST Failures | 0 |
| SHOULD Advisories | 2 |
| GOV-SK Outcome | Pass With Advisories |
| GOV-CUS Outcome | Pass |
| GOV-OPT Outcome | Pass With Advisories |

## Evidence Bundle

| Evidence | Result |
|---|---|
| get-lane-counts.ps1 (agents, instructions, prompts, skills) | Executed |
| test-catalog-integrity.ps1 (agents, instructions, prompts, skills) | Agents Pass, Instructions Pass, Prompts Pass, Skills Pass |
| test-frontmatter-validity.ps1 (agents, instructions, prompts) | Pass with advisory warnings on global applyTo use |
| test-hub-file-sync.ps1 | Pass |
| test-governance-link-graph.ps1 | Fail (advisory control) |
| test-governance-artifact-contract.ps1 | Pass |
| test-utilization-coverage.ps1 | Pass |
| test-review-recency.ps1 | Pass |
| test-source-catalog-freshness.ps1 | Pass |
| test-responsibility-overlap.ps1 | Pass |
| test-governance-optimization-factor.ps1 | Pass |
| Companion evidence | [governance-type-audit-skills.md](../../../skill/reviews/governance-type-audit-skills.md), [governance-type-audit-customizations.md](../../../customization/reviews/governance-type-audit-customizations.md), [governance-type-audit-optimization.md](../../../customization/reviews/governance-type-audit-optimization.md) |

## Asset Inventory

| Asset Type | On-Disk Count | Catalog Integrity | Evidence |
|---|---:|---|---|
| Agents | 18 | Pass | test-catalog-integrity.ps1 -AssetType agents |
| Instructions | 21 | Pass | test-catalog-integrity.ps1 -AssetType instructions |
| Prompts | 21 | Pass | test-catalog-integrity.ps1 -AssetType prompts |
| Skills | 145 | Pass | test-catalog-integrity.ps1 -AssetType skills |

## Coverage Grid by Lane

| Lane | Agents | Instructions | Prompts | Skills | Coverage Outcome |
|---|---:|---:|---:|---:|---|
| Planning | 5 | 5 | 0 | 33 | Covered |
| Execution | 6 | 16 | 10 | 76 | Covered |
| Review | 7 | 0 | 11 | 35 | Covered |

Lane coverage passes globally: all three lanes are represented.

## GOV-M Standards Grid (Mandatory)

| Code | Check | Evidence | Outcome | Severity | Findings |
|---|---|---|---|---|---|
| GOV-M1 | Lane coverage | get-lane-counts.ps1 | PASS | None | Planning, Execution, and Review lanes all present. |
| GOV-M2 | Frontmatter validity | test-frontmatter-validity.ps1 | PASS | None | Agents, instructions, and prompts pass. Global applyTo warnings are advisory and documented. |
| GOV-M3 | Catalog integrity | test-catalog-integrity.ps1 | PASS | None | Skills slice now passes after restoring build-mobile-apps skill artifact and catalog entry. |
| GOV-M4 | Lifecycle-governance coverage | test-governance-artifact-contract.ps1, test-hub-file-sync.ps1 | PASS | None | Artifact contract and hub synchronization checks pass. |
| GOV-M5 | Skill self-containment | test-utilization-coverage.ps1 plus direct cross-skill link scan | PASS | None | No direct cross-SKILL.md delegation references detected by focused scan; utilization coverage check passes. |

Final mandatory outcome: PASS (no MUST control failures).

## GOV-S Standards Grid (Advisory)

| Code | Check | Evidence | Outcome | Findings |
|---|---|---|---|---|
| GOV-S1 | Lane assignment appropriateness | get-lane-counts.ps1 | PASS | Lane distribution is present and non-degenerate across asset types. |
| GOV-S2 | Agent role boundary tightness | test-responsibility-overlap.ps1 | PASS | Duplicate pair count is 0 at configured threshold. |
| GOV-S3 | Instruction applyTo specificity | test-frontmatter-validity.ps1 -AssetType instructions | ADVISORY | Three instructions use global applyTo with rationale, which remains acceptable but broad. |
| GOV-S4 | Skill specialization | test-responsibility-overlap.ps1 | PASS | No overlap threshold breach reported. |
| GOV-S5 | Prompt task specificity | test-frontmatter-validity.ps1 -AssetType prompts | PASS | Prompts pass frontmatter validation. |
| GOV-S6 | Cross-type interaction coverage | Companion GOV-CUS evidence | PASS | Customization type audit reports Pass and zero open conflicts. |
| GOV-S7 | Hub file sync | test-hub-file-sync.ps1 | PASS | Hub sync passes. |
| GOV-S8 | Link graph integrity | test-governance-link-graph.ps1 | ADVISORY | 97 broken links across 1768 checked links in 865 files after targeted cluster remediation. |
| GOV-S9 | Utilization coverage | test-utilization-coverage.ps1 | PASS | All indexed skills referenced by at least one non-self artifact. |
| GOV-S10 | Review recency threshold coverage | test-review-recency.ps1 | PASS | All 123 tracked artifacts reviewed within 28 days. |
| GOV-S11 | Responsibility overlap threshold coverage | test-responsibility-overlap.ps1 | PASS | Overlap gate passes with zero duplicates. |

## Source Catalog Freshness (Required)

| Catalog | Last Evaluated | Status | Evidence |
|---|---|---|---|
| .github/skills/sync-customizations/references/source-catalog.md | 2026-04-07 | Current | test-source-catalog-freshness.ps1 |
| .github/skills/sync-skills/references/source-catalog.md | 2026-04-12 | Current | test-source-catalog-freshness.ps1 |

Freshness threshold drift was not detected.

## Companion Evidence Grid (GOV-SK, GOV-CUS, GOV-OPT)

| Code | Source Audit | Outcome | MUST Failures | SHOULD Advisories | Evidence |
|---|---|---|---:|---:|---|
| GOV-SK | Skill Type Audit | Pass With Advisories | 0 | 22 | [governance-type-audit-skills.md](../../../skill/reviews/governance-type-audit-skills.md) |
| GOV-CUS | Customization Type Audit | Pass | 0 | 0 | [governance-type-audit-customizations.md](../../../customization/reviews/governance-type-audit-customizations.md) |
| GOV-OPT | Optimization Factor Audit | Pass With Advisories | 0 | 11 | [governance-type-audit-optimization.md](../../../customization/reviews/governance-type-audit-optimization.md) |

## Ranked Recommendations

| Rank | Priority | Code(s) | Recommendation | Evidence |
|---|---:|---|---|---|
| 1 | P1 | GOV-M3 | Completed: restored build-mobile-apps skill artifact and index entry; catalog-integrity skills check now passes. | test-catalog-integrity.ps1 -AssetType skills, .github/skills/build-mobile-apps, .github/skills/skill-discovery-index.md |
| 2 | P2 | GOV-S8 | In progress: reduced broken links from 121 to 97 by fixing aggregate report and template link clusters; continue with remaining history/reference targets. | test-governance-link-graph.ps1 (97 issues), .docs/changes/governance/audits/execute-customization-audit.md, .docs/changes/governance/audits/governance-executive-audit.md, .github/skills/execute-customization-audit/references/execute-customization-audit-report-template.md |
| 3 | P2 | GOV-SK, GOV-OPT | Execute focused remediation for companion advisories (22 skill advisories, 11 optimization advisories) and publish updated aggregate outcomes. | governance-type-audit-skills.md, governance-type-audit-optimization.md |
| 4 | P3 | GOV-S3 | Keep global applyTo usage under periodic review and narrow scope where practical without violating policy intent. | test-frontmatter-validity.ps1 -AssetType instructions |

## Final Disposition

PASS WITH ADVISORIES.

