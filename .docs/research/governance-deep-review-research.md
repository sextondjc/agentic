# Governance Layer Deep-Review Research Report

**Date:** 2026-05-07  
**Scope:** Full workspace governance layer — `c:\Projects\agentic`  
**Purpose:** Exhaustive research artifact to support official documentation authoring  
**Method:** Direct file reading of all governance assets; no inference from memory

---

## SECTION 1: Workspace Governance Overview

### 1.1 Repository Intent and Design Philosophy

The workspace is explicitly **not** a product application host. It is a **customization and skills compendium** — a reusable governance layer designed to be applied to target repositories. All policies under `.github/instructions/` are normative standards that skills, agents, and prompts operationalize.

**Core philosophy:**

- **Deterministic-by-default**: every request must produce explicit intake fields before any specialist execution begins. Scope drift, silent additions, and unapproved expansions are policy violations.
- **Policy separation**: instruction files hold mandatory always-on rules; skills hold situational workflows; agents hold specialist personas; prompts hold workflow entry points with output contracts.
- **Evidence-first governance**: every promotion decision, review outcome, and quality disposition must reference named, durable artifacts — verbal summaries and chat history do not satisfy requirements.
- **Least-privilege decomposition**: agents must not perform work outside their lane; orchestrator is the sole intake mechanism.
- **Mandatory intake**: every request — regardless of apparent simplicity — routes through `orchestrator` first for lane classification, specialist selection, and determinism validation.

### 1.2 The Three-Lane Operating Model

The three-lane model is the structural backbone of the entire governance system. It is defined in `governance-lifecycle.instructions.md` and detailed in the planning-execution-review-governance reference.

| Lane | Responsibility | Primary Outputs | Exit Condition |
|---|---|---|---|
| **Planning** | Analyze intent, constraints, dependencies; produce execution-ready work packages | Grid-first markdown plan packets in `.docs/plans/`; research in `.docs/research/` | Every work package has owner, scope, acceptance criteria, risk controls, and handoff data |
| **Execution** | Build approved artifacts from planning packets | Code, tests, docs, scripts, workflows, change entries in `.docs/changes/` | Artifact acceptance criteria are met and evidence is recorded |
| **Review** | Validate quality, correctness, security, and standards adherence | Review reports with severity-tagged findings and required actions | All findings resolved or explicitly accepted with decision record |

**Lane rules:**
- Every agent, instruction, prompt, and skill is assigned exactly one primary lane and optionally one secondary lane.
- Catalog entries (agents-discovery-index.md, skills-discovery-index.md, instructions-discovery-index.md, prompts-discovery-index.md) are the authoritative source for lane assignments.
- Lane conflicts are resolved explicitly by `orchestrator` via phase split; mixed ownership is never left implicit.
- Changing the Discipline list in the Phase/Discipline/Lane matrix requires a full matrix revisit and an ADR entry (policy decision DEC-PDL-07).

### 1.3 Traceability Model

The system uses immutable IDs across the full lifecycle:

| ID Type | Pattern | Required In |
|---|---|---|
| Vision ID | `VIS-YYYYMMDD-###` | Vision statement and top-level plan packet |
| Plan ID | `PLAN-YYYYMMDD-###` | Planning packet, execution notes, review report |
| Workstream ID | `WS-##` | Planning rows and execution tasks |
| Decision ID | `DEC-##` | Architecture, routing, or scope decisions |
| Review ID | `REV-YYYYMMDD-###` | Review report and disposition tracking |

### 1.4 How the System Fits Together

The governance system operates through five interlocking layers:

1. **Policy layer** (`.github/instructions/*.instructions.md`) — always-on mandatory rules applied by `applyTo` scope; never contain workflows
2. **Routing layer** (`orchestrator.agent.md` + `copilot-instructions.md`) — mandatory entry point for every request; catalog-driven routing
3. **Discovery layer** (`.github/catalogs/`) — four index files that map every asset to a lane; the source of truth for routing decisions
4. **Workflow layer** (`.github/skills/*/SKILL.md`) — situational, self-contained workflows loaded when triggered; never cross-reference other skills
5. **Audit and health layer** (governance skills + PowerShell scripts) — periodic and on-demand governance assessment producing durable evidence artifacts

**Artifact storage convention:**
- Plans: `.docs/plans/<domain>/<workstream>/`
- Research: `.docs/research/<domain>/`
- Change tracking: `.docs/changes/<artifact-type>/<artifact-class>/<item>/`
- Governance audits: `.docs/changes/governance/audits/`
- Skill reviews: `.docs/changes/skill/reviews/<skill-name>/`
- Agent reviews: `.docs/changes/agent/reviews/<agent-name>/`
- ADRs: `.docs/adr/`

---

## SECTION 2: Per-Governance-Type Analysis

### 2.1 Request Intake Governance

**Asset:** `orchestrator.agent.md` + `work-intake-governance` skill + `governance-lifecycle.instructions.md`

**Purpose:** Classify every inbound request before any specialist or skill execution begins. Prevent scope drift, role bleed, and unapproved work from entering delivery.

**Why it exists:** Without mandatory intake, specialists execute incorrectly scoped work, lanes collapse into each other, and deliverables diverge silently from plans.

**Triggers:** Every workspace request — no exceptions. Even trivial single-lane tasks must pass through orchestrator.

**Workflow (orchestrator):**
1. Classify request into one primary category and optional secondary categories using the Category Routing Map
2. Resolve lane owner from the category map
3. Select candidate specialist agents from agents-discovery-index.md
4. Select companion skills from skills-discovery-index.md
5. Apply tie-break rules; select one owner per phase
6. Publish intake schema before specialist execution begins

**Required intake schema fields (all mandatory):**
- Objective
- In-scope / Out-of-scope
- Required outputs
- Primary lane + Owner + Handoff target
- Candidate capabilities / skills / selected target / rejected candidates with reason codes
- Determinism status
- If bounded exploration: hypothesis, time-box, success criteria, closure decision owner

**Work-intake-governance skill adds:** Pre-backlog control for raw demands — classifies inbound requests as accept, defer, reject, or route before they enter planning. Produces: intake record, evidence sufficiency note, urgency/impact assessment, next-action trigger.

**Responsible assets:** `orchestrator.agent.md` (mandatory entry point), `work-intake-governance/SKILL.md` (pre-backlog), `governance-lifecycle.instructions.md` (policy authority)

**Hard constraints:**
- Must not perform domain implementation work
- Must not allow intake bypass under any circumstance
- Must not let planning, implementation, and review collapse into one workflow
- No direct specialist execution is allowed before orchestrator routing, including single-lane tasks

**Integration:** Every other governance type downstream of intake. The orchestrator's category routing map explicitly maps "Governance and release control" to the Review lane.

---

### 2.2 Customization Type Governance (Agents, Instructions, Skills, Prompts)

This governance type covers four item-level audit skills and one type-level aggregation skill.

#### 2.2.1 Agent Governance — `audit-agent/SKILL.md`

**Purpose:** Evaluate `.agent.md` files for role quality, invocation boundary precision, and platform-currency alignment.

**Standards (AGR-M* mandatory, AGR-S* advisory):**

