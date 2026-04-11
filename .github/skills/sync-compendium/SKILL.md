---
name: sync-compendium
description: Use when importing or updating this compendium in target repositories with explicit approval gates and bespoke-safe merge behavior.
---

# Sync Compendium

## Specialization

Apply compendium updates to external repositories using explicit approval checkpoints, source attribution, and safe handling of bespoke local customizations.

This skill is intentionally narrow and should not absorb broad workspace governance reviews.

## Trigger Conditions

Use this skill when:

- A target repository needs to import this compendium for the first time.
- A target repository needs to update from one compendium version to another.
- Teams must confirm provenance (`source`, `version`, `commit`) for imported assets.
- Sync operations must preserve local bespoke customizations.

## Required Inputs

- `source_repo` (default: `sextondjc/agentic`)
- `source_version` (SemVer tag)
- `source_commit` (immutable SHA)
- Target repository root path
- Target artifact index file path
- Source manifest file path for the version being imported

## Required Outputs

- A dry-run sync plan with classified actions.
- A reviewer-facing approval table before any apply step.
- A lock/provenance update record after approved sync.
- A sync report that records what changed and what was preserved.

## Safety Rules

- Explicit approval is mandatory for every sync.
- `ownership_mode=local` is never overwritten.
- `ownership_mode=extended` is never blind-replaced; it requires manual merge review.
- `source != sextondjc/agentic` is treated as external/local and excluded from overwrite by default.
- No apply step is allowed until a dry-run plan has been generated and reviewed.

## Workflow

1. Generate a sync plan using [Invoke-CompendiumSyncPlan.ps1](./references/scripts/Invoke-CompendiumSyncPlan.ps1).
2. Review the plan with the decision matrix in [sync-decision-matrix.md](./references/sync-decision-matrix.md).
3. Require explicit human approval for every non-noop action.
4. Apply only approved changes.
5. Update target provenance lock metadata and preserve sync evidence.

## Recommended Prompt Entry

Use [sync-compendium.prompt.md](./../../prompts/sync-compendium.prompt.md) as the operator-facing invocation contract for target repositories.

## References

- [artifact-source-schema.md](./references/artifact-source-schema.md)
- [sync-decision-matrix.md](./references/sync-decision-matrix.md)
- [Invoke-CompendiumSyncPlan.ps1](./references/scripts/Invoke-CompendiumSyncPlan.ps1)

## Inputs

- User request context and target scope for this skill invocation.

## Required Outputs

- A concrete, workspace-applicable result aligned with this skill purpose.

## Workflow

1. Gather required context and constraints from the workspace and user request.
2. Execute the skill-specific steps and produce the required artifacts or decisions.
3. Validate outputs for completeness and consistency with active workspace instructions.
