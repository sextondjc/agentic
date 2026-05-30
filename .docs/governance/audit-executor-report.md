# Governance Audit Report
> Executive aggregate audit across all customization types

## Executive Summary

- Overall governance health status: PASSED
- Critical findings: 0
- High findings: 0
- Medium findings: 0
- Low findings: 0

| Metric | Value |
|---|---:|
| Assets audited | 329 |
| Validation checks passed | 7 / 7 |
| Disposition | PASSED |

## Per-Type Audit Highlights

### Agents
- Catalog integrity and frontmatter checks pass.
- Detailed audit: [.docs/changes/governance/type-audits/agents-audit.md](../changes/governance/type-audits/agents-audit.md)

### Instructions
- Catalog integrity, frontmatter, and global applyTo rationale checks pass.
- Detailed audit: [.docs/changes/governance/type-audits/instructions-audit.md](../changes/governance/type-audits/instructions-audit.md)

### Prompts
- Catalog integrity and frontmatter checks pass.
- Detailed audit: [.docs/changes/governance/type-audits/prompts-audit.md](../changes/governance/type-audits/prompts-audit.md)

### Skills
- Catalog integrity, source freshness, and naming checks pass.
- Detailed audit: [.docs/changes/governance/type-audits/skills-audit.md](../changes/governance/type-audits/skills-audit.md)

## Cross-Type Findings

| ID | Severity | Finding |
|---|---|---|
| XTF-001 | Low | Responsibility overlap check reports 0 duplicate cross-type ownership pairs. |

## Governance Health Assessment

| Dimension | Status |
|---|---|
| Coverage | PASS |
| Consistency | PASS |
| Remediation readiness | PASS |

## Remediation Roadmap

| Rank | Action | Owner | Lane | Priority |
|---:|---|---|---|---|
| 1 | Maintain periodic governance verification and update source catalogs on cadence. | Governance owner | Review | Low |

## Audit Metadata

- Date run: 2026-05-28
- Disposition: PASSED
- Artifacts used:
  - [.docs/changes/governance/type-audits/audit-customization-types.md](../changes/governance/type-audits/audit-customization-types.md)
  - [.docs/changes/governance/type-audits/execute-customization-audit.md](../changes/governance/type-audits/execute-customization-audit.md)
  - [.docs/changes/governance/audits/governance-executive-audit.md](../changes/governance/audits/governance-executive-audit.md)