| ID | Standard | Type |
|---|---|---|
| AGR-M1 | Specialization — singular role, no mixed responsibilities | MUST |
| AGR-M2 | Valid YAML frontmatter (`name`, `description`) and `## Specialization` section | MUST |
| AGR-M3 | `description` is third-person, invocation-focused, not a workflow summary | MUST |
| AGR-M4 | `## Hard Constraints` section present and defines what agent will not do | MUST |
| AGR-S1 | All required sections present: Specialization, Focus Areas, Standards, Hard Constraints, Preferred Companion Skills | SHOULD |
| AGR-S2 | No hardcoded cross-agent delegation or required-sub-agent directives | SHOULD NOT |
| AGR-S3 | No harmful role overlap or contradictory behavior with sibling agents | SHOULD NOT |
| AGR-S4 | Growth governance alignment: reuse-before-create, anti-duplication | SHOULD |
| AGR-S5 | Platform currency: frontmatter aligned with current VS Code custom agent spec | SHOULD |

**Workflow:** Collect agent files → load per-agent history → build deny-list from rejected recommendations → re-evaluate source catalog → run all AGR-M*/AGR-S* checks → update history → produce review report.

**Output artifacts:**
- Per-agent review: `.docs/changes/agent/reviews/<agent-name>/review.md`
- Per-agent history: `.docs/changes/agent/history/<agent-name>-history.md`
- Conflict artifacts (when detected): `.docs/changes/agent/conflicts/`

**Key rule:** Source catalog (`./references/source-catalog.md`) must be read BEFORE producing any findings. Platform assessments are grounded in source catalog, not local tooling.

#### 2.2.2 Instruction Governance — `audit-instructions/SKILL.md`

**Purpose:** Evaluate `.instructions.md` files for policy-domain integrity, `applyTo` scope correctness.

**Standards (INR-M* mandatory, INR-S* advisory):**

| ID | Standard | Type |
|---|---|---|
| INR-M1 | Singular policy domain | MUST |
| INR-M2 | Valid frontmatter with `name`, `description`, `applyTo` | MUST |
| INR-M3 | `applyTo` not broader than policy requires; `**` only for truly global rules | MUST |
| INR-M4 | No task workflow content (multi-step procedures must live in skills) | MUST |
| INR-S1 | No conflict with other instruction files | SHOULD NOT |
| INR-S2 | Non-obvious rules include brief rationale | SHOULD |
| INR-S3 | No conflict with agent or skill boundaries | SHOULD NOT |
| INR-S4 | Brevity — economical wording | SHOULD |
| INR-S5 | Growth governance alignment | SHOULD |

**Output artifacts:**
- Per-instruction review: `.docs/changes/instruction/reviews/<instruction-name>/review.md`
- Per-instruction history: `.docs/changes/instruction/history/<instruction-name>-history.md`

#### 2.2.3 Skill Governance — `audit-skill/SKILL.md`

**Purpose:** Evaluate skill SKILL.md files for reusable workflow quality, trigger clarity, self-containment.

**Standards (SKR-M* mandatory, SKR-S* advisory):**

| ID | Standard | Type |
|---|---|---|
| SKR-M1 | Hyper-specialized to one objective only | MUST |
| SKR-M2 | Valid YAML frontmatter and Markdown structure | MUST |
| SKR-M3 | Clear discovery triggers in description and body | MUST |
| SKR-M4 | No cross-skill references — no invocations, delegations, or required-sub-skill directives to named sibling skills | MUST |
| SKR-S1 | Assets present when they materially improve execution | SHOULD |
| SKR-S3 | Markdown links are resolvable and non-placeholder | SHOULD |
| SKR-S4 | Growth governance alignment | SHOULD |
| SKR-S5 | Economical wording; no duplication or narrative padding | SHOULD |

**Key rule (SKR-M4):** Self-containment is the most distinctive constraint. Skills must not depend on other named skills. If shared logic is needed, it must be inlined or an explicit orchestrator skill introduced as the indirection layer.

**Output artifacts:**
- Per-skill review: `.docs/changes/skill/reviews/<skill-name>/review.md`
- Per-skill history: `.docs/changes/skill/history/<skill-name>-history.md`

**Script assets:** `generate-audit-skill-baseline.ps1`, `get-audit-skill-metadata.ps1`, `generate-audit-skill-targeted.ps1`, `refresh-audit-skill-history.ps1`

#### 2.2.4 Prompt Governance — `audit-prompts/SKILL.md`

**Purpose:** Evaluate `.prompt.md` files for execution-contract quality, invocation safety, output clarity.

**Standards (PRR-M* mandatory, PRR-S* advisory):**

| ID | Standard | Type |
|---|---|---|
| PRR-M1 | Singular purpose — one repeatable workflow task | MUST |
| PRR-M2 | Valid frontmatter with `name`, `description` | MUST |
| PRR-M3 | Required output structure explicitly defined in body | MUST |
| PRR-M4 | Skill routing present when driving a reusable workflow | MUST |
| PRR-S1 | No conflict with other prompts | SHOULD NOT |
| PRR-S2 | Brevity — no narrative padding beyond routing and output clarity | SHOULD |
| PRR-S3 | Growth governance alignment | SHOULD |

**Output artifacts:**
- Per-prompt review: `.docs/changes/prompt/reviews/<prompt-name>/review.md`
- Per-prompt history: `.docs/changes/prompt/history/<prompt-name>-history.md`

#### 2.2.5 Type-Level and Cross-Type Governance — `audit-customization-types/SKILL.md`

**Purpose:** Evaluate governance at the type layer — cross-type interaction failures, type-level conflict detection, boundary clarity.

**Standards (TYP-M* mandatory, TYP-S* advisory):**

| ID | Standard | Type |
|---|---|---|
| TYP-M1 | Type coverage completeness — all in-scope types explicitly covered | MUST |
| TYP-M2 | Interaction matrix completeness — every pair has explicit result | MUST |
| TYP-M3 | Evidence traceability — failed findings link to file paths and check IDs | MUST |
| TYP-M4 | Deterministic disposition contract — derived from defined rule set | MUST |
| TYP-M5 | Severity mapping consistency — one explicit mapping table applied consistently | MUST |
| TYP-S1 | Same-type artifacts do not conflict or cause failures | SHOULD NOT |
| TYP-S2 | Cross-type artifacts do not conflict | SHOULD NOT |
| TYP-S3 | Boundary clarity — responsibilities explicit, no duplication | SHOULD |
| TYP-S4 | Catalog and taxonomy parity | SHOULD |
| TYP-S5 | Brevity | SHOULD |
| TYP-S6 | Growth governance alignment | SHOULD |

**Required output grids (in order):**
1. Type Scope Grid
2. Standards Outcome Grid
3. Same-Type Interaction Grid
4. Cross-Type Interaction Grid
5. Severity Mapping Grid
6. Failure Detail Grid
7. Ranked Recommendations Grid
8. Disposition Grid

**Output path:** `.docs/changes/governance/type-audits/audit-customization-types.md`

**Script:** `test-type-interaction-matrix.ps1`

---

### 2.3 Naming and Taxonomy Governance

**Assets:** `governance-naming-conventions.instructions.md` (policy) + `asset-naming-taxonomy/SKILL.md` (enforcement workflow)

**Purpose:** Ensure every asset is consistently named, classifiable, and discoverable across its full lifecycle context.

**Why it exists:** Inconsistent naming breaks catalog lookups, routing determinism, and agentic discovery. A new team member or agent must be able to find assets by lane + domain without reading all catalog tables.

**Four-layer classification model:**

