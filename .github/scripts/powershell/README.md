<!-- markdownlint-disable-file -->
# PowerShell Script Library

## Purpose

This folder contains reusable PowerShell utilities for governance audits, catalog validation, and asset inventory checks. Each script is designed to be called from governance-focused skills and related review routines.

## Script Catalog

| Script | Purpose | Usage | Output |
|---|---|---|---|
| `invoke-governance-health-overview.ps1` | Run governance-health-overview evidence collection in one non-interactive execution (core checks, skill audit, customization metrics) | `.github/scripts/powershell/invoke-governance-health-overview.ps1 -RootPath c:/Projects/agentic -ReviewDate 2026-04-08` | JSON summary with core check results, skill aggregate path, and customization metrics |
| `get-lane-counts.ps1` | Count agents/skills/instructions/prompts per lifecycle lane | `.github/scripts/powershell/get-lane-counts.ps1 -AssetType 'skills'` | PSCustomObject array with Lane and Count |
| `test-catalog-integrity.ps1` | Detect missing or stale catalog entries | `.github/scripts/powershell/test-catalog-integrity.ps1 -AssetType 'agents'` | PSCustomObject with MissingInCatalog and StaleInCatalog arrays |
| `test-frontmatter-validity.ps1` | Validate instruction/agent/prompt frontmatter structure | `.github/scripts/powershell/test-frontmatter-validity.ps1 -AssetType 'instructions'` | Validation errors or success message |
| `test-hub-file-sync.ps1` | Verify copilot-instructions.md preferred lists match assets | `.github/scripts/powershell/test-hub-file-sync.ps1` | JSON report of divergences or exit 0 if synced |
| `test-governance-link-graph.ps1` | Validate local markdown links and fragment anchors across governance docs | `.github/scripts/powershell/test-governance-link-graph.ps1 -RootPath c:/Projects/agentic` | Pass message or JSON list of broken link issues |
| `get-corpus-manifest.ps1` | Build structured manifest of all markdown files in a document corpus | `./get-corpus-manifest.ps1 -RootPath .docs` | PSCustomObject array: Path, Title, Category, WordCount, Hash |
| `invoke-index-refresh.ps1` | Generate or refresh INDEX.md files throughout a document corpus | `./invoke-index-refresh.ps1 -RootPath .docs` | PSCustomObject: FoldersIndexed, DocumentsIndexed |
| `test-naming-conformance.ps1` | Check .docs file and folder naming policy conformance | `./test-naming-conformance.ps1 -RootPath .docs` | PSCustomObject array of violations; exit 1 if any found |

## Workflow Integration

- **audit-governance skill**: Uses all scripts in full governance audit cycle.
- **governance-health-overview skill**: Uses `invoke-governance-health-overview.ps1` to batch multi-phase evidence collection into one non-interactive run.
- **sync-customizations skill**: Uses `test-frontmatter-validity.ps1` for instruction file validation.
- **validate-customization skill**: Uses `test-catalog-integrity.ps1` for catalog drift detection.
- **governance routines**: Use `test-hub-file-sync.ps1` to verify preferred-list alignment as part of scheduled or on-demand governance audits.
- **governance routines**: Use `test-governance-link-graph.ps1` during cadence runs to close GOV-S6 with executable link-graph evidence.
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
