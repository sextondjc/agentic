---
name: sync-compendium
description: Fully automated explicit-approval compendium sync. Checks GitHub for latest main hash, compares with skill-contained version metadata, and runs sync only when approved.
---

# Sync Compendium

Route this request to `orchestrator`.

Use the `sync-compendium` skill as the primary workflow.

## Automation-First Contract

The caller does not provide `source_repo`, `source_version`, `source_commit`, or output paths.

The agent must derive them automatically from:
- GitHub API: `https://api.github.com/repos/sextondjc/agentic/commits?per_page=1`
- Skill metadata: `.github/skills/sync-compendium/references/.compendium/version.json`

## Required Inputs

No required user-supplied values by default.

Implicit defaults:
- `target_repo_root`: current workspace root
- `target_index_path`: `.github/skills/sync-compendium/references/.compendium/artifact-index.json`
- `source_manifest_path`: `.github/skills/sync-compendium/references/.compendium/manifest.json`

If defaults are unavailable, ask only for the missing path(s).

## Execution Contract

1. Fetch latest `main` commit hash from GitHub.
2. Read `.github/skills/sync-compendium/references/.compendium/version.json` and compare `mainBranchCommitHash`.
3. If hashes match, tell user the compendium is up to date and ask whether to continue anyway.
4. If hashes differ, continue to sync review and apply flow.
5. Initialize state using `Initialize-CompendiumImport.ps1` (first run only) under `.github/skills/sync-compendium/references/.compendium/`.
6. Determine output paths:
   - `PlanOutPath`: Prompt user for desired plan output location, or use self-contained default (e.g., `.github/skills/sync-compendium/references/.compendium/latest-plan.json`)
   - `SyncReportPath`: Prompt user for desired sync report location, or use self-contained default
7. Generate plan with `Invoke-CompendiumSyncPlan.ps1` using the determined `PlanOutPath`.
8. Classify with `sync-decision-matrix.md` and require explicit approval for non-noop actions.
9. Apply approved actions only with `Apply-CompendiumSync.ps1` using the determined `SyncReportPath`.
10. Validate sync report at the caller-specified `SyncReportPath`.

## Required Outputs

1. Dry-run plan artifact at caller-specified or self-contained `PlanOutPath`.
2. Approval table with per-artifact disposition.
3. Applied-change summary with preserved/held/manual-review counts.
4. Updated lock metadata at `.github/skills/sync-compendium/references/.compendium/lock.json`.
5. Sync report at caller-specified or self-contained `SyncReportPath`.

## Verification Checklist

- [ ] No root-level `.compendium` paths are created or referenced.
- [ ] No root-level `.artifacts` paths are used.
- [ ] Every artifact has `source` attribution.
- [ ] No `local` ownership artifact is overwritten.
- [ ] No apply action runs without explicit approval evidence.
- [ ] Plan source version and lock metadata source version are consistent.
