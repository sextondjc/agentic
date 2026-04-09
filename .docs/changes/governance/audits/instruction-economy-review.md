<!-- markdownlint-disable-file -->
# Instruction Economy Review

| Metric | Value |
|---|---|
| Review Date | 2026-04-09 |
| Primary Lane | Review |
| Scope | `.github/instructions`, `.github/skills`, and routing guidance in `.github/copilot-instructions.md` |
| Objective | Reduce always-loaded instruction footprint without sacrificing clarity or losing access to the same guidance when it is actually needed |
| Disposition | Approved for Wave 1 implementation |

## Aggregate Footprint Grid

| Metric | Value |
|---|---:|
| Instruction Files | 17 |
| Skill Files | 47 |
| Total Instruction Lines | 1939 |
| Total Skill Lines | 5952 |
| Largest 5 Instructions | 1366 |
| Largest Single Instruction | 377 |

## Largest Instruction Files Grid

| Rank | File | Lines | Current Disposition |
|---|---|---:|---|
| 1 | [syrx.instructions.md](./../../../../.github/instructions/syrx.instructions.md) | 377 | Split to shim + on-demand skill |
| 2 | [architecture.instructions.md](./../../../../.github/instructions/architecture.instructions.md) | 304 | Split to shim + on-demand skill |
| 3 | [csharp.instructions.md](./../../../../.github/instructions/csharp.instructions.md) | 243 | Split to shim + supporting skills |
| 4 | [naming-conventions.instructions.md](./../../../../.github/instructions/naming-conventions.instructions.md) | 243 | Split to shim + authoring/librarian skills |
| 5 | [powershell.instructions.md](./../../../../.github/instructions/powershell.instructions.md) | 199 | Split to shim + PowerShell skills |

## Severity-Ranked Findings Grid

| ID | Severity | Finding | Evidence | Decision |
|---|---|---|---|---|
| IE-001 | High | Multiple instruction files contain workflow, tutorial, template, or example-heavy content that violates policy-only guidance and inflates always-loaded context. | [architecture.instructions.md](./../../../../.github/instructions/architecture.instructions.md), [syrx.instructions.md](./../../../../.github/instructions/syrx.instructions.md), [csharp.instructions.md](./../../../../.github/instructions/csharp.instructions.md), [powershell.instructions.md](./../../../../.github/instructions/powershell.instructions.md), [task-implementation.instructions.md](./../../../../.github/instructions/task-implementation.instructions.md) | Remove procedural depth from Wave 1 targets and keep concise shims only. |
| IE-002 | High | Most `.cs` tasks currently inherit a large combined instruction set even when only a fraction is relevant. | [csharp.instructions.md](./../../../../.github/instructions/csharp.instructions.md), [architecture.instructions.md](./../../../../.github/instructions/architecture.instructions.md), [syrx.instructions.md](./../../../../.github/instructions/syrx.instructions.md), [validation-and-guards.instructions.md](./../../../../.github/instructions/validation-and-guards.instructions.md) | Slim the highest-volume `.cs` instruction files first. |
| IE-003 | High | Architecture guidance has no dedicated on-demand skill destination today, so architecture detail remains trapped in an always-on instruction. | [architecture.instructions.md](./../../../../.github/instructions/architecture.instructions.md), [skill-discovery-index.md](./../../../../.github/skills/skill-discovery-index.md) | Create a narrowly scoped architecture skill in Wave 1. |
| IE-004 | Medium | Naming and documentation-corpus guidance are mixed with migration playbooks and examples, causing broad `.github/**/*.md` loading pressure. | [naming-conventions.instructions.md](./../../../../.github/instructions/naming-conventions.instructions.md), [librarian/SKILL.md](./../../../../.github/skills/librarian/SKILL.md), [instructions-authoring/SKILL.md](./../../../../.github/skills/instructions-authoring/SKILL.md) | Keep only hard naming policy in the instruction; route how-to content to skills. |
| IE-005 | Medium | Routing text in [copilot-instructions.md](./../../../../.github/copilot-instructions.md) still assumes substantive guidance remains centralized in instruction files. | [copilot-instructions.md](./../../../../.github/copilot-instructions.md) | Update hub guidance to reflect shim instructions plus skills. |
| IE-006 | Medium | PowerShell skill assets contain malformed relative links and can better absorb instruction examples once repaired. | [powershell-script-library/SKILL.md](./../../../../.github/skills/powershell-script-library/SKILL.md) | Repair skill and move detailed authoring guidance there in Wave 1. |

