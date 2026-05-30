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
| Skills | agent-plugin-setup; agent-plugin-design; agent-plugin-implementation-markdown; agent-plugin-implementation-extension; agent-plugin-tools-integration; agent-plugin-security-hardening; agent-plugin-publishing; agent-authoring; instructions-authoring; skills-authoring; route-customization |

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

## Validation Checklist

| Check ID | Check | Status |
|---|---|---|
| VAL-001 | Single primary capability statement is explicit. | Pass |
| VAL-002 | Manifest aligns with PLG-04 row in approved plan. | Pass |
| VAL-003 | Dependencies are explicit and not implicit. | Pass |
| VAL-004 | Scope excludes domain-specific product engineering assets. | Pass |
| VAL-005 | Plan and change traceability fields are present. | Pass |

## Review Handoff

| Field | Value |
|---|---|
| Ready For Review | Yes |
| Requested Review Focus | Dependency correctness, scope boundaries, and publishing-governance sequencing |
| Next Slice Gate | PLG-03 contract slice may proceed once review disposition is recorded. |
