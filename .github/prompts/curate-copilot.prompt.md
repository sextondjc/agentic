---
name: curate-copilot
description: Prompt for discovering imported customizations and updating copilot-instructions.md to leverage them.
---

# Curating Copilot Instructions

Update `copilot-instructions.md` so imported skills, agents, and instructions are discoverable and new contributors can pick the right tool quickly.

Use this prompt when importing customizations, setting up a workspace, adding assets, or cleaning stale references.

## Pre-Flight

Gather these inputs:

**Required:**
- `workspace_name` — Display name for your workspace context
- `project_type` — What kind of project? (API, CLI tool, background service, etc.)
- `catalogue_source` — What catalogue are your customizations pulled from? (e.g., agentic_templates)

**Optional but helpful:**
- `recently_imported` — List any agents/skills you've recently added (e.g., "syrx-data-access, api-design")
- `unused_customizations` — Any imported assets you decided NOT to use (e.g., "sql-dba" if your project doesn't use databases)

Ask for any missing required inputs before continuing.

---

## Discovery Phase

### Step 1: List Available Customizations

Scan your workspace for all available customizations:

**Agents** — Search `.github/agents/` for all `.agent.md` files
Output: filename, agent name (from frontmatter), description (from frontmatter)

**Skills** — Search `.github/skills/` for all `SKILL.md` files
Output: skill name (from frontmatter), description (from frontmatter), file path

**Instructions** — Search `.github/instructions/` for all `.instructions.md` files
Output: instruction name (from frontmatter), policy domain, applyTo pattern

**Prompts** — Search `.github/prompts/` for all `.prompt.md` files (for context only)
Output: prompt name, paired agent/skill (if any)

Compile this into a master list showing what's available.

### Step 2: Categorize by Role

Sort agents into categories:
- **Routing/Orchestration:** Dispatches work to specialists (e.g., `orchestrator`)
- **Specialist:** Handles a specific domain (e.g., `csharp-engineer`, `architecture-designer`)
- **Analysis/Research:** Produces assessments or reports (e.g., `security-researcher`, `performance-assessor`)

Sort skills into categories:
- **Workflow/Methodology:** Guides multi-step processes (e.g., `writing-plans`, `executing-plans`)
- **Domain-Specific:** Targets technologies or patterns (e.g., `syrx-data-access`, `api-design`)
- **Authoring/Generation:** Creates docs or code artifacts (e.g., `adr-generator`, `prd-generator`)
- **Analysis/Review:** Evaluates quality, security, or performance (e.g., `code-reviewer`, `security-research`)

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

- Alternatives: Which agents overlap, and which one is the default? (e.g., `plan-researcher` vs. `orchestrator`)
- Bundles: Which skills should be listed together? (e.g., `test-driven-development` + `request-code-review` + `remediate-review`)
- Pairings: Which skill and agent combinations naturally work together?
- Instruction weight: Which instructions are foundational vs. advisory?

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
- [ ] Links to indices ([skill-discovery-index.md](./../skills/skill-discovery-index.md)) are correct
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
Run Steps **1, 3, 5, and 7**.

### Scenario: "I added a new skill/agent and need to reference it"

**Your task:**
Extract the new asset frontmatter, place it in the correct section, maintain style, then run **Step 7**.

### Scenario: "I'm auditing copilot-instructions.md and found stale references"

**Your task:**
Run **Step 1**, compare against current entries, remove or update stale references, then run **Step 8**.

---

## Success Criteria

Your updated `copilot-instructions.md` is ready when:

✓ Every listed asset exists in the workspace  
✓ Descriptions are accurate frontmatter extracts (not paraphrased)  
✓ New contributors can identify the right tool within 30 seconds  
✓ No duplicate references; links and formatting render correctly  
✓ Content reflects project scope and intended defaults





