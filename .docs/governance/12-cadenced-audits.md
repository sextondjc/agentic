# 12 · Cadenced Audits

**Lane:** Review  
**Primary Assets:** `monthly-light-audit-template.md`, `quarterly-full-audit-template.md`  
**Location:** `.docs/changes/governance/`  
**Back to:** [Executive Summary](./executive-summary.md) · [INDEX](./INDEX.md)

---

## Purpose

Provide structured, recurring audit templates that schedule when the full governance audit pyramid is run and what evidence is required at each cadence. Without scheduled cadence, governance assessments happen reactively — only before releases or after problems emerge. Cadenced audits shift governance to a proactive, predictable discipline.

---

## Two Cadences

### Monthly: Light Audit

**Frequency:** Every month  
**Scope:** Recent changes only — new or renamed assets, catalog sync, link integrity, orphan candidates  
**Duration:** Lightweight by design; expected to be completable in a single session

**Template covers:**

| Section | Content |
|---|---|
| New or renamed customization assets | Any create/rename/delete since last audit |
| Catalog sync drift | Are all new assets registered? Are all deleted assets removed? |
| `.docs` orphan candidates | Documents with no inbound references |
| Link integrity | Broken or placeholder markdown links |
| Findings | Severity, evidence reference, responsible asset |
| Candidate actions | Duplicate / Redundant / Misplaced / Orphan |
| Disposition | Pass / Pass with advisories / Fail |
| Named approvals with timestamps | At least one named, dated approver |

**Disposition options:**

| Disposition | Meaning |
|---|---|
| Pass | All checks clear; no action required |
| Pass with advisories | Advisory findings present; tracked but non-blocking |
| Fail | One or more mandatory check failures; action required before next cadence |

---

### Quarterly: Full Audit

**Frequency:** Every quarter  
**Scope:** Complete governance pyramid — all four evidence streams, all types, plus release readiness  
**Duration:** Multi-session; coordinates multiple skills

**Template covers:**

| Section | Skill / Check |
|---|---|
| Type-level customization audit | `audit-customization-types` |
| Optimization and drift audit | `optimize-customizations` |
| `.docs` retention and curation audit | `prune-doc-artifacts` |
| Link-integrity validation | `test-governance-link-graph.ps1` |
| Remediation backlog prioritization | Ranked findings from prior audits |
| Standards outcome grid | TYP-M* and OPR-M* checks |
| **Release Governance Readiness** | Evidence bundle, approval chain, rollback owner, release notes status |
| Final go/no-go disposition | Explicit PASSED or FAILED |

**The quarterly audit is the convergence point** for all thirteen governance types. The Release Governance Readiness section explicitly requires:
- Evidence bundle present and current
- Approval chain named and timestamped
- Rollback owner identified
- Release notes status confirmed

---

## Cadence Relationship to the Audit Pyramid

The monthly light audit exercises Levels 1–3 of the audit pyramid for assets changed since the prior audit. The quarterly full audit exercises all five levels and produces the executive disposition.

```
Monthly (Levels 1–3):
  Item audits for changed assets
  → Catalog integrity check
  → Naming conformance check
  → Link integrity check
  → Light disposition

Quarterly (Levels 1–5, full run):
  All item audits (L1)
  → Cross-type audit (L2) via audit-customization-types
  → Optimization audit (L2) via optimize-customizations
  → Full governance audit (L3) via governance-audit
  → Health overview (L4) via governance-health-overview
  → Executive report (L5) via execute-customization-audit
  → Release readiness check
  → Final PASSED or FAILED disposition
```

---

## Artifact Storage

| Artifact | Path |
|---|---|
| Monthly light audit template | `.docs/changes/governance/monthly-light-audit-template.md` |
| Quarterly full audit template | `.docs/changes/governance/quarterly-full-audit-template.md` |
| Completed monthly audits | `.docs/changes/governance/audits/` (dated by content, not filename) |
| Completed quarterly audits | `.docs/changes/governance/audits/` (dated by content, not filename) |

**Naming rule:** Audit artifacts use content-dated metadata, not filename date prefixes. This prevents the corpus from accumulating `2026-01-15-audit.md` style artifacts.

---

## Integration Points

| Governance Type | Connection |
|---|---|
| [Customization Types](./02-customization-types.md) | Monthly audit covers item-level type checks for changed assets |
| [Naming & Taxonomy](./03-naming-taxonomy.md) | Monthly audit includes naming conformance check |
| [Lifecycle & Lanes](./04-lifecycle-lanes.md) | Monthly audit covers catalog sync drift |
| [Release Governance](./05-release.md) | Quarterly audit requires release governance readiness section |
| [Health & Audit Overview](./10-health-audit.md) | Quarterly audit executes the full audit pyramid |
| [Optimization Governance](./11-optimization.md) | Quarterly audit includes optimization and drift section |