| Layer | What It Classifies | Examples |
|---|---|---|
| Type | Structural form (path + extension) | Agent (`.agent.md`), Instruction (`.instructions.md`), Prompt (`.prompt.md`), Skill (`SKILL.md`) |
| Lane | Lifecycle phase (Planning, Execution, Review) | Authoritative in catalog indexes |
| Domain | Subject area | Governance, Engineering, Mobile, Data, DevOps, Documentation, Meta-workflow |
| Function | Action/verb vocabulary aligned to lane | Review-lane verbs: audit, evaluate, assess; Execution-lane verbs: build, implement, scaffold |

**Core naming rules:**
- Skills: `<verb>-<domain>` or `<noun>-<domain>`
- Instructions: `<domain>` or `<domain>-<policy>`
- Agents: `<domain>-<specialist>` unless single meta-role name already unambiguous
- Prompts: `<verb>-<domain>` or `<domain>-<action>`
- Catalogs and indexes: descriptive names, never `README.md` for inventory/mapping
- `.docs` names: lowercase kebab-case; no date prefixes in file/folder names
- `README.md` reserved for true folder entry-point guidance only
- `INDEX.md` reserved for generated indexes

**Naming formula (from function-vocabulary.md references):** A name whose leading verb does not align with its catalog lane is a **vocabulary drift signal** — not automatically a violation but requires justification and recording in `lane-intent.md`.

**Key constraint:** Folders under `.docs/changes/` that represent a skill, agent, instruction, or prompt must exactly match that asset's canonical catalog name.

**Output:** Naming taxonomy assessment grid, canonical naming map (legacy → canonical), vocabulary drift signals table.

---

### 2.4 Lifecycle and Lane Governance

**Asset:** `governance-lifecycle.instructions.md` (normative policy) + `planning-execution-review-governance.md` (reference) + `route-customization/SKILL.md` + `writing-plans/SKILL.md` + `task-execution/SKILL.md`

**Purpose:** Classify every artifact into exactly one primary lane, enforce explicit handoffs, maintain traceability from vision to delivery.

**Key policies:**
- Every agent, instruction, prompt, and skill must have exactly one primary lane and at most one secondary lane.
- Catalog integrity: lane mappings must be updated in all four catalog files in the **same change** as any create/delete/rename of a customization asset. Omitting this is a MUST failure (GOV-M3).
- An unregistered skill or orphaned catalog row is a MUST failure with no grace period.
- Catalog entry requires: one-line rationale for lane assignment.

**Composition gate policy:** Multi-capability requests must pass a composition gate before execution. The gate requires a phase-output ownership matrix where every required output maps to exactly one owning phase.

**Bounded exploration policy:** Only permitted when novelty, ambiguity, or conflicting constraints make deterministic execution suboptimal. Requires: stated hypothesis, strict scope boundary, time-box, measurable success criteria, closure decision (adopt/discard/convert).

**Planning output requirements:**
- Markdown and grid-first
- Durable handoff context sufficient to resume in a later session
- Explicit IDs for plans, workstreams, and decisions
- Workstream boundaries defined for parallel execution

**Execution output requirements:**
- Reference originating plan and workstream IDs
- Scope changes recorded as explicit decisions before divergence
- All requested deliverables explicitly completed

**Review output requirements:**
- Evaluated against active instruction files and acceptance criteria
- Severity-tagged findings with explicit dispositions
- Determinism controls verified using the Determinism Review Scorecard
- Standard checklist at `.github/skills/governance-audit/references/determinism-review-scorecard.md`

**Integration:** This is the most cross-cutting governance type. It directly governs orchestrator behavior, catalog integrity, and every other governance type's output requirements.

---

### 2.5 Release Governance

**Assets:** `governance-release.instructions.md` (policy) + `release-readiness/SKILL.md` (execution workflow)

**Purpose:** Ensure every promotion has named, durable evidence; an explicit approval chain; a tested rollback procedure; and release notes written before promotion begins.

**Policy (governance-release.instructions.md) — `applyTo: '**'`:**

**Evidence requirements:**
- Every promotion needs a named evidence bundle: smoke results, gate checklist outcome, security sign-off reference
- Evidence must be durable artifacts before promotion executes — notes and verbal summaries do not qualify
- Evidence must trace to originating plan or workstream ID

**Approval chain:**
- At minimum: one engineering owner and one product/delivery owner
- Approvals recorded as named, timestamped entries — not inferred from chat history
- Security-sensitive/high-risk: requires explicit security sign-off

**Rollback documentation:**
- Rollback procedure must exist and be reviewed before every promotion
- Steps must be concrete and executable without reference to in-flight context
- Rollback owner must be identified by name or role (not left implicit)

**Release notes format:**
- Must include: scope included, known issues, rollback reference, approval evidence reference
- Must be written before promotion begins (not after)
- Scope must distinguish delivered vs deferred/descoped items

**Release-readiness skill workflow:**
1. Confirm promotion target and link to originating plan ID
2. Populate gate checklist (build integrity, test evidence, security gate, performance gate, rollback doc, approval chain)
3. Validate rollback (present, executable, named owner)
4. Assemble evidence bundle
5. Obtain named/timestamped approvals
6. Produce go/no-go decision: Pass / Hold / No-Go
7. If No-Go: document blocking gate and required resolution

**Gate reference:**

| Gate | Pass Criteria |
|---|---|
| Build integrity | Clean pipeline run, no suppressed failures |
| Test evidence | Unit, integration, smoke evidence present and dated |
| Security gate | Sign-off reference present; no unresolved blocking findings |
| Performance gate | Signal vs thresholds reviewed (waivable) |
| Rollback doc | Exists, current, named owner |
| Approval chain | At minimum one engineering + one product/delivery owner |

**Output artifacts:** Gate checklist result, evidence bundle, rollback confirmation, sign-off record — all required before go/no-go.

**Integration:** `governance-release.instructions.md` applies to all file types (`**`). `release-readiness` skill explicitly satisfies the policy requirements. Connected to `dependency-security-scan`, `test-orchestration`, `acceptance-governance`.

---

### 2.6 Acceptance and Quality Governance

**Assets:** `acceptance-criteria/SKILL.md` + `acceptance-governance/SKILL.md`

#### 2.6.1 Acceptance Criteria

**Purpose:** Convert backlog items into explicit, testable acceptance conditions before implementation starts.

**Outputs:** Numbered acceptance criteria set, scenario matrix (primary/edge/negative/recovery), done gate, ambiguity log, traceability note.

**Criteria rules:** Each criterion must express one observable outcome; be testable; avoid implementation instructions; be traceable to a source work item.

#### 2.6.2 Acceptance Governance

**Purpose:** Standardize the intake, checklist application, finding structure, and disposition output across all discipline reviews (Architecture, Engineering, Security, Performance, UX, Product, Governance).

**Workflow:**
1. Confirm artifact, acceptance criteria, discipline, and phase
2. Select discipline checklist
3. Apply checklist line by line (Pass/Fail/N/A with evidence note)
4. Classify each Fail by severity: Critical (blocks sign-off), Major (conditional), Minor (advisory), Advisory
5. Write finding set
6. Write evidence summary
7. Record disposition: Approved / Approved with conditions / Rejected
8. Populate follow-up list

**Hard guardrails:**
- Do not record Approved when any Critical finding is open
- Do not omit findings to reach a cleaner disposition
- Do not merge findings from separate disciplines without labeling discipline context

**Discipline checklists cover:**

