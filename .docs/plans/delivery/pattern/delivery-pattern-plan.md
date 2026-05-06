# Delivery Pattern Plan

**Document ID:** delivery-pattern-plan  
**Version:** 1.0  
**Date:** 2026-05-06  
**Status:** APPROVED — All open decisions resolved 2026-05-06. Pattern is ratified. Implementation may begin.  
**Author:** plan-researcher  
**Skills Used:** `opportunity-mapping` → `agentic-workflow-patterns` → `writing-plans`

---

## 1. Objective

Define a **robust, mature, predictable, and automatic delivery process pattern** for the `c:\Projects\agentic` workspace — a skills and customization compendium for agentic workflows.

The pattern must:
- Cover all important delivery dimensions automatically, without agent guessing
- Provide strong traceability: intent → plan → implementation → verification
- Enforce TDD discipline, security review, performance quality, code review, and release governance in a fixed, reproducible sequence
- Be executable step-by-step by an agent using only workspace skills and agents
- Produce a durable named artifact at every phase so progress is always auditable

The target asset types are: `.github/skills/`, `.github/agents/`, `.github/instructions/`, `.github/prompts/`.

---

## 2. Scope

### Included

- All changes and additions to agentic assets in `.github/skills/`, `.github/agents/`, `.github/instructions/`, `.github/prompts/`
- New asset creation workflows
- Update/refactor workflows for existing assets
- Governance and audit workflows triggered by asset changes
- Release / sync promotion workflows to target repositories

### Explicitly Excluded

