---
name: customization-authoring
description: Use when creating or editing .instructions.md or .agent.md files, fixing frontmatter, configuring applyTo patterns, or defining tool restrictions and agent boundaries.
---

# Customization Authoring

## Singular Purpose

Author high-quality `.instructions.md` and `.agent.md` files in this workspace.

This skill does not decide which artifact type to create. Use `customization-routing-decision` first if you have not yet determined whether you need an instruction file or an agent file.

## Prerequisites

- REQUIRED SUB-SKILL: Use `customization-routing-decision` before authoring any new artifact.
- REQUIRED BACKGROUND: Understand the activation model differences:
  - Instructions are loaded automatically based on file path pattern (`applyTo`).
  - Agents are invoked explicitly by name as a mode or subagent.

---

## Authoring `.instructions.md` Files

### Frontmatter

All three fields are required:

```yaml
---
name: <policy-domain>
description: '<One sentence describing the enforced policy area.>'
applyTo: '<glob pattern or **>'
---
```

| Field | Rules |
|---|---|
| `name` | Lowercase kebab-case. Match the policy domain, not the file name. |
| `description` | Short declarative sentence. Describes the policy scope, not the workflow. |
| `applyTo` | Glob from workspace root. Use `**/*.cs` for C#, `.github/workflows/*.yml` for CI, `**` for global rules. |

### Content Rules

- Write policies as mandate sentences: "Use X", "Do not Y", "Always Z".
- Do not include task workflows or decision trees — those belong in skills.
- Do not duplicate content already present in another instruction file.
- Keep content lean. One instruction file = one policy domain.
- If a rule must be applied only sometimes, it is a skill trigger condition — not an instruction.

### Anti-patterns

| Anti-pattern | Correct Action |
|---|---|
| Putting multi-step decision flows in instructions | Move to a skill |
| `applyTo: '**'` for narrow rules | Tighten pattern to the relevant file type |
| Duplicating rules from another instruction file | Consolidate or cross-reference |
| Mixing multiple policy domains in one file | Split into separate instruction files |

### Template

```markdown
---
name: <policy-domain>
description: '<Single sentence describing the policy scope.>'
applyTo: '<glob>'
---
# <Policy Domain Title>

## <Section>
- Rule 1
- Rule 2

## <Section>
- Rule 3
```

---

## Authoring `.agent.md` Files

### Frontmatter

Both fields are required:

```yaml
---
name: <agent-name>
description: '<Third-person role description. State what the agent does and when to call it.>'
---
```

| Field | Rules |
|---|---|
| `name` | Lowercase kebab-case. Role-focused name (e.g., `security-researcher`). |
| `description` | Third-person. Describes role and invocation conditions clearly. Must not summarize the agent's internal workflow. |

### Required Body Sections

| Section | Purpose |
|---|---|
| `## Singular Purpose` | One-paragraph statement of what this agent does and what it must not do. |
| `## Focus Areas` | Bullet list of the capabilities and disciplines this agent applies. |
| `## Standards` | References to workspace instruction files that apply within this lane. Do not restate their content. |
| `## Hard Constraints` | Non-negotiable behavioral limits. What the agent will never do regardless of input. |
| `## Preferred Companion Skills` | Bullet list of skills this agent uses. Helps discovery and reduces instructions. |

### Content Rules

- MUST have a singular role boundary. One agent = one lane.
- MUST NOT restate rules that are in instruction files. Reference them instead.
- SHOULD declare explicit routing edges: what work this agent hands off and to which specialist.
- Do not add a `## Working Style` section unless the agent has genuinely distinctive style behavior not covered by instruction files.

### Anti-patterns

| Anti-pattern | Correct Action |
|---|---|
| Agent body restates all instruction file rules | Replace with a reference list under `## Standards` |
| Agent covers two distinct specialist roles | Split into two agents |
| No companion skills declared | Add `## Preferred Companion Skills` |
| Description summarizes the agent's internal workflow | Rewrite as invocation conditions only |

### Template

```markdown
---
name: <agent-name>
description: '<Third-person role + invocation conditions.>'
---
# <Agent Title> Agent

## Singular Purpose

<One paragraph. What this agent does. What it must not do.>

## Focus Areas
- <Capability 1>
- <Capability 2>

## Standards

All standards are in the workspace instruction files. The active files for this lane are:
- `<instruction-file>.instructions.md`

## Hard Constraints
- <Absolute limit 1>
- <Absolute limit 2>

## Preferred Companion Skills
- `<skill-name>` for <brief purpose>
```

---

## Quality Signals

A finished customization artifact passes authoring quality when:

- [ ] Frontmatter is valid YAML with all required fields.
- [ ] For instructions: `applyTo` is as narrow as the policy requires.
- [ ] For instructions: content contains only mandatory policies, no workflows.
- [ ] For agents: `## Singular Purpose` clearly names the boundary.
- [ ] For agents: instruction file content is referenced, not restated.
- [ ] No overlap with an existing instruction or agent handling the same domain.
- [ ] `validate-customization` has been requested after authoring.

## Done Criteria

Authoring is complete when:

- The artifact file exists at the correct workspace path.
- All frontmatter fields are populated and valid.
- The content passes the quality signals checklist above.
- `validate-customization` has been invoked to validate the result.
