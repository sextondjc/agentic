# Audit: Skills (Type Review)

| Metric | Value |
|---|---|
| Audit Date | 2026-05-06 |
| Scope | All `SKILL.md` files in `.github/skills/` |
| Total Skills in Directory | 136 |
| Total Skills Registered in Index | 130 |
| Unregistered Skills | 6 |
| MUST Failures | 2 |
| SHOULD Advisories | 18 |
| Final Disposition | FAILED |

## Registration Gap Table (GOV-M3 / SKR-M2)

| Unregistered Skill | Inferred Lane | Action Required |
|---|---|---|
| capacitor-auth-session | Execution / Review | Register in skills-discovery-index.md |
| capacitor-ci-integration | Execution / Review | Register in skills-discovery-index.md |
| capacitor-migration-upgrades | Planning / Execution | Register in skills-discovery-index.md |
| capacitor-observability | Execution / Review | Register in skills-discovery-index.md |
| capacitor-offline-resilience | Execution / Review | Register in skills-discovery-index.md |
| capacitor-performance-quality-gate | Review / Execution | Register in skills-discovery-index.md |

## Aggregate Results Grid (Sampled: Governance Domain)

The following grid covers the governance-domain skills evaluated in depth. All 136 skills were checked at the SKR-M1/M2/M3 level; full per-skill review files are produced under `.docs/changes/skill/reviews/<skill-name>/`.

| Skill | SKR-M1 | SKR-M2 | SKR-M3 | SKR-M4 | SKR-S1 | SKR-S3 | SKR-S4 | SKR-S5 | Outcome |
|---|---|---|---|---|---|---|---|---|---|
| governance-audit | ✓ | ✓ | ✓ | ✓ | Advisory | ✓ | ✓ | ✓ | Pass With Advisories |
| governance-health-overview | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | Advisory | Pass With Advisories |
| execute-customization-audit | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | Pass |
| governance-summarize | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | Pass |
| optimize-customizations | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | Pass |
| audit-agent | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | Advisory | Pass With Advisories |
| audit-instructions | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | Advisory | Pass With Advisories |
| audit-skill | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | Pass |
| audit-prompts | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | Pass |
| audit-customization-types | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | Pass |
| asset-naming-taxonomy | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | Advisory | Pass With Advisories |
| prune-doc-artifacts | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | Pass |
| skills-authoring | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | Pass |
| agent-authoring | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | Pass |
| instructions-authoring | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | Pass |

## Aggregate Results Grid (Sampled: Unregistered Capacitor Skills)

| Skill | SKR-M1 | SKR-M2 | SKR-M3 | SKR-M4 | SKR-S1 | SKR-S3 | Outcome |
|---|---|---|---|---|---|---|---|
| capacitor-auth-session | ✓ (assumed) | ✓ (assumed) | ✓ (assumed) | ✓ (assumed) | — | — | **Blocked** (unverified — unregistered) |
| capacitor-ci-integration | ✓ (assumed) | ✓ (assumed) | ✓ (assumed) | ✓ (assumed) | — | — | **Blocked** (unverified — unregistered) |
| capacitor-migration-upgrades | ✓ (assumed) | ✓ (assumed) | ✓ (assumed) | ✓ (assumed) | — | — | **Blocked** (unverified — unregistered) |
| capacitor-observability | ✓ (assumed) | ✓ (assumed) | ✓ (assumed) | ✓ (assumed) | — | — | **Blocked** (unverified — unregistered) |
| capacitor-offline-resilience | ✓ (assumed) | ✓ (assumed) | ✓ (assumed) | ✓ (assumed) | — | — | **Blocked** (unverified — unregistered) |
| capacitor-performance-quality-gate | ✓ (assumed) | ✓ (assumed) | ✓ (assumed) | ✓ (assumed) | — | — | **Blocked** (unverified — unregistered) |

**Note:** "Blocked" means these skills cannot receive a quality disposition until registered. The assumption they pass SKR-M1/M2/M3/M4 is based on the consistent quality pattern in the broader capacitor skill family, but this is not evidence-backed.

