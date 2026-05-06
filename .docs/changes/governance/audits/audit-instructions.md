# Audit: Instructions

| Metric | Value |
|---|---|
| Audit Date | 2026-05-06 |
| Scope | All `.instructions.md` files in `.github/instructions/` |
| Total Instructions Reviewed | 21 |
| MUST Failures | 0 |
| SHOULD Advisories | 5 |
| Final Disposition | PASS WITH ADVISORIES |

## Aggregate Results Grid

| Instruction File | Outcome | INR-M1 | INR-M2 | INR-M3 | INR-M4 | INR-S1 | INR-S2 | INR-S3 | INR-S4 | INR-S5 |
|---|---|---|---|---|---|---|---|---|---|---|
| architecture.instructions.md | Pass | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| async-programming.instructions.md | Pass | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| ci-cd.instructions.md | Pass | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| csharp.instructions.md | Pass | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| governance-lifecycle.instructions.md | Pass | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| governance-naming-conventions.instructions.md | Pass | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| governance-release.instructions.md | Pass With Advisories | ✓ | ✓ | Advisory | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| mobile-frontend.instructions.md | Pass | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| namespace-boundaries.instructions.md | Pass | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| powershell.instructions.md | Pass | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| prd.instructions.md | Pass | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| request-economy.instructions.md | Pass With Advisories | ✓ | ✓ | Advisory | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| secure-coding.instructions.md | Pass With Advisories | ✓ | ✓ | Advisory | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| sql-dba.instructions.md | Pass | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| syrx.instructions.md | Pass | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| task-implementation.instructions.md | Pass | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| technical-docs.instructions.md | Pass | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| testing-strategy.instructions.md | Pass | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| ux-design.instructions.md | Pass | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| validation.instructions.md | Pass | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| web-frontend.instructions.md | Pass | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |

## SHOULD Advisories Detail

### INR-S-001 — `governance-release.instructions.md`: Global applyTo Advisory

**Severity:** MEDIUM  
**Check:** INR-M3 (advisory level) / INR-S2  
**Finding:** `applyTo: '**'` applies governance-release rules to all file types including `.json`, `.yaml`, and script files. The file includes a Global Scope Rationale section explaining the justification. The rationale is present and defensible, but the pattern remains a risk: applying release governance rules to code files during development phases may trigger unintended constraints in engineering lanes.  
**Recommendation:** Keep `applyTo: '**'` but add a `## Applicability Override` section clarifying that CI/CD configuration files (`.yml`) and code files defer to their own instruction files for implementation concerns. This prevents future boundary confusion.

### INR-S-002 — `request-economy.instructions.md`: Global applyTo Advisory

**Severity:** MEDIUM  
**Check:** INR-M3 (advisory level) / INR-S2  
**Finding:** `applyTo: '**'` applies request-economy cost controls globally. This is intentional per the inline rationale section. However, the instruction contains an Escalation Criteria section with conditional rules that begin to resemble workflow procedural logic.  
**Recommendation:** Extract the Escalation Criteria into a simpler decision table. Current wording is borderline INR-M4 (no task workflow content) but does not cross the MUST threshold.

### INR-S-003 — `secure-coding.instructions.md`: Global applyTo Advisory

**Severity:** MEDIUM  
**Check:** INR-M3 (advisory level) / INR-S2  
**Finding:** `applyTo: '**'` applies secure-coding rules globally including to documentation files. This is intentional (the file includes a Global Scope Rationale). The concern is that applying `.NET`-specific Syrx guard rules to TypeScript or Python contexts may create confusion. The instruction is otherwise well-scoped.  
**Recommendation:** Add a language-context qualifier noting which rules are language-specific and which are universal.

### INR-S-004 — Global Instruction Rationale Pattern Gap

**Severity:** LOW  
**Check:** INR-S2 — Non-obvious rules include a brief rationale comment.  
**Finding:** Several instructions (`architecture.instructions.md`, `namespace-boundaries.instructions.md`, `testing-strategy.instructions.md`) contain rules without inline rationale. The rules themselves are reasonable but new contributors may not understand the reasoning behind specific constraints (e.g., why Syrx-specific patterns are mandatory even for simple queries).  
**Recommendation:** Add single-sentence rationale comments to the 3 most non-obvious rules per file during the next maintenance pass.

### INR-S-005 — `governance-naming-conventions.instructions.md`: Lane Assignment Brevity

**Severity:** LOW  
**Check:** INR-S4 — Brevity.  
**Finding:** The instruction file references governance catalogs for lane definitions but its own body partially restates catalog content, creating minor redundancy.  
**Recommendation:** Remove restated catalog content and replace with a direct link reference.

## Summary Table

| MUST Failures | SHOULD Advisories | Instructions Passing | Instructions With Advisories | Instructions Failing |
|---:|---:|---:|---:|---:|
| 0 | 5 | 18 | 3 | 0 |