| Discipline | Core Check Areas |
|---|---|
| Architecture | Boundary conformance, coupling risk, ADR coverage, change safety |
| Engineering | Standards conformance, test coverage, plan fidelity, security baseline |
| Security | Control implementation, validation points, exposure surface, secrets handling |
| Performance | Budget compliance, regression risk, instrumentation coverage |
| UX | Accessibility (WCAG AA), design fidelity, journey completeness |
| Product Management | Acceptance criteria coverage, value delivery, scope conformance |
| Governance | Policy conformance, evidence completeness, audit trail integrity |

**Integration:** `acceptance-governance` is the shared review contract connecting code-reviewer, manual-code-reviewer, request-code-review, remediate-review, test-design-review, and release-readiness.

---

### 2.7 Change Control Governance

**Asset:** `scope-change-control/SKILL.md`

**Purpose:** Govern scope changes during active delivery by producing explicit decisions with impact analysis instead of silent divergence.

**Triggers:** New work proposed during active execution; release candidate needs descoping/swapping under pressure; teams are accepting silent additions without trade-offs.

**Change types handled:** Add, descope, swap, exception.

**Workflow:**
1. Record requested change and active delivery context
2. Classify request type
3. Analyze impact on date, scope confidence, dependencies, acceptance baseline
4. Decide: approve, reject, defer, or swap
5. If approved: record compensating action needed to protect commitment
6. If baseline materially changes: define re-baseline trigger and owner
7. Publish change record to prevent silent drift

**Scope control rules:**
- No approved add without explicit impact and compensating action
- A swap must name both incoming and outgoing scope
- A defer is a decision, not a parking lot
- If change invalidates prior acceptance assumptions, baseline must be updated explicitly

**Output artifacts:** Scope-change record (Change ID, type, request, source, owner, decision), impact analysis (date/scope/confidence/dependency effects), compensating action note, re-baseline trigger.

**Integration:** Sits between planning lane and execution lane. Connects to `writing-plans`, `work-intake-governance`, and `acceptance-governance`.

---

### 2.8 Security Governance

**Assets:** `secure-coding.instructions.md` (policy) + `security-research/SKILL.md` + `dependency-security-scan/SKILL.md` + `security-researcher.agent.md`

#### 2.8.1 Secure Coding Policy (`secure-coding.instructions.md`, `applyTo: '**'`)

**Core principles:**
- Least privilege, deny by default, explicit allow-lists for external systems
- Validate all external input at boundary using Syrx guard semantics
- Never hardcode secrets — use environment variables or approved secret manager
- Use explicit parameterized SQL only (no concatenation)
- Validate outbound user-supplied URLs to prevent SSRF
- No silent catches; log with actionable context, rethrow or translate
- Use modern, approved cryptographic algorithms; prefer HTTPS
- Prefer current stable package versions; run security scanning in CI

**`applyTo: '**'`** rationale: Security control gaps from narrower scoping are treated as unacceptable drift.

#### 2.8.2 Security Research Skill

**Purpose:** Research-only security assessment — identify vulnerabilities without implementing fixes.

**Scope:** .NET/C# codebases — input validation, auth/authz, secret handling, SQL/command/path injection, SSRF, unsafe deserialization, cryptography misuse, async/concurrency exploitable patterns, dependency hygiene.

**Evidence rules:** Each finding requires source file/symbol evidence, analyzer output, reproduction notes, or authoritative references. Incomplete evidence must be explicitly flagged as gaps.

**Output path:** `.docs/research/security/<solution>-security-research-report.md`

**Hard constraints:** Research only; no remediation implementation; no production code edits except the report; label uncertain items as hypotheses.

#### 2.8.3 Dependency Security Scan Skill

**Purpose:** Deterministic dependency vulnerability scanning covering CVE identification, SBOM generation, severity classification.

**Supported ecosystems:** NuGet, npm/yarn, Python pip.

**Depth modes:**

| Mode | When | Coverage |
|---|---|---|
| L1 Manifest Inventory | Quick triage | Enumerate manifests; no CVE lookup |
| L2 CVE Scan (direct) | Standard delivery gate (Phase P7a default) | Scan direct dependencies; gate signal |
| L3 Full SBOM + Transitive | Release promotion | Full SBOM; transitive scan; upgrade path analysis |
| L4 Multi-DB Cross-Reference | Critical path, regulated context | L3 + cross-reference NVD + GitHub Advisory + OSV |

**Output artifacts:**
- Dependency findings report: `.docs/changes/[date]-[task]-security-scan.md`
- SBOM inventory (L3+): `.docs/changes/[date]-[task]-sbom.md`

**Gate signal:** PASS / CONDITIONAL / BLOCK.

**Integration:** Triggered at Phase P7a of workspace delivery pattern; connected to release-readiness, CI/CD workflows, dependency hygiene policy.

---

### 2.9 Delivery Governance

**Asset:** `governance-delivery/SKILL.md`

**Purpose:** Produce and maintain delivery coordination artifacts for multi-discipline initiatives: RAID log, dependency map, milestone list, status update template.

**Triggers:** Delivery spans more than one discipline or team; milestone plan exists but RAID management is absent; delivery review needed; escalation paths undefined.

**RAID categories:**

| Category | Examples |
|---|---|
| Risk | Schedule risk, capability gap, dependency delay, scope ambiguity |
| Assumption | Assumed availability, environment readiness, scope boundary |
| Issue | Active blocker, defect with delivery impact, failed dependency |
| Dependency | Cross-discipline artifact, external decision, environment/tooling readiness |

**Required outputs:**
- RAID log (ID, category, description, owner, status, target resolution date)
- Dependency map (producing discipline, consuming discipline, artifact/decision required, current status)
- Milestone list (named checkpoints, target dates, owners, entry/exit criteria)
- Status update template (milestone status, new blockers, resolved items, next checkpoint)

**Done criteria:** RAID log populated with named owner/status per item; dependency map covers all cross-discipline handoffs; milestone list has target dates, owners, entry/exit criteria; status template present.

**Integration:** Related to `delivery-status-grid`, `writing-plans`, `analysis-execution`.

---

### 2.10 Governance Health and Audit Overview

This is the top-level governance tier — four skills that aggregate evidence upward into progressively higher-level reports.

#### 2.10.1 Workspace-Level Governance Audit — `governance-audit/SKILL.md`

**Purpose:** Run a full workspace-level governance assessment and return a single ranked, evidence-backed remediation report.

**Trigger:** Governance posture must be assessed across agents, instructions, prompts, skills, and catalogs; periodic health check requested; restructuring may have introduced drift.

**Required outputs:**
- Report at `.docs/changes/governance/audits/governance-audit.md`
- Coverage grid by lane
- Standards grid for GOV-M* and GOV-S*
- Ranked recommendations with priority and evidence

**Violation code legend:**

| Code Prefix | Standard | Type |
|---|---|---|
| GOV-M* | Mandatory governance check | MUST |
| GOV-S* | Advisory governance check | SHOULD |
| GOV-SK | Skill quality aggregate | Aggregate |
| GOV-CUS | Customization quality aggregate | Aggregate |
| GOV-OPT | Optimization factor coverage | Aggregate |
| SKR-M*/SKR-S* | Skill quality checks | From audit-skill |
| INR-M*/INR-S* | Instruction quality checks | From audit-instructions |
| AGR-M*/AGR-S* | Agent quality checks | From audit-agent |
| PRR-M*/PRR-S* | Prompt quality checks | From audit-prompts |
| OPR-M*/OPR-S* | Optimization quality checks | From optimize-customizations |

**Core GOV-M* checks:**
- GOV-M1: Lane coverage
- GOV-M2: Frontmatter validity
- GOV-M3: Catalog integrity (unregistered skill or orphaned catalog row = immediate MUST failure, no grace period)
- GOV-M4: Lifecycle-governance coverage
- GOV-M5: Skill self-containment (no cross-skill references in SKILL.md bodies)