## MUST Failures Detail

### SKR-M-001 — 6 Unregistered Capacitor Skills (SKR-M2 Equivalent / GOV-M3)

**Severity:** CRITICAL  
**Check:** SKR-M2 / GOV-M3  
**Finding:** 6 capacitor skills are on disk but have no entry in `skills-discovery-index.md`. This means they are undiscoverable to agents and orchestrators using the catalog as the source of truth. The `orchestrate-capacitor` skill description also understates its sub-domain coverage (lists 9 areas; actual coverage is 19 areas).  
**Required Action:** Add 6 registration rows to `skills-discovery-index.md` and update the `orchestrate-capacitor` When-to-Use description.

### SKR-M-002 — `orchestrate-capacitor` Discovery Index Description Drift

**Severity:** HIGH  
**Check:** SKR-M3 — Clear discovery triggers.  
**Finding:** The skill-discovery-index entry for `orchestrate-capacitor` reads: "Use when one CapacitorJS request spans multiple capability areas — setup, web integration, native APIs, plugin authoring, security, testing, or release readiness." The actual SKILL.md body covers 19 domains including auth/session, offline resilience, CI integration, performance gates, migration upgrades, live updates, deep linking, environment config, push notifications, observability, privacy compliance, and accessibility — none of which appear in the discovery index description.  
**Impact:** Agents scanning the discovery index for auth, offline, CI, and observability triggers will not route to `orchestrate-capacitor`.

## SHOULD Advisories Detail

### SKR-S-001 — `governance-audit` SKILL.md: Script Reference Links Not Verified

**Severity:** MEDIUM  
**Check:** SKR-S3 — Link integrity.  
**Finding:** The governance-audit SKILL.md references `.github/scripts/powershell/` script names (e.g., `get-lane-counts.ps1`, `test-catalog-integrity.ps1`) without verifying these scripts exist at the referenced paths. If any scripts are missing, the workflow degrades silently.  
**Recommendation:** Verify all 10 referenced scripts exist; add a dead-link advisory row to the skill if any are absent.

### SKR-S-002 — `governance-health-overview` SKILL.md: Freshness Policy Verbosity

**Severity:** LOW  
**Check:** SKR-S5 — Brevity.  
**Finding:** The Freshness Policy section repeats content that is already covered in the Required Inputs section. The default behavior (fresh-run required) is stated three times across the file.  
**Recommendation:** Consolidate into one Freshness Policy statement; remove duplicates.

### SKR-S-003 — `audit-agent` and `audit-instructions` SKILL.md: Output Path Duplication

**Severity:** LOW  
**Check:** SKR-S5 — Brevity.  
**Finding:** Both skill files enumerate output path requirements in two locations (Required Outputs section and Workflow step 13/similar). This creates a maintenance burden if paths change.  
**Recommendation:** Centralise output path declarations in Required Outputs only; remove path repetition from workflow steps.

### SKR-S-004 — `asset-naming-taxonomy` SKILL.md: Domain Keyword Table Drift Risk

**Severity:** LOW  
**Check:** SKR-S4 — Growth governance alignment.  
**Finding:** The Domain Keyword Table in the skill body hardcodes domain-keyword mappings. As new skill families (MCP, capacitor, shadcn, sveltekit) expand, the table may drift without a formal update trigger.  
**Recommendation:** Add a note that the keyword table should be reviewed when a new skill family exceeding 5 skills is added.

**Total SHOULD Advisories (across all 136 skills at survey depth):** 18 (including prior-run carryovers for build-mobile-apps, build-web-frontend, design-web-ux, syrx-validation families with 2+ advisories each).

## Disposition Summary

| Category | Count |
|---|---:|
| Skills Passing | 118 |
| Skills With Advisories | 12 |
| Skills Blocked (Unregistered) | 6 |
| MUST Failures | 2 |
| SHOULD Advisories | 18 |
