# 05 · Release Governance

**Lane:** Execution / Review  
**Primary Assets:** `governance-release.instructions.md`, `release-readiness/SKILL.md`  
**Back to:** [Executive Summary](./executive-summary.md) · [INDEX](./INDEX.md)

---

## Purpose

Ensure every promotion from one environment to the next has named, durable evidence; an explicit approval chain; a tested rollback procedure; and release notes written before promotion begins. Apply to all release types: feature releases, hotfixes, configuration promotions, and dependency upgrades.

---

## Why It Exists

Promotion decisions made without durable evidence are irreproducible. If a deployment fails, an approval chain that exists only in chat history cannot be audited or used for rollback authorization. This governance type enforces that every gate element exists as a physical artifact before execution begins.

---

## The Four Mandatory Gates

### Gate 1: Evidence Bundle

Every promotion must be supported by a named evidence bundle containing:
- Smoke test results
- Gate checklist outcome
- Security sign-off reference

**Rules:**
- Evidence must exist as durable artifacts **before** promotion executes
- Notes or verbal summaries do not satisfy this requirement
- Evidence must be traceable to the originating plan or workstream ID

### Gate 2: Approval Chain

At minimum, two named approvers are required:
- One engineering owner
- One product or delivery owner

**Rules:**
- Approvals must be recorded as **named, timestamped entries** in a release artifact
- Approvals inferred from chat history do not qualify
- Security-sensitive or high-risk promotions require an explicit security sign-off referencing the evidence artifact

### Gate 3: Rollback Documentation

A rollback procedure must exist and be reviewed before every promotion.

**Rules:**
- Rollback steps must be concrete and executable **without reference to in-flight context** — they must work when the team is under incident pressure with no other information
- The rollback owner must be identified by name or role (not left implicit)
- Rollback must be reviewed, not just present

### Gate 4: Release Notes

Release notes must be written **before** promotion begins — not after.

**Required content:**
- Scope included (delivered items)
- Scope deferred or descoped (explicit distinction from delivered)
- Known issues
- Rollback reference
- Approval evidence reference

---

## Release Readiness Skill Workflow

The `release-readiness` skill executes the gate checklist and produces all required artifacts.

| Step | Action |
|---|---|
| 1 | Confirm promotion target and link to originating plan ID |
| 2 | Populate gate checklist (build integrity, test evidence, security gate, performance gate, rollback doc, approval chain) |
| 3 | Validate rollback (present, executable, named owner) |
| 4 | Assemble evidence bundle |
| 5 | Obtain named and timestamped approvals |
| 6 | Produce go/no-go decision |
| 7 | If No-Go: document blocking gate and required resolution |

**Gate checklist:**

| Gate | Pass Criteria |
|---|---|
| Build integrity | Clean pipeline run; no suppressed failures |
| Test evidence | Unit, integration, and smoke evidence present and dated |
| Security gate | Sign-off reference present; no unresolved blocking findings |
| Performance gate | Signal vs thresholds reviewed (waivable with documented rationale) |
| Rollback doc | Exists, is current, has a named owner |
| Approval chain | At minimum one engineering + one product/delivery owner |

**Go/No-Go outcomes:**

| Decision | Meaning |
|---|---|
| **Pass** | All gates clear; promotion authorized |
| **Hold** | One or more gates incomplete but resolvable; named action required |
| **No-Go** | Blocking finding that prevents promotion; documented blocking gate |

---

## Required Output Artifacts

All artifacts must exist before promotion executes:
- Gate checklist result (populated, not blank)
- Evidence bundle (named, linked)
- Rollback confirmation (reviewed, executable, owned)
- Sign-off record (named, timestamped)

---

## Applicability

`governance-release.instructions.md` uses `applyTo: '**'` — global scope. The rationale: release governance obligations apply to all artifact types and delivery lanes, not only pipeline configuration files. Narrower scoping would create enforcement gaps during design, implementation, and review phases where release obligations are first established.

**Applies to all release types:**
- Feature releases
- Hotfixes
- Configuration promotions
- Dependency upgrades

---

## Integration Points

| Governance Type | Connection |
|---|---|
| [Acceptance & Quality](./06-acceptance-quality.md) | Release gate requires acceptance governance sign-off |
| [Security Governance](./08-security.md) | Security gate references dependency scan and security research findings |
| [Health & Audit Overview](./10-health-audit.md) | Quarterly full audit includes a Release Governance Readiness section |
| [Cadenced Audits](./12-cadenced-audits.md) | Quarterly template requires evidence bundle, approval chain, rollback owner, release notes status |

---

## Companion Skills

- `dependency-security-scan` — provides security gate evidence
- `test-orchestration` — provides test evidence
- `acceptance-governance` — provides acceptance sign-off
- `release-simulation` — rehearses the promotion before it executes (for high-risk scenarios)
- `post-release-retrospective` — captures outcomes after promotion completes
