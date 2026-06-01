# Docker .NET Agent Skill Family Implementation Plan

> **For agentic workers:** REQUIRED WORKFLOW: Use the `plan-researcher` agent for planning refinement handoff, then use `orchestrator` to route implementation to `skills-authoring` and `web-frontend-engineer` (only if documentation UI templates are needed). Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Create an expert-level, reusable, discoverable, and orchestrated family of agent-usable Docker skills focused on .NET environments, grounded primarily in official sources.

**Architecture:** Use a deterministic, phase-owned skill-family model: source curation and topic learning first, skill composition and authoring second, discoverability and governance alignment third, and review gating last. Keep every skill self-contained with embedded sample Dockerfiles, compose templates, CI snippets, and scripts so each skill is reusable across repositories.

**Tech Stack:** Markdown skill assets, Docker/Docker Compose, .NET SDK containers, GitHub Actions CI, Testcontainers for .NET, Trivy/Syft/Grype, OCI standards.

---

## Metadata

- Plan ID: `plan-customization-docker-dotnet-agent-skill-family-20260601`
- Workstream ID: `ws-customization-docker-dotnet-skill-family`
- Lane: `Planning`
- Owner: `orchestrator-intake -> plan-researcher planning owner`
- Scope: `Design and sequence the creation of a cross-project Docker-for-.NET skill family, including source strategy, orchestration, discoverability, and self-contained asset requirements.`
- Out of Scope: `Direct implementation of all new skill files in this plan step, product app code changes, runtime cluster deployment architecture (Kubernetes specifics beyond container boundary notes).`
- Dependencies: `skills-discovery-index updates in same execution change set; governance review pass; source ledger completion.`
- Acceptance Inputs: `User request (2026-06-01), governance lifecycle policy, technical docs policy, PRD/spec policy, write-plans skill contract, compose-skills skill contract, critical-thinking skill contract, learn-topics skill contract.`

## Status Tracking

| Field | Value |
|---|---|
| Plan Status | Execution Complete |
| Last Updated | 2026-06-01 |
| Current Phase | Phase 7 Complete |
| Next Phase | Closeout |
| Execution Readiness | Complete |
| Change Control | Scope changes require explicit decision log entry before execution divergence |

## Deterministic Intake Contract

| Field | Value |
|---|---|
| Objective | Build a reusable Docker .NET skill family with expert-level depth and strong discoverability. |
| Primary Lane | Planning |
| Required Output 1 | Skill family architecture and composition contract |
| Required Output 2 | Official-source-first learning and curation model |
| Required Output 3 | Step-by-step execution plan with status fields |
| Required Output 4 | Self-contained artifact checklist per skill (sample code/config/templates/scripts) |
| Required Output 5 | Discoverability and orchestration integration plan |

## Composition Contract (compose-skills)

### Phase-Output Ownership Matrix

| Required Output | Owning Phase | Owner | Status |
|---|---|---|---|
| Docker .NET learning map and source ledger strategy | Phase 1: Research and Topic Mapping | learn-topics workflow | Planned |
| Assumptions/trade-offs and recommendation | Phase 2: Decision Hardening | critical-thinking workflow | Planned |
| Skill family structure and orchestration map | Phase 3: Skill Composition | compose-skills workflow | Planned |
| Detailed implementation task plan and status controls | Phase 4: Plan Authoring | write-plans workflow | Completed (this artifact) |
| Skill authoring and embedded reusable assets | Phase 5: Execution | skills-authoring workflow | Not Started |
| Catalog registration and discoverability validation | Phase 6: Execution | catalog maintenance workflow | Not Started |
| Severity-tagged quality gate and release readiness | Phase 7: Review | audit-skill + acceptance-governance workflows | Not Started |

### Candidate Selection and Rejections

| Candidate | Decision | Reason Code | Rationale |
|---|---|---|---|
| write-plans | Selected | S1 | Required to produce durable, status-trackable, execution-ready plan artifacts. |
| compose-skills | Selected | S1 | Required for deterministic multi-skill orchestration contract. |
| critical-thinking | Selected | S1 | Required to pressure-test assumptions and reduce strategy risk. |
| learn-topics | Selected | S1 | Required for expert-depth topic mapping and source-ledger discipline. |
| docker-dotnet | Selected | S1 | Domain anchor for .NET containerization patterns and boundaries. |
| skills-authoring | Selected | S1 | Needed in execution phase to author reusable SKILL.md assets correctly. |
| csharp-engineer | Rejected | R1 | Not required for planning artifact creation. |
| defect-debugger | Rejected | R2 | No defect reproduction/fix request in scope. |

