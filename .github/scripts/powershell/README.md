<!-- markdownlint-disable-file -->
# PowerShell Script Library

## Purpose

This folder contains reusable PowerShell utilities for governance audits, catalog validation, and asset inventory checks. Each script is designed to be called from governance-focused skills and related review routines.

## Script Catalog

| Script | Purpose | Usage | Output |
|---|---|---|---|
| `invoke-governance-health-overview.ps1` | Run governance-health-overview evidence collection in one non-interactive execution (core checks, skill audit, customization metrics, responsibility overlap summary, aggregate metrics payload) | `.github/scripts/powershell/invoke-governance-health-overview.ps1 [-RootPath <path>] [-ReviewDate <date>]` (defaults to current directory) | JSON summary with core check results, skill aggregate existence, customization metrics, routed responsibility-overlap evidence, and computed aggregate metrics (`TotalChecks`, `PassedChecks`, `FailedChecks`, asset counts, overlap threshold status) |
| `invoke-execute-customization-audit.ps1` | Canonical launcher for execute-customization-audit executive aggregation flow | `.github/scripts/powershell/invoke-execute-customization-audit.ps1 [-RootPath <path>] [-ReviewDate <date>]` | Invokes executive aggregation workflow and returns JSON summary payload |
| `get-lane-counts.ps1` | Count agents/skills/instructions/prompts per lifecycle lane | `.github/scripts/powershell/get-lane-counts.ps1 -AssetType 'skills'` | PSCustomObject array with Lane and Count |
| `test-catalog-integrity.ps1` | Detect missing or stale catalog entries; exits 1 on any violation | `.github/scripts/powershell/test-catalog-integrity.ps1 -AssetType 'agents'` | Success message (exit 0) or error with MissingInCatalog/StaleInCatalog detail (exit 1) |
| `test-frontmatter-validity.ps1` | Validate instruction/agent/prompt frontmatter structure and semantics (non-empty values, unknown-key detection, applyTo quality warning) | `.github/scripts/powershell/test-frontmatter-validity.ps1 -AssetType 'instructions'` | Validation errors (exit 1) or success message (exit 0) |
| `test-hub-file-sync.ps1` | Verify copilot-instructions.md preferred agents stay synced and prompt/instruction catalogs match assets | `.github/scripts/powershell/test-hub-file-sync.ps1` | JSON report of divergences or exit 0 if synced |
| `test-governance-optimization-factor.ps1` | Verify optimization remains an enforced governance review factor across skills, prompts, and catalogs | `.github/scripts/powershell/test-governance-optimization-factor.ps1 [-RootPath <path>]` | Success message (exit 0) or JSON violations (exit 1) |
| `test-governance-link-graph.ps1` | Validate local markdown links and fragment anchors across governance docs | `.github/scripts/powershell/test-governance-link-graph.ps1 -RootPath c:/Projects/agentic` | Pass message or JSON list of broken link issues |
| `test-governance-artifact-contract.ps1` | Detect forbidden legacy governance artifact paths and dated `.docs` review naming contracts in active governance assets | `.github/scripts/powershell/test-governance-artifact-contract.ps1` | PSCustomObject array of violations; exit 1 if any are found |
| `test-artifact-reference-hygiene.ps1` | Detect stale unreferenced governance artifacts and fail checks when residue is present | `.github/scripts/powershell/test-artifact-reference-hygiene.ps1 [-RootPath <path>] [-ArtifactsPath <path>]` | PSCustomObject rows with ArtifactPath, ReferenceCount, ReferencedBy, Status; exit 1 if unreferenced files are found |
| `test-utilization-coverage.ps1` | Validate that each indexed skill is referenced by at least one non-self agent or prompt artifact | `.github/scripts/powershell/test-utilization-coverage.ps1 [-RootPath <path>]` | PSCustomObject rows with Skill, ReferenceCount, ReferencedBy, Status; exit 1 if orphaned skills are found |
| `test-review-recency.ps1` | Validate review recency for skill history and customization audit history records | `.github/scripts/powershell/test-review-recency.ps1 [-RootPath <path>] [-ThresholdDays <int>]` | PSCustomObject rows with Asset, Type, LastReviewDate, DaysSinceReview, Status; exit 1 if overdue/missing |
| `test-source-catalog-freshness.ps1` | Validate source catalog freshness thresholds for sync-customizations and sync-skills | `.github/scripts/powershell/test-source-catalog-freshness.ps1 [-RootPath <path>] [-ThresholdDays <int>]` | PSCustomObject rows with Catalog, Source, LastEvaluated, DaysOverdue, Status; exit 1 when stale/invalid/missing |
| `test-asset-naming.ps1` | Validate naming policy conformance for `.github` customization assets | `.github/scripts/powershell/test-asset-naming.ps1 [-RootPath <path>] [-AssetType all|skills|agents|instructions|prompts]` | PSCustomObject rows with AssetType, AssetName, Pattern, Status, Violation; exit 1 on violations |
| `test-responsibility-overlap.ps1` | Detect responsibility-overlap signals across agents, instructions, prompts, and skills using purpose similarity heuristics | `.github/scripts/powershell/test-responsibility-overlap.ps1 [-RootPath <path>] [-SimilarityThreshold <double>] [-MinimumSharedTokens <int>] [-MaxAllowedDuplicatePairs <int>] [-OutputPath <path>]` | PSCustomObject summary with overlap pairs, counts by type pair, threshold breach status; exit 1 when duplicate pair count exceeds threshold |
| `test-type-interaction-matrix.ps1` | Validate same-type and cross-type pair coverage in type-audit reports and count failure-propagation signals | `.github/scripts/powershell/test-type-interaction-matrix.ps1 [-RootPath <path>] [-ReportPath <path>]` | PSCustomObject with expected/found pair counts, missing pairs, failure-propagation totals; exit 1 when required pairs are missing |
| `test-overlap-watchlist.ps1` | Monitor designated high-overlap watchlist pairs in responsibility-overlap artifacts | `.github/scripts/powershell/test-overlap-watchlist.ps1 [-RootPath <path>] [-OverlapArtifactPath <path>]` | PSCustomObject rows for each watchlist pair; exit 1 only when artifact cannot be read |
| `test-governance-count-consistency.ps1` | Verify overlap artifact asset counts match canonical workspace counts | `.github/scripts/powershell/test-governance-count-consistency.ps1 [-RootPath <path>] [-OverlapArtifactPath <path>]` | PSCustomObject count comparison rows; exit 1 on mismatch |
| `test-global-applyto-rationale.ps1` | Ensure intentional global `applyTo: '**'` instruction scope retains explicit rationale sections | `.github/scripts/powershell/test-global-applyto-rationale.ps1 [-RootPath <path>]` | PSCustomObject file policy rows; exit 1 on missing rationale/scope |
| `test-governance-must-traceability.ps1` | Ensure each MUST finding in the executive governance report maps to a canonical check ID and expected script evidence using the MUST registry | `.github/scripts/powershell/test-governance-must-traceability.ps1 [-ReportPath <path>] [-RegistryPath <path>]` | Success message (exit 0) or violation rows (exit 1); blocks report generation when MUST findings are unmapped |
| `test-routing-determinism.ps1` | Validate deterministic capability-to-skill selection against registry and benchmark corpus to ensure required skills are always selected | `.github/scripts/powershell/test-routing-determinism.ps1 [-RootPath <path>] [-RegistryPath <path>] [-BenchmarkPath <path>]` | PSCustomObject rows per benchmark case; exit 1 if any required skill is missed |
| `Invoke-MatrixCoverageCheck.ps1` | Detect coverage gaps, asset drift, stale matrix, promotion gaps, discipline changes, and tagged-only cells in the PDL governance system | `.github/scripts/powershell/Invoke-MatrixCoverageCheck.ps1 [-RootPath <path>]` | PSCustomObject rows with Signal, Severity, Asset, Detail, RecommendedAction; exit 1 on Blocking signals |
| `get-corpus-manifest.ps1` | Build structured manifest of all markdown files in a document corpus | `./get-corpus-manifest.ps1 -RootPath .docs` | PSCustomObject array: Path, Title, Category, WordCount, Hash |
| `invoke-index-refresh.ps1` | Generate or refresh INDEX.md files throughout a document corpus | `./invoke-index-refresh.ps1 -RootPath .docs` | PSCustomObject: FoldersIndexed, DocumentsIndexed |
| `test-naming-conformance.ps1` | Check .docs file and folder naming policy conformance | `./test-naming-conformance.ps1 -RootPath .docs` | PSCustomObject array of violations; exit 1 if any found |

