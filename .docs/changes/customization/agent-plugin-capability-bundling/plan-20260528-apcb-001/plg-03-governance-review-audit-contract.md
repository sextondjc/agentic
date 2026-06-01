# PLG-03 Contract: governance-review-audit

## Contract Metadata

| Field | Value |
|---|---|
| Contract ID | PLG-03-CONTRACT-20260530 |
| Plan ID | PLAN-20260528-APCB-001 |
| Change ID | CHG-20260530-APCB-001 |
| Plugin ID | PLG-03 |
| Plugin Name | governance-review-audit |
| Status | Draft for Review |

## Capability Definition

| Field | Value |
|---|---|
| Primary Capability | Review-lane governance workflows for audits, findings, optimization, and release readiness decisions |
| In Scope | Customization audits, governance summarization, acceptance governance, review prompts, and release-readiness review support |
| Out of Scope | Domain implementation specialists and execution-lane implementation behavior |

## Asset Inclusion Manifest

| Asset Type | Included Assets |
|---|---|
| Agents | code-reviewer.agent.md; manual-code-reviewer.agent.md; governance-briefer.agent.md; powershell-reviewer.agent.md |
| Instructions | governance-lifecycle.instructions.md; technical-docs.instructions.md; task-implementation.instructions.md |
| Prompts | execute-customization-audit.prompt.md; governance-audit-types.prompt.md; governance-item-audit.prompt.md; audit-customization-types.prompt.md; audit-agent.prompt.md; optimize-customizations.prompt.md; execute-artifact-condense.prompt.md; execute-manual-review.prompt.md |
| Skills | governance-audit; execute-customization-audit; audit-executor; audit-customization-types; audit-agent; audit-instructions; audit-prompts; audit-skill; audit-powershell; acceptance-governance; optimize-customizations; governance-health-overview; governance-summarize; matrix-skill-mapping; delivery-status-grid; remediate-review; request-code-review; test-design-review; test-orchestration; release-readiness; release-simulation; post-release-retrospective |

## Asset Purpose and Benefit Matrix