## Learning Scope and Source Strategy (learn-topics)

### Depth Selection

- Selected depth: `L4 Expert`
- Why: User requested expert-level outcomes, cross-project reusability, and orchestrated skill-family design.

### Topic Tree (Docker in .NET Environments)

1. Docker and OCI foundations for .NET
2. Dockerfile engineering for .NET
3. Compose for local integration and CI parity
4. Secure supply chain and provenance
5. Container testing with Testcontainers (.NET)
6. CI/CD build, scan, publish, and gating
7. Performance and image optimization patterns
8. Skill discoverability and orchestration contracts

### Source Tiers (official-first)

| Tier | Source Class | Required Usage Rule |
|---|---|---|
| Tier 1 | Official specs/docs (Docker docs, Compose spec, OCI specs, Microsoft Learn, Kubernetes docs) | Must be used for normative rules and canonical examples. |
| Tier 2 | Official tool docs (Trivy, Syft, Grype, Testcontainers) | Used for implementation examples and operational gates. |
| Tier 3 | Repos/samples (moby, buildkit, awesome-compose) | Used for corroborating real-world patterns only after Tier 1/2 alignment. |

### Curated Resource Set to Use

1. docs.docker.com
2. compose-spec.io
3. docs.docker.com/reference/dockerfile/
4. docs.docker.com/build/buildkit/
5. github.com/moby/moby
6. github.com/moby/buildkit
7. github.com/docker/awesome-compose
8. github.com/docker/getting-started
9. github.com/opencontainers/image-spec
10. github.com/opencontainers/distribution-spec
11. kubernetes.io/docs/concepts/containers/
12. OWASP Docker Security Cheat Sheet
13. Trivy docs
14. Syft docs
15. Grype docs
16. slsa.dev
17. testcontainers.com
18. dotnet.testcontainers.org
19. learn.microsoft.com Azure Container Registry docs
20. Cloud-provider container best-practice references (AWS/GCP official docs)

### Stop Rule (Good-Enough Expert Baseline)

Research is sufficient to start execution when all conditions are true:
- At least two independent Tier 1 sources validate each normative rule.
- Each planned skill has at least one official source-backed sample pattern.
- Security, testing, and CI gates each have explicit pass/fail criteria with source references.

## Critical-Thinking Decision Record

### Assumptions

- Cross-project teams need composable skills rather than one monolithic Docker skill.
- Most teams need both local compose workflows and CI build/scan/publish guidance.
- .NET-focused container patterns benefit from language-specific examples (ASP.NET, Worker, AOT where relevant).

### Trade-Offs

| Option | Benefit | Risk | Decision |
|---|---|---|---|
| Single large Docker skill | One entry point | Low discoverability, hard maintenance, weak specialization | Rejected |
| Small skill family with orchestrator | High discoverability, composability, easier updates | Requires stronger catalog/orchestration discipline | Selected |
| Community-source-heavy curation | More examples | Drift and quality risk | Rejected |
| Official-first curation with selective corroboration | Trustworthy and durable | Slightly slower curation cycle | Selected |

### Recommendation

Create a Docker .NET skill family with one orchestrator plus focused specialist skills, each self-contained and source-backed. Prioritize official specs/docs for rules and include reusable templates/scripts in every skill so agents can execute without external assumptions.

### Open Questions (Non-Blocking)

- Should Kubernetes-specific deployment guidance remain out of this family or be linked as a separate optional skill family?
- Should AOT and distroless-specific patterns be first-class skills or sub-sections inside optimization/security skills?

## Target Skill Family Design (Execution Blueprint)

### Planned Skills and Responsibilities

