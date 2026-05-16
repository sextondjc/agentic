# Instruction Audit Review: web-frontend

**Review Date:** 2025-04-20  
**Reviewer Skill:** audit-instructions  
**Target Instruction:** web-frontend.instructions.md  
**Target Path:** `.github/instructions/web-frontend.instructions.md`  
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
| **INR-M1: Singular Policy Domain** | ✅ PASS | File scopes to single domain: Web Frontend Coding Standards | No domain bleed detected. Focused exclusively on component design, accessibility, performance, security, and prohibited patterns for web. |
| **INR-M2: Valid Frontmatter** | ✅ PASS | Name, description, applyTo all present; valid YAML | Frontmatter: `name: web-frontend`, `description: Web frontend coding standards...`, `applyTo: **/*.ts,**/*.tsx,**/*.js,**/*.jsx,**/*.css,**/*.html` |
| **INR-M3: applyTo Scope** | ✅ PASS | applyTo scoped to web file patterns; not over-broad | Pattern `**/*.ts,**/*.tsx,**/*.js,**/*.jsx,**/*.css,**/*.html` is precisely scoped. No blanket `**` wildcard. |
| **INR-M4: Policy Only** | ✅ PASS | Content is pure policy; no workflows, procedures, or numbered steps | Sections define standards (accessibility, performance, security) without multi-step procedures. Routing notes delegate execution to skills. |
| **INR-S1: No Conflict with Other Instructions** | ✅ PASS | No contradictory rules identified in web-frontend rules vs other active instructions | Web frontend policy does not conflict with secure-coding, testing-strategy, or other applicable instructions. |
| **INR-S2: Rationale Present** | ✅ PASS | Non-obvious rules include rationale | Example: "Core Web Vitals targets: LCP ≤ 2.5 s, CLS ≤ 0.1, INP ≤ 200 ms" (industry-standard targets justified by performance standards). Security rules justified by threat models (XSS, CSP). |
| **INR-S3: No Agent/Skill Boundary Conflict** | ✅ PASS | Routing notes properly delegate to skills; no boundary conflicts | Explicitly routes to build-web-frontend skill and specialized quality-gate skills. No scope creep into agent responsibilities. |
| **INR-S4: Brevity & Wording Economy** | ✅ PASS | Wording is concise; no duplication or padding | Each section is focused. No repetition. Clear, direct language. |
| **INR-S5: Growth Governance Alignment** | ✅ PASS | Follows reuse-before-create pattern; references existing skills | Instruction references existing skills (build-web-frontend, web-ux-accessibility, web-ux-performance, web-ux-quality-gate). Delta-first approach. |

## Source Alignment Check

| Item | Status | Notes |
|------|--------|-------|
| **File Location** | ✅ Valid | Located at `.github/instructions/web-frontend.instructions.md` as expected. |
| **Frontmatter Semantics** | ✅ Valid | `applyTo` patterns are valid glob syntax. `name` matches file stem. `description` is descriptive and concise. |
| **Auto-Apply Behavior** | ✅ Correct | `applyTo` includes `*.ts`, `*.tsx`, `*.js`, `*.jsx`, `*.css`, `*.html`. Will auto-apply to web projects. |

## Recommendations

| ID | Priority | Recommendation | Status |
|----|---------|----|--------|
| None | — | No remediations required. | Accepted |

## History Guard Check

| Check | Status | Notes |
|-------|--------|-------|
| **Deny-List Entries** | N/A | First audit; no deny-list entries yet. |
| **Suppressed Recommendations** | N/A | No suppressed recommendations exist. |

## Next Actions

- ✅ Audit complete. No blocking issues.
- File approved for continued use.
- Monitor for conflicts if new instructions are added.
