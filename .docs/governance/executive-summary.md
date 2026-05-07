# Governance Executive Summary

**Workspace:** `c:\Projects\agentic`  
**Reviewed:** 2026-05-07  
**Scope:** Full governance layer — instructions, skills, agents, prompts, catalogs, scripts

---

## What This Workspace Is

This repository is **not a product application**. It is a **customization and skills compendium** — a reusable governance layer designed to be applied to target repositories. The `.github/instructions/` files contain normative standards; the skills, agents, and prompts operationalize those standards. Product code may be generated in or for target repositories; this workspace governs *how* that generation happens.

---

## Why the Governance System Exists

Without structured governance, AI-assisted development produces unpredictable outcomes: scope silently expands, specialist agents execute work outside their competency, review findings lack severity context, and promotion decisions occur without named evidence or approval chains. This governance system was purpose-built to eliminate those failure modes.

The system solves six concrete problems:

| Problem | Governance Solution |
|---|---|
| Scope drift during execution | Mandatory intake classification before any specialist begins |
| Agent role confusion | Singular-responsibility agents with explicit hard constraints |
| Silent quality failures | Evidence-first quality gates with severity-ranked findings |
| Undocumented promotion decisions | Durable evidence bundles required before every promotion |
| Asset discovery breakdown | Four catalog index files as authoritative routing source of truth |
| Repeated review cycles over rejected suggestions | Per-asset audit history with deny-list enforcement |

---

## How the System Works

### The Three-Lane Operating Model

Every request, artifact, and agent is classified into exactly one primary lane:

| Lane | Responsibility | Canonical Output Paths |
|---|---|---|
| **Planning** | Analyze intent, constraints, risks; produce execution-ready work packages | `.docs/plans/`, `.docs/research/`, `.docs/adr/` |
| **Execution** | Build approved artifacts from planning packets | Code, tests, docs, scripts, change entries in `.docs/changes/` |
| **Review** | Validate quality, correctness, security, and standards adherence | Review reports in `.docs/changes/`, disposition records |

Lane assignment is authoritative in the four catalog indexes. Changing a lane assignment requires updating all four catalogs in the same change.

### The Five Interlocking Layers

```
┌─────────────────────────────────────────────────────────────────┐
│  LAYER 5: Audit and Health                                      │
│  governance-audit, governance-health-overview, governance-      │
│  summarize, execute-customization-audit, governance-briefer     │
├─────────────────────────────────────────────────────────────────┤
│  LAYER 4: Workflow                                              │
│  .github/skills/*/SKILL.md — situational, self-contained        │
├─────────────────────────────────────────────────────────────────┤
│  LAYER 3: Discovery                                             │
│  .github/catalogs/ — four index files, source of truth for     │
│  routing decisions                                              │
├─────────────────────────────────────────────────────────────────┤
│  LAYER 2: Routing                                               │
│  orchestrator.agent.md + copilot-instructions.md                │
│  Mandatory entry point for every request                        │
├─────────────────────────────────────────────────────────────────┤
│  LAYER 1: Policy                                                │
│  .github/instructions/*.instructions.md                         │
│  Always-on mandatory rules; never contain workflows             │
└─────────────────────────────────────────────────────────────────┘
```

### The Mandatory Intake Rule

**Every request — without exception — routes through `orchestrator` first.** The orchestrator classifies scope, selects specialist agents from the catalog, assigns lane ownership, and publishes an intake schema before any implementation begins. This rule is stated in three separate places (copilot-instructions.md, governance-lifecycle.instructions.md, orchestrator.agent.md) — deliberately redundant so no single file's absence creates a bypass path.

### Evidence-First Promotion

No promotion from one environment to the next proceeds without:
- A named evidence bundle (smoke results, gate checklist, security sign-off)
- An explicit approval chain (at minimum: engineering owner + product/delivery owner), recorded as named timestamped entries
- A reviewed, executable rollback procedure with a named rollback owner
- Release notes written *before* promotion begins

---

## The 13 Governance Types

The system covers thirteen distinct governance domains, each with its own skills, violation codes, and output paths:

