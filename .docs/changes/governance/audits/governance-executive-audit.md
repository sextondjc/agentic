# Governance Executive Audit

## Report Navigation Grid

| Level | Artifact | Purpose |
|---|---|---|
| Level 1 Executive | `.docs/governance/audit-executor-report.md` | Executive summary and roadmap |
| Level 2 Type | `.docs/changes/governance/type-audits/*.md` | Per-type evidence |
| Level 3 Item | `.github/scripts/powershell/*.ps1` | Script-level controls |

## Coverage Grid

| Asset Type | Count |
|---|---:|
| Agents | 18 |
| Instructions | 21 |
| Prompts | 21 |
| Skills | 267 |
| Total | 327 |

## Standards Health Grid

| Standard Group | Result | Notes |
|---|---|---|
| GOV-M* | Pass | No open MUST failures. |
| GOV-S* | Pass | No open governance script failures in the current run. |
| GOV-SK | Pass | Skills checks pass after catalog/freshness updates. |
| GOV-CUS | Pass | No-docs-dependency now aligns with repository conventions for source checks. |
| GOV-OPT | Pass | Responsibility-overlap remains within threshold. |

## Aggregate Metrics Grid

| Metric | Value |
|---|---:|
| Validation checks run | 21 |
| Validation checks passed | 21 |
| Validation checks failed | 0 |
| Duplicate responsibility pairs | 0 |

## Failure Detail Grid

| ID | Check | Severity | Finding | Evidence |
|---|---|---|---|---|
| None | N/A | N/A | No open failures in current check set. | `.github/skills/governance-health-overview/references/.artifacts/governance-health-overview.latest.json` |

## Ranked Recommendations Grid

| Rank | Recommendation | Priority |
|---:|---|---|
| 1 | Maintain monthly governance verification cadence and keep check paths aligned with active catalogs. | Low |

## Final Disposition

PASSED
