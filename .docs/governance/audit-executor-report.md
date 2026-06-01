# Governance Audit Report
> Executive aggregate audit across all customization types

## Executive Summary

- Overall governance health status: FAILED
- Critical findings: 0
- High findings: 0
- Medium findings: 0
- Low findings: 0

| Metric | Value |
|---|---:|
| Assets audited | 327 |
| Validation checks passed | 13 / 21 (canonical wrapper check set) |
| Disposition | FAILED |

## Per-Type Audit Highlights

### Agents
- Top findings by severity:
- Low: Frontmatter validation passes.
- Low: Catalog integrity validation passes.
- Detailed audit: [.docs/changes/governance/type-audits/agents-audit.md](../changes/governance/type-audits/agents-audit.md)

### Instructions
- Top findings by severity:
- Low: Frontmatter validation passes.
- Low: Catalog integrity validation passes.
- Low: Intentional global `applyTo` rationale checks pass.
- Detailed audit: [.docs/changes/governance/type-audits/instructions-audit.md](../changes/governance/type-audits/instructions-audit.md)

### Prompts
- Top findings by severity:
- Low: Frontmatter validation passes.
- Low: Catalog integrity validation passes.
- Detailed audit: [.docs/changes/governance/type-audits/prompts-audit.md](../changes/governance/type-audits/prompts-audit.md)

### Skills
- Top findings by severity:
- Low: Catalog integrity validation passes.
- Low: Source-catalog freshness check passes.
- Low: Naming conformance check passes.
- Detailed audit: [.docs/changes/governance/type-audits/skills-audit.md](../changes/governance/type-audits/skills-audit.md)

## Cross-Type Findings

| ID | Severity | Finding |
|---|---|---|
| XTF-001 | Low | Responsibility overlap check reports 0 duplicate cross-type ownership pairs (within threshold). |

## Validation Check Detail

| Metric | Value |
|---|---|
| Failed checks | 8 |
| Failure detail source | `.github/skills/governance-health-overview/references/.artifacts/governance-health-overview.latest.json` |

<!-- GOV-CHECK-DETAIL-START -->
### Current Gate Check Failures

| Check | ExitCode | Evidence Snippet |
|---|---:|---|
| catalog-agents | 1 | Catalog integrity passed for 'agents': all entries match on-disk assets. MissingInCatalog StaleInCatalog ---------------- -------------- {} {} |
| catalog-prompts | 1 | Catalog integrity passed for 'prompts': all entries match on-disk assets. MissingInCatalog StaleInCatalog ---------------- -------------- {} {} |
| catalog-instructions | 1 | Catalog integrity passed for 'instructions': all entries match on-disk assets. MissingInCatalog StaleInCatalog ---------------- -------------- {} {} |
| frontmatter-agents | 1 | All agents files passed frontmatter validation. |
| frontmatter-prompts | 1 | All prompts files passed frontmatter validation. |
| frontmatter-instructions | 1 | All instructions files passed frontmatter validation. |
| optimization-factor | 1 | [ { "Check": "audit-skill brevity standard", "Path": ".github/skills/audit-skill/SKILL.md", "Reason": "Required pattern not found" }, { "Check": "audit-agent conflict standard",... |
| link-graph | 1 | { "CheckedFiles": 2102, "CheckedLinks": 2939, "BrokenLinks": 290, "Issues": [ { "Source": "C:\\Projects\\agentic\\.docs\\plans\\customization\\csharp-skills\\2026-05-31\\csharp-... |
<!-- GOV-CHECK-DETAIL-END -->

## Governance Health Assessment

| Dimension | Status |
|---|---|
| Coverage | PASS (4/4 customization types audited) |
| Consistency | PASS |
| Remediation readiness | PASS |

## Remediation Roadmap

| Rank | Action | Owner | Lane | Priority |
|---:|---|---|---|---|
| 1 | Continue cadence governance runs and keep script path references aligned with current catalogs. | Governance engineering owner | Review | Low |

## Audit Metadata

- Date run: 2026-06-01
- Disposition: FAILED
- Artifacts used:
  - [.docs/changes/governance/type-audits/audit-customization-types.md](../changes/governance/type-audits/audit-customization-types.md)
  - [.docs/changes/governance/type-audits/execute-customization-audit.md](../changes/governance/type-audits/execute-customization-audit.md)
  - [.docs/changes/governance/audits/governance-executive-audit.md](../changes/governance/audits/governance-executive-audit.md)
  - [.github/skills/governance-health-overview/references/.artifacts/governance-health-overview.latest.json](../../.github/skills/governance-health-overview/references/.artifacts/governance-health-overview.latest.json)