**Script integration (all in `.github/scripts/powershell/`):**
- `get-lane-counts.ps1`
- `test-catalog-integrity.ps1`
- `test-frontmatter-validity.ps1`
- `test-hub-file-sync.ps1`
- `test-governance-link-graph.ps1`
- `test-governance-artifact-contract.ps1`
- `test-utilization-coverage.ps1`
- `test-review-recency.ps1`
- `test-source-catalog-freshness.ps1`
- `test-responsibility-overlap.ps1`
- `test-routing-determinism.ps1`
- `test-naming-conformance.ps1`
- `test-global-applyto-rationale.ps1`
- `test-governance-must-traceability.ps1`
- `test-type-interaction-matrix.ps1`
- And many others

**Final disposition:** FAILED if any MUST check fails.

#### 2.10.2 Governance Health Overview — `governance-health-overview/SKILL.md`

**Purpose:** Synthesize outputs from four sub-routines into one unified reconciled governance disposition. The most comprehensive governance assessment.

**Four evidence streams (all must be fresh):**
1. Core governance artifact (`.docs/changes/governance/audits/`)
2. Skill quality aggregate (`.docs/changes/skill/reviews/`)
3. Customization quality aggregate (`.docs/changes/customization/reviews/`)
4. Optimization factor artifact (`.docs/changes/customization/reviews/`)

**Key policy:** Default behavior is `fresh-run required`. Do not aggregate from previously existing artifacts when reruns are possible.

**Required outputs:**
- Reconciled report at `.docs/changes/governance/audits/governance-executive-audit.md`
- Report Navigation Grid (3 levels: Executive, Type, Item)
- Coverage Grid
- Standards Health Grid (GOV-M*, GOV-S*, GOV-SK, GOV-CUS, GOV-OPT)
- Aggregate Metrics Grid
- Failure Detail Grid
- Delta vs Prior Report Grid
- Responsibility overlap summary (from `test-responsibility-overlap.ps1`)
- Docs Corpus Hygiene Grid
- Ranked Recommendations Grid
- Explicit final disposition (PASSED or FAILED)

**Script:** `invoke-governance-health-overview.ps1`

**Partial-run decision table:**

| Evidence Segments Completed | Disposition |
|---|---|
| 4 of 4 | Normal PASSED/FAILED |
| 3 of 4 | PROVISIONAL-FAILED |
| 2 of 4 | PROVISIONAL-FAILED |
| 1 of 4 | PROVISIONAL-FAILED |
| 0 of 4 | Not reported — abort |

**Critical check:** `test-governance-must-traceability.ps1` must pass before report publication; failure returns PROVISIONAL-FAILED.

**Decision rules:**
- Core governance pass does not override failing skill/customization quality outcomes
- Open conflict artifacts from customization review force overall FAILED
- If source artifacts disagree, prefer latest-dated output

#### 2.10.3 Governance Summarize — `governance-summarize/SKILL.md`

**Purpose:** Produce one concise, single-page governance briefing (450–700 words excluding tables) aggregating most salient findings from existing governance artifacts.

**Trigger:** Governance docs have grown; stakeholders need fast executive readout; periodic checkpoint needs one page instead of multi-file narratives.

**Salience selection priority:**
1. MUST failures or unresolved conflicts
2. Repeated advisories across multiple source artifacts
3. Lane coverage or catalog integrity issues blocking delivery
4. High-impact hygiene gaps
5. Near-term corrective actions with clear owners

**Required sections (in order):**
1. Disposition Snapshot
2. Top Salient Findings
3. Risk and Impact
4. Decision and Action Matrix
5. Evidence Index

**Limits:** Top 5 salient findings; top 5 actions; single final disposition line (PASSED / PASSED WITH ADVISORIES / FAILED).

**Output path:** `.docs/changes/governance/audits/governance-one-pager.md`

#### 2.10.4 Execute Customization Audit — `execute-customization-audit/SKILL.md`

**Purpose:** Produce one executive-level governance audit report aggregating existing source audit artifacts. Aggregation-only; does not perform standalone audits.

**Required source artifacts (all must pre-exist):**
- `.docs/changes/governance/audits/governance-audit.md`
- `.docs/changes/skill/reviews/governance-audit-types-skills.md`
- `.docs/changes/customization/reviews/governance-audit-types-customizations.md`
- `.docs/changes/customization/reviews/governance-audit-types-optimization.md`

**Executive standards (EXE-M*):**

| ID | Standard | Type |
|---|---|---|
| EXE-M1 | Exactly one executive report produced | MUST |
| EXE-M2 | Failure matrix near top with explicit failure reasoning | MUST |
| EXE-M3 | Any source-level Fail forces executive FAILED | MUST |
| EXE-M4 | Required section order enforced | MUST |
| EXE-M5 | Evidence links are human-readable markdown links only | MUST |

**Required output sections (in order):**
1. Executive Briefing
2. Aggregate Outcome Grid
3. Failure Matrix
4. Per-Type Results
5. Ranked Recommendations

**Output path:** `.docs/changes/governance/audits/execute-customization-audit.md`

**Script:** `invoke-execute-customization-audit.ps1`

#### 2.10.5 Governance Briefer Agent — `governance-briefer.agent.md`

**Purpose:** Produce one concise, evidence-linked governance briefing page for a requested date window. Summarizes only — does not run full governance audits unless explicitly requested.

**Audience modes:** Executive, Engineering Leads, Customization Maintainers.

**Sources:** `.docs/changes/` and `.github/skills/governance-audit/references/`.

**Output:** `.docs/changes/governance/audits/governance-one-pager.md`

**Hard constraints:**
- Prefer most recent dated artifact when sources disagree
- Flag evidence drift when same-day artifacts conflict
- Never hide MUST failures or unresolved conflicts
- Keep recommendations actionable with owner and target date

**Companion skills:** `governance-summarize`, `execute-customization-audit`, `delivery-status-grid`, `governance-audit`

---

### 2.11 Customization Optimization Governance

**Asset:** `optimize-customizations/SKILL.md`

**Purpose:** Evaluate and improve authoring quality for agents, instructions, prompts, and skills — covering clarity, brevity, determinism, and cross-asset consistency.

**Standards (OPR-M* mandatory, OPR-S* advisory):**

| ID | Standard | Type |
|---|---|---|
| OPR-M1 | Scope purity — one primary objective, no role bleed | MUST |
| OPR-M2 | Deterministic wording — testable, concrete directives | MUST |
| OPR-M3 | Non-contradiction with active governance instructions or catalogs | MUST |
| OPR-M4 | No cross-skill delegation in SKILL.md bodies | MUST |
| OPR-S1 | Brevity — economical wording | SHOULD |
| OPR-S2 | Reuse over duplication | SHOULD |
| OPR-S3 | Output clarity — required outputs explicit and easily validated | SHOULD |

**Output artifact:** `.docs/changes/customization/reviews/governance-audit-types-optimization.md`

**Template:** `./references/optimization-factor-template.md`

---

### 2.12 Cadenced Audit Governance (Monthly/Quarterly)

**Assets:** `.docs/changes/governance/monthly-light-audit-template.md` + `.docs/changes/governance/quarterly-full-audit-template.md`

