# Docker .NET Family Source Refresh Checkpoint

## Purpose

Monthly checkpoint to verify official-source freshness and drift posture across the Docker .NET skill family.

## Metadata

- Family: `docker-dotnet-skill-family`
- Cadence: `Monthly`
- Owner: `Source-curation owner`
- Last Reviewed: `YYYY-MM-DD`
- Next Review Due: `YYYY-MM-DD`

## Coverage Set

| Skill | Source Catalog Path | Freshness Threshold | Status |
|---|---|---|---|
| docker-dotnet-foundations | `.github/skills/docker-dotnet-foundations/references/source-catalog.md` | 30 days | Pending |
| docker-dotnet-buildkit-optimization | `.github/skills/docker-dotnet-buildkit-optimization/references/source-catalog.md` | 30 days | Pending |
| docker-dotnet-compose-workflows | `.github/skills/docker-dotnet-compose-workflows/references/source-catalog.md` | 30 days | Pending |
| docker-dotnet-security-supply-chain | `.github/skills/docker-dotnet-security-supply-chain/references/source-catalog.md` | 30 days | Pending |
| docker-dotnet-testcontainers | `.github/skills/docker-dotnet-testcontainers/references/source-catalog.md` | 30 days | Pending |
| docker-dotnet-ci-cd | `.github/skills/docker-dotnet-ci-cd/references/source-catalog.md` | 30 days | Pending |
| docker-dotnet-quality-gate | `.github/skills/docker-dotnet-quality-gate/references/source-catalog.md` | 30 days | Pending |
| docker-dotnet-source-curation | `.github/skills/docker-dotnet-source-curation/references/source-catalog.md` | 30 days | Pending |
| docker-orchestrator | `.github/skills/docker-orchestrator/references/source-catalog.md` | 30 days | Pending |

## Decision Rules

- If any source is older than threshold, create a remediation entry with owner and due date.
- If official guidance changed materially, update the affected skill and reference assets in the same change.
- If no changes are required, record explicit `No Drift` status with review date.

## Drift and Remediation Log

| Date | Skill | Drift Detected | Action | Owner | Due Date | Status |
|---|---|---|---|---|---|---|
| YYYY-MM-DD | <skill-name> | Yes/No | <update summary or no-drift note> | <owner> | YYYY-MM-DD | Open/Closed |
