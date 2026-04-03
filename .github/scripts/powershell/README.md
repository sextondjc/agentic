<!-- markdownlint-disable-file -->
# PowerShell Script Library

## Purpose

Reusable, single-purpose PowerShell scripts for governance audits, catalog validation, and asset inventory checks. Each script is designed to be called from audit skills and orchestration workflows.

## Script Catalog

| Script | Purpose | Usage | Output |
|---|---|---|---|
| `get-lane-counts.ps1` | Count agents/skills/instructions/prompts per lifecycle lane | `.github/scripts/powershell/get-lane-counts.ps1 -AssetType 'skills'` | PSCustomObject array with Lane and Count |
| `test-catalog-integrity.ps1` | Detect missing or stale catalog entries | `.github/scripts/powershell/test-catalog-integrity.ps1 -AssetType 'agents'` | PSCustomObject with MissingInCatalog and StaleInCatalog arrays |
| `test-frontmatter-validity.ps1` | Validate instruction/agent/prompt frontmatter structure | `.github/scripts/powershell/test-frontmatter-validity.ps1 -AssetType 'instructions'` | Validation errors or success message |
| `test-hub-file-sync.ps1` | Verify copilot-instructions.md preferred lists match assets | `.github/scripts/powershell/test-hub-file-sync.ps1` | JSON report of divergences or exit 0 if synced |

## Workflow Integration

- **audit-governance skill**: Uses all scripts in full governance audit cycle.
- **sync-customizations skill**: Uses `test-frontmatter-validity.ps1` for instruction file validation.
- **validate-customization skill**: Uses `test-catalog-integrity.ps1` for catalog drift detection.
- **orchestrator / planning agents**: Use `test-hub-file-sync.ps1` to verify asset availability before routing.

## Path Requirement

All scripts must be invoked from the workspace root. Use `Push-Location` before calling:

```powershell
Push-Location c:/Projects/agentic_templates
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
