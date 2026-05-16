# Instruction Audit Review: mobile-frontend

**Review Date:** 2025-04-20  
**Reviewer Skill:** audit-instructions  
**Target Instruction:** mobile-frontend.instructions.md  
**Target Path:** `.github/instructions/mobile-frontend.instructions.md`  
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
| **INR-M1: Singular Policy Domain** | ✅ PASS | File scopes to single domain: Mobile Frontend Policy | Focus on cross-platform mobile standards (MAUI, React Native variants). No domain bleed. |
| **INR-M2: Valid Frontmatter** | ✅ PASS | Name, description, applyTo all present; valid YAML | Frontmatter: `name: mobile-frontend`, `description: Cross-platform mobile frontend standards...`, `applyTo: **/*.tsx,**/*.xaml` |
| **INR-M3: applyTo Scope** | ✅ PASS | applyTo scoped to mobile file types; appropriate narrowing | Pattern targets React Native (`*.tsx`) and MAUI/Xamarin (`*.xaml`) files. Not over-broad. |
| **INR-M4: Policy Only** | ✅ PASS | Content is pure policy; no workflows or multi-step procedures | Policy defines standards (platform parity, architecture, offline, security, performance, prohibited patterns) without procedural workflow. Routing notes delegate to skills. |
| **INR-S1: No Conflict with Other Instructions** | ✅ PASS | No contradictory rules vs other active instructions | Mobile-frontend policy aligns with web-frontend, secure-coding, and architecture instructions. No conflicts detected. |
| **INR-S2: Rationale Present** | ✅ PASS | Non-obvious rules include rationale | Example: "Target app cold-start time under two seconds" - rationale is user experience. Platform parity requirement justified by UX consistency. Performance targets are industry-standard. |
| **INR-S3: No Agent/Skill Boundary Conflict** | ✅ PASS | Routing notes properly delegate to build-maui-apps and orchestrate-mobile skills | Delegates workflow to skills; no boundary violations. |
| **INR-S4: Brevity & Wording Economy** | ✅ PASS | Wording is economical and concise | Policy sections are focused. No duplication or padding. |
| **INR-S5: Growth Governance Alignment** | ✅ PASS | References existing skills; reuse-before-create pattern followed | No redundant rules. Delegates to skills. Delta-first approach. |

## Source Alignment Check

| Item | Status | Notes |
|------|--------|-------|
| **File Location** | ✅ Valid | Located at `.github/instructions/mobile-frontend.instructions.md`. |
| **Frontmatter Semantics** | ✅ Valid | `applyTo` patterns are valid glob. `name` matches file stem. |
| **Auto-Apply Behavior** | ✅ Correct | Will auto-apply to `*.tsx` and `*.xaml` files. |

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
