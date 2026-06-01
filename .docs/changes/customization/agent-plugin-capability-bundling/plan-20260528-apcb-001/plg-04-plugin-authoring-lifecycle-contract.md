# PLG-04 Contract: plugin-authoring-lifecycle

## Contract Metadata

| Field | Value |
|---|---|
| Contract ID | PLG-04-CONTRACT-20260530 |
| Plan ID | PLAN-20260528-APCB-001 |
| Change ID | CHG-20260530-APCB-001 |
| Plugin ID | PLG-04 |
| Plugin Name | plugin-authoring-lifecycle |
| Status | Draft for Review |

## Capability Definition

| Field | Value |
|---|---|
| Primary Capability | End-to-end authoring and publishing workflows for agent plugins |
| In Scope | Plugin setup, design, implementation paths, tool integration, security hardening, publishing, and customization authoring support |
| Out of Scope | Product-domain engineering workflows and non-plugin domain stacks |

## Asset Inclusion Manifest

| Asset Type | Included Assets |
|---|---|
| Agents | workspace-scaffolder.agent.md |
| Instructions | governance-naming-conventions.instructions.md; secure-coding.instructions.md; request-economy.instructions.md |
| Prompts | workspace-scaffolder.prompt.md |
| Skills | agent-plugin-setup; agent-plugin-design; agent-plugin-implementation-markdown; agent-plugin-implementation-extension; agent-plugin-tools-integration; agent-plugin-security-hardening; agent-plugin-publishing; agent-authoring; instructions-authoring; skills-authoring; route-customization; agent-plugin-integrity |

## Asset Purpose and Benefit Matrix

| Asset | Purpose | Benefit |
|---|---|---|
| workspace-scaffolder.agent.md | Provides scaffolding specialization for new plugin/workspace setup. | Accelerates repeatable plugin bootstrap and reduces setup variance. |
| governance-naming-conventions.instructions.md | Enforces naming standards for authored assets. | Keeps plugin deliverables discoverable and catalog-compliant. |
| secure-coding.instructions.md | Applies security requirements to authoring and tool usage. | Reduces risk in plugin implementation, integration, and publishing stages. |
| request-economy.instructions.md | Limits unnecessary request expansion and context use. | Improves efficiency and focus during plugin authoring workflows. |
| workspace-scaffolder.prompt.md | Operational prompt for scaffold execution flows. | Provides a consistent execution entrypoint for authoring setup tasks. |
| agent-plugin-setup | Covers plugin skeleton and base manifest initialization. | Establishes the structural baseline required for all later authoring steps. |
| agent-plugin-design | Defines persona, workflow, permissions, and boundaries. | Improves design clarity before implementation and reduces rework. |
| agent-plugin-implementation-markdown | Implements simple .agent.md based agents. | Enables fast delivery path for non-code plugin capabilities. |
| agent-plugin-implementation-extension | Implements TypeScript extension-based agents. | Enables advanced/custom-tool plugin scenarios requiring code-level behavior. |
| agent-plugin-tools-integration | Handles built-in, MCP, and extension tool wiring. | Ensures tool availability is explicit, secure, and correctly integrated. |
| agent-plugin-security-hardening | Performs hardening and threat-control checks. | Raises security posture before release and publication. |
| agent-plugin-publishing | Defines packaging and publishing lifecycle. | Converts authored plugin assets into releasable distribution artifacts. |
| agent-authoring | Improves .agent.md quality and role boundaries. | Increases correctness and maintainability of agent definitions. |
| instructions-authoring | Improves instruction scope and applyTo quality. | Keeps policy assets precise and reduces instruction drift. |
| skills-authoring | Improves skill trigger clarity and self-containment. | Strengthens quality and reuse value of plugin-included skills. |
| route-customization | Selects correct customization format per requirement. | Prevents implementing behavior in the wrong artifact type. |
| agent-plugin-integrity | Produces deterministic per-file and bundle-level SHA-256 integrity evidence. | Adds verifiable integrity metadata for plugin manifests and user trust validation. |

## Dependency Declarations

| Dependency | Type | Rationale |
|---|---|---|
| PLG-01 core-intake-governance | Required | Enforces intake, lifecycle, and secure deterministic routing controls for all plugin-authoring workflows. |
| PLG-03 governance-review-audit | Required before promotion | Provides review quality gate before publishing workflows are considered complete. |

## Inclusion and Exclusion Rules

| Rule ID | Rule |
|---|---|
| INC-PLG04-001 | Include only assets directly required for plugin authoring lifecycle capability. |
| INC-PLG04-002 | Keep both markdown and extension implementation paths to support simple and complex plugin builds. |
| EXC-PLG04-001 | Exclude product engineering assets unrelated to authoring plugins. |
| EXC-PLG04-002 | Exclude review-only audit assets except via explicit dependency on PLG-03. |

## Versioning and Integrity Requirements

| Requirement ID | Requirement | Why |
|---|---|---|
| VER-001 | Every plugin manifest must include pluginVersion using semantic versioning. | Provides predictable upgrade semantics for consumers. |
| VER-002 | Every plugin manifest must include sourceCommit (current commit hash). | Adds source provenance and independent validation anchor. |
| VER-003 | sourceCommit is provenance metadata, not the plugin version contract. | Prevents version ambiguity and keeps semver authoritative. |
| INT-PLG04-001 | Every artifact in plugin manifest must include SHA-256 digest. | Enables per-file integrity verification by consumers. |
| INT-PLG04-002 | Manifest must include aggregate SHA-256 digest over canonicalized per-file digest list. | Enables whole-bundle integrity verification and tamper detection. |
| INT-PLG04-003 | Plugin README must publish verification steps for sourceCommit and digests. | Makes integrity checks reproducible and user-verifiable. |
| INT-PLG04-004 | MD5 is prohibited for integrity evidence. | Reduces collision-related compromise risk. |

## Validation Checklist

| Check ID | Check | Status |
|---|---|---|
| VAL-001 | Single primary capability statement is explicit. | Pass |
| VAL-002 | Manifest aligns with PLG-04 row in approved plan. | Pass |
| VAL-003 | Dependencies are explicit and not implicit. | Pass |
| VAL-004 | Scope excludes domain-specific product engineering assets. | Pass |
| VAL-005 | Plan and change traceability fields are present. | Pass |
| VAL-006 | Versioning and integrity requirements are defined (semver plus sourceCommit plus SHA-256). | Pass |

## Review Handoff

| Field | Value |
|---|---|
| Ready For Review | Yes |
| Requested Review Focus | Dependency correctness, scope boundaries, and publishing-governance sequencing |
| Next Slice Gate | PLG-03 contract slice may proceed once review disposition is recorded. |
