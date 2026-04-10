# Architectural Decision Records

This directory is the canonical home for all architectural decision records (ADRs) produced in this workspace.

## Authoring

Use the `adr-generator` skill to create new ADRs in the correct format with explicit rationale, alternatives considered, and consequences.

## Naming

Use the pattern: `adr-NNNN-<short-decision-title>.md` — sequential number, lowercase, hyphens only.

**Date prefixes are prohibited.** Date metadata belongs in the ADR frontmatter (`date:` field), never in the filename.

Example: `adr-0001-repository-pattern-for-data-access.md`

## Index

| File | Date | Decision | Status |
|---|---|---|---|
| [customization-taxonomy-promotion-boundary.md](./customization-taxonomy-promotion-boundary.md) | 2026-04-02 | Promote taxonomy v1 as conceptual governance reference; retain lifecycle catalogs as operational source-of-truth | Accepted |

## References

- Skill: [SKILL.md](./../../.github/skills/adr-generator/SKILL.md)
- Governance: [planning-execution-review-governance.md](./../../.github/skills/audit-governance/references/planning-execution-review-governance.md)