| # | Governance Type | Lane | Key Skill(s) | Purpose |
|---|---|---|---|---|
| 1 | [Request Intake](./01-request-intake.md) | Planning | `work-intake-governance` | Classify every request before any specialist executes |
| 2 | [Customization Types](./02-customization-types.md) | Review | `audit-agent`, `audit-instructions`, `audit-skill`, `audit-prompts`, `audit-customization-types` | Quality and boundary compliance for agents, instructions, skills, prompts |
| 3 | [Naming & Taxonomy](./03-naming-taxonomy.md) | Execution | `asset-naming-taxonomy` | Consistent naming for discoverability and routing determinism |
| 4 | [Lifecycle & Lanes](./04-lifecycle-lanes.md) | Planning | `governance-lifecycle.instructions.md`, `route-customization` | Lane classification, catalog integrity, traceability |
| 5 | [Release Governance](./05-release.md) | Execution/Review | `release-readiness` | Evidence bundles, approval chain, rollback, release notes |
| 6 | [Acceptance & Quality](./06-acceptance-quality.md) | Review | `acceptance-criteria`, `acceptance-governance` | Testable criteria and standardized multi-discipline review |
| 7 | [Change Control](./07-change-control.md) | Execution | `scope-change-control` | Explicit scope change records with impact analysis |
| 8 | [Security Governance](./08-security.md) | Review | `security-research`, `dependency-security-scan` | Vulnerability research, dependency scanning, secure coding policy |
| 9 | [Delivery Governance](./09-delivery.md) | Planning | `governance-delivery` | RAID logs, dependency maps, milestone tracking |
| 10 | [Health & Audit Overview](./10-health-audit.md) | Review | `governance-audit`, `governance-health-overview`, `governance-summarize`, `execute-customization-audit` | Pyramid audit hierarchy from item-level to executive |
| 11 | [Optimization Governance](./11-optimization.md) | Review | `optimize-customizations` | Authoring quality: clarity, brevity, determinism |
| 12 | [Cadenced Audits](./12-cadenced-audits.md) | Review | Monthly/quarterly templates | Periodic health checks with structured evidence |
| 13 | [Customization Taxonomy](./13-taxonomy.md) | Planning | `taxonomy-tag-registry` | Five-field classification model for all assets |

---

## Key Design Principles

**Radical separation of policy from workflow.** Instruction files hold mandatory rules; skills hold the workflows that implement those rules. No instruction file contains step-by-step procedures. Every instruction file ends with routing notes pointing to the relevant skill.

**Self-containment as non-negotiable.** Skills must not invoke or delegate to other named skills. Cross-skill logic is inlined or a dedicated orchestrator skill is created. This eliminates hidden dependency chains.

**Catalog-first routing.** The orchestrator reads catalog indexes as the source of truth for routing. Catalogs are updated in the same change as any asset create, rename, or delete. An unregistered asset or orphaned catalog row is an immediate MUST failure.

**History + deny-list loop.** Every item-level audit maintains a history file and builds a deny-list from previously rejected recommendations at the start of each run. Governance cycles cannot loop endlessly over the same rejected suggestions.

**PowerShell-backed determinism.** 24+ scripts provide automated evidence collection covering lane counts, frontmatter validity, catalog integrity, link graphs, naming conformance, routing determinism, and responsibility overlap. `test-governance-must-traceability.ps1` blocks report publication if MUST traceability fails — enforcement is automated, not honor-system.

---

## Traceability Model

| ID Type | Pattern | Required In |
|---|---|---|
| Vision ID | `VIS-YYYYMMDD-###` | Vision statement and top-level plan packet |
| Plan ID | `PLAN-YYYYMMDD-###` | Planning packet, execution notes, review report |
| Workstream ID | `WS-##` | Planning rows and execution tasks |
| Decision ID | `DEC-##` | Architecture, routing, or scope decisions |
| Review ID | `REV-YYYYMMDD-###` | Review report and disposition tracking |

---

## Asset Counts

| Asset Type | Count |
|---|---|
| Instruction files | 21 |
| Governance agents | 10+ |
| Governance skills | 20+ |
| Governance prompts | 10+ |
| Catalog index files | 4 |
| Reference documents | 6+ |
| PowerShell scripts | 27+ |

---

## Navigation

- [01 · Request Intake Governance](./01-request-intake.md)
- [02 · Customization Type Governance](./02-customization-types.md)
- [03 · Naming & Taxonomy Governance](./03-naming-taxonomy.md)
- [04 · Lifecycle & Lane Governance](./04-lifecycle-lanes.md)
- [05 · Release Governance](./05-release.md)
- [06 · Acceptance & Quality Governance](./06-acceptance-quality.md)
- [07 · Change Control Governance](./07-change-control.md)
- [08 · Security Governance](./08-security.md)
- [09 · Delivery Governance](./09-delivery.md)
- [10 · Health & Audit Overview](./10-health-audit.md)
- [11 · Optimization Governance](./11-optimization.md)
- [12 · Cadenced Audits](./12-cadenced-audits.md)
- [13 · Customization Taxonomy](./13-taxonomy.md)
- [INDEX](./INDEX.md)
