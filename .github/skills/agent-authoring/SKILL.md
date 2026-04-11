---
name: agent-authoring
description: Use when creating or editing .agent.md files, including frontmatter fixes, role boundary tightening, and companion-skill alignment.
---

# Agent Authoring

## Specialization

Author and maintain `.agent.md` artifacts only.

This skill is strictly for agent persona assets. It does not author `.instructions.md` files.

## Prerequisites

- REQUIRED: Keep execution self-contained within this skill. Do not delegate execution to sibling skills.
- REQUIRED BACKGROUND: Understand that agents are explicitly invoked and must keep a singular specialist boundary.

## Frontmatter Rules

Both fields are required:

```yaml
---
name: <agent-name>
description: '<Third-person role description. State what the agent does and when to call it.>'
---
```

- `name`: lowercase kebab-case and role-focused.
- `description`: third-person, invocation-focused, and not a workflow summary.

## Required Body Sections

- `## Specialization`
- `## Focus Areas`
- `## Standards`
- `## Hard Constraints`
- `## Preferred Companion Skills`

## Trigger Conditions

Invoke this skill when any of the following is true:

- A `.agent.md` file must be created or edited.
- Agent frontmatter or boundary language needs correction.
- Agent companion-skill references or standards links need updates.

## Inputs

- User request context and target `.agent.md` scope.

## Required Outputs

- A concrete `.agent.md` result aligned with workspace standards and the requested role boundary.

## Workflow

1. Confirm the target artifact is an agent file.
2. Apply frontmatter and section requirements.
3. Keep role scope singular and deterministic.
4. Reference instruction standards instead of restating them.
5. Route post-change quality checks to this skill.

## Hard Constraint

- Never create root-level folders in any workspace.
- Never create top-level reference folders; keep references under the owning asset path (for example `.github/skills/<skill>/references/`).
- `## Preferred Companion Skills` entries are **declarative only**. Do not embed cross-skill invocation directives inside an agent file. Cross-skill execution steps are a governance violation.
- Skills referenced from agents must themselves be self-contained (SKR-M4). Flag skills that are not.

## Done Criteria

Authoring is complete when:

- The target `.agent.md` file exists at the correct path.
- Frontmatter is valid and complete.
- Required sections are present with non-overlapping boundaries.
- this skill routing is included for post-change review.