| Asset | Purpose | Benefit |
|---|---|---|
| code-reviewer.agent.md | Specialist for standards-based implementation review. | Provides severity-ranked findings for code and implementation artifacts. |
| manual-code-reviewer.agent.md | Captures structured manual review observations. | Improves review traceability for findings gathered outside automated passes. |
| governance-briefer.agent.md | Produces concise governance summaries from evidence. | Enables fast decision briefings for stakeholders. |
| powershell-reviewer.agent.md | Reviews PowerShell assets for safety and maintainability. | Extends review coverage to script-heavy governance surfaces. |
| governance-lifecycle.instructions.md | Governs lane ownership and handoff behavior. | Ensures review outputs remain lifecycle-compliant and traceable. |
| technical-docs.instructions.md | Governs documentation quality and structure. | Improves consistency and clarity of review artifacts and reports. |
| task-implementation.instructions.md | Governs plan-linked execution change traceability. | Ensures review references proper plan IDs, deviations, and progressive updates. |
| execute-customization-audit.prompt.md | Runs executive aggregate customization governance audits. | Provides consolidated audit workflow for high-level disposition. |
| governance-audit-types.prompt.md | Runs deep type-level governance audits. | Enables cross-type quality checks across agents/instructions/prompts/skills. |
| governance-item-audit.prompt.md | Runs focused single-item governance audit. | Supports pinpoint diagnostics and remediation planning. |
| audit-customization-types.prompt.md | Executes deterministic cross-type interaction audits. | Detects integration and overlap risks between customization types. |
| audit-agent.prompt.md | Executes agent-focused audit workflows. | Improves quality of agent role boundaries and behavior contracts. |
| optimize-customizations.prompt.md | Runs optimization-focused customization reviews. | Identifies actionable quality improvements across assets. |
| execute-artifact-condense.prompt.md | Produces concise rewrite guidance for artifacts. | Reduces verbosity and improves maintainability of reviewed assets. |
| execute-manual-review.prompt.md | Applies and validates recorded manual review findings. | Closes loop between observed issues and remediation execution checks. |
| governance-audit | Baseline workspace governance assessment workflow. | Provides ranked governance findings and remediation direction. |
| execute-customization-audit | Aggregates governance outputs into executive disposition. | Supports release-quality go or no-go style governance decisions. |
| audit-executor | Coordinates full multi-type governance audit execution. | Ensures comprehensive coverage with unified outcomes. |
| audit-customization-types | Evaluates customization type interactions and boundaries. | Identifies cross-type drift and contract ambiguity. |
| audit-agent | Evaluates .agent.md quality and invocation boundaries. | Improves agent reliability and specialization fidelity. |
| audit-instructions | Evaluates instruction integrity and applyTo correctness. | Reduces policy drift and over/under-scoped instruction behavior. |
| audit-prompts | Evaluates prompt execution contracts and safety. | Improves prompt determinism and invocation clarity. |
| audit-skill | Evaluates skill quality, triggers, and self-containment. | Strengthens reuse quality and reduces skill coupling risks. |
| audit-powershell | Evaluates PowerShell script safety and style quality. | Adds scripting governance depth for automation assets. |
| acceptance-governance | Evaluates outputs against acceptance criteria and sign-off rules. | Improves decision confidence for completion and promotion gates. |
| optimize-customizations | Applies concise optimization checks across customization assets. | Helps reduce duplication and improve maintainability. |
| governance-health-overview | Synthesizes governance health into unified status view. | Enables quick understanding of systemic governance posture. |
| governance-summarize | Produces concise governance brief artifacts. | Supports executive communication and rapid decision support. |
| matrix-skill-mapping | Maintains matrix-to-skill coverage mapping integrity. | Prevents taxonomy drift across phase/discipline/lane coverage. |
| delivery-status-grid | Produces table-first delivery progress views. | Improves review visibility into completion state and remaining risk. |
| remediate-review | Validates and applies review feedback rigorously. | Reduces shallow or incorrect remediation actions. |
| request-code-review | Standardizes code-review request workflow. | Ensures review engagement occurs at appropriate checkpoints. |
| test-design-review | Reviews test strategy and coverage rationale. | Improves release confidence through stronger testing posture. |
| test-orchestration | Coordinates multi-discipline test evidence and outcomes. | Consolidates testing signals into clear release recommendations. |
| release-readiness | Governs release gate evidence and promotion checks. | Prevents promotion without sufficient readiness proof. |
| release-simulation | Supports pre-release rehearsal and rollback drill validation. | Reduces release risk through practiced failure recovery. |
| post-release-retrospective | Captures post-release outcomes and follow-up actions. | Improves continuous governance learning after promotion events. |

## Dependency Declarations

| Dependency | Type | Rationale |
|---|---|---|
| PLG-01 core-intake-governance | Required | Review workflows depend on lifecycle controls and deterministic scope boundaries. |

## Inclusion and Exclusion Rules

| Rule ID | Rule |
|---|---|
| INC-PLG03-001 | Include only review-lane agents and audit-oriented skills/prompts. |
| INC-PLG03-002 | Include release-readiness and test review gates as review responsibilities. |
| EXC-PLG03-001 | Exclude execution-lane domain implementation specialists from this plugin. |
| EXC-PLG03-002 | Exclude plugin-authoring implementation assets that belong to PLG-04. |

## Validation Checklist

| Check ID | Check | Status |
|---|---|---|
| VAL-001 | Single primary capability statement is explicit. | Pass |
| VAL-002 | Manifest aligns with PLG-03 row in approved plan. | Pass |
| VAL-003 | Dependencies are explicit and minimal. | Pass |
| VAL-004 | Scope excludes implementation-lane domain assets. | Pass |
| VAL-005 | Plan and change traceability fields are present. | Pass |

## Review Handoff

| Field | Value |
|---|---|
| Ready For Review | Yes |
| Requested Review Focus | Separation of review-lane versus execution-lane responsibilities |
| Next Slice Gate | Broad rollout wave can begin after review disposition is recorded. |
