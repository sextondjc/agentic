# Governance Audit

| Metric | Value |
|---|---|
| Audit Date | 2026-05-06 |
| Scope | Full Workspace |
| Prior Audit | 2026-04-18 |
| Skills Inventoried | 136 (130 registered; 6 unregistered) |
| Agents Inventoried | 18 |
| Instructions Inventoried | 21 |
| Prompts Inventoried | 21 |
| MUST Failures | 1 |
| SHOULD Advisories | 11 |
| Final Disposition | FAILED |

## Lane Coverage Grid (GOV-M1)

| Lane | Agents | Instructions | Prompts | Skills | Coverage |
|---|---:|---:|---:|---:|---|
| Planning | 6 | 5 | 2 | 42 | ✓ Present |
| Execution | 8 | 13 | 12 | 72 | ✓ Present |
| Review | 4 | 3 | 7 | 22 | ✓ Present |
| **Total** | **18** | **21** | **21** | **136** | **✓ PASS** |

**GOV-M1 Result: PASS** — All three lanes are covered across all four asset types.

## Catalog Integrity Grid (GOV-M2 / GOV-M3)

| Catalog | Asset Type | Registered | Found On Disk | Orphaned | Unregistered | Result |
|---|---|---:|---:|---:|---:|---|
| agents-discovery-index.md | Agents | 18 | 18 | 0 | 0 | ✓ PASS |
| instructions-discovery-index.md | Instructions | 21 | 21 | 0 | 0 | ✓ PASS |
| prompts-discovery-index.md | Prompts | 21 | 21 | 0 | 0 | ✓ PASS |
| skills-discovery-index.md | Skills | 130 | 136 | 0 | **6** | ✗ **FAIL** |

**GOV-M2 Result: PASS** — All registered assets have valid frontmatter fields present (`name`, `description`, and `applyTo` where applicable) across agents, instructions, and prompts. Minor frontmatter quality advisories noted under GOV-S* checks.

**GOV-M3 Result: FAIL (MUST)** — 6 skills exist on disk but are NOT registered in `skills-discovery-index.md`:

| Unregistered Skill | Directory Path | Status |
|---|---|---|
| `capacitor-auth-session` | `.github/skills/capacitor-auth-session/` | Unregistered |
| `capacitor-ci-integration` | `.github/skills/capacitor-ci-integration/` | Unregistered |
| `capacitor-migration-upgrades` | `.github/skills/capacitor-migration-upgrades/` | Unregistered |
| `capacitor-observability` | `.github/skills/capacitor-observability/` | Unregistered |
| `capacitor-offline-resilience` | `.github/skills/capacitor-offline-resilience/` | Unregistered |
| `capacitor-performance-quality-gate` | `.github/skills/capacitor-performance-quality-gate/` | Unregistered |

Additionally, the `orchestrate-capacitor` skill-discovery-index description enumerates only 9 sub-domains but the skill covers 19. This description drift reduces discovery accuracy.

## Evidence Artifact Coverage (GOV-M4)

| Evidence Type | Path | Status |
|---|---|---|
| Governance audit | `.docs/changes/governance/audits/governance-audit.md` | ✓ Present |
| Executive audit | `.docs/changes/governance/audits/execute-customization-audit.md` | ✓ Present (prior 2026-04-18) |
| Skill type reviews | `.docs/changes/skill/reviews/governance-type-audit-skills.md` | ✓ Present (prior 2026-04-18) |
| Customization type audit | `.docs/changes/customization/reviews/governance-type-audit-customizations.md` | ✓ Present (prior 2026-04-18) |
| Optimization audit | `.docs/changes/customization/reviews/governance-audit-types-optimization.md` | ✓ Present (prior 2026-04-18) |
| `.docs/plans/` artifacts | `.docs/plans/` | ✓ Directory present |
| ADR artifacts | `.docs/adr/` | ✓ Directory present |

**GOV-M4 Result: PASS** — Evidence artifacts exist at canonical locations. Prior cycle evidence is dated 2026-04-18; fresh cycle artifacts being produced in this run.

## Skill Self-Containment (GOV-M5)

Sampling 10 skills across domains for cross-skill invocation violations:

| Skill | Cross-Skill Delegation Found | Result |
|---|---|---|
| governance-audit | No | ✓ PASS |
| audit-agent | No | ✓ PASS |
| audit-instructions | No | ✓ PASS |
| audit-skill | No | ✓ PASS |
| audit-prompts | No | ✓ PASS |
| optimize-customizations | No | ✓ PASS |
| execute-customization-audit | No | ✓ PASS |
| governance-health-overview | No | ✓ PASS |
| governance-summarize | No | ✓ PASS |
| prune-doc-artifacts | No | ✓ PASS |