**Monthly light audit template covers:**
- New or renamed customization assets
- Catalog sync drift
- `.docs` orphan candidates
- Link integrity
- Findings with severity and evidence
- Candidate actions (duplicate/redundant/misplaced/orphan)
- Disposition (Pass/Pass with advisories/Fail)
- Named approvals with timestamps

**Quarterly full audit template covers:**
- Type-level customization audit
- Optimization and drift audit
- `.docs` retention and curation audit
- Link-integrity validation
- Remediation backlog prioritization
- Standards outcome grid (TYP-M*, OPR-M*)
- Release governance readiness
- Final go/no-go disposition

**Integration:** Quarterly template explicitly requires Release Governance Readiness section with evidence bundle, approval chain, rollback owner, and release notes status.

---

### 2.13 Customization Taxonomy

**Asset:** `.github/skills/governance-audit/references/customization-taxonomy-v1.md`

**Status:** Approved baseline (2026-04-02). Related plan: PLAN-20260402-001.

**Five-field taxonomy for classification:**

| Field | Meaning |
|---|---|
| ASSET | Canonical asset name |
| LANE | Lifecycle lane (planning, execution, review) |
| FAMILY | Conceptual grouping: governance, planning, delivery, execution, orchestration, review, test, security, standards, synchronization |
| TYPE | Asset kind: agent, instruction, prompt, skill |
| ROLE | Primary functional role for routing and intent matching |

**Source-of-truth precedence:** Planning-execution-review-governance.md > catalog indexes. The taxonomy is authoritative for conceptual classification only; operational routing and lane ownership remain governed by catalog indexes.

**Approved v1 family decisions:**
- `delivery` and `execution` remain separate families
- Performance assets are under `test` family in v1
- `architecture-designer` is under `standards` family in v1

---

## SECTION 3: Asset Inventory

### 3.1 Governance Instructions

| File | `applyTo` | Primary Lane | Purpose |
|---|---|---|---|
| `governance-lifecycle.instructions.md` | `**/*.md` | Planning | Mandatory lane classification, catalog integrity, handoff traceability, determinism policy |
| `governance-naming-conventions.instructions.md` | `.github/**/*.md` | Execution | Asset naming standards for agents, instructions, skills, prompts |
| `governance-release.instructions.md` | `**` | Execution | Release evidence, approval chain, rollback documentation, release notes format |
| `request-economy.instructions.md` | `**` | Execution | Premium-request budgeting, context-window controls, escalation criteria |
| `secure-coding.instructions.md` | `**` | Execution | OWASP-aligned secure coding rules for all artifact types |
| `task-implementation.instructions.md` | `.docs/changes/*.md` | Execution | Plan linkage, deviation traceability, progressive change artifact updates |
| `technical-docs.instructions.md` | `.docs/components/**/*.md,.docs/changes/**/*.md,.docs/plans/**/*.md,README.md` | Planning | Documentation artifact standards, folder hierarchy, naming conventions |
| `architecture.instructions.md` | `**/*.cs` | Planning | DDD, SOLID, .NET architecture boundary rules |
| `prd.instructions.md` | `.docs/plans/**/*.md,.docs/specs/**/*.md,**/*prd*.md` | Planning | PRD/specification authoring structure and mandatory identifiers |
| `ux-design.instructions.md` | `.docs/**/*.md` | Planning | WCAG 2.1 AA baseline, wireframe standards, UX design process |
| `testing-strategy.instructions.md` | `**/*.cs` | Execution | Test implementation patterns and validation |
| `validation.instructions.md` | `**/*.cs` | Execution | Syrx guard usage at public boundaries |
| `csharp.instructions.md` | `**/*.cs,**/*.csproj` | Execution | C# engineering and style standards |
| `namespace-boundaries.instructions.md` | `**/*.cs,**/*.csproj` | Execution | Assembly and namespace layer separation |
| `async-programming.instructions.md` | `**/*.cs` | Execution | Async/await and concurrency standards |
| `syrx.instructions.md` | `**/*.cs` | Execution | Syrx 2.4.1 repository and SQL usage |
| `ci-cd.instructions.md` | `.github/workflows/*.yml` | Execution | GitHub Actions CI/CD pipeline standards |
| `sql-dba.instructions.md` | `**/*.sql` | Execution | T-SQL safety, parameterization, naming |
| `powershell.instructions.md` | `**/*.ps1,**/*.psm1` | Execution | PowerShell scripting standards |
| `mobile-frontend.instructions.md` | `**/*.tsx,**/*.xaml` | Execution | Cross-platform mobile frontend standards |
| `web-frontend.instructions.md` | `**/*.ts,**/*.tsx,**/*.js,**/*.jsx,**/*.css,**/*.html` | Execution | Web frontend component and security standards |

### 3.2 Governance Agents

| Agent File | Primary Lane | Role |
|---|---|---|
| `orchestrator.agent.md` | Planning | Mandatory intake and routing for every request; catalog-driven specialist selection |
| `governance-briefer.agent.md` | Review | Concise governance briefing pages; aggregates existing artifacts |
| `code-reviewer.agent.md` | Review | Reviews implementation against plans and standards; severity-ranked findings |
| `manual-code-reviewer.agent.md` | Review | Structured observation scribe for live code reviews; no evaluation |
| `security-researcher.agent.md` | Review | Research-only security assessment; no remediation implementation |
| `plan-researcher.agent.md` | Planning | Evidence-backed research and execution-ready plan authoring |
| `architecture-designer.agent.md` | Planning | Architecture boundaries, ADR decisions, non-functional constraints |
| `performance-assessor.agent.md` | Review | Performance assessment and evidence-backed recommendations |
| `benchmark-researcher.agent.md` | Review | BenchmarkDotNet methodology performance review |
| `powershell-reviewer.agent.md` | Review | PowerShell script safety, automation readiness, maintainability |

### 3.3 Governance Skills

| Skill | Primary Lane | Violation Codes | Output Path |
|---|---|---|---|
| `governance-audit` | Review | GOV-M*, GOV-S* | `.docs/changes/governance/audits/governance-audit.md` |
| `governance-health-overview` | Review | All code families | `.docs/changes/governance/audits/governance-executive-audit.md` |
| `governance-summarize` | Review | — | `.docs/changes/governance/audits/governance-one-pager.md` |
| `governance-delivery` | Planning | — | RAID log + dependency map + milestone list |
| `execute-customization-audit` | Review | EXE-M* | `.docs/changes/governance/audits/execute-customization-audit.md` |
| `audit-customization-types` | Review | TYP-M*, TYP-S* | `.docs/changes/governance/type-audits/audit-customization-types.md` |
| `audit-agent` | Review | AGR-M*, AGR-S* | `.docs/changes/agent/reviews/<agent-name>/review.md` |
| `audit-instructions` | Review | INR-M*, INR-S* | `.docs/changes/instruction/reviews/<instruction-name>/review.md` |
| `audit-skill` | Review | SKR-M*, SKR-S* | `.docs/changes/skill/reviews/<skill-name>/review.md` |
| `audit-prompts` | Review | PRR-M*, PRR-S* | `.docs/changes/prompt/reviews/<prompt-name>/review.md` |
| `optimize-customizations` | Review | OPR-M*, OPR-S* | `.docs/changes/customization/reviews/governance-audit-types-optimization.md` |
| `release-readiness` | Review | — | Gate checklist + evidence bundle + sign-off record |
| `acceptance-criteria` | Execution | — | Acceptance criteria set + scenario matrix + done gate |
| `acceptance-governance` | Review | — | Checklist result + finding set + disposition |
| `scope-change-control` | Execution | — | Scope-change record + impact analysis + compensating action |
| `work-intake-governance` | Execution | — | Intake record + admission decision + evidence note |
| `route-customization` | Planning | — | Routing decision (Agent/Instruction/Skill/No New Artifact) |
| `asset-naming-taxonomy` | Execution | — | Naming taxonomy assessment grid + drift signals |
| `security-research` | Review | — | `.docs/research/security/<solution>-security-research-report.md` |
| `dependency-security-scan` | Execution | — | `.docs/changes/[date]-[task]-security-scan.md` |

