# Instruction Audit Review: testing-strategy

**Review Date:** 2025-04-20  
**Reviewer Skill:** audit-instructions  
**Target Instruction:** testing-strategy.instructions.md  
**Target Path:** `.github/instructions/testing-strategy.instructions.md`  
**Review Scope:** INR-M1 through INR-S5

## Summary Outcome Grid

| Field | Value |
|-------|-------|
| **Overall Outcome** | Pass |
| **MUST Failures** | 0 |
| **SHOULD Advisories** | 1 |
| **Disposition** | Pass With Advisories |

## Standards Evaluation

| Standard | Result | Evidence | Notes |
|----------|--------|----------|-------|
| **INR-M1: Singular Policy Domain** | ✅ PASS | File scopes to single domain: Unified Testing Strategy | Focus on test naming, patterns, and tooling for C#. No domain bleed. |
| **INR-M2: Valid Frontmatter** | ✅ PASS | Name, description, applyTo all present; valid YAML | Frontmatter: `name: testing-strategy`, `description: Unified testing strategy...`, `applyTo: **/*.cs` |
| **INR-M3: applyTo Scope** | ✅ PASS | applyTo scoped to C# files; appropriate narrowing | Pattern `**/*.cs` correctly targets C# code. Not over-broad. |
| **INR-M4: Policy Only** | ✅ PASS | Content is pure policy; no workflows or multi-step procedures | Policy lists mandatory rules (xUnit, naming conventions, guard tests, architecture tests) without procedural detail. Routing notes delegate to skill. |
| **INR-S1: No Conflict with Other Instructions** | ✅ PASS | No contradictory rules vs other active instructions | Testing strategy aligns with csharp and async-programming instructions. No conflicts detected. |
| **INR-S2: Rationale Present** | ⚠️ ADVISORY | Some rules lack explicit rationale | Rule: "FluentAssertions is prohibited" - rationale not stated in file. Reason may be in csharp.instructions.md but testing-strategy should be self-contained for this assertion. |
| **INR-S3: No Agent/Skill Boundary Conflict** | ✅ PASS | Routing notes properly delegate to test-driven-development skill | Delegates workflow to skill; no boundary violations. |
| **INR-S4: Brevity & Wording Economy** | ✅ PASS | Wording is economical and concise | File is brief. Clear rules. No duplication or padding. |
| **INR-S5: Growth Governance Alignment** | ✅ PASS | References existing test-driven-development skill; reuse-before-create pattern followed | No redundant rules. Delegates to skill. Delta-first approach. |

## Source Alignment Check

| Item | Status | Notes |
|------|--------|-------|
| **File Location** | ✅ Valid | Located at `.github/instructions/testing-strategy.instructions.md`. |
| **Frontmatter Semantics** | ✅ Valid | `applyTo` pattern is valid glob. `name` matches file stem. |
| **Auto-Apply Behavior** | ✅ Correct | Will auto-apply to `*.cs` files. |

## Recommendations

| ID | Priority | Recommendation | Status |
|----|---------|----|--------|
| REC-001 | LOW | Add rationale for FluentAssertions prohibition in testing-strategy file or cross-reference csharp.instructions.md explicitly | Proposed |

## History Guard Check

| Check | Status | Notes |
|-------|--------|-------|
| **Deny-List Entries** | N/A | First audit; no deny-list entries. |
| **Suppressed Recommendations** | N/A | None exist. |

## Next Actions

- ✅ Audit complete. One low-priority advisory (REC-001).
- File approved for continued use with note on advisory.
- Optional: Add cross-reference or rationale for FluentAssertions prohibition.
