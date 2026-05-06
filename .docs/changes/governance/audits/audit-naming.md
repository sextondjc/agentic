# Audit: Asset Naming and Taxonomy

| Metric | Value |
|---|---|
| Audit Date | 2026-05-06 |
| Scope | All agents, instructions, prompts, skills in workspace |
| Total Assets Assessed | 196 (18 agents + 21 instructions + 21 prompts + 136 skills) |
| Naming Violations | 3 |
| Vocabulary Drift Signals | 4 |
| MUST Failures | 0 |
| SHOULD Advisories | 7 |
| Final Disposition | PASS WITH ADVISORIES |

## Naming Taxonomy Assessment Grid

| Layer | Assets Checked | Violations | Advisory | Pass Rate |
|---|---:|---:|---:|---|
| Type (path + extension) | 196 | 0 | 0 | 100% |
| Lane (catalog assignment) | 196 | 0 | 2 | 99% |
| Domain (noun classification) | 196 | 0 | 3 | 98.5% |
| Function (verb vocabulary) | 196 | 0 | 4 | 98% |

**Result: All assets pass structural naming checks. Advisories only.**

## Canonical Naming Map (Drift Signals)

| Asset | Current Name | Canonical Expectation | Layer | Finding |
|---|---|---|---|---|
| `.docs/changes/librarian-curation-report.md` | `librarian-curation-report.md` | Should reside under `.docs/changes/governance/` or `.docs/changes/librarian/` | Domain | File is in root of `.changes/` against naming convention |
| `.docs/changes/customization-taxonomy-promotion-changes.md` | `customization-taxonomy-promotion-changes.md` | Should reside under `.docs/changes/customization/` subdirectory | Domain | File in root of `.changes/` instead of subdirectory |
| `.docs/changes/ux-quality-gate-examples-index.md` | `ux-quality-gate-examples-index.md` | Should reside under `.docs/changes/ux/` or `.docs/changes/web-ux/` | Domain | File in root of `.changes/` |
| `skills-discovery-index.md` | Flat file in `.github/skills/` | Correct per convention (governance doc, not a skill) | — | No action needed — correctly placed |

## Vocabulary Drift Signals Table

| Asset | Asset Type | Lane Assignment | Lead Verb/Noun | Expected Vocabulary | Drift Signal |
|---|---|---|---|---|---|
| `curate-copilot-instructions` (skill) | Skill | Execution | `curate-` | Execution vocab ✓ | No drift |
| `prune-doc-artifacts` (skill) | Skill | Review | `prune-` | Review: `assess`, `audit`, `review`, `evaluate` | Minor drift: "prune" is an execution verb assigned to a Review-primary skill |
| `prune-sync-assets` (skill) | Skill | Execution | `prune-` | Execution vocab ✓ | No drift |
| `delivery-status-grid` (skill) | Skill | Review | `delivery-` + `status-` | Review: `assess`, `report`, `evaluate` | Minor drift: "delivery" noun paired with "status" in a Review lane skill |
| `current-test-coverage` (skill) | Skill | Review | `current-` | Review: `assess`, `report`, `evaluate` | Minor drift: "current" adjective is unconventional as a skill name lead; not a verb or noun |

## SHOULD Advisories Detail

### NMG-S-001 — Three `.docs/changes/` Root Files Violate Subdirectory Convention

**Severity:** MEDIUM  
**Check:** Docs naming convention (GOV-S8 carryover).  
**Files:**
- `.docs/changes/librarian-curation-report.md`
- `.docs/changes/customization-taxonomy-promotion-changes.md`
- `.docs/changes/ux-quality-gate-examples-index.md`

**Finding:** These files sit in the root of `.docs/changes/` rather than under a domain subdirectory (e.g., `.docs/changes/governance/`, `.docs/changes/customization/`, `.docs/changes/ux/`). This violates the corpus hierarchy convention that keeps change tracking artifacts organized by domain.  
**Recommendation:** Move files to appropriate subdirectories; update any cross-references before moving.

### NMG-S-002 — `prune-doc-artifacts` Vocabulary Drift

**Severity:** LOW  
**Check:** Function vocabulary alignment.  
**Finding:** `prune-` is an execution-lane verb (destructive/cleanup action) but the skill is assigned to the Review primary lane. The skill body is clearly a review/discovery skill (produces a candidate list, no deletions). The lane assignment is correct; the name is the drift signal.  
**Recommendation:** No rename required given established usage, but document the vocabulary exception in `lane-intent.md` to prevent future confusion.

### NMG-S-003 — `current-test-coverage` Non-Standard Lead Adjective

**Severity:** LOW  
**Check:** Function vocabulary alignment.  
**Finding:** Skills conventionally start with a verb (`audit-`, `build-`, `design-`, `execute-`) or a noun domain (`governance-`, `sql-`, `csharp-`). `current-` is an adjective that signals context rather than function, making this skill harder to discover via vocabulary-based scanning.  
**Recommendation:** Consider renaming to `assess-test-coverage` or `report-test-coverage` in a future taxonomy normalization pass. Document current name exception in `lane-intent.md`.

### NMG-S-004 — `orchestrate-capacitor` Index Description Does Not Match Skill Coverage

**Severity:** MEDIUM  
**Check:** Domain classification completeness (repeated from GOV-S9 / SKR-M-002).  
**Finding:** The skill-discovery-index entry for `orchestrate-capacitor` lists 9 sub-domains. The SKILL.md and the 19 individual capacitor sub-skills collectively cover auth/session, offline, CI, observability, performance, migration, and more. This mismatch breaks discovery for those 6+ domains.  
**Recommendation:** Update the `orchestrate-capacitor` index description to enumerate all 19 sub-domain triggers (or use a "…and more" pattern with a link to the SKILL.md).

### NMG-S-005 — `.docs/changes/web-ux-quality-gate-example/` and `.docs/changes/web-ux-quality-gate-full-example/` Directory Placement

**Severity:** LOW  
**Check:** Domain classification — example directories.  
**Finding:** Two example directories sit directly under `.docs/changes/` rather than under a domain-specific path like `.docs/changes/ux/examples/`. This is minor but creates corpus clutter.  
**Recommendation:** Move to `.docs/changes/ux/examples/` or `.docs/examples/web-ux-quality-gate/` during the next librarian pass.