## Instruction Routing Matrix

| Instruction | Keep as Instruction | Split to Shim + Skill | Convert Fully to Skill | Destination |
|---|---|---|---|---|
| [security-and-secure-coding.instructions.md](./../../../../.github/instructions/security-and-secure-coding.instructions.md) | Yes | No | No | N/A |
| [ci-cd.instructions.md](./../../../../.github/instructions/ci-cd.instructions.md) | Yes | No | No | N/A |
| [sql-dba.instructions.md](./../../../../.github/instructions/sql-dba.instructions.md) | Yes | No | No | N/A |
| [architecture.instructions.md](./../../../../.github/instructions/architecture.instructions.md) | No | Yes | No | New `domain-design` skill |
| [syrx.instructions.md](./../../../../.github/instructions/syrx.instructions.md) | No | Yes | No | [syrx-data-access/SKILL.md](./../../../../.github/skills/syrx-data-access/SKILL.md) |
| [csharp.instructions.md](./../../../../.github/instructions/csharp.instructions.md) | No | Yes | No | [dotnet-refactor/SKILL.md](./../../../../.github/skills/dotnet-refactor/SKILL.md), [test-driven-development/SKILL.md](./../../../../.github/skills/test-driven-development/SKILL.md) |
| [naming-conventions.instructions.md](./../../../../.github/instructions/naming-conventions.instructions.md) | No | Yes | No | [librarian/SKILL.md](./../../../../.github/skills/librarian/SKILL.md), [instructions-authoring/SKILL.md](./../../../../.github/skills/instructions-authoring/SKILL.md), [skills-authoring/SKILL.md](./../../../../.github/skills/skills-authoring/SKILL.md) |
| [powershell.instructions.md](./../../../../.github/instructions/powershell.instructions.md) | No | Yes | No | [powershell-script-library/SKILL.md](./../../../../.github/skills/powershell-script-library/SKILL.md), [audit-powershell/SKILL.md](./../../../../.github/skills/audit-powershell/SKILL.md) |

## Wave 1 Scope Grid

| Workstream ID | Target | Rationale | Expected Outcome |
|---|---|---|---|
| WS-01 | Audit and plan artifacts | Required resumability and traceability | Durable review, plan, and execution record |
| WS-02 | Architecture split | Highest-value domain guidance lacks on-demand destination | New architecture skill + concise instruction shim |
| WS-03 | Syrx split | Largest instruction file and clear existing destination skill | Concise instruction shim + enriched Syrx skill routing |
| WS-04 | C# split | Broadest everyday instruction load | Concise instruction shim + skill routing for deep workflows |
| WS-05 | Naming split | Broad `.github/**/*.md` pressure | Compact naming policy + skill routing |
| WS-06 | PowerShell split | Large example-heavy instruction | Compact PowerShell policy + skill routing |
| WS-07 | Hub and catalog sync | New skill and changed routing must stay discoverable | Updated discovery index and hub guidance |

## Expected Savings Grid

| Scenario | Estimated Instruction Lines | Approximate Reduction |
|---|---:|---:|
| Before Wave 1 | 1939 | - |
| After Wave 1 Target | 950 to 1150 | 41% to 51% |

## Risk and Mitigation Grid

| Risk | Impact | Mitigation |
|---|---|---|
| Over-thinning instructions removes mandatory policy | Quality regression | Keep only non-negotiable constraints in shims and explicitly route to skills for depth. |
| New skill overlaps with architecture-designer agent | Discovery confusion | Name the skill for reusable workflow, not persona behavior, and keep the agent as the orchestration specialist. |
| Existing skill links remain broken | Reduced trust in on-demand guidance | Repair touched skill links as part of Wave 1. |
| Future sessions miss the new model | Drift back to instruction bloat | Update [copilot-instructions.md](./../../../../.github/copilot-instructions.md) and [skill-discovery-index.md](./../../../../.github/skills/skill-discovery-index.md) in the same change. |

## Wave 1 Approval Grid

| Decision ID | Decision | Status | Rationale |
|---|---|---|---|
| DEC-IE-001 | Implement Wave 1 immediately after this review | Approved | User requested report-first, then implementation. |
| DEC-IE-002 | Use resumable plan and progressive change tracking | Approved | Required by user and workspace governance policy. |
