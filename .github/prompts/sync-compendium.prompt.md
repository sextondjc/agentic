---
name: sync-compendium
description: Prompt for explicit-approval compendium sync with source attribution and bespoke-safe merge handling.
---

# Sync Compendium

Route this request to `orchestrator`.

Use the `sync-compendium` skill as the primary workflow.

Run a deterministic sync cycle that plans first, classifies conflicts, requires explicit approval, and preserves local/bespoke artifacts.

## Required Inputs

Collect and confirm these before execution:

- `target_repo` (required)
- `source_repo` (required, default: `sextondjc/agentic`)
- `source_version` (required)
- `source_commit` (required)
- `target_index_path` (required)
- `source_manifest_path` (required)

Ask for missing required inputs before continuing.

## Execution Contract

1. Generate dry-run sync plan with [Invoke-CompendiumSyncPlan.ps1](./../skills/sync-compendium/references/scripts/Invoke-CompendiumSyncPlan.ps1).
2. Classify every artifact using [sync-decision-matrix.md](./../skills/sync-compendium/references/sync-decision-matrix.md).
3. Present an approval table and block apply until explicit approval is recorded.
4. Exclude `source=local`, `ownershipMode=local`, and non-`sextondjc/agentic` artifacts from overwrite.
5. Treat `ownershipMode=extended` and managed local drift as manual-review actions.
6. After approved apply, update lock metadata and publish a sync report.

## Required Outputs

1. Dry-run plan artifact.
2. Approval table with per-artifact disposition.
3. Applied-change summary with preserved and held counts.
4. Updated lock metadata (`source_repo`, `source_version`, `source_commit`, `approved_by`, `approved_at`).

## Verification Checklist

- [ ] Every artifact has `source` attribution.
- [ ] No `local` ownership artifacts are overwritten.
- [ ] No apply action runs without explicit approval evidence.
- [ ] Plan source version and lock metadata source version are consistent.
- [ ] Sync report includes manual-review and hold items.

## Success Criteria

- Sync updates are explicit, reversible, and traceable.
- Bespoke target customizations remain intact unless explicitly approved for change.
- Imported compendium version can be proven at any time.
