# 10 · Health & Audit Overview

**Lane:** Review  
**Primary Assets:** `governance-audit`, `governance-health-overview`, `governance-summarize`, `execute-customization-audit`, `governance-briefer.agent.md`  
**Back to:** [Executive Summary](./executive-summary.md) · [INDEX](./INDEX.md)

---

## Purpose

The audit and health layer is the governance system's top tier — five skills and one agent that aggregate evidence upward through a deliberate pyramid. Each level consumes artifacts from the level below, producing progressively higher-level assessments that culminate in a single executive disposition.

---

## The Audit Pyramid

```
Level 5 — Executive Layer
  governance-briefer (agent)
  governance-summarize / execute-customization-audit
  → One-page briefing; executive aggregation report

Level 4 — Health Overview
  governance-health-overview
  → Reconciles all Level 3 outputs into unified disposition

Level 3 — Workspace Governance Audit
  governance-audit
  → Full workspace-level ranked remediation report

Level 2 — Type and Optimization Audits
  audit-customization-types + optimize-customizations
  → Cross-type interaction and authoring quality

Level 1 — Item Audits
  audit-agent / audit-instructions / audit-skill / audit-prompts
  → Per-asset quality and standards compliance
```

---

## Level 3: Workspace Governance Audit — `governance-audit`

The primary workspace-level assessment. Aggregates signals from all asset types and produces a ranked, evidence-backed remediation report.

**Trigger:** Governance posture must be assessed across agents, instructions, prompts, skills, and catalogs; periodic health check; restructuring may have introduced drift.

**Output path:** `.docs/changes/governance/audits/governance-audit.md`

### Core MUST Checks (GOV-M\*)

| Code | Check |
|---|---|
| GOV-M1 | Lane coverage — every asset has an assigned lane |
| GOV-M2 | Frontmatter validity — all assets have valid YAML frontmatter |
| GOV-M3 | Catalog integrity — no unregistered assets, no orphaned catalog rows |
| GOV-M4 | Lifecycle-governance coverage — intake present for all requests |
| GOV-M5 | Skill self-containment — no cross-skill references in SKILL.md bodies |

### Advisory Checks (GOV-S\*)

| Code | Check |
|---|---|
| GOV-S9 | Utilization coverage |
| GOV-S10 | Review recency — assets reviewed within expected cadence |
| GOV-S11 | Responsibility overlap — no overlapping ownership between agents |

### PowerShell Script Integration

All scripts located at `.github/scripts/powershell/`:

| Script | Governance Check |
|---|---|
| `get-lane-counts.ps1` | Lane coverage metrics |
| `test-catalog-integrity.ps1` | GOV-M3 — catalog sync |
| `test-frontmatter-validity.ps1` | GOV-M2 — frontmatter |
| `test-responsibility-overlap.ps1` | GOV-S11 — responsibility overlap |
| `test-naming-conformance.ps1` | Asset naming conformance |
| `test-routing-determinism.ps1` | Routing determinism |
| `test-review-recency.ps1` | GOV-S10 — review recency |
| `test-governance-must-traceability.ps1` | **Blocks report publication if fails** |
| `test-type-interaction-matrix.ps1` | TYP-M2 — interaction matrix |
| `test-governance-link-graph.ps1` | Link graph integrity |
| `test-global-applyto-rationale.ps1` | Global applyTo rationale |
| `run-full-governance-local.ps1` | Full local governance run |
| `governance-must-check-registry.json` | Registry of all MUST checks |

**Final disposition:** FAILED if any MUST check fails.

---

## Level 4: Governance Health Overview — `governance-health-overview`

The most comprehensive governance assessment — reconciles four evidence streams into one unified disposition.

**Trigger:** Comprehensive governance health needed; pre-release governance validation; multiple sub-audits completed and synthesis required.

**Output path:** `.docs/changes/governance/audits/governance-executive-audit.md`

**Script:** `invoke-governance-health-overview.ps1`

### Four Evidence Streams (all must be fresh)

| Stream | Source |
|---|---|
| 1 | Core governance artifact (`.docs/changes/governance/audits/`) |
| 2 | Skill quality aggregate (`.docs/changes/skill/reviews/`) |
| 3 | Customization quality aggregate (`.docs/changes/customization/reviews/`) |
| 4 | Optimization factor artifact (`.docs/changes/customization/reviews/`) |

**Default behavior:** Fresh run required. Do not aggregate from previously existing artifacts when reruns are possible.

### Partial-Run Decision Table

| Evidence Segments Completed | Disposition |
|---|---|
| 4 of 4 | Normal PASSED or FAILED |
| 3 of 4 | PROVISIONAL-FAILED |
| 2 of 4 | PROVISIONAL-FAILED |
| 1 of 4 | PROVISIONAL-FAILED |
| 0 of 4 | Abort — no report produced |

### Required Output Sections (in order)

1. Report Navigation Grid (Executive / Type / Item levels)
2. Coverage Grid
3. Standards Health Grid (GOV-M*, GOV-S*, GOV-SK, GOV-CUS, GOV-OPT)
4. Aggregate Metrics Grid
5. Failure Detail Grid
6. Delta vs Prior Report Grid
7. Responsibility Overlap Summary
8. Docs Corpus Hygiene Grid
9. Ranked Recommendations Grid
10. Explicit final disposition (PASSED or FAILED)

