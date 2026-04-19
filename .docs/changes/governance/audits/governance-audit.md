# Governance Audit

| Metric | Value |
|---|---|
| Audit Date | 2026-04-19 |
| Auditor | governance-audit skill |
| Scope | Full Workspace — agents, instructions, prompts, skills, catalogs |
| Final Disposition | **FAILED** |
| MUST Failures | 1 (GOV-M3) |
| SHOULD Advisories | 9 |
| GOV-SK Outcome | Pass With Advisories |
| GOV-CUS Outcome | Pass |
| GOV-OPT Outcome | Pass With Advisories |
| Prior Audit | 2026-04-18 (Run 1) — classified all script failures as advisory |
| Delta | GOV-M2 `handoffs` finding corrected — field is valid per VS Code platform docs (audit-agent source catalog, verified 2026-04-15); GOV-M2 reduced to script-defect advisory; GOV-M3 remains MUST; source catalog freshness resolved |

---

## Asset Inventory

| Asset Type | On-Disk Count | Catalog Count | Missing From Catalog |
|---|---:|---:|---|
| Agents | 18 | 18 | 0 (script path defect; catalog present) |
| Instructions | 21 | 18 | mobile-frontend, ux-design, web-frontend |
| Prompts | 19 | 19 | 0 |
| Skills | 75 | 69 | governance-health-overview, skill-review (index only; more unlisted) |

---

## Coverage Grid by Lane

| Lane | Agent Count | Instruction Count | Skill Count | Coverage |
|---|---:|---:|---:|---|
| Planning | 5 | 5 | 26 | Full |
| Execution | 6 | 11 | 30 | Full |
| Review | 7 | 2 | 13 | Full |
| **Total** | **18** | **18** | **69** | — |

Lane coverage is balanced. All three lanes have primary-designated agents, instructions, and skills. No lane gap detected.

---

## GOV-M Standards Grid (Mandatory Checks)

| Code | Check | Script | Outcome | Severity | Findings |
|---|---|---|---|---|---|
| GOV-M1 | Lane coverage | `get-lane-counts.ps1` | **PASS** | — | Planning: 5, Execution: 6, Review: 7 — all lanes staffed |
| GOV-M2 | Frontmatter validity | `test-frontmatter-validity.ps1` | **ADVISORY** | Low | Script's `AllowedKeys` is stale — `handoffs` is a valid VS Code platform field (documented in VS Code Custom Agents docs, verified 2026-04-15 per `audit-agent` source catalog); all 18 agent files carry `handoffs` intentionally; script defect, not an agent authoring violation. Instructions: PASS. Prompts: PASS. Script remediation required (see REC-001). |
| GOV-M3 | Catalog integrity | `test-catalog-integrity.ps1` | **FAIL** | High | Instructions catalog: 3 files missing (`mobile-frontend.instructions.md`, `ux-design.instructions.md`, `web-frontend.instructions.md`); skill-discovery-index: 2 skills missing (`governance-health-overview`, `skill-review`); agents catalog: script path defect (catalog at `.github/agent-lifecycle-catalog.md`, script looks at `.github/agents/agent-lifecycle-catalog.md`) |
| GOV-M4 | Lifecycle-governance coverage | `test-governance-artifact-contract.ps1` | **PASS** | — | All four lifecycle catalogs present (agent, instruction, prompt, skill) |
| GOV-M5 | Skill self-containment | `test-utilization-coverage.ps1` (indirect) | **PASS** | — | No cross-skill invocations or required-sub-skill delegations detected; all indexed skills self-contained |

**MUST failure count: 1 (GOV-M3) → Final Disposition: FAILED**

---

## GOV-S Standards Grid (Advisory Checks)

| Code | Check | Script | Outcome | Findings |
|---|---|---|---|---|
| GOV-S1 | Lane assignment appropriateness | Catalog review | PASS | All agents carry Primary + Secondary lane; catalog entries complete |
| GOV-S2 | Agent role boundary tightness | `test-responsibility-overlap.ps1` | ADVISORY | 5 duplicate pairs; see GOV-S11 |
| GOV-S3 | Instruction applyTo specificity | `test-frontmatter-validity.ps1` | ADVISORY | 3 instructions use global `applyTo: '**'` (`governance-release`, `request-economy`, `security-and-secure-coding`); each has documented global-scope rationale |
| GOV-S4 | Skill specialization | `test-responsibility-overlap.ps1` | ADVISORY | `audit-skill` / `skill-review` overlap at similarity 1.0; boundary undefined |
| GOV-S5 | Prompt task specificity | Catalog review | PASS | 19 prompts all carry explicit task scope and lane assignment |
| GOV-S6 | Cross-type interaction coverage | Type audit evidence | PASS | GOV-CUS: Pass, no open conflicts |
| GOV-S7 | Hub file sync | `test-hub-file-sync.ps1` | ADVISORY | 3 instructions missing from hub catalog (`mobile-frontend.instructions.md`, `ux-design.instructions.md`, `web-frontend.instructions.md`) |
| GOV-S8 | Link graph integrity | `test-governance-link-graph.ps1` | ADVISORY | 575 broken links detected across 675 files (1,571 links scanned) |
| GOV-S9 | Utilization coverage | `test-utilization-coverage.ps1` | PASS | All indexed skills referenced by at least one non-self artifact |
| GOV-S10 | Review recency | `test-review-recency.ps1` | ADVISORY | No review history records found; recency threshold coverage cannot be evaluated |
| GOV-S11 | Responsibility overlap | `test-responsibility-overlap.ps1` | ADVISORY | 5 duplicate pairs: `audit-skill` ↔ `skill-review` (1.0), `audit-agent` ↔ `audit-skill` (0.95), `audit-agent` ↔ `skill-review` (0.95), `performance-research` ↔ `security-research` (0.91) |
| GOV-S* | Source catalog freshness | `test-source-catalog-freshness.ps1` | PASS | Governance-sync-customizations source catalog current; last evaluated 2026-04-07 |