## Workflow Integration

- **governance-audit skill**: Uses all scripts in full governance audit cycle.
- **execute-customization-audit skill**: Uses `invoke-execute-customization-audit.ps1` as the canonical launcher for executive aggregation runs.
- **sync-customizations skill**: Uses `test-frontmatter-validity.ps1` for instruction file validation.
- **audit-agent / audit-instructions / audit-prompts skills**: Use `test-catalog-integrity.ps1` for catalog drift detection when review findings depend on stale or broken registry paths.
- **governance routines**: Use `test-hub-file-sync.ps1` to verify preferred-agent alignment and prompt/instruction catalog parity as part of scheduled or on-demand governance audits.
- **governance routines**: Use `test-governance-optimization-factor.ps1` to keep optimization quality as a mandatory review factor in cadence checks.
- **governance routines**: Use `test-governance-link-graph.ps1` during cadence runs to close GOV-S6 with executable link-graph evidence.
- **governance routines**: Use `test-governance-artifact-contract.ps1` during cadence runs to close GOV-S8 and catch legacy `.docs` artifact contracts before they regenerate drift.
- **governance routines**: Use `test-artifact-reference-hygiene.ps1` during cadence runs to fail fast when stale unreferenced governance artifacts accumulate.
- **governance routines**: Use `test-utilization-coverage.ps1` during cadence runs to enforce GOV-S9 utilization coverage.
- **governance routines**: Use `test-review-recency.ps1` during cadence runs to enforce GOV-S10 review recency thresholds.
- **governance routines**: Use `test-source-catalog-freshness.ps1` during cadence runs to detect stale source evaluations in sync customizations/skills catalogs.
- **governance routines**: Use `test-asset-naming.ps1` during cadence runs to enforce naming-conventions policy on `.github` customization assets.
- **governance routines**: Use `test-responsibility-overlap.ps1` during cadence runs to detect duplication of purpose across all four customization asset types and fail on threshold breach.
- **audit-customization-types skill**: Uses `test-type-interaction-matrix.ps1` to validate pair coverage and failure-propagation totals in type-audit reports.
- **governance routines**: Use `test-overlap-watchlist.ps1` during cadence runs to monitor designated high-similarity overlap pairs.
- **governance routines**: Use `test-governance-count-consistency.ps1` during cadence runs to keep generated asset counts normalized across artifacts.
- **governance routines**: Use `test-global-applyto-rationale.ps1` during cadence runs to preserve explicit rationale for intentional global instruction scope.
- **governance routines**: Use `test-governance-must-traceability.ps1` during cadence runs to enforce that MUST findings are script-mapped and evidence-traceable before reports are published.
- **governance routines**: Use `test-routing-determinism.ps1` during cadence runs to enforce deterministic routing coverage and required-skill recall.
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

