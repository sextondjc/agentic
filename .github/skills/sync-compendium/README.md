# Sync Compendium Skill

Self-contained, approval-gated compendium synchronization.

## Path Guarantees

- Version metadata: `.github/skills/sync-compendium/references/.compendium/version.json`
- Lock + artifact index state: `.github/skills/sync-compendium/references/.compendium/`
- Generated plan + reports: Wrapper defaults to `.github/skills/sync-compendium/references/.compendium/`; low-level scripts remain caller-configurable.
- No root-level `.compendium` or `.artifacts` paths are required.

## Scripts

- `references/scripts/Initialize-CompendiumImport.ps1`
  - Initializes lock and artifact index under `.github/skills/sync-compendium/references/.compendium/`
- `references/scripts/Invoke-CompendiumSyncPlan.ps1`
  - Generates dry-run plan; caller specifies output path via `PlanOutPath` parameter (required)
- `references/scripts/Apply-CompendiumSync.ps1`
  - Applies approved actions only; caller specifies sync report path via `SyncReportPath` parameter (required)
- `references/scripts/Invoke-CompendiumSync.ps1`
  - Wrapper entrypoint; derives source metadata and writes default plan/report outputs under `.github/skills/sync-compendium/references/.compendium/`
- `references/scripts/Bootstrap-CompendiumSyncEngine.ps1`
  - Bootstraps sync engine assets (including version metadata) for legacy callers before normal sync runs

## Automated Hash Check

1. Query latest `main` commit from `sextondjc/agentic`.
2. Read `.github/skills/sync-compendium/references/.compendium/version.json`.
3. Compare `mainBranchCommitHash` values.
4. If same, ask whether to continue anyway.
5. If different, continue with review and synchronization.

## Default Execution Paths

- `target_repo_root`: current workspace root
- `target_index_path`: `.github/skills/sync-compendium/references/.compendium/artifact-index.json`
- `plan_out_path`: `.github/skills/sync-compendium/references/.compendium/latest-plan.json`
- `sync_report_path`: `.github/skills/sync-compendium/references/.compendium/latest-sync-report.json`

## Safety Rules

- Explicit approval required for non-noop actions.
- `source: local` and `ownershipMode: local` are never overwritten.
- `ownershipMode: extended` changes always require manual review.
- Non-compendium sources are preserved by default.
- If plan contains `hold` / `missing-in-source` outcomes, same-flow cleanup is mandatory: apply must include `-Prune` and approved removals for every hold artifact ID.

## Imported PM And Delivery Bundle

Compendium sync already discovers new skills from the source repository tree, so PM and delivery skills under `.github/skills/*/SKILL.md` are importable without a separate manifest update.

Treat this bundle as the default portable PM and delivery set when curating target repositories after sync:

- `delivery-operating-system`
- `opportunity-mapping`
- `backlog-structuring`
- `acceptance-criteria`
- `flow-metrics`

Post-sync curation rule:

- If target-repo mission includes agent-assisted planning or delivery control, feature `delivery-operating-system` in the target `copilot-instructions.md` as the default PM and delivery intake skill.
- Surface the other four skills as supporting discovery, backlog, acceptance, and flow-control capabilities.
- Do not rely on `skill-discovery-index.md` alone when the repository should actively steer users toward this bundle.
