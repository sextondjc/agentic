---
name: workspace-scaffolder
description: 'Prompt for scaffolding lean .NET project workspace configuration and copilot instructions.'
---

# Project Setup Workflow

Route this request to `orchestrator`.

Use the `scaffold-dotnet` skill as the primary workflow.

Your goal is to create tailored workspace configuration for a new lean .NET project. Gather deep context via a questionnaire, audit the workspace for canonical patterns, curate agent and skill recommendations, and generate a complete project initialization package.

## Pre-Flight

Confirm these inputs before starting:
- `project_name` — Name of the project (e.g., AcmeInventory.API)
- `project_type` — REST API, Console Tool, Background Service, etc.
- `target_framework` — .NET version (e.g., .NET 9, .NET 8 LTS)

Request any missing inputs before proceeding.

## Questionnaire

Use the canonical questionnaire in [workspace-scaffolder-questionnaire.md](./references/workspace-scaffolder-questionnaire.md).

Key rule: do not proceed to analysis until all 12 answers are concrete and implementation-ready.

## Analysis

1. **Audit workspace** — extract Syrx patterns, guard semantics, test naming, documentation structure from existing projects
2. **Curate agents** — match project needs to: `csharp-engineer`, `architecture-designer`, `execute-syrx-data-access`, `api-design`, `critical-thinking`, etc.
3. **Curate skills** — prioritize: `execute-syrx-data-access`, `adr-generator`, `api-design` by phase
4. **Identify instruction scope** — which canonical `.github/instructions/*.md` files are essential vs. optional/deferred

## Outputs (Save to `.docs/setup/` + `.github/agents/`)

### 1. Project Copilot Instructions
**File:** `.github/agents/project-copilot-instructions.md`

Structure:
- Overview (1–2 sentences)
- Domain Model (core aggregates, invariants)
- Canonical Standards (tied to questionnaire answers)
- Preferred Agents (with rationale)
- Preferred Skills (with rationale)
- Documentation Structure
- Getting Started

**Keep it scannable:** < 40 lines, only document what's unique to this project.

### 2. Agent Activation Rules
**File:** `.docs/setup/agents-activation.md`

Table: Agent | Activate (Yes/Optional) | Rationale

### 3. Skills Recommendations
**File:** `.docs/setup/skills-recommendations.md`

Sections: High-Priority, Medium-Priority, Deferred, Guidance by Phase

### 4. Documentation Baseline
**File:** `.docs/setup/docs-baseline.md`

Canonical structure (`.docs/plans/`, `.docs/research/`, `.docs/adr/`, `.docs/changes/`) with essential vs. optional instruction files.

### 5. Quick-Start Checklist
**File:** `.docs/setup/quick-start-checklist.md`

Actionable list of: Review instructions, confirm Syrx, scaffold repo, create ADR, write plan, next phase steps.

## Workspace Rules

- **Syrx only** — no EF Core or alternate ORMs
- **xUnit + Moq** — no FluentAssertions
- **`.docs/` canonical** — plans, research, ADRs, changes all live here
- **Guard semantics** — Syrx `Throw<TException>(condition, ...)` for validation
- **Lean standards** — only document what is unique; reference canonical instruction files for rest

## Guardrails

- Every output is tied to a questionnaire answer or workspace audit
- Every agent/skill recommendation includes rationale
- No irrelevant boilerplate — cut ruthlessly
- No vague non-goals like "Phase 2"; ask for explicit boundary
- Confirm with user before saving files


