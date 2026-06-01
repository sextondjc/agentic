# Docker Skill Authoring Checklist Template

## Metadata

| Field | Value |
|---|---|
| Artifact ID | checklist-docker-skill-authoring-template |
| Lane | Execution |
| Owner | skills-authoring workflow |
| Last Updated | 2026-06-01 |

## Scope

Use this checklist when creating or updating any reusable Docker-related skill so outputs are deterministic, self-contained, and discoverable across projects.

## Checklist

- [ ] Skill frontmatter includes name and clear trigger-focused description.
- [ ] Skill has clear specialization and scope boundaries.
- [ ] Skill includes deterministic workflow steps.
- [ ] Skill includes required outputs and done criteria.
- [ ] Skill includes at least one sample code artifact.
- [ ] Skill includes at least one sample configuration artifact.
- [ ] Skill includes at least one reusable template artifact.
- [ ] Skill includes at least one runnable script artifact.
- [ ] Skill claims are backed by official-first sources in a source catalog.
- [ ] Skill avoids workspace-specific assumptions and paths.
- [ ] Skill is registered in skills discovery index in the same change set.
- [ ] Skill includes anti-pattern checks and rejection criteria where applicable.

## Asset Mapping Table

| Asset Type | Minimum Requirement | Example Path Pattern |
|---|---|---|
| Sample code | 1+ concrete snippet/example | .github/skills/<skill>/references/examples/*.md |
| Configuration | 1+ config sample | .github/skills/<skill>/references/templates/config/*.yaml |
| Templates | 1+ reusable template | .github/skills/<skill>/references/templates/*.md |
| Scripts | 1+ automation script | .github/skills/<skill>/references/scripts/*.ps1 |

## Validation

- [ ] No unresolved placeholder text.
- [ ] References resolve and are current.
- [ ] Skill can be used without reading other skills first.
