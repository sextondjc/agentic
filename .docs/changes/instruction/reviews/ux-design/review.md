# Instruction Audit Review: ux-design

**Review Date:** 2025-04-20  
**Reviewer Skill:** audit-instructions  
**Target Instruction:** ux-design.instructions.md  
**Target Path:** `.github/instructions/ux-design.instructions.md`  
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
| **INR-M1: Singular Policy Domain** | ✅ PASS | File scopes to single domain: UX Design Policy | Exclusive focus on accessibility, interaction design, and wireframe/prototype standards. No domain bleed. |
| **INR-M2: Valid Frontmatter** | ✅ PASS | Name, description, applyTo all present; valid YAML | Frontmatter: `name: ux-design`, `description: UX design policy standards...`, `applyTo: .docs/**/*.md` |
| **INR-M3: applyTo Scope** | ✅ PASS | applyTo scoped to documentation files in .docs; appropriate narrowing | Pattern `.docs/**/*.md` correctly targets design documentation. Not over-broad. |
| **INR-M4: Policy Only** | ✅ PASS | Content is pure policy; no workflows or multi-step procedures | Policy lists standards (accessibility, interaction, wireframes) without procedural workflow. Routing notes delegate execution to skills. |
| **INR-S1: No Conflict with Other Instructions** | ✅ PASS | No contradictory rules vs other active instructions | UX design policy aligns with web-frontend and mobile-frontend accessibility standards. No conflicts detected. |
| **INR-S2: Rationale Present** | ✅ PASS | Non-obvious rules include rationale | Example: "Touch targets must be at least 44×44 logical pixels" (industry-standard mobile accessibility). WCAG 2.1 AA baseline is justified. |
| **INR-S3: No Agent/Skill Boundary Conflict** | ✅ PASS | Routing notes properly delegate to design skills | Delegates to design-web-ux, design-mobile-ux, and usability-test-scripts skills. No boundary violations. |
| **INR-S4: Brevity & Wording Economy** | ✅ PASS | Wording is concise; no duplication or padding | Each section is focused. No repetition. Clear language. |
| **INR-S5: Growth Governance Alignment** | ✅ PASS | References existing design skills; reuse-before-create pattern followed | No redundant rules. Delegates to skills. Delta-first approach. |

## Source Alignment Check

| Item | Status | Notes |
|------|--------|-------|
| **File Location** | ✅ Valid | Located at `.github/instructions/ux-design.instructions.md`. |
| **Frontmatter Semantics** | ✅ Valid | `applyTo` pattern is valid glob. `name` matches file stem. |
| **Auto-Apply Behavior** | ✅ Correct | Will auto-apply to markdown files under `.docs/`. |

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
