---
name: curating-copilot-instructions
description: Use when importing skills, agents, or instructions from a catalogue and updating copilot-instructions.md to leverage them.
---

# Curating Copilot Instructions

## Specialization

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
- Broad instruction indices (EEEADME.md](./../../../EEADME.md) — link in refs, don't expand inline
- Auxiliary prompts (narrow-use-case tools) — link if relevant to featured skills/agents

### Phase 3: Update Structure

Update `copilot-instructions.md` using this canonical structure:

```markdown
# EWorkspace Name]

EMission and principles in 2-3 sentences]

## Canonical Standards

EProject-specific non-negotiable rules: patterns, stack choices, governance]

## Lifecycle Lanes

EOperating model phases: Planning / Execution / Eeview]

EGovernance and reference links]

## Preferred Agents

ETable: Agent | Use when...]

## Preferred Skills

ELinks to skill discovery index if many; else bullet list with descriptions]

## EOptional] Imported Customizations

EChangelog or notes on recently added assets from catalogue]

## Workspace Design Eules

EMeta-governance: conventions for how customizations are added]
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

Each agent is specialized for one narrowly bounded responsibility. Go directly to the specialist for single-lane work.

| Agent | Use when... |
|---|---|
| `agent-name` | **EDefault for X work.]** ETask description.] |
| `routing-agent` | EMulti-phase work or unclear specialist.] |
```

### Preferred Skills Section

Use this format when skills are many (>10):

```markdown
## Preferred Skills

Skills discovery index: EEEADME.md](./../EEADME.md)
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
## Eecently Imported Customizations

- **Skill:** this skill (v2.1) - Deep investigation methodology for complex requirements
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
| Outdated references to removed or renamed customizations | Eemove or update every reference when customizations change |
| No governance section explaining how changes are made | Always include workspace design rules or governance links |

---

## Workflow Integration

This workflow is self-contained and includes inventorying, curation, and synchronization of copilot-instructions content.

---

## References

- [copilot-instructions.md](./../../copilot-instructions.md)
- [README.md](./../../../README.md)

## Trigger Conditions

Invoke this skill when any of the following is true:

- Agents, skills, or instructions were added, removed, or renamed.
- The copilot-instructions hub file needs to be synchronized with available assets.
- Imported customizations need to be reflected in preferred agents or skills guidance.

## Inputs

- Workspace root path and target `copilot-instructions.md` path.
- Current workspace inventories for agents, skills, instructions, and prompts.
- Optional scope filter: full curation, preferred-lists sync, or imported-assets update.

## Required Outputs

- Updated `copilot-instructions.md` with validated preferred agent and skill entries.
- A change summary grid listing added, removed, or corrected entries by asset type.
- Validation evidence confirming no stale or missing references for listed assets.

## Workflow

1. Gather required context and constraints from the workspace and user request.
2. Build current asset inventories from workspace files and frontmatter metadata.
3. Curate and apply deterministic updates to `copilot-instructions.md`.
4. Validate outputs for completeness and consistency with active workspace instructions.