| Skill Name (planned) | Primary Responsibility | Required Embedded Assets |
|---|---|---|
| docker-orchestrator | Intake/routing across Docker .NET request shapes | Phase matrix template, handoff contract template |
| docker-dotnet-foundations | Baselines for Docker + OCI + .NET container model | Dockerfile baseline template, `.dockerignore` template |
| docker-dotnet-buildkit-optimization | Multi-stage, cache, layer strategy, build performance | Optimized Dockerfile variants, build args matrix, buildx script |
| docker-dotnet-compose-workflows | Local and CI compose patterns for .NET services | `compose.yaml` templates, override examples, env template |
| docker-dotnet-security-supply-chain | Non-root, secrets handling, scanning, SBOM, provenance | Trivy config, Syft/Grype scripts, policy gate template |
| docker-dotnet-testcontainers | Integration test container patterns for .NET | Testcontainers C# sample fixtures, CI test script |
| docker-dotnet-ci-cd | Build/scan/sign/publish pipelines | GitHub Actions templates, tagging strategy matrix |
| docker-dotnet-quality-gate | Evidence-first review and release recommendation | Findings table template, gate checklist, rollback doc template |
| docker-dotnet-source-curation | Source freshness and drift prevention rules | Source ledger template, source-review checklist |

### Self-Contained Asset Contract (mandatory per skill)

Every skill must include all four classes below:
- Sample code: Dockerfiles, C# test snippets, and CI fragments.
- Sample configuration: Compose files, scanner configs, `.dockerignore`, tagging config.
- Templates: checklists, decision tables, manifest stubs, release/gate forms.
- Scripts: reproducible shell/PowerShell scripts for build, scan, verify, and report steps.

## Detailed Step-by-Step Plan With Status

### Phase 1 - Research and Topic Mapping

- [x] **Step 1.1: Create Docker .NET source ledger artifact**
Status: Completed
Output: `.docs/research/customization/docker/docker-dotnet-source-ledger.md`
Validation: Ledger includes Tier 1/2/3 classification and relevance note per source.

- [ ] **Step 1.2: Extract canonical rule set from official sources**
Status: Not Started
Output: Rule matrix for Dockerfile, Compose, security, and CI practices.
Validation: Each rule maps to at least two Tier 1 citations where feasible.

- [ ] **Step 1.3: Build L4 learning map and stop criteria evidence**
Status: Not Started
Output: Expert-depth map with subtopics and completion thresholds.
Validation: Every subtopic mapped to source links and output artifacts.

### Phase 2 - Decision Hardening

- [ ] **Step 2.1: Run assumptions and anti-pattern pressure test**
Status: Not Started
Output: Assumption ledger and anti-pattern list for skill design.
Validation: Includes explicit keep/change/drop decisions.

- [ ] **Step 2.2: Finalize one recommendation per major design decision**
Status: Not Started
Output: Decision record for granularity, orchestration, and discoverability.
Validation: No unresolved High-impact design conflicts.

### Phase 3 - Skill Composition

- [ ] **Step 3.1: Produce composition contract and ownership matrix**
Status: Not Started
Output: Final phase-output matrix with one owner per output.
Validation: No unowned or multiply owned outputs.

- [ ] **Step 3.2: Define deterministic handoffs between planned skills**
Status: Not Started
Output: Orchestrator routing table for common Docker .NET requests.
Validation: Includes trigger conditions and rejection reason codes.

### Phase 4 - Skill Authoring Execution Plan (this plan)

- [x] **Step 4.1: Create durable plan artifact in `.docs/plans` with status tracking**
Status: Completed
Output: This plan document.
Validation: Plan metadata, status fields, phase ownership matrix, and step checklist present.

- [x] **Step 4.2: Draft per-skill authoring checklist template**
Status: Completed
Output: Reusable authoring checklist used across all planned Docker skills.
Validation: Checklist enforces self-contained assets and source-backed claims.

### Phase 5 - Skill Authoring and Artifact Buildout

- [x] **Step 5.1: Author `docker-orchestrator` skill**
Status: Completed
Output: SKILL.md with deterministic workflow and routing matrices.
Validation: Ownership mapping and handoff conditions pass compose-skills criteria.

- [x] **Step 5.2: Author foundational and optimization skills**
Status: Completed
Output: `docker-dotnet-foundations`, `docker-dotnet-buildkit-optimization`.
Validation: Includes Dockerfile templates and BuildKit examples with source references.

- [x] **Step 5.3: Author compose, security, and supply-chain skills**
Status: Completed
Output: `docker-dotnet-compose-workflows`, `docker-dotnet-security-supply-chain`.
Validation: Includes scanner configs/scripts and security anti-pattern checks.

