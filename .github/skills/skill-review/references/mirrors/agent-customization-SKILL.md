---
name: agent-customization
description: Use when creating, updating, reviewing, fixing, or debugging VS Code agent customization files.
source: copilot-skill:/agent-customization/SKILL.md
mirroredFrom: customizations-index attachment metadata
mirroredOn: 2026-03-29
---

# Agent Customization (Mirror)

## Scope

Create, update, review, fix, or debug VS Code agent customization files:

- `.instructions.md`
- `.prompt.md`
- `.agent.md`
- `SKILL.md`
- `copilot-instructions.md`
- `AGENTS.md`

## Use For

- Saving coding preferences.
- Troubleshooting why instructions, skills, or agents are ignored or not invoked.
- Configuring `applyTo` patterns.
- Defining tool restrictions and agent boundaries.
- Creating custom agent modes or specialized workflows.
- Packaging domain knowledge.
- Fixing YAML frontmatter syntax.

## Do Not Use For

- General coding questions.
- Runtime debugging or error diagnosis.
- MCP server configuration.
- VS Code extension development.

## Invokes

- File system tools for customization file reads/writes.
- Ask-questions tool for requirement interviews.
- Subagents for codebase exploration.

## Notes

- For quick single-file operations (for example frontmatter fixes or creating one known file), direct editing is acceptable without invoking the skill.
- This file exists to provide a workspace-readable review artifact for conflict checks and evidence capture.
