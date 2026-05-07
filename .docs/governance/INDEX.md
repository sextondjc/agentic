# Governance Documentation Index

**Workspace:** `c:\Projects\agentic`  
**Generated:** 2026-05-07  
**Source research:** [.docs/research/governance-deep-review-research.md](../research/governance-deep-review-research.md)

This index navigates the complete governance documentation for this workspace. Start with the executive summary for the full picture, then drill into individual governance types as needed.

---

## Start Here

| Document | Description |
|---|---|
| [Executive Summary](./executive-summary.md) | What the governance system is, why it exists, how it works, and a map of all 13 governance types |

---

## Governance Types

| # | Document | Lane | Primary Assets | Purpose |
|---|---|---|---|---|
| 1 | [Request Intake Governance](./01-request-intake.md) | Planning | `orchestrator`, `work-intake-governance` | Classify every request before any specialist executes |
| 2 | [Customization Type Governance](./02-customization-types.md) | Review | `audit-agent`, `audit-instructions`, `audit-skill`, `audit-prompts`, `audit-customization-types` | Quality and boundary compliance for all customization asset types |
| 3 | [Naming & Taxonomy Governance](./03-naming-taxonomy.md) | Execution | `governance-naming-conventions`, `asset-naming-taxonomy` | Consistent naming for discoverability and routing determinism |
| 4 | [Lifecycle & Lane Governance](./04-lifecycle-lanes.md) | Planning | `governance-lifecycle`, `route-customization` | Lane classification, catalog integrity, traceability |
| 5 | [Release Governance](./05-release.md) | Execution/Review | `governance-release`, `release-readiness` | Evidence bundles, approval chain, rollback, release notes |
| 6 | [Acceptance & Quality Governance](./06-acceptance-quality.md) | Review | `acceptance-criteria`, `acceptance-governance` | Testable criteria and standardized multi-discipline review |
| 7 | [Change Control Governance](./07-change-control.md) | Execution | `scope-change-control` | Explicit scope change records with impact analysis |
| 8 | [Security Governance](./08-security.md) | Review | `secure-coding`, `security-research`, `dependency-security-scan` | Vulnerability research, dependency scanning, secure coding policy |
| 9 | [Delivery Governance](./09-delivery.md) | Planning | `governance-delivery` | RAID logs, dependency maps, milestone tracking |
| 10 | [Health & Audit Overview](./10-health-audit.md) | Review | `governance-audit`, `governance-health-overview`, `governance-summarize`, `execute-customization-audit` | Five-level pyramid audit from item-level to executive disposition |
| 11 | [Optimization Governance](./11-optimization.md) | Review | `optimize-customizations` | Authoring quality: clarity, brevity, determinism, scope purity |
| 12 | [Cadenced Audits](./12-cadenced-audits.md) | Review | Monthly and quarterly templates | Scheduled governance health checks with structured evidence |
| 13 | [Customization Taxonomy](./13-taxonomy.md) | Planning | `customization-taxonomy-v1`, `taxonomy-tag-registry`, `matrix-skill-mapping` | Five-field classification model for all customization assets |

---

## Quick Reference: Violation Code Registry

| Code Prefix | Governing Skill | Type |
|---|---|---|
| GOV-M* / GOV-S* | `governance-audit` | Workspace governance |
| AGR-M* / AGR-S* | `audit-agent` | Agent compliance |
| INR-M* / INR-S* | `audit-instructions` | Instruction compliance |
| SKR-M* / SKR-S* | `audit-skill` | Skill compliance |
| PRR-M* / PRR-S* | `audit-prompts` | Prompt compliance |
| TYP-M* / TYP-S* | `audit-customization-types` | Cross-type compliance |
| EXE-M* | `execute-customization-audit` | Executive audit standards |
| OPR-M* / OPR-S* | `optimize-customizations` | Optimization quality |

---

## Quick Reference: Governance Artifact Storage

```
.docs/
  changes/
    governance/
      audits/
        governance-audit.md              ← governance-audit output
        governance-executive-audit.md    ← governance-health-overview output
        execute-customization-audit.md   ← execute-customization-audit output
        governance-one-pager.md          ← governance-summarize / governance-briefer output
      type-audits/
        audit-customization-types.md     ← audit-customization-types output
    skill/
      reviews/<name>/review.md           ← audit-skill output
      history/<name>-history.md          ← audit-skill history
    agent/
      reviews/<name>/review.md           ← audit-agent output
      history/<name>-history.md          ← audit-agent history
      conflicts/                         ← audit-agent conflict artifacts
    instruction/
      reviews/<name>/review.md           ← audit-instructions output
      history/<name>-history.md          ← audit-instructions history
    prompt/
      reviews/<name>/review.md           ← audit-prompts output
      history/<name>-history.md          ← audit-prompts history
    customization/
      reviews/
        governance-audit-types-optimization.md  ← optimize-customizations output
  research/
    governance-deep-review-research.md   ← Source research for this documentation
  adr/                                   ← Architecture Decision Records
  plans/                                 ← Planning packets
```

---

## Quick Reference: Catalog Index Files

| Catalog | Location |
|---|---|
| Agents | `.github/catalogs/agents-discovery-index.md` |
| Skills | `.github/catalogs/skills-discovery-index.md` |
| Instructions | `.github/catalogs/instructions-discovery-index.md` |
| Prompts | `.github/catalogs/prompts-discovery-index.md` |

All four catalogs are the **authoritative source of truth** for routing decisions. An unregistered asset or orphaned catalog row is an immediate MUST failure (GOV-M3) with no grace period.
