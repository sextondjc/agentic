---
name: curating-copilot-instructions
description: Use when importing skills, agents, or instructions from a catalogue and updating copilot-instructions.md to leverage them.
---

# Curating Copilot Instructions

## Singular Purpose

Maintain and update the `copilot-instructions.md` file in a workspace to accurately reflect available agents, skills, and instructions — especially after importing customizations from an external catalogue.

This skill ensures that every imported asset is discoverable by the workspace and Copilot, and that the instructions guide users to the right tools for their specific tasks.

---

## Execution Model

### Phase 1: Discovery

Identify all available customizations in the workspace:

1. **Agents** — List all `.agent.md` files in `.github/agents/`
   - Extract agent name (from frontmatter `name:` field)
   - Extract agent description (from frontmatter `description:` field)
   - Note whether it's a routing/orchestration agent or a specialist agent

2. **Skills** — List all SKILL.md files in `.github/skills/**/`
   - Extract skill name (from frontmatter `name:` field)
   - Extract skill description (from frontmatter `description:` field)
   - Note the skill's category: authoring/generation, research/analysis, workflow/orchestration, or domain-specific

3. **Instructions** — List all `.instructions.md` files in `.github/instructions/`
   - Extract the policy domain (from frontmatter `name:` field)
   - Extract the scope (from frontmatter `applyTo:` field)
   - Note which are imported vs. locally authored

4. **Prompts** — List all `.prompt.md` files in `.github/prompts/`
   - Extract prompt name and description
   - Note if the prompt is paired with a specific agent or skill

### Phase 2: Classification & Curation

Decide what belongs in `copilot-instructions.md`:

**Always Include:**
- Core routing agents (e.g., `orchestrator`, `csharp-engineer`, `plan-researcher`)
- Essential workflow skills (e.g., domain-specific, TDD, code review)
- Critical instructions (security, testing, style)

**Conditional Include:**
- Specialist agents (DBA, security researcher, performance researcher) — only if the workspace uses them
- Optional skills (advanced optimization, specific frameworks) — only if the project scope includes them
- Auxiliary instructions (specific to certain file types or rare scenarios)

**Document But Don't Feature:**
- Broad instruction indices ([README.md](./../../../README.md) — link in refs, don't expand inline
- Auxiliary prompts (narrow-use-case tools) — link if relevant to featured skills/agents

### Phase 3: Update Structure

Update `copilot-instructions.md` using this canonical structure:

```markdown
# [Workspace Name]

[Mission and principles in 2-3 sentences]

## Canonical Standards

[Project-specific non-negotiable rules: patterns, stack choices, governance]

## Lifecycle Lanes

[Operating model phases: Planning / Execution / Review]

[Governance and reference links]

## Preferred Agents

[Table: Agent | Use when...]

## Preferred Skills

[Links to skill discovery index if many; else bullet list with descriptions]

## [Optional] Imported Customizations

[Changelog or notes on recently added assets from catalogue]

## Workspace Design Rules

[Meta-governance: conventions for how customizations are added]
```

### Phase 4: Validation

Before committing the updated file:

1. **Completeness** — Does every listed agent/skill exist in the workspace?
2. **Accuracy** — Do descriptions match the actual `.md` files?
3. **Clarity** — Will a new contributor understand which agent to invoke for their task?
4. **No Duplication** — Is there one source of truth for each customization?
5. **Consistency** — Does formatting and tone match the canonical template?

---

## Content Patterns

### Preferred Agents Section

```markdown
## Preferred Agents

Each agent has a singular purpose. Go directly to the specialist for single-lane work.

| Agent | Use when... |
|---|---|
| `agent-name` | **[Default for X work.]** [Task description.] |
| `routing-agent` | [Multi-phase work or unclear specialist.] |
```

### Preferred Skills Section

Use this format when skills are many (>10):

```markdown
## Preferred Skills

Skills discovery index: [README.md](./../README.md)
- `skill-1` — Short description
- `skill-2` — Short description
```

Use inline descriptions when skills are few (<8):

```markdown
## Preferred Skills

- `skill-1` — Specific use case
- `skill-2` — Specific use case
```

### Imported Customizations (Optional)

For workspaces that pull regularly from this catalogue:

```markdown
## Recently Imported Customizations

- **Skill:** `task-research` (v2.1) - Deep investigation methodology for complex requirements
- **Prompt:** `workspace-scaffolder.prompt.md` - Guided new-project scaffolding workflow
- **Instruction:** `validation-and-guards.instructions.md` - Syrx guard standardization
```

---

## Anti-patterns

| Anti-pattern | Correct Action |
|---|---|
| Listing every skill in the workspace, even unused ones | Curate by project scope; link to full index |
| Expanding full agent descriptions inline instead of table format | Use table for core routing; link to `.agent.md` for details |
| Instructions with descriptions that don't match their actual files | Extract descriptions from frontmatter; verify before commit |
| Mixing "Agents" and "Skills" sections | Keep them separate; they serve different discovery patterns |
| Outdated references to removed or renamed customizations | Remove or update every reference when customizations change |
| No governance section explaining how changes are made | Always include workspace design rules or governance links |

---

## Workflow Integration

This skill pairs naturally with:
- **`skills-authoring`** — Authoring new skills that should be documented in copilot-instructions
- **`customization-authoring`** — Creating agents/instructions that need referencing
- **`workspace-scaffolder`** — When initializing a new workspace from catalogue
- **`keeping-customizations-current`** — When maintaining import relationships over time

---

## References

- [copilot-instructions.md](./../../copilot-instructions.md)
- [README.md](./../../../README.md)
- [planning-execution-review-governance.md](./../../../.docs/reference/planning-execution-review-governance.md)

## Inputs

- User request context and target scope for this skill invocation.

## Required Outputs

- A concrete, workspace-applicable result aligned with this skill purpose.

## Workflow

1. Gather required context and constraints from the workspace and user request.
2. Execute the skill-specific steps and produce the required artifacts or decisions.
3. Validate outputs for completeness and consistency with active workspace instructions.

