---
name: agent-authoring
description: Use when creating or editing .agent.md files, including frontmatter fixes, role boundary tightening, and companion-skill alignment.
---

# Agent Authoring

## Specialization

Author and maintain `.agent.md` artifacts only.

This skill is strictly for agent persona assets. It does not author `.instructions.md` files.

## Prerequisites

- REQUIRED SUB-SKILL: Use `route-customization` first when artifact type is not already confirmed as Agent.
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
5. Route post-change quality checks to `validate-customization`.

## Done Criteria

Authoring is complete when:

- The target `.agent.md` file exists at the correct path.
- Frontmatter is valid and complete.
- Required sections are present with non-overlapping boundaries.
- `validate-customization` routing is included for post-change review.