**GOV-M5 Result: PASS** — All sampled skills are self-contained. No cross-skill invocations or delegation chains detected.

## Advisory Checks (GOV-S1 – GOV-S11)

| Check ID | Description | Result | Evidence |
|---|---|---|---|
| GOV-S1 | Frontmatter fields complete across all agents | Advisory | `csharp-engineer` description lacks explicit invocation context |
| GOV-S2 | Frontmatter fields complete across all instructions | Advisory | Prior run flagged frontmatter advisories; some instruction files rely on global `**` patterns without explicit justification comments |
| GOV-S3 | Frontmatter fields complete across all prompts | Advisory | Prior run flagged prompt frontmatter advisories; `governance-item-audit.prompt.md` description should reference skill routing explicitly |
| GOV-S4 | Frontmatter fields complete across all skills | Pass | All reviewed skills have valid YAML frontmatter |
| GOV-S5 | Broken link graph resolved | Advisory | Prior run: `link-graph` check returned non-zero. [governance-broken-links-grid.md](./governance-broken-links-grid.md) documents open broken links. Resolution status unknown since prior run. |
| GOV-S6 | Hub-sync state current | Advisory | Prior run: `hub-sync` check returned non-zero. Cross-workspace coherence not verified in this run. |
| GOV-S7 | Artifact reference hygiene normalized | Advisory | Prior run: `artifact-reference-hygiene` returned non-zero. Evidence traceability gaps persist. |
| GOV-S8 | Docs naming conventions met | Advisory | Prior run: `docs-naming` returned non-zero. Legacy `librarian-curation-report.md` and other flat-root change files violate sub-directory naming convention. |
| GOV-S9 | Utilization coverage: skills referenced by agents/prompts | Advisory | 6 unregistered capacitor skills not discoverable via catalog; `orchestrate-capacitor` description understates coverage scope. |
| GOV-S10 | Review recency within 30-day threshold | Advisory | Prior reviews dated 2026-04-18 (18 days); within threshold. Skill review artifacts for benchmark, capacitor, sveltekit families lack individual history files. |
| GOV-S11 | Responsibility overlap below threshold | Pass | Prior run showed 0 conflicts across 18 agents. No new agents added since prior run. |

## MUST Failures Summary

| Failure ID | Check | Severity | Description | Recommended Action |
|---|---|---|---|---|
| GOV-2026-M3-001 | GOV-M3 | **CRITICAL** | 6 CapacitorJS skills unregistered in skills-discovery-index.md | Register all 6 skills in skills-discovery-index.md with correct lane assignments; update orchestrate-capacitor description |

## Ranked Recommendations

| Rank | Priority | Recommendation | Owner | Target Date |
|---|---:|---|---|---|
| 1 | CRITICAL | Register 6 unregistered capacitor skills in skills-discovery-index.md and update orchestrate-capacitor description | Skills Owner | 2026-05-10 |
| 2 | HIGH | Verify governance broken-links-grid resolution; re-run link-graph check to close GOV-S5 | Governance Owner | 2026-05-10 |
| 3 | HIGH | Run hub-sync check and restore cross-workspace coherence (GOV-S6) | Governance Owner | 2026-05-10 |
| 4 | MEDIUM | Update `csharp-engineer` agent description to include explicit invocation context (GOV-S1) | Skills Owner | 2026-05-17 |
| 5 | MEDIUM | Normalize `governance-briefer.agent.md` duplicate Hard Constraints section (GOV-S1) | Skills Owner | 2026-05-17 |
| 6 | MEDIUM | Resolve artifact-reference-hygiene and docs-naming advisories from prior run (GOV-S7, GOV-S8) | Governance Owner | 2026-05-17 |
| 7 | LOW | Add individual skill history files for benchmark, capacitor, sveltekit families to restore review recency tracking (GOV-S10) | Skills Owner | 2026-05-24 |

## Delta vs Prior (2026-04-18)

| Metric | Prior | Current | Delta | Trend |
|---|---:|---:|---:|---|
| MUST Failures | 0 | 1 | +1 | Increase |
| SHOULD Advisories | 11 | 11 | 0 | Flat |
| Skills Registered | 130 | 130 | 0 | Flat |
| Skills On Disk | 130 | 136 | +6 | Increase |
| Unregistered Skills | 0 | 6 | +6 | Increase |
| Agents | 18 | 18 | 0 | Flat |
| Instructions | 21 | 21 | 0 | Flat |
| Prompts | 19 | 21 | +2 | Increase |
| Disposition | PASSED | FAILED | — | Degraded |