### 3.4 Governance Prompts

| Prompt | Primary Lane | Purpose |
|---|---|---|
| `execute-customization-audit.prompt.md` | Review | Canonical executive aggregation report |
| `governance-audit-types.prompt.md` | Review | Canonical type deep-scan governance report |
| `audit-customization-types.prompt.md` | Review | Deterministic type and cross-type customization interaction audit |
| `governance-item-audit.prompt.md` | Review | Canonical item deep-scan governance report for one customization item |
| `optimize-customizations.prompt.md` | Review | On-demand optimization-factor review |
| `audit-agent.prompt.md` | Review | Quality review of `.agent.md` files |
| `security-research.prompt.md` | Review | Security assessment output without implementation |
| `review-project.prompt.md` | Review | Plan alignment, artifact hygiene, scope integrity verification |
| `execute-manual-review.prompt.md` | Execution | Apply previously recorded manual review findings |
| `execute-delivery.prompt.md` | Execution | Resume active execution slice with traceability-first status |

### 3.5 Catalog Files

| File | Purpose |
|---|---|
| `catalogs/agents-discovery-index.md` | Lane assignments and rationale for all agents |
| `catalogs/skills-discovery-index.md` | Lane assignments, when-to-use, and skill file links for all skills |
| `catalogs/instructions-discovery-index.md` | Lane assignments and rationale for all instruction files |
| `catalogs/prompts-discovery-index.md` | Lane assignments, canonical identifiers, and file links for all prompts |

### 3.6 Reference Documents

| File | Purpose |
|---|---|
| `.github/skills/governance-audit/references/planning-execution-review-governance.md` | Canonical three-lane operating model reference with traceability IDs and planning packet contract |
| `.github/skills/governance-audit/references/governance-audit-checklist.md` | Compact governance audit checklist |
| `.github/skills/governance-audit/references/determinism-review-scorecard.md` | Standardized scorecard for determinism review (D1–D4 checks, E1–E4 bounded exploration) |
| `.github/skills/governance-audit/references/customization-taxonomy-v1.md` | Approved v1 five-field customization taxonomy |
| `.docs/changes/governance/monthly-light-audit-template.md` | Monthly light audit structure |
| `.docs/changes/governance/quarterly-full-audit-template.md` | Quarterly full audit structure |

### 3.7 PowerShell Scripts

All scripts located at `.github/scripts/powershell/`:

| Script | Governance Check |
|---|---|
| `get-lane-counts.ps1` | Lane coverage metrics |
| `test-catalog-integrity.ps1` | GOV-M3 — catalog sync |
| `test-frontmatter-validity.ps1` | GOV-M2 — frontmatter |
| `test-hub-file-sync.ps1` | Hub file synchronization |
| `test-governance-link-graph.ps1` | Link graph integrity |
| `test-governance-artifact-contract.ps1` | Artifact contract compliance |
| `test-utilization-coverage.ps1` | GOV-S9 — utilization |
| `test-review-recency.ps1` | GOV-S10 — review recency |
| `test-source-catalog-freshness.ps1` | Source catalog freshness |
| `test-responsibility-overlap.ps1` | GOV-S11 — responsibility overlap |
| `test-routing-determinism.ps1` | Routing determinism |
| `test-naming-conformance.ps1` | Asset naming conformance |
| `test-global-applyto-rationale.ps1` | Global applyTo rationale |
| `test-governance-must-traceability.ps1` | MUST-check traceability (blocks report publication if fails) |
| `test-type-interaction-matrix.ps1` | TYP-M2 — interaction matrix |
| `test-governance-count-consistency.ps1` | Count consistency |
| `test-overlap-watchlist.ps1` | Overlap watchlist |
| `test-artifact-reference-hygiene.ps1` | Artifact reference hygiene |
| `test-no-docs-dependency.ps1` | No-docs dependency check |
| `invoke-governance-health-overview.ps1` | Full health overview orchestration |
| `invoke-execute-customization-audit.ps1` | Executive audit orchestration |
| `invoke-index-refresh.ps1` | INDEX.md refresh |
| `run-full-governance-local.ps1` | Full local governance run |
| `governance-must-check-registry.json` | Registry of all MUST checks |
| `get-corpus-manifest.ps1` | Corpus manifest generation |
| `condense-dated-docs.ps1` | Dated document condensation |
| `Invoke-MatrixCoverageCheck.ps1` | PDL matrix coverage check |

---

## SECTION 4: Key Findings

### 4.1 Architectural Strengths

**1. Radical separation of policy from workflow.** Every instruction file contains a mandatory routing note (`Keep this file policy-only. Use [SKILL.md]...`) directing to the appropriate skill for operational detail. This strict separation prevents instruction files from becoming mixed-mode documents that trigger everywhere but contain conditional logic that only applies sometimes.

**2. Self-containment as a non-negotiable.** SKR-M4 (skill self-containment) and GOV-M5 are the same rule stated at two levels: skills must not invoke or delegate to other named skills. This is enforced at both item-level audit (audit-skill) and workspace-level audit (governance-audit). Cross-skill logic must be inlined or a dedicated orchestrator skill created. This design eliminates hidden dependency chains.

**3. Layered audit hierarchy with clear aggregation.** The audit architecture follows a deliberate pyramid:
- Level 1: Item-level audits (audit-agent, audit-instructions, audit-skill, audit-prompts)
- Level 2: Type-level audit (audit-customization-types) + Optimization audit (optimize-customizations)
- Level 3: Workspace governance audit (governance-audit)
- Level 4: Health overview (governance-health-overview) — reconciles all Level 3 outputs
- Level 5: Executive summary (execute-customization-audit, governance-summarize, governance-briefer)

**4. PowerShell-backed determinism.** The governance layer has 24+ PowerShell scripts providing automated evidence collection, covering lane counts, frontmatter validity, catalog integrity, link graphs, naming conformance, routing determinism, responsibility overlap, review recency, and source catalog freshness. `test-governance-must-traceability.ps1` blocks report publication if MUST traceability fails — enforcement is automated, not honor-system.

**5. Source catalog as grounding mechanism.** Agent, instruction, skill, and prompt audits all require reading a per-skill `./references/source-catalog.md` BEFORE producing any findings (marked BLOCKING). This prevents platform-specific recommendations from drifting against actual current VS Code behavior.

**6. History management across all customization types.** Every item-level audit skill maintains a history file (`.docs/changes/<type>/history/<name>-history.md`) and builds a deny-list from previously rejected recommendations. This prevents audit cycles from re-recommending changes that were deliberately rejected.

**7. Growth governance as a cross-cutting advisory standard.** Every audit skill includes a SHOULD standard for "growth governance alignment" (AGR-S4, INR-S5, SKR-S4, PRR-S3, TYP-S6): reuse-before-create, anti-duplication, delta-first edits, explicit auditability. This prevents the workspace from accumulating redundant assets over time.

### 4.2 Design Decisions Worth Documenting