**Advisory count: 7 active advisories (GOV-S2, GOV-S3, GOV-S4, GOV-S7, GOV-S8, GOV-S10, GOV-S11)**

---

## Companion Evidence Grid (GOV-SK / GOV-CUS / GOV-OPT)

| Code | Source Audit | Outcome | MUST Failures | SHOULD Advisories | Evidence |
|---|---|---|---:|---:|---|
| GOV-SK | Skill Type Audit | Pass With Advisories | 0 | 22 | [governance-audit-types-skills.md](./../../../skill/reviews/governance-audit-types-skills.md) |
| GOV-CUS | Customization Type Audit | Pass | 0 | 0 | [governance-audit-types-customizations.md](./../../../customization/reviews/governance-audit-types-customizations.md) |
| GOV-OPT | Optimization Factor Audit | Pass With Advisories | 0 | 11 | [governance-audit-types-optimization.md](./../../../customization/reviews/governance-audit-types-optimization.md) |

GOV-SK detail: 69 skills reviewed — 52 Pass, 17 Pass With Advisories. Skills with 2+ advisories: `build-mobile-apps`, `build-web-frontend`, `design-web-ux`, `skill-review`, `syrx-validation`.

---

## Delta vs Prior Audit (2026-04-18 Run 1)

| Check | Prior Outcome | Current Outcome | Change |
|---|---|---|---|
| GOV-M2 Frontmatter validity | Classified as advisory | **ADVISORY (script defect)** | `handoffs` finding retracted — field is valid per VS Code platform docs; `test-frontmatter-validity.ps1` AllowedKeys is stale |
| GOV-M3 Catalog integrity | Classified as advisory | **FAIL (MUST)** | Severity correctly escalated per SKILL.md MUST classification |
| GOV-S* Source catalog freshness | FAIL (2 violations) | **PASS** | Resolved — catalogs updated since prior run |
| GOV-S11 Responsibility overlap | Insufficient assets | **ADVISORY (5 pairs)** | New finding — sufficient assets now evaluated |
| GOV-SK Skill quality | 22 advisories | 22 advisories | No change |
| GOV-CUS Customization quality | 0 failures | 0 failures | No change |
| GOV-OPT Optimization | 11 advisories | 11 advisories | No change |

---

## Ranked Recommendations

| Rank | ID | Priority | Check | Action | Target |
|---|---|---:|---|---|---|
| 1 | REC-001 | P1 | GOV-M3 | Add `mobile-frontend.instructions.md`, `ux-design.instructions.md`, `web-frontend.instructions.md` to `instruction-lifecycle-catalog.md`; add `governance-health-overview` and `skill-review` to `skill-discovery-index.md`; fix agent catalog lookup path in `test-catalog-integrity.ps1` | Governance Owner |
| 2 | REC-002 | P2 | GOV-M2 (script defect) | Update `AllowedKeys` in `test-frontmatter-validity.ps1` for agents to include the full current VS Code platform field set: `handoffs`, `hooks`, `agents`, `model`, `user-invocable`, `disable-model-invocation`, `mcp-servers`; source: VS Code Custom Agents docs (verified 2026-04-15 in `audit-agent` source catalog) | Governance Owner |
| 3 | REC-003 | P2 | GOV-S7 | Update hub file to include the 3 missing instruction references (same as REC-002 targets); re-run `test-hub-file-sync.ps1` to verify | Governance Owner |
| 4 | REC-004 | P2 | GOV-S11 | Evaluate `audit-skill` vs `skill-review` for merger or boundary differentiation (similarity 1.0); clarify `audit-agent` vs `audit-skill` scope; evaluate `performance-research` vs `security-research` differentiation | Skills Owner |
| 5 | REC-005 | P2 | GOV-S10 | Establish review history records for tracked assets; re-run `test-review-recency.ps1` after establishing baseline review dates | Governance Owner |
| 6 | REC-006 | P3 | GOV-S8 | Investigate 575 broken links across 675 files; prioritize `.docs` cross-document link repairs; re-run `test-governance-link-graph.ps1` | Governance Owner |
| 7 | REC-007 | P3 | GOV-SK | Address 22 skill SHOULD advisories across 17 skills; prioritize skills with 2+ advisories: `build-mobile-apps`, `build-web-frontend`, `design-web-ux`, `skill-review`, `syrx-validation` | Skills Owner |
| 8 | REC-008 | P3 | GOV-OPT | Resolve 11 optimization-factor advisories; these mirror the GOV-M2/GOV-M3 failures and will auto-resolve when REC-001 and REC-002 are completed | Governance Owner |