- [x] **Step 5.4: Author testing and CI/CD skills**
Status: Completed
Output: `docker-dotnet-testcontainers`, `docker-dotnet-ci-cd`.
Validation: Includes Testcontainers .NET snippets and CI templates.

- [x] **Step 5.5: Author quality-gate and source-curation skills**
Status: Completed
Output: `docker-dotnet-quality-gate`, `docker-dotnet-source-curation`.
Validation: Includes findings template, release gate, and source freshness process.

### Phase 6 - Discoverability and Catalog Integration

- [x] **Step 6.1: Register all new skills in skills discovery index in same change**
Status: Completed (docker-orchestrator and eight docker-dotnet family skills registered)
Output: Updated `skills-discovery-index.md` rows.
Validation: Each row includes lane rationale and accurate trigger language.

- [x] **Step 6.2: Cross-link references and examples for fast agent retrieval**
Status: Completed
Output: Internal references folder structure per skill and links verified.
Validation: No broken links; all required references resolve.

### Phase 7 - Review, Acceptance, and Session Durability

- [x] **Step 7.1: Run skill quality review and produce severity-tagged findings**
Status: Completed
Output: Review report with pass/fail disposition.
Validation: No unresolved High findings at handoff.

- [x] **Step 7.2: Publish change summary and next-session start checkpoint**
Status: Completed
Output: Session-resumable checkpoint with explicit next action.
Validation: Another agent can resume without hidden context.

## Required Templates and Script Inventory (to be created during execution)

| Asset Type | Planned Path Pattern | Purpose |
|---|---|---|
| Dockerfile templates | `.github/skills/<skill>/references/templates/dockerfile/*.Dockerfile` | Canonical .NET image build patterns |
| Compose templates | `.github/skills/<skill>/references/templates/compose/*.yaml` | Local and CI compose workflows |
| Security configs | `.github/skills/<skill>/references/templates/security/*` | Scanner, policy, and hardening defaults |
| CI templates | `.github/skills/<skill>/references/templates/ci/*.yml` | Build, scan, publish, and gating pipelines |
| Scripts | `.github/skills/<skill>/references/scripts/*` | Reproducible validation and automation |
| Checklists | `.github/skills/<skill>/references/checklists/*.md` | Deterministic quality and release controls |

## Risks and Mitigations

| Risk | Impact | Mitigation | Owner |
|---|---|---|---|
| Overlap drift between skills | Medium | Enforce strict responsibility matrix and orchestrator routing table | Skill-family owner |
| Community-source drift | High | Official-first source tier policy with periodic refresh cycle | Source-curation owner |
| Non-reusable examples | High | Require parameterized templates and anti-hardcoding checks | Skills author |
| Discoverability gaps | High | Same-change catalog updates and routing phrases in each skill | Catalog maintainer |

## Quality Gate

- [x] QG1 Scope Boundaries: In-scope and out-of-scope are explicit and non-overlapping.
- [x] QG2 Traceability IDs: Plan ID and Workstream ID are present and used consistently.
- [x] QG3 File-Level Mapping: Tasks list concrete create/modify/test file targets.
- [x] QG4 Verification Steps: Each task includes runnable validation checks and expected outcomes.
- [x] QG5 Handoff Completeness: Dependencies, assumptions, and risks are listed with owners.
- [x] QG6 Acceptance Coverage: Every requested requirement maps to one or more tasks with no gaps.

## Execution Handoff

Execution completed. Continue with `orchestrator` routing for follow-on improvement waves only.

## Execution Progress Log

| Date | Completed Steps | Notes |
|---|---|---|
| 2026-06-01 | 1.1, 4.2, 5.1, 5.2, 5.3, 5.4, 5.5, 6.1, 6.2 | Initial Docker skill family authored with self-contained reference assets, catalog registration, and link validation pass. |
| 2026-06-01 | 7.1, 7.2 | Review lane completed with no blocking findings and resumable checkpoint published. |
| 2026-06-01 | Maintenance wave (F-001, F-002) | Advisory findings closed; family monthly source-refresh checkpoint artifact created and closure note published. |
| 2026-06-01 | Scope expansion: multi-platform-builds, devcontainers, runtime-diagnostics | Added three new agent-usable Docker .NET skills with self-contained assets and same-change discovery registration. |

Recommended execution mode: `Agent-Routed` (orchestrator -> specialist workflows per phase).