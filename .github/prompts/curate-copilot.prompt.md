---
name: curate-copilot
description: Prompt for discovering imported customizations and updating copilot-instructions.md to leverage them.
---

# Curating Copilot Instructions

Your goal is to update the `copilot-instructions.md` file in your workspace to reflect imported skills, agents, and instructions — ensuring every asset is discoverable and that new contributors understand which tools to use for their specific tasks.

This is typically run when:
- You've imported skills/agents/instructions from a catalogue
- You're setting up a new workspace with pulled-in customizations
- You're maintaining copilot-instructions.md after adding new agents or skills
- You're auditing the file to remove outdated or unused references

## Pre-Flight

Gather these inputs:

**Required:**
- `workspace_name` — Display name for your workspace context
- `project_type` — What kind of project? (API, CLI tool, background service, etc.)
- `catalogue_source` — What catalogue are your customizations pulled from? (e.g., agentic_templates)

**Optional but helpful:**
- `recently_imported` — List any agents/skills you've recently added (e.g., "syrx-data-access, api-design")
- `unused_customizations` — Any imported assets you decided NOT to use (e.g., "sql-dba" if your project doesn't use databases)

Request any missing required inputs before proceeding.

---

## Discovery Phase

### Step 1: List Available Customizations

Scan your workspace for all available customizations:

**Agents** — Search `.github/agents/` for all `.agent.md` files
```
Expected output: filename, agent name (from frontmatter), description (from frontmatter)
```

**Skills** — Search `.github/skills/` for all `SKILL.md` files
```
Expected output: skill name (from frontmatter), description (from frontmatter), file path
```

**Instructions** — Search `.github/instructions/` for all `.instructions.md` files
```
Expected output: instruction name (from frontmatter), policy domain, applyTo pattern
```

**Prompts** — Search `.github/prompts/` for all `.prompt.md` files (for context only)
```
Expected output: prompt name, paired agent/skill (if any)
```

Compile this into a master list showing what's available.

### Step 2: Categorize by Role

Sort agents into categories:
- **Routing/Orchestration:** Agents that dispatch work to specialists (e.g., `orchestrator`)
- **Specialist:** Agents for specific domains (e.g., `csharp-engineer`, `architecture-designer`)
- **Analysis/Research:** Agents that produce reports (e.g., `security-researcher`, `performance-assessor`)

Sort skills into categories:
- **Workflow/Methodology:** Skills that guide multi-step processes (e.g., `writing-plans`, `executing-plans`)
- **Domain-Specific:** Skills for particular technologies/patterns (e.g., `syrx-data-access`, `api-design`)
- **Authoring/Generation:** Skills for creating documentation/code (e.g., `adr-generator`, `prd-generator`)
- **Analysis/Review:** Skills for evaluating work (e.g., `code-reviewer`, `security-research`)

---

## Curation Phase

### Step 3: Decide What Belongs in copilot-instructions.md

For each customization, ask:

**Scope Questions:**
1. Does this agent/skill directly support the stated project type/scope?
2. Is it a "default choice" for this project, or is it auxiliary/optional?
3. Would a new contributor need to know about this on Day 1?

**Assignment:**
- **FEATURE** — Core to this project. Include in the main copilot-instructions.md
- **REFERENCE** — Less common, but valuable. Link to the asset index or include with minimal description
- **ARCHIVE** — Not relevant to this project scope. Remove or don't include

### Step 4: Impact Analysis

Identify dependencies and groupings:

**Which agents are alternatives to each other?**
- Example: `plan-researcher` vs. `orchestrator` — which is the default for ambiguous requests?

**Which skills should always be mentioned together?**
- Example: `test-driven-development` + `request-code-review` + `remediate-review` form a review workflow

**Are there any skill/agent pairs that naturally execute together?**
- Example: `critical-thinking` often pairs with `architecture-designer` for complex design decisions

**Which instructions are foundational vs. advisory?**
- Example: `validation-and-guards.instructions.md` (Syrx) vs. `docker-dotnet.instructions.md` (optional)

Use these groupings to structure the sections of your updated copilot-instructions.md

---

## Update Phase

### Step 5: Revise copilot-instructions.md

Update the file following the canonical structure:

1. **Header** — Workspace name and 2-3 sentence mission statement
2. **Canonical Standards** — Non-negotiable project rules (stack, patterns, governance)
3. **Lifecycle Lanes** — Planning/Execution/Review model + links to governance
4. **Preferred Agents** — Table format with core routing agents and use cases
5. **Preferred Skills** — Curated list or index link, grouped by category
6. **[Optional] Imported Customizations** — Changelog if you import regularly from a catalogue
7. **Workspace Design Rules** — Meta-governance for how customizations are managed

### Step 6: Verify Accuracy

Before committing, validate:

- [ ] Every listed agent/skill file exists in the workspace
- [ ] Descriptions match the actual frontmatter (not paraphrased)
- [ ] No duplicate asset entries across sections
- [ ] Links to indices ([README.md](./../skills/README.md) are correct
- [ ] The table formats render correctly in Markdown
- [ ] Tone and terminology are consistent
- [ ] No references to removed or renamed assets

---

## Validation Phase

### Step 7: Test Discoverability

Simulate a new contributor joining the team:

1. **First-time reader test** — Can someone new to the workspace quickly identify which agent to use for their task?
2. **Completeness test** — If someone goes to the listed agents/skills, can they find and execute them?
3. **Bias test** — Are there any implied preferences that favor some agents/skills over others? Is that intentional?

### Step 8: Commit & Document (if applicable)

If you're using version control:

- Commit the updated `copilot-instructions.md`
- Include a message noting which customizations were added/removed
- Link to any corresponding `.docs/changes/` entries if tracking major updates

---

## Prompts for Common Scenarios

### Scenario: "I'm setting up a new workspace and importing catalogue skills"

**Your task:**
1. Run **Step 1** to list what's available from the catalogue
2. Run **Step 3** to decide what fits your project scope
3. Run **Step 5** to create or update copilot-instructions.md with a curated list
4. Run **Step 7** to validate the file as a "new contributor would see it"

### Scenario: "I added a new skill/agent and need to reference it"

**Your task:**
1. Extract the name and description from the new customization's frontmatter
2. Identify which section of copilot-instructions.md it belongs in (Agents vs. Skills, etc.)
3. Insert the entry maintaining existing formatting and tone
4. Run **Step 7** to verify the update doesn't break discoverability

### Scenario: "I'm auditing copilot-instructions.md and found stale references"

**Your task:**
1. Run **Step 1** to get a fresh manifest of what actually exists
2. Compare the current copilot-instructions.md against that manifest
3. Remove or update any entries that don't match actual files
4. Run **Step 8** to document the cleanup

---

## Success Criteria

Your updated `copilot-instructions.md` is ready when:

✓ Every agent, skill, and instruction listed actually exists in the workspace  
✓ Descriptions are accurate extracts from frontmatter (not paraphrased)  
✓ New contributors can identify the right tool for their task within 30 seconds  
✓ There are no duplicate asset references  
✓ Links to indices and governance docs are correct  
✓ Formatting is consistent and renders correctly  
✓ The file reflects your project's actual scope and default choices