**1. `applyTo: '**'` for three instructions.** `governance-release`, `request-economy`, and `secure-coding` use global scope. Each file includes an explicit rationale for why narrower scoping would create enforcement gaps. This is a deliberate design decision, not an oversight.

**2. Orchestrator as the single entry point.** The mandatory-intake rule is stated in three places: `copilot-instructions.md`, `governance-lifecycle.instructions.md`, and `orchestrator.agent.md`. The redundancy is intentional — it prevents any single artifact's absence from creating an intake bypass.

**3. No date prefixes in file or folder names.** The naming policy explicitly prohibits date prefixes in `.docs` paths. Dated artifacts get their date from content metadata, not filenames. This prevents the corpus from accumulating `2026-01-15-report.md` style files that become unnavigable.

**4. Prompts as workflow entry points, not skill containers.** The PRR-M4 standard requires prompts to route to named skills when driving reusable workflows. Prompts are thin entry points; skills hold the executable logic. This keeps prompts focused and skills reusable from multiple prompts.

**5. Catalog integrity as a MUST failure with no grace period.** GOV-M3 (and corresponding lifecycle policy) treats an unregistered skill or orphaned catalog row as an immediate MUST failure. There is no grace period. This ensures the discovery indexes never drift from the actual asset set.

**6. Provisional-FAILED vs FAILED distinction.** The governance-health-overview skill distinguishes between incomplete evidence (PROVISIONAL-FAILED) and confirmed quality failure (FAILED). This allows environment failures or tool blockers to be communicated without implying actual quality problems.

**7. Acceptance governance as a shared contract.** `acceptance-governance` skill does not perform primary discipline reviews — it standardizes the review intake, checklist application, finding structure, and disposition format across ALL disciplines (Architecture, Engineering, Security, Performance, UX, Product, Governance). This makes cross-discipline review outputs structurally comparable and auditable.

### 4.3 Integration Patterns

**Pattern 1: Audit stacking.** Governance audits stack upward: item-level → type-level → workspace → executive. Each level consumes artifacts from the level below. `execute-customization-audit` explicitly fails (PROVISIONAL-FAILED) if required source artifacts are missing.

**Pattern 2: Release gate as convergence.** `release-readiness` is the convergence point for security, testing, performance, and acceptance governance. It references evidence artifacts from multiple governance types but does not re-run them.

**Pattern 3: Catalog-first routing.** The orchestrator's routing algorithm explicitly uses catalog indexes as source of truth. If a catalog entry conflicts with a hardcoded reference in orchestrator.agent.md, the catalog wins. This makes the routing table live-updatable without modifying the agent.

**Pattern 4: History + deny-list loop.** Audit skills maintain per-asset history files and build deny-lists from rejected recommendations at the start of each run. This creates an institutional memory that prevents governance cycles from cycling endlessly over the same rejected suggestions.

**Pattern 5: Policy instruction → skill delegation.** Every instruction file concludes with a `## Routing Notes` section that explicitly delegates operational depth to named skills. Instructions set the rules; skills implement the workflow. No instruction file contains step-by-step procedures.

### 4.4 Observed Gaps or Areas for Documentation Attention

**Gap 1:** The `curate-copilot-instructions` skill exists in the catalog but was not included in the copilot-instructions.md skill attachment list shown in the workspace instructions — potential catalog/usage drift worth noting.

**Gap 2:** The `benchmark-experiment-design` skill appears in the catalog with lane `Execution | Planning` but was not listed in the original copilot-instructions.md skill attachment. This may be intentional (selectively attached) but warrants documentation.

**Gap 3:** The `.github/skills/governance-audit/references/` directory contains a `.artifacts/` subdirectory whose contents were not enumerated. If it contains versioned governance artifacts, they represent durable evidence of past assessments.

**Gap 4:** The `governance-must-check-registry.json` file in scripts is a critical governance asset — it appears to be the canonical registry of all MUST checks. Its structure and contents were not read; documentation should cover what it contains and how `test-governance-must-traceability.ps1` uses it.

**Gap 5:** The `matrix-skill-mapping` and `taxonomy-tag-registry` skills relate to the Phase/Discipline/Lane matrix but their SKILL.md files were not read in this pass. These govern how the PDL matrix stays current as new disciplines are added.

---

## Appendix A: Governance Violation Code Registry

| Code | Type | Governing Skill | Meaning |
|---|---|---|---|
| GOV-M1 | MUST | governance-audit | Lane coverage |
| GOV-M2 | MUST | governance-audit | Frontmatter validity |
| GOV-M3 | MUST | governance-audit | Catalog integrity |
| GOV-M4 | MUST | governance-audit | Lifecycle-governance coverage |
| GOV-M5 | MUST | governance-audit | Skill self-containment |
| GOV-S1–S11 | SHOULD | governance-audit | Advisory checks (utilization, recency, overlap, etc.) |
| GOV-SK | Aggregate | governance-audit | Skill quality aggregate |
| GOV-CUS | Aggregate | governance-audit | Customization quality aggregate |
| GOV-OPT | Aggregate | governance-audit | Optimization factor coverage |
| AGR-M1–M4 | MUST | audit-agent | Agent governance |
| AGR-S1–S5 | SHOULD | audit-agent | Agent advisory |
| INR-M1–M4 | MUST | audit-instructions | Instruction governance |
| INR-S1–S5 | SHOULD | audit-instructions | Instruction advisory |
| SKR-M1–M4 | MUST | audit-skill | Skill governance |
| SKR-S1,S3–S5 | SHOULD | audit-skill | Skill advisory |
| PRR-M1–M4 | MUST | audit-prompts | Prompt governance |
| PRR-S1–S3 | SHOULD | audit-prompts | Prompt advisory |
| TYP-M1–M5 | MUST | audit-customization-types | Type governance |
| TYP-S1–S6 | SHOULD | audit-customization-types | Type advisory |
| EXE-M1–M5 | MUST | execute-customization-audit | Executive audit |
| OPR-M1–M4 | MUST | optimize-customizations | Optimization |
| OPR-S1–S3 | SHOULD | optimize-customizations | Optimization advisory |

---

## Appendix B: Governance Artifact Storage Map

```
.docs/
  changes/
    governance/
      audits/
        governance-audit.md             (governance-audit skill output)
        governance-executive-audit.md   (governance-health-overview output)
        execute-customization-audit.md  (execute-customization-audit output)
        governance-one-pager.md         (governance-summarize / governance-briefer output)
      type-audits/
        audit-customization-types.md    (audit-customization-types skill output)
    skill/
      reviews/<skill-name>/review.md    (audit-skill output)
      history/<skill-name>-history.md   (audit-skill history)
    agent/
      reviews/<agent-name>/review.md    (audit-agent output)
      history/<agent-name>-history.md   (audit-agent history)
      conflicts/                        (audit-agent conflict artifacts)
    instruction/
      reviews/<instruction-name>/review.md  (audit-instructions output)
      history/<instruction-name>-history.md
    prompt/
      reviews/<prompt-name>/review.md   (audit-prompts output)
      history/<prompt-name>-history.md
    customization/
      reviews/
        governance-audit-types-skills.md
        governance-audit-types-customizations.md
        governance-audit-types-optimization.md  (optimize-customizations output)
  plans/                                (planning lane artifacts)
  research/
    security/                          (security-research output)
  adr/                                 (architecture decisions)
```

---

*Research complete. All files were read directly from disk. No content was inferred from memory. This artifact is suitable for use as the primary source for official governance documentation authoring.*
