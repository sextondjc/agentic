# Sync Compendium Skill

Self-contained, approval-gated compendium synchronization.

## Path Guarantees

- Version metadata: `.github/skills/sync-compendium/references/.compendium/version.json`
- Lock + artifact index state: `.github/skills/sync-compendium/references/.compendium/`
- Generated plan + reports: Caller-specified paths (no defaults; fully configurable)
- No root-level `.compendium` or `.artifacts` paths are required.

## Scripts

- `references/scripts/Initialize-CompendiumImport.ps1`
  - Initializes lock and artifact index under `.github/skills/sync-compendium/references/.compendium/`
- `references/scripts/Invoke-CompendiumSyncPlan.ps1`
  - Generates dry-run plan; caller specifies output path via `PlanOutPath` parameter (required)
- `references/scripts/Apply-CompendiumSync.ps1`
  - Applies approved actions only; caller specifies sync report path via `SyncReportPath` parameter (required)

## Automated Hash Check

1. Query latest `main` commit from `sextondjc/agentic`.
2. Read `.github/skills/sync-compendium/references/.compendium/version.json`.
3. Compare `mainBranchCommitHash` values.
4. If same, ask whether to continue anyway.
5. If different, continue with review and synchronization.

## Default Execution Paths

- `target_repo_root`: current workspace root
- `target_index_path`: `.github/skills/sync-compendium/references/.compendium/artifact-index.json`
- `source_manifest_path`: `.github/skills/sync-compendium/references/.compendium/manifest.json`

## Safety Rules

- Explicit approval required for non-noop actions.
- `source: local` and `ownershipMode: local` are never overwritten.
- `ownershipMode: extended` changes always require manual review.
- Non-compendium sources are preserved by default.
- `hold` / `missing-in-source` outcomes are not deleted by this skill; decommission runs in a separate approved workflow.
