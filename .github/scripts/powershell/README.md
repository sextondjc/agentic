<!-- markdownlint-disable-file -->
# PowerShell Script Library

## Purpose

This folder contains reusable PowerShell utilities for governance audits, catalog validation, and asset inventory checks. Each script is designed to be called from governance-focused skills and related review routines.

## Script Catalog

| Script | Purpose | Usage | Output |
|---|---|---|---|
| `invoke-governance-health-overview.ps1` | Run governance-health-overview evidence collection in one non-interactive execution (core checks, skill audit, customization metrics) | `.github/scripts/powershell/invoke-governance-health-overview.ps1 [-RootPath <path>] [-ReviewDate <date>]` (defaults to current directory) | JSON summary with core check results, skill aggregate existence, and customization metrics |
| `get-lane-counts.ps1` | Count agents/skills/instructions/prompts per lifecycle lane | `.github/scripts/powershell/get-lane-counts.ps1 -AssetType 'skills'` | PSCustomObject array with Lane and Count |
| `test-catalog-integrity.ps1` | Detect missing or stale catalog entries; exits 1 on any violation | `.github/scripts/powershell/test-catalog-integrity.ps1 -AssetType 'agents'` | Success message (exit 0) or error with MissingInCatalog/StaleInCatalog detail (exit 1) |
| `test-frontmatter-validity.ps1` | Validate instruction/agent/prompt frontmatter structure and semantics (non-empty values, unknown-key detection, applyTo quality warning) | `.github/scripts/powershell/test-frontmatter-validity.ps1 -AssetType 'instructions'` | Validation errors (exit 1) or success message (exit 0) |
| `test-hub-file-sync.ps1` | Verify copilot-instructions.md preferred agents stay synced and prompt/instruction catalogs match assets | `.github/scripts/powershell/test-hub-file-sync.ps1` | JSON report of divergences or exit 0 if synced |
| `test-governance-optimization-factor.ps1` | Verify optimization remains an enforced governance review factor across skills, prompts, and catalogs | `.github/scripts/powershell/test-governance-optimization-factor.ps1 [-RootPath <path>]` | Success message (exit 0) or JSON violations (exit 1) |
| `test-governance-link-graph.ps1` | Validate local markdown links and fragment anchors across governance docs | `.github/scripts/powershell/test-governance-link-graph.ps1 -RootPath c:/Projects/agentic` | Pass message or JSON list of broken link issues |
| `test-governance-artifact-contract.ps1` | Detect forbidden legacy governance artifact paths and dated `.docs` review naming contracts in active governance assets | `.github/scripts/powershell/test-governance-artifact-contract.ps1` | PSCustomObject array of violations; exit 1 if any are found |
| `test-utilization-coverage.ps1` | Validate that each indexed skill is referenced by at least one non-self agent or prompt artifact | `.github/scripts/powershell/test-utilization-coverage.ps1 [-RootPath <path>]` | PSCustomObject rows with Skill, ReferenceCount, ReferencedBy, Status; exit 1 if orphaned skills are found |
| `test-review-recency.ps1` | Validate review recency for skill history and customization audit history records | `.github/scripts/powershell/test-review-recency.ps1 [-RootPath <path>] [-ThresholdDays <int>]` | PSCustomObject rows with Asset, Type, LastReviewDate, DaysSinceReview, Status; exit 1 if overdue/missing |
| `test-source-catalog-freshness.ps1` | Validate source catalog freshness thresholds for sync-customizations and sync-skills | `.github/scripts/powershell/test-source-catalog-freshness.ps1 [-RootPath <path>] [-ThresholdDays <int>]` | PSCustomObject rows with Catalog, Source, LastEvaluated, DaysOverdue, Status; exit 1 when stale/invalid/missing |
| `test-asset-naming.ps1` | Validate naming policy conformance for `.github` customization assets | `.github/scripts/powershell/test-asset-naming.ps1 [-RootPath <path>] [-AssetType all|skills|agents|instructions|prompts]` | PSCustomObject rows with AssetType, AssetName, Pattern, Status, Violation; exit 1 on violations |
| `get-corpus-manifest.ps1` | Build structured manifest of all markdown files in a document corpus | `./get-corpus-manifest.ps1 -RootPath .docs` | PSCustomObject array: Path, Title, Category, WordCount, Hash |
| `invoke-index-refresh.ps1` | Generate or refresh INDEX.md files throughout a document corpus | `./invoke-index-refresh.ps1 -RootPath .docs` | PSCustomObject: FoldersIndexed, DocumentsIndexed |
| `test-naming-conformance.ps1` | Check .docs file and folder naming policy conformance | `./test-naming-conformance.ps1 -RootPath .docs` | PSCustomObject array of violations; exit 1 if any found |

## Workflow Integration

- **audit-governance skill**: Uses all scripts in full governance audit cycle.
- **governance-health-overview skill**: Uses `invoke-governance-health-overview.ps1` to batch multi-phase evidence collection into one non-interactive run.
- **sync-customizations skill**: Uses `test-frontmatter-validity.ps1` for instruction file validation.
- **validate-customization skill**: Uses `test-catalog-integrity.ps1` for catalog drift detection.
- **governance routines**: Use `test-hub-file-sync.ps1` to verify preferred-agent alignment and prompt/instruction catalog parity as part of scheduled or on-demand governance audits.
- **governance routines**: Use `test-governance-optimization-factor.ps1` to keep optimization quality as a mandatory review factor in cadence checks.
- **governance routines**: Use `test-governance-link-graph.ps1` during cadence runs to close GOV-S6 with executable link-graph evidence.
- **governance routines**: Use `test-governance-artifact-contract.ps1` during cadence runs to close GOV-S8 and catch legacy `.docs` artifact contracts before they regenerate drift.
- **governance routines**: Use `test-utilization-coverage.ps1` during cadence runs to enforce GOV-S9 utilization coverage.
- **governance routines**: Use `test-review-recency.ps1` during cadence runs to enforce GOV-S10 review recency thresholds.
- **governance routines**: Use `test-source-catalog-freshness.ps1` during cadence runs to detect stale source evaluations in sync customizations/skills catalogs.
- **governance routines**: Use `test-asset-naming.ps1` during cadence runs to enforce naming-conventions policy on `.github` customization assets.
- **librarian skill**: Uses `get-corpus-manifest.ps1` for evidence gathering, `invoke-index-refresh.ps1` for index step, `test-naming-conformance.ps1` for naming audit.

## Path Requirement

All scripts must be invoked from the workspace root. Use `Push-Location` before calling:

```powershell
Push-Location c:/Projects/agentic
& ./.github/scripts/powershell/get-lane-counts.ps1 -AssetType 'skills'
Pop-Location
```

## Script Standards

- **Single purpose**: Each script does one thing and does it well.
- **Parameter validation**: Use `[ValidateSet(...)]` to restrict inputs.
- **Error handling**: Exit with 1 on error, 0 on success.
- **Output format**: Use PSCustomObject for structured results.
- **Idempotent**: Safe to run multiple times without side effects.
- **Conciseness**: Target <50 lines; avoid duplication.