- Product application code (this workspace contains no product C# application)
- Database migration workflows (no application database in this workspace)
- Mobile/web frontend implementation (not applicable to compendium workspace)
- CI/CD pipeline infrastructure changes (treated as a separate concern)
- Hotfix or emergency promotion (a separate, abridged pattern is needed; this plan covers standard delivery only)

---

## 3. Opportunity Map

### 3.1 Delivery Dimensions → Workspace Skill Coverage

| # | Delivery Dimension | Description | Covered By (Workspace Skills/Agents) | Coverage Status |
|---|---|---|---|---|
| D1 | Work Intake & Classification | Classify, bound, admit/defer/reject/route requests before work enters planning | `work-intake-governance`, `orchestrator` agent | ✅ Covered |
| D2 | Discovery & Research | Understand the problem, gather evidence, identify constraints | `task-research`, `analysis-execution`, `critical-thinking`, `opportunity-mapping` | ✅ Covered |
| D3 | Planning & Specification | Produce structured, approved plans and PRDs | `writing-plans`, `prd-generator`, `product-scope-slicing`, `backlog-structuring`, `plan-researcher` agent | ✅ Covered |
| D4 | Acceptance Criteria | Define done-gates and testable criteria before build | `acceptance-criteria` | ✅ Covered |
| D5 | Architecture & Decision Records | Capture design boundaries and ADRs before execution | `adr-generator`, `domain-design`, `api-design`, `architecture-designer` agent | ✅ Covered |
| D6 | Asset Naming & Taxonomy | Enforce consistent naming and taxonomy across assets | `asset-naming-taxonomy`, `governance-naming-conventions.instructions.md` | ✅ Covered |
| D7 | Test Design (TDD First) | Author test/validation scenarios before implementation | `test-driven-development`, `xunit-test-design`, `test-design-review` | ✅ Covered (adapted: acceptance criteria + governance audit scripting serve as TDD equivalent for agentic assets) |
| D8 | Implementation / Execution | Author new or updated agentic assets | `task-execution`, `skills-authoring`, `agent-authoring`, `instructions-authoring`, `workspace-scaffolder` agent | ✅ Covered |
| D9 | Security Review | Assess prompt injection resistance, policy compliance, OWASP alignment | `security-research`, `security-researcher` agent, `secure-coding.instructions.md` | ✅ Covered (partial — no dedicated agentic-asset-specific security skill) |
| D10 | Performance / Optimization Review | Evaluate asset efficiency, token budget, invocation clarity | `optimize-customizations`, `performance-assessor` agent | ✅ Covered (partial — optimization focuses on quality/conciseness, not runtime perf metrics) |
| D11 | Governance Audit | Evaluate all asset types against quality standards | `governance-audit`, `audit-skill`, `audit-agent`, `audit-instructions`, `audit-prompts`, `audit-customization-types`, `governance-briefer` agent | ✅ Covered |
| D12 | Code / Asset Review & Quality Gate | Multi-discipline evidence-first quality decision | `request-code-review`, `acceptance-governance`, `remediate-review`, `code-reviewer` agent, `manual-code-reviewer` agent | ✅ Covered |
| D13 | Test Orchestration | Coordinate multi-disciplinary test passes into single verdict | `test-orchestration` | ✅ Covered |
| D14 | Release Readiness | Gate checklist, rollback, go/no-go, evidence collation | `release-readiness`, `release-simulation` | ✅ Covered |
| D15 | Retrospective & Outcome Review | Capture lessons, compare intended vs actual outcomes | `post-release-retrospective`, `outcome-review` | ✅ Covered |
| D16 | Scope Change Control | Handle adds/swaps/descopes mid-delivery with impact analysis | `scope-change-control` | ✅ Covered |
| D17 | Documentation & Index Maintenance | Keep docs navigable and cross-referenced | `write-technical-docs`, `index-docs`, `librarian` | ✅ Covered |
| D18 | Sync / Promotion to Target Repos | Controlled propagation of compendium assets | `sync-compendium`, `sync-customizations`, `sync-skills` | ✅ Covered |
| D19 | Dependency / Vulnerability Scanning | SBOM, CVE scanning, package security validation | *(none)* | ❌ Gap |
| D20 | License Compliance | License header and SPDX compliance checking | *(none)* | ❌ Gap |
| D21 | Stakeholder Communication / Change Announcement | Structured change notification to downstream consumers | *(none)* | ❌ Gap |
| D22 | Observability Readiness (deployment-time) | Verify that agentic assets include operability hooks before promotion | `operability-design` (partial) | ⚠️ Partial |

### 3.2 Gap Summary

| Gap ID | Dimension | Recommendation |
|---|---|---|
| G1 | Dependency / Vulnerability Scanning (D19) | Author a new `dependency-security-scan` skill (future) |
| G2 | License Compliance (D20) | Add to `sync-compendium` checklist or author `license-compliance` skill (future) |
| G3 | Stakeholder Communication (D21) | Author a `change-announcement` skill that generates structured release notes (future) |
| G4 | Observability Readiness for Agentic Assets (D22) | Extend `operability-design` trigger criteria or author `agentic-operability` skill (future) |

---

## 4. Workflow Shape

### 4.1 Phase Sequencing Rationale

| Constraint | Rationale |
|---|---|
| Intake before Discovery | A request must be classified and bounded before research begins; unbounded discovery wastes effort |
| Discovery before Planning | Plans cannot be deterministic without evidence; assumptions not surfaced in discovery become hidden defects |
| Planning before Acceptance Criteria | Acceptance criteria depend on scope being fixed; writing them before the plan risks testing the wrong thing |
| Acceptance Criteria + Architecture before TDD | Test design requires knowing the acceptance boundary AND the design boundaries |
| TDD before Implementation | Tests must be authored and reviewed before implementation to prevent tests that are written to pass existing code |
| Implementation before Review | Review requires completed artifacts; reviewing incomplete work produces noise |
| Review phases run in parallel | Security, performance, and governance audits are independent of each other after implementation completes |
| All reviews must complete before Test Orchestration | Test orchestration aggregates cross-discipline evidence; it needs all reviews complete |
| Test Orchestration before Release Readiness | Release readiness gate depends on the aggregate verdict from test orchestration |
| Release Readiness before Sync/Promotion | Promotion must be explicitly gated; no sync without go/no-go sign-off |
| Retrospective after Promotion | Retro captures actual post-promotion outcomes; it cannot run before promotion |

### 4.2 Parallelisation Map

| Phase | Can Parallel With | Cannot Parallel With |
|---|---|---|
| Phase 5 (Architecture + ADR) | Phase 4 (Acceptance Criteria, after planning) | Phase 6 (TDD) — architecture must complete first |
| Phase 7a (Security Review) | Phase 7b (Performance/Optimization Review), Phase 7c (Governance Audit) | Phase 6 (Implementation) — all reviews require completion |
| Phase 7b (Performance/Optimization) | Phase 7a, Phase 7c | Phase 6 |
| Phase 7c (Governance Audit) | Phase 7a, Phase 7b | Phase 6 |
| Phase 8 (Asset Review / Quality Gate) | Can begin after Phase 7a/7b/7c produce their artifacts, once implementation is complete | Phase 9 (Test Orchestration) — must consume review outputs |

### 4.3 Approval Gates

| Gate ID | Location | Description | Who Approves |
|---|---|---|---|
| G-PLAN | After Phase 3 (Planning) | Plan document reviewed and approved before any implementation begins | User (explicit) |
| G-TDD | After Phase 6 (TDD) | Test/acceptance scenarios reviewed and accepted before implementation code is written | `code-reviewer` agent or user |
| G-REVIEW | After Phase 8 (Quality Gate) | All cross-discipline reviews complete; blocking findings resolved or documented deferrals recorded | `code-reviewer` agent + user (for blocking findings) |
| G-RELEASE | After Phase 9 (Test Orchestration) | Go/no-go sign-off; evidence bundle complete; rollback procedure documented and reviewed | User (explicit) |

### 4.4 Escalation Rules

| Trigger | Escalation Action |
|---|---|
| Phase fails to produce required output artifact | Block progression; re-run phase with explicit scope correction; document in scope-change log |
| Blocking security finding in Phase 7a | Halt all parallel review phases; route to `security-researcher` agent for remediation plan; re-run phase |
| Blocking performance finding in Phase 7b | Log finding; route to `performance-assessor` agent; decide accept/defer/fix before proceeding |
| Governance audit CRITICAL finding in Phase 7c | Halt; route to owning agent for remediation; do not proceed to release |
| Quality gate NO-GO in Phase 8 | Return to implementation (Phase 6) with explicit failing criteria; do not re-enter planning unless scope changes |
| Scope change request mid-delivery | Invoke `scope-change-control`; pause current phase; produce impact analysis; re-enter planning only if accepted |

---

## 5. Phase Table

> **Reading Guide:** Each phase has a required input, required output artifact, and gate condition. An agent must not proceed to the next phase unless the gate condition is satisfied. Parallelisation notes are explicit per phase.

| # | Phase Name | Description | Owning Skill(s) / Agent(s) | Required Input | Required Output Artifact | Gate Condition (must be true to proceed) | Parallel Note |
|---|---|---|---|---|---|---|---|
| **P1** | **Work Intake & Classification** | Classify request type, bound scope, admit/defer/reject/route | `work-intake-governance` · `orchestrator` agent | Raw request or user prompt | `intake-record.md` at `.docs/changes/[task]-intake-record.md` | Request classified, scoped, and routed; no unbounded open questions | Sequential — must complete before any other phase |
| **P2** | **Discovery & Research** | Evidence-backed analysis of the problem, constraints, alternatives | `task-research` · `analysis-execution` · `critical-thinking` · `opportunity-mapping` · `plan-researcher` agent | `intake-record.md` | `[topic]-research.md` at `.docs/research/` | Evidence gathered; alternatives enumerated; no unresolved contradictions | Sequential after P1 |
| **P3** | **Planning & Specification** | Produce formal plan, PRD (if required), delivery slices, acceptance-ready scope | `writing-plans` · `prd-generator` · `product-scope-slicing` · `backlog-structuring` · `plan-researcher` agent | Research artifact from P2 | Plan document at `.docs/plans/[domain]/[task]-plan.md` | Plan document complete; open decisions listed; user approval received (`G-PLAN` gate) | Sequential after P2 · **⛔ G-PLAN approval gate** |
| **P4** | **Acceptance Criteria Authoring** | Convert plan scope into testable done-gates | `acceptance-criteria` · `plan-researcher` agent | Approved plan from P3 | `[task]-acceptance-criteria.md` at `.docs/plans/[domain]/` | All delivery items have ≥1 testable criterion; criteria are unambiguous and agent-executable | Sequential after P3 approval; can begin same session |
| **P5** | **Architecture & Decision Records** | Capture design boundaries, API contracts, naming decisions, ADRs | `adr-generator` · `domain-design` · `api-design` · `asset-naming-taxonomy` · `architecture-designer` agent | Approved plan + acceptance criteria | ADR file(s) at `.docs/adr/[date]-[title].md`; naming decision record if applicable | All architectural decisions have ADRs; no undocumented design choices | Can run in parallel with P4 after P3 approves |
| **P6** | **Test Design (TDD-First)** | Author validation scenarios, acceptance test scripts, governance audit triggers **before** implementation begins | `test-driven-development` · `xunit-test-design` · `test-design-review` · `acceptance-criteria` | Acceptance criteria (P4) + ADRs (P5) | `[task]-test-design.md` at `.docs/plans/[domain]/`; test/audit scenario scripts as applicable | Test scenarios reviewed and accepted (`G-TDD` gate); implementation code does not yet exist | Sequential — P4 and P5 must complete first · **⛔ G-TDD gate** |
| **P7** | **Implementation / Asset Authoring** | Author new or updated agentic assets (skills, agents, instructions, prompts) | `task-execution` · `skills-authoring` · `agent-authoring` · `instructions-authoring` · `workspace-scaffolder` agent · `csharp-engineer` agent (if .NET) | Approved plan + test design + ADRs | Implemented assets in correct `.github/` paths; change tracking entry in `.docs/changes/` | All delivery items from the plan are implemented; asset files exist at expected paths; no outstanding plan items | Sequential after P6 |
| **P7a** | **Security Review** | Evaluate prompt injection resistance, policy alignment, OWASP-relevant guidance | `security-research` · `security-researcher` agent | Implemented assets from P7 | `[task]-security-review.md` at `.docs/changes/` | All findings triaged; blocking findings have remediation plans; no CRITICAL open items | Parallel with P7b and P7c after P7 completes |
| **P7b** | **Performance & Optimization Review** | Evaluate asset efficiency, token budget, invocation clarity, redundancy | `optimize-customizations` · `performance-assessor` agent | Implemented assets from P7 | `[task]-optimization-review.md` at `.docs/changes/` | All findings triaged; blocking items resolved or deferred with rationale | Parallel with P7a and P7c after P7 completes |
| **P7c** | **Governance Audit** | Evaluate all asset types against workspace quality standards | `governance-audit` · `audit-skill` · `audit-agent` · `audit-instructions` · `audit-prompts` · `audit-customization-types` · `governance-briefer` agent | Implemented assets from P7 | `[task]-governance-audit.md` at `.docs/changes/` | All audit findings triaged; no CRITICAL quality defects unresolved | Parallel with P7a and P7b after P7 completes |
| **P8** | **Asset Review & Quality Gate** | Aggregate cross-discipline review findings; produce go/no-go quality verdict | `request-code-review` · `acceptance-governance` · `remediate-review` · `code-reviewer` agent | Security review (P7a) + optimization review (P7b) + governance audit (P7c) | `[task]-quality-gate.md` at `.docs/changes/` with explicit PASS/FAIL/CONDITIONAL | All P7a/P7b/P7c artifacts present; acceptance criteria validated; quality verdict is PASS or CONDITIONAL with documented deferrals · **⛔ G-REVIEW gate** | Sequential — requires all three P7x phases to complete · **⛔ G-REVIEW gate** |
| **P9** | **Test Orchestration** | Coordinate multi-disciplinary test passes; collate evidence into unified release-ready verdict | `test-orchestration` · `test-design-review` | Quality gate artifact (P8) + test design (P6) | `[task]-test-orchestration.md` at `.docs/changes/` | All disciplines have evidence artifacts; verdict is RELEASE READY or BLOCKED (with explicit blocking items) | Sequential after P8 |
| **P10** | **Release Readiness & Go/No-Go** | Produce release evidence bundle, rollback procedure, release notes; obtain explicit go/no-go | `release-readiness` · `release-simulation` (for high-risk changes) | Test orchestration artifact (P9) | `[task]-release-readiness.md` at `.docs/changes/`; `[task]-release-notes.md` | Release evidence bundle complete; rollback steps documented and owner named; go/no-go sign-off received (`G-RELEASE` gate) · **⛔ G-RELEASE gate** | Sequential after P9 · **⛔ G-RELEASE gate** |
| **P11** | **Sync / Promotion** | Propagate approved assets to target repositories with approval gates and bespoke-safe merge | `sync-compendium` · `sync-customizations` · `sync-skills` | Release readiness artifact (P10) + go/no-go sign-off | Sync log entry; updated lock file or manifest | Go/no-go signed; release notes published; rollback procedure on record | Sequential after P10 |
| **P12** | **Retrospective & Outcome Review** | Capture post-promotion outcomes, lessons, follow-up actions | `post-release-retrospective` · `outcome-review` | Promotion confirmation (P11) + original plan (P3) | `[task]-retrospective.md` at `.docs/changes/`; follow-up items in `.docs/plans/` if required | Promotion confirmed; retrospective authored within agreed window | Sequential after P11 |

---

## 6. Approval Gate Section

> **IMPORTANT:** This plan is the approval artifact for the `G-PLAN` gate on this meta-delivery (the pattern design itself).
>
> For **all future deliveries** using this pattern, the following rule applies without exception:
>
> **No implementation (Phase P7) may begin until:**
> 1. The plan document (P3) is complete and explicitly approved by the user
> 2. Acceptance criteria (P4) are authored and unambiguous
> 3. Architecture decisions (P5) are recorded
> 4. Test design (P6) is authored and has passed the G-TDD gate
>
> Agents must not skip or compress these phases for expediency. If a request arrives that seems trivial, the pattern still applies — Phase P1 through P3 may be abbreviated to a one-pager intake comment, but they cannot be omitted.

---

## 7. Open Decisions

All decisions resolved 2026-05-06.

| Decision ID | Question | Resolution |
|---|---|---|
| OD-1 | Should hotfix/emergency deliveries follow an abridged pattern? | **Full pattern applies to all deliveries.** No abridged variant. |
| OD-2 | Is `G-TDD` a hard human gate or can `code-reviewer` satisfy it? | **`code-reviewer` agent may satisfy the gate autonomously; human oversight required for high-risk or cross-cutting changes.** |
| OD-3 | Full PRD for all changes, or one-page plan for small updates? | **Full PRD for new assets; one-page plan for updates to existing assets.** |
| OD-4 | Retrospective completion window? | **5 business days post-promotion, or on-demand if explicitly triggered earlier.** |
| OD-5 | Is `release-simulation` mandatory for all promotions? | **Mandatory when >3 asset files are changed; optional otherwise.** |
| OD-6 | Address vulnerability scanning gap before or after pattern adoption? | **Addressed now — `dependency-security-scan` skill authored 2026-05-06. Gap G1 is closed.** |

---

## 8. Known Gaps (Future Skill Candidates)

| Gap ID | Delivery Dimension | Missing | Recommended Skill Name | Priority |
|---|---|---|---|---|
| G1 | Dependency / Vulnerability Scanning | No SBOM or CVE scanning skill for agentic asset dependencies | `dependency-security-scan` | **Closed — skill authored 2026-05-06** |
| G2 | License Compliance | No license header or SPDX compliance checking skill | `license-compliance` | Low |
| G3 | Stakeholder Communication | No structured change announcement or release notification skill | `change-announcement` | Medium |
| G4 | Observability Readiness (agentic) | `operability-design` does not cover agentic asset-specific operability signals | `agentic-operability` | Low |

G1 is now closed. G2–G4 remain as candidates for future skill authoring sprints.

---

## 9. Reasoning Package

### 9.1 Assumptions Made

| ID | Assumption | Basis |
|---|---|---|
| A1 | All asset changes in this workspace (skills, agents, instructions, prompts) follow the same delivery lifecycle shape | The four asset families share the same quality, governance, and promotion concerns |
| A2 | TDD in this compendium context means writing acceptance criteria and governance audit scenarios **before** authoring the asset | Agentic assets have no runtime test suite; governance audits and acceptance criteria are the equivalent verification layer |
| A3 | `orchestrator` always handles intake (Phase P1); no specialist can be invoked directly | Matches the mandatory intake rule in `copilot-instructions.md` |
| A4 | "Performance review" for agentic assets means optimization quality (token efficiency, clarity, redundancy), not runtime performance metrics | No runtime performance profiling applies to `.md` skill files |
| A5 | Parallel phases (P7a/P7b/P7c) must all complete before Phase P8; a partial aggregate is not acceptable | Evidence aggregation requires complete inputs |
| A6 | Release in this workspace means promotion via `sync-compendium` to target repositories, not deployment to infrastructure | Matches the workspace's stated purpose as a compendium |

### 9.2 Trade-offs Considered

| Trade-off | Decision | Rationale |
|---|---|---|
| Rigid 12-phase pattern vs. lightweight adaptive flow | Rigid pattern, with explicit size thresholds for plan depth (OD-3) | Predictability and traceability outweigh speed for a governance-oriented compendium |
| TDD gate before or after architecture? | Architecture (P5) must precede TDD (P6) | Test design requires knowing naming conventions, boundaries, and API contracts |
| Separate governance audit vs. integrated into quality gate | Separate phase (P7c) feeding quality gate (P8) | Governance audit is a distinct discipline with its own skill family; collapsing it into quality gate would obscure findings |
| Security review inline vs. post-implementation | Post-implementation (P7a) | Security review of agentic assets requires the artifact to exist; threat-modelling during design is covered by `critical-thinking` in P2 |
| Retrospective mandatory vs. optional | Mandatory (P12) | A pattern without a learning loop degrades over time; retro is the mechanism that improves the pattern itself |

### 9.3 Alternatives Rejected

| Alternative | Reason Rejected |
|---|---|
| Single-phase "review and publish" pattern | Insufficient traceability; no pre-implementation approval gate; security and performance reviews would be skipped |
| Inline review (review as you implement) | Prevents clean separation of concerns; agents cannot objectively review their own output in the same phase |
| Skipping test design for small changes | TDD discipline is binary — either it applies or it doesn't; a size exemption creates a gap exploited by habit |
| Combining P7a/P7b/P7c into one parallel "review sprint" with shared artifact | Merging the review artifact conflates security, performance, and governance findings; harder to triage and harder to escalate selectively |
| Using GitHub PR as the primary governance artifact | This workspace is a compendium, not a product repo; PR review does not substitute for formal governance audit |

---

## 10. Visualisation: Phase Flow

```
P1 Intake
  │
P2 Discovery & Research
  │
P3 Planning & Specification
  │
  ⛔ G-PLAN (user approval)
  │
P4 Acceptance Criteria ──── P5 Architecture & ADRs
  │                              │
  └──────────────────────────────┘
  │
P6 Test Design (TDD First)
  │
  ⛔ G-TDD
  │
P7 Implementation / Asset Authoring
  │
  ├── P7a Security Review ─────┐
  ├── P7b Performance Review ──┼── (parallel)
  └── P7c Governance Audit ────┘
                               │
P8 Asset Review & Quality Gate ◄─┘
  │
  ⛔ G-REVIEW
  │
P9 Test Orchestration
  │
P10 Release Readiness & Go/No-Go
  │
  ⛔ G-RELEASE (user approval)
  │
P11 Sync / Promotion
  │
P12 Retrospective & Outcome Review
```

---

## 11. Artifact Naming Convention

All delivery artifacts produced by this pattern follow:

```
.docs/
  changes/
    [yyyymmdd]-[task-slug]-intake-record.md
    [yyyymmdd]-[task-slug]-security-review.md
    [yyyymmdd]-[task-slug]-optimization-review.md
    [yyyymmdd]-[task-slug]-governance-audit.md
    [yyyymmdd]-[task-slug]-quality-gate.md
    [yyyymmdd]-[task-slug]-test-orchestration.md
    [yyyymmdd]-[task-slug]-release-readiness.md
    [yyyymmdd]-[task-slug]-release-notes.md
    [yyyymmdd]-[task-slug]-retrospective.md
  plans/
    [domain]/
      [task-slug]-plan.md
      [task-slug]-acceptance-criteria.md
      [task-slug]-test-design.md
  research/
    [topic]-research.md
  adr/
    [yyyymmdd]-[title].md
```

---

## 12. Agentic Assets Used in This Plan

| Asset | Type | Lane | Justification |
|---|---|---|---|
| `opportunity-mapping` | Skill | Planning | Produced the delivery dimension map and gap analysis |
| `agentic-workflow-patterns` | Skill | Planning | Determined phase sequencing, parallelisation, and gate design |
| `writing-plans` | Skill | Planning | Structured the formal plan document |
| `task-research` | Skill | Planning | Evidence gathering from skill-discovery-index and agent-lifecycle-catalog |
| `critical-thinking` | Skill | Planning | Evaluated trade-offs and alternatives |
| `plan-researcher` | Agent | Planning | Owns this document; produced research, opportunity map, and plan |

---

*End of delivery-pattern-plan.md — PENDING USER APPROVAL*
