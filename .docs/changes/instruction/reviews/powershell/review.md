# Instruction Audit Review: powershell

**Review Date:** 2025-04-20  
**Reviewer Skill:** audit-instructions  
**Target Instruction:** powershell.instructions.md  
**Target Path:** `.github/instructions/powershell.instructions.md`  
**Review Scope:** INR-M1 through INR-S5

## Summary Outcome Grid

| Field | Value |
|-------|-------|
| **Overall Outcome** | Pass |
| **MUST Failures** | 0 |
| **SHOULD Advisories** | 0 |
| **Disposition** | Approved |

## Standards Evaluation

| Standard | Result | Evidence | Notes |
|----------|--------|----------|-------|
| **INR-M1: Singular Policy Domain** | ✅ PASS | File scopes to single domain: PowerShell Scripting Policy | Focus on consolidated PowerShell scripting and cmdlet guidance for automation. No domain bleed. |
| **INR-M2: Valid Frontmatter** | ✅ PASS | Name, description, applyTo all present; valid YAML | Frontmatter: `name: powershell`, `applyTo: **/*.ps1,**/*.psm1`, `description: Consolidated PowerShell scripting and cmdlet guidance...` |
| **INR-M3: applyTo Scope** | ✅ PASS | applyTo scoped to PowerShell files; appropriate narrowing | Pattern `**/*.ps1,**/*.psm1` correctly targets PowerShell scripts. Not over-broad. |
| **INR-M4: Policy Only** | ✅ PASS | Content is pure policy; no workflows or multi-step procedures | Policy defines mandatory standards (naming, pipeline, safety, documentation) without procedural workflow. Routing notes delegate to skills. |
| **INR-S1: No Conflict with Other Instructions** | ✅ PASS | No contradictory rules vs other active instructions | PowerShell policy is domain-specific and complements secure-coding policy. No conflicts detected. |
| **INR-S2: Rationale Present** | ✅ PASS | Non-obvious rules include rationale | Example: "Mutating commands should use [CmdletBinding(SupportsShouldProcess = $true)]" - rationale is automation safety. Rules include clear intent. |
| **INR-S3: No Agent/Skill Boundary Conflict** | ✅ PASS | Routing notes properly delegate to powershell-script-library and audit-powershell skills | Delegates workflow to skills; no boundary violations. |
| **INR-S4: Brevity & Wording Economy** | ✅ PASS | Wording is economical and concise | Policy sections are focused. No duplication or padding. |
| **INR-S5: Growth Governance Alignment** | ✅ PASS | References existing skills; reuse-before-create pattern followed | No redundant rules. Delegates to skills. Delta-first approach. |

## Source Alignment Check

| Item | Status | Notes |
|------|--------|-------|
| **File Location** | ✅ Valid | Located at `.github/instructions/powershell.instructions.md`. |
| **Frontmatter Semantics** | ✅ Valid | `applyTo` patterns are valid glob. `name` matches file stem. |
| **Auto-Apply Behavior** | ✅ Correct | Will auto-apply to `*.ps1` and `*.psm1` files. |

## Recommendations

| ID | Priority | Recommendation | Status |
|----|---------|----|--------|
| None | — | No remediations required. | Accepted |

## History Guard Check

| Check | Status | Notes |
|-------|--------|-------|
| **Deny-List Entries** | N/A | First audit; no deny-list entries. |
| **Suppressed Recommendations** | N/A | None exist. |

## Next Actions

- ✅ Audit complete. No blocking issues.
- File approved for continued use.