### Decision Rules

- A core governance pass does NOT override failing skill or customization quality outcomes
- Open conflict artifacts from customization review force overall FAILED
- If source artifacts disagree, prefer the latest-dated output

### PROVISIONAL-FAILED vs FAILED

| Disposition | Meaning |
|---|---|
| **FAILED** | Confirmed quality failure from completed evidence |
| **PROVISIONAL-FAILED** | Incomplete evidence — environment failure or tool blocker; cannot confirm pass |

---

## Level 5: Executive Layer

### Governance Summarize — `governance-summarize`

**Purpose:** Produce one concise, single-page governance briefing (450–700 words excluding tables) for stakeholders who need a fast readout instead of multi-file narratives.

**Output path:** `.docs/changes/governance/audits/governance-one-pager.md`

**Salience selection priority:**
1. MUST failures or unresolved conflicts
2. Repeated advisories across multiple source artifacts
3. Lane coverage or catalog integrity issues blocking delivery
4. High-impact hygiene gaps
5. Near-term corrective actions with clear owners

**Required sections:**
1. Disposition Snapshot
2. Top Salient Findings (max 5)
3. Risk and Impact
4. Decision and Action Matrix (max 5 actions)
5. Evidence Index

**Final disposition line options:** `PASSED` / `PASSED WITH ADVISORIES` / `FAILED`

---

### Execute Customization Audit — `execute-customization-audit`

**Purpose:** Produce one executive-level governance audit report by aggregating existing source audit artifacts. This skill **does not perform standalone audits** — it requires all source artifacts to pre-exist.

**Script:** `invoke-execute-customization-audit.ps1`

**Required source artifacts (all must pre-exist):**
- `.docs/changes/governance/audits/governance-audit.md`
- `.docs/changes/skill/reviews/governance-audit-types-skills.md`
- `.docs/changes/customization/reviews/governance-audit-types-customizations.md`
- `.docs/changes/customization/reviews/governance-audit-types-optimization.md`

**Output path:** `.docs/changes/governance/audits/execute-customization-audit.md`

**Mandatory standards (EXE-M\*):**

| ID | Rule |
|---|---|
| EXE-M1 | Exactly one executive report produced |
| EXE-M2 | Failure matrix near top with explicit failure reasoning |
| EXE-M3 | Any source-level Fail forces executive FAILED |
| EXE-M4 | Required section order enforced |
| EXE-M5 | Evidence links are human-readable markdown links only |

**Required output sections (in order):**
1. Executive Briefing
2. Aggregate Outcome Grid
3. Failure Matrix
4. Per-Type Results
5. Ranked Recommendations

---

### Governance Briefer Agent

The `governance-briefer` agent produces concise, evidence-linked governance briefing pages for a requested date window. It aggregates existing artifacts — it does not run fresh audits unless explicitly asked.

**Output:** `.docs/changes/governance/audits/governance-one-pager.md`

**Audience modes:** Executive, Engineering Leads, Customization Maintainers

**Sources:** `.docs/changes/` and `.github/skills/governance-audit/references/`

**Hard constraints:**
- Prefer most recent dated artifact when sources disagree
- Flag evidence drift when same-day artifacts conflict
- Never hide MUST failures or unresolved conflicts
- Keep recommendations actionable with named owner and target date

---

## Complete Violation Code Registry

| Code Prefix | Standard | Governing Skill |
|---|---|---|
| GOV-M* | Mandatory workspace governance | `governance-audit` |
| GOV-S* | Advisory workspace governance | `governance-audit` |
| GOV-SK | Skill quality aggregate | `governance-audit` |
| GOV-CUS | Customization quality aggregate | `governance-audit` |
| GOV-OPT | Optimization factor coverage | `governance-audit` |
| AGR-M* / AGR-S* | Agent governance | `audit-agent` |
| INR-M* / INR-S* | Instruction governance | `audit-instructions` |
| SKR-M* / SKR-S* | Skill governance | `audit-skill` |
| PRR-M* / PRR-S* | Prompt governance | `audit-prompts` |
| TYP-M* / TYP-S* | Cross-type governance | `audit-customization-types` |
| EXE-M* | Executive audit standards | `execute-customization-audit` |
| OPR-M* / OPR-S* | Optimization standards | `optimize-customizations` |

---

## Integration Points

| Governance Type | Connection |
|---|---|
| [Customization Types](./02-customization-types.md) | Item-level audits (Level 1) feed into this pyramid |
| [Naming & Taxonomy](./03-naming-taxonomy.md) | `test-naming-conformance.ps1` is a GOV-M check |
| [Lifecycle & Lanes](./04-lifecycle-lanes.md) | Catalog integrity (GOV-M3) is evaluated here |
| [Release Governance](./05-release.md) | Health overview includes release governance readiness in quarterly audits |
| [Cadenced Audits](./12-cadenced-audits.md) | Monthly and quarterly templates structure when this pyramid is run |
