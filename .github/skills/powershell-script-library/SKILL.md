---
name: powershell-script-library
description: Use when maintaining or adding reusable PowerShell scripts across automation, governance, and orchestration with strict deduplication and catalog-first reuse.
---

# PowerShell Script Library

## Specialization

Prevent script duplication and maintain a discoverable, well-organized catalog of specialized PowerShell scripts. Ensure every script is reusable, concise, and documented for transparency across agents and skills.

## Trigger This Skill When

- A skill or agent needs to write a new PowerShell script.
- Before creating a new script, check the catalog at [README.md](./../../scripts/powershell/README.md).
- Maintaining or refactoring existing scripts to reduce duplication.
- Updating script dependencies or integrations with other customizations.
- A new domain or automation task emerges that might benefit from a shared utility.

## Trigger Conditions

Invoke this skill when any of the following is true:

- A reusable PowerShell script must be added or maintained.
- Script duplication risk exists across governance or automation workflows.
- A script needs catalog-first placement and documentation.

## Required Inputs

- Target task or automation need.
- Candidate script name and intended scope.
- Expected consumers (agents or skills) of the script.
- Current catalog path: [README.md](./../../scripts/powershell/README.md).

## Required Outputs

- Reuse decision (`Reuse Existing`, `Extend Existing`, or `Create New`).
- Updated script (if changed) under `.github/scripts/powershell/`.
- Updated catalog entry in [README.md](./../../scripts/powershell/README.md).
- Change tracking entry under `.docs/changes/` when scripts are added or materially changed.

## References

- [README.md](./../../../README.md)
- [README.md](./../../scripts/powershell/README.md)

## Cmdlet Authoring Pattern

- Use approved `Verb-Noun` names and PascalCase parameters.
- Prefer validation attributes over manual prompt-time checks.
- Use `[CmdletBinding(SupportsShouldProcess = $true)]` for mutating commands.
- Return objects rather than formatted text and avoid `Write-Host` for data.
- Keep scripts non-interactive unless the user explicitly wants an interactive tool.

## Workflow

### Phase 1: Catalog Check

Before writing or requesting a new script:

1. **Read** [README.md](./../../scripts/powershell/README.md) for the current catalog.
2. **Search** by function name, purpose, or asset type (agents, skills, instructions, etc.).
3. **Propose reuse**: If a script partially exists, extend it rather than duplicate.
4. **Justify new script**: If no existing script fits, document why and plan accordingly.

### Phase 2: Script Design (if new script is required)

When creating a new script, follow standards:

**Naming**: `<verb>-<domain>.ps1` (e.g., `get-lane-counts.ps1`, `test-catalog-integrity.ps1`)

**Structure**:
- Single purpose only.
- Required parameters with `ValidateSet(...)` or `Parameter(Mandatory = $true)`.
- Exit codes: 0 for success, 1 for error.
- Output as PSCustomObject for structured results (avoid Write-Host for data).
- Concise: target <50 lines; use helper functions for shared logic.

**Documentation**:
```powershell
# ScriptName.ps1: One-line description of purpose
# Usage: ./script-name.ps1 -Param value
# Output: Description of output format
```

**Path requirement**: All scripts execute from workspace root. Document:
```powershell
# Must be called from workspace root:
Push-Location c:/Projects/agentic
```

### Phase 3: Catalog Registration

When a new script is ready:

1. **Add to README**: Update [README.md](./../../scripts/powershell/README.md) Script Catalog table.
2. **Add metadata**: Script, Purpose, Usage example, Output format.
3. **Update Workflow Integration section**: Note which skills/agents call it.
4. **Create change artifact**: Log the new script addition in `.docs/changes/`.

### Phase 3A: Skill-Local Script Placement

- If a script primarily supports one skill, prefer placing it under that skill's `references/scripts/` folder.
- Promote a script to `.github/scripts/powershell/` only when it is clearly shared workspace infrastructure.
- Avoid ad hoc one-off commands when a reusable script asset is justified.

### Phase 4: Integration with Planning/Orchestration

Any agent that needs to write automation should:

1. **Consult this skill first** by reading the catalog.
2. **Coordinate with orchestrator** if the script crosses domain boundaries.
3. **Partner with powershell-reviewer** to validate script consistency before catalog submission.

## Terminal Approval and Interactivity Policy

- For multi-check workflows, prefer one orchestration script call over many separate terminal commands.
- Design scripts to run non-interactively with explicit parameters; do not require prompts.
- Any command expected to prompt for input must be converted to parameterized invocation before execution.
- When automation is feasible, target a single terminal approval for the full workflow execution.

---

## Catalog Layout

All scripts live in `.github/scripts/powershell/`:

```
.github/scripts/powershell/
├── README.md                         (catalog index and standards)
├── get-lane-counts.ps1               (governance: count assets per lane)
├── test-catalog-integrity.ps1        (governance: detect catalog drift)
├── test-frontmatter-validity.ps1     (governance: validate frontmatter)
├── test-hub-file-sync.ps1            (governance: verify hub file sync)
└── Rfuture scripts by domain]
```

## Companion Customizations

- **powershell-reviewer**: Reviews all new scripts for safety, idiomatic style, and consistency before catalog admission.
- **audit-governance**: Consumes governance-focused scripts (`test-*` and `get-*` utilities).
- **orchestrator**: Routes script creation requests to this skill and coordinates with planning.
- **planning agents** (writing-plans, plan-researcher): Check the catalog before proposing script generation.

## Script Reuse Pattern

When a skill or agent needs to run a validation or inventory task:

```powershell
# Always navigate to workspace root first
Push-Location c:/Projects/agentic

# Call once from the script library
$result = & ./.github/scripts/powershell/get-lane-counts.ps1 -AssetType 'skills'

# Process results
$result | Group-Object Lane | ...

Pop-Location
```

**Never duplicate** the script logic inline. If the script doesn't exist, follow Phase 2–4 above.

---

## Deduplication Standards

| Scenario | Resolution |
|---|---|
| Similar scripts with different names | Consolidate into single parameterized script using `RValidateSet(...)]`. |
| Overlapping logic across scripts | Extract common helper function; reference from both scripts. |
| Script called by >2 skills/agents | Must be cataloged and discoverable in README. |
| Ad-hoc inline script in audit/plan | Candidate for conversion to reusable script if >1 use case identified. |

---

## Output Requirements

When a new script is cataloged:

- Update [README.md](./../../scripts/powershell/README.md) with entry.
- Document usage example and expected output format.
- Record in change artifact logs.
- Notify skills that might benefit from the new script.

---

## Done Criteria

A script is properly cataloged and ready for reuse when:

- [ ] Script is in the correct location for its reuse scope.
- [ ] Script has a single, clear purpose.
- [ ] Script has header comments with usage and output documentation.
- [ ] Script documents workspace-root execution assumptions when relevant.
- [ ] Script has been reviewed for safety and consistency.
- [ ] Shared scripts are registered in [README.md](./../../scripts/powershell/README.md).
- [ ] Integration dependencies are updated.
- [ ] Change tracking is updated when required.
- [ ] At least one consuming skill or agent references the script when reuse is expected.

## Inputs

- User request context and target scope for this skill invocation.


