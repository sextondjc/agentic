# MCP Skill Family Changes

## Traceability

| Field | Value |
|---|---|
| Plan ID | PLAN-MCP-SKILL-FAMILY-2026-04-28 |
| Workstream ID | WS-MCP-SKILL-COMPENDIUM |
| Date | 2026-04-28 |

## Scope Delivered

- Added new orchestrator skill for MCP multi-phase intake and routing.
- Added write, refine, and quality-gate MCP skills.
- Added source curation, SDK selection, contract versioning, transport architecture, inspector CI observability, authn/authz hardening, regression test design, and release readiness gate MCP skills.
- Added official-source catalogs for each new skill.
- Registered new skills in the canonical skill discovery index.

## Constraint Compliance

- Official sources only.
- SDK scope constrained to C# and TypeScript.
- Community aggregators excluded.

## Files Added

- `.github/skills/orchestrate-mcp-servers/SKILL.md`
- `.github/skills/orchestrate-mcp-servers/references/source-catalog.md`
- `.github/skills/write-mcp-servers/SKILL.md`
- `.github/skills/write-mcp-servers/references/source-catalog.md`
- `.github/skills/refine-mcp-servers/SKILL.md`
- `.github/skills/refine-mcp-servers/references/source-catalog.md`
- `.github/skills/mcp-server-quality-gate/SKILL.md`
- `.github/skills/mcp-server-quality-gate/references/source-catalog.md`
- `.github/skills/mcp-source-curation/SKILL.md`
- `.github/skills/mcp-source-curation/references/source-catalog.md`
- `.github/skills/mcp-sdk-selection-csharp-typescript/SKILL.md`
- `.github/skills/mcp-sdk-selection-csharp-typescript/references/source-catalog.md`
- `.github/skills/mcp-contract-versioning/SKILL.md`
- `.github/skills/mcp-contract-versioning/references/source-catalog.md`
- `.github/skills/mcp-transport-architecture/SKILL.md`
- `.github/skills/mcp-transport-architecture/references/source-catalog.md`
- `.github/skills/mcp-inspector-ci-observability/SKILL.md`
- `.github/skills/mcp-inspector-ci-observability/references/source-catalog.md`
- `.github/skills/mcp-authn-authz-hardening/SKILL.md`
- `.github/skills/mcp-authn-authz-hardening/references/source-catalog.md`
- `.github/skills/mcp-regression-test-design/SKILL.md`
- `.github/skills/mcp-regression-test-design/references/source-catalog.md`
- `.github/skills/mcp-release-readiness-gate/SKILL.md`
- `.github/skills/mcp-release-readiness-gate/references/source-catalog.md`

## Files Updated

- `.github/catalogs/skills-discovery-index.md`

## Residual Risks

- Source catalogs use current evaluation snapshots and should be refreshed periodically.
- Any future MCP SDK policy changes require a targeted sync pass for these skills.
