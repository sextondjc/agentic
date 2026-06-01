# Governance Health Overview - Human Summary

| Metric | Value |
|---|---|
| Review Date | 2026-06-01 |
| Total Checks | 21 |
| Passed Checks | 13 |
| Failed Checks | 8 |
| Material Failures | 6 |
| Likely False Positives | 2 |
| Asset Total | 340 |
| Open Conflicts | 0 |

## Strengths
- Asset coverage complete across agents, instructions, prompts, and skills (340 total artifacts).
- No open customization conflict files detected.
- Responsibility overlap remains within threshold (0/8).

## Weaknesses
- catalog-agents: Catalog integrity passed for 'agents': all entries match on-disk assets. MissingInCatalog StaleInCatalog ---------------- -------------- ...
- catalog-prompts: Catalog integrity passed for 'prompts': all entries match on-disk assets. MissingInCatalog StaleInCatalog ---------------- --------------...
- catalog-instructions: Catalog integrity passed for 'instructions': all entries match on-disk assets. MissingInCatalog StaleInCatalog ---------------- ---------...
- frontmatter-agents: All agents files passed frontmatter validation.
- optimization-factor: [ { "Check": "audit-skill brevity standard", "Path": ".github/skills/audit-skill/SKILL.md", "Reason": "Required pattern not found" }, { "...
- link-graph: { "CheckedFiles": 2102, "CheckedLinks": 2939, "BrokenLinks": 290, "Issues": [ { "Source": "C:\\Projects\\agentic\\.docs\\plans\\customiza...

## Opportunities
- Fix exit-code behavior for likely false-positive checks: frontmatter-prompts, frontmatter-instructions.
- Publish top-N link graph issues as curated remediation batches to reduce noise and speed triage.
- Promote catalog updates into CI guardrails so new instructions and prompts cannot drift from lifecycle catalogs.

## Threats
- 6 material check failures are currently blocking PASSED disposition.
- Large-volume broken links (100) can degrade trust in governance navigation and evidence traceability.

## Top Failing Checks

| Check | ExitCode | Evidence Snippet |
|---|---:|---|
| catalog-agents | 1 | Catalog integrity passed for 'agents': all entries match on-disk assets. MissingInCatalog StaleInCatalog ---------------- -------------- {} {} |
| catalog-prompts | 1 | Catalog integrity passed for 'prompts': all entries match on-disk assets. MissingInCatalog StaleInCatalog ---------------- -------------- {} {} |
| catalog-instructions | 1 | Catalog integrity passed for 'instructions': all entries match on-disk assets. MissingInCatalog StaleInCatalog ---------------- -------------- {} {} |
| frontmatter-agents | 1 | All agents files passed frontmatter validation. |
| optimization-factor | 1 | [ { "Check": "audit-skill brevity standard", "Path": ".github/skills/audit-skill/SKILL.md", "Reason": "Required pattern not found" }, { "Check": "audit-agent conflict standard", "Path": ".github/skills/audit-agent/SKI... |
| link-graph | 1 | { "CheckedFiles": 2102, "CheckedLinks": 2939, "BrokenLinks": 290, "Issues": [ { "Source": "C:\\Projects\\agentic\\.docs\\plans\\customization\\csharp-skills\\2026-05-31\\csharp-skills-exact-skill-edits-side-by-side.md... |

## Evidence Artifacts

- Raw machine evidence: [governance-health-overview.latest.json](./governance-health-overview.latest.json)
- Responsibility overlap payload: [responsibility-overlap.routing.json](./responsibility-overlap.routing.json)
