<!-- markdownlint-disable-file -->
# Task Research Notes: Governance Specialization and Script Ownership Alignment

## Research Executed

### File Analysis
- .github/scripts/powershell/test-frontmatter-validity.ps1
  - Confirmed prior behavior relied on a mandatory parameter prompt when -AssetType was omitted.
- .github/scripts/powershell/README.md
  - Found workflow guidance that over-attributed hub sync checks to orchestrator/planning usage.
- .github/skills/governance-health-overview/SKILL.md
  - Confirmed the workspace can standardize on Specialization as the canonical boundary heading.

### Code Search Results
- test-hub-file-sync.ps1
  - Located in shared script library under .github/scripts/powershell for governance routines.
- Specialization
  - Confirmed as the canonical heading after source-asset standardization.

### External Research
- #githubRepo:"N/A local-workspace governance alignment"
  - No external repository evidence required; scope constrained to workspace conventions and governance artifacts.
- #fetch:https://learn.microsoft.com/
  - No external documentation required for this change set.

### Project Conventions
- Standards referenced: specialization-first governance, lifecycle lane governance, traceability IDs, progressive change tracking.
- Instructions followed: [lifecycle-governance.instructions.md](./../../.github/instructions/lifecycle-governance.instructions.md), [task-implementation.instructions.md](./../../.github/instructions/task-implementation.instructions.md), [technical-docs.instructions.md](./../../.github/instructions/technical-docs.instructions.md).

## Key Discoveries

### Project Structure
Governance controls are split cleanly across skills, instructions, and reusable scripts. Shared scripts are expected to remain centralized while ownership is declared by workflow integration docs.

### Implementation Patterns
Changes are safer and more durable when split into: behavior fix, ownership clarification, and terminology alignment. This maps directly to independent workstreams.

### Complete Examples
```markdown
- Behavior hardening: remove interactive prompt path and fail fast with explicit error.
- Ownership tightening: constrain hub sync checks to governance routines.
- Terminology standardization: use Specialization consistently across source assets.
```

### API and Schema Documentation
Not applicable for this documentation and script-governance scope.

### Configuration Examples
```powershell
# Non-interactive validation run
.\.github\scripts\powershell\test-frontmatter-validity.ps1 -AssetType instructions
```

### Technical Requirements
- Preserve single-responsibility intent for all customizations.
- Keep governance validation in governance routines, not planning/orchestration defaults.
- Ensure artifacts survive session boundaries via dated research, plan, and change files.

## Recommended Approach
Apply a three-workstream implementation: WS-01 non-interactive script hardening, WS-02 script ownership documentation alignment, WS-03 specialization terminology standardization across governance assets.

## Implementation Guidance
- Objectives: remove manual prompts, clarify script ownership boundaries, and align terminology.
- Key Tasks: produce dated plan and changes artifacts; implement and validate each workstream.
- Dependencies: existing governance script library and skill documentation.
- Success Criteria: all three changes implemented, validated, and traceable through .docs artifacts.
