# Prompt Audit Review: scaffold-web-ux-quality-gate

**Review Date**: 2026-05-06  
**Auditor**: audit-prompts skill  
**Outcome**: PASS WITH ADVISORIES  

---

## Metadata

| Field | Value |
|-------|-------|
| Prompt Name | scaffold-web-ux-quality-gate |
| Prompt Type | Task orchestration |
| Classification | Quality Assurance |
| Last Updated | 2026-05-06 |
| Location | `.github/prompts/scaffold-web-ux-quality-gate.prompt.md` |

---

## Outcome Grid

| Category | Status | Notes |
|----------|--------|-------|
| **MUST Failures** | ✓ PASS | 0 critical issues |
| **SHOULD Advisories** | ⚠ ADVISORY | 1 advisory (PRR-M4) |
| **PRR Checks** | ⚠ ADVISORY | 1 advisory, 6 pass |
| **Source Alignment** | ✓ PASS | Mostly aligns with canonical standards |
| **Quality Gate** | ✓ PASS | Approved with remediation recommendation |

---

## Standards Evaluation (7-Point PRR Checklist)

| Check | Status | Evidence & Notes |
|-------|--------|----------|
| **PRR-M1**: Execution boundary clarity | ✓ PASS | Clear invocation contract; quality gates explicit |
| **PRR-M2**: Frontmatter specification | ✓ PASS | Standard fields present; metadata complete |
| **PRR-M3**: Output structure consistency | ✓ PASS | Output contract explicit; grid format used |
| **PRR-M4**: Skill routing pattern | ⚠ ADVISORY | Current pattern lacks standardized "Load and follow" format; ambiguous skill invocation |
| **PRR-S1**: Prompt length & clarity | ✓ PASS | Word count ~490; concise and complete |
| **PRR-S2**: Source citation & accuracy | ✓ PASS | All references current; no dependency drift |
| **PRR-S3**: Governance alignment | ✓ PASS | Aligns with QA governance model |

---

## Source Alignment Check

| Artifact | Status | Reference |
|----------|--------|-----------|
| Skill routing spec | ⚠ CURRENT BUT DRIFTS | `.docs/specs/skill-routing-patterns.md` |
| QA standards | ✓ Current | `.docs/specs/quality-gate-specification.md` |
| Prompt conventions | ✓ Current | `.github/instructions/governance-naming-conventions.instructions.md` |

---

## Recommendations

### Advisory F-004: Skill Routing Pattern Standardization

**Priority**: HIGH  
**Status**: Proposed  
**Severity**: SHOULD  

**Issue**: Prompt uses ad-hoc skill routing instead of standardized "Load and follow" pattern.

**Remediation**:
1. Change current routing to: `"Load and follow SKILL.md in the relevant skill folder for UX quality gate evaluation."`
2. Replace any conditional skill invocation with explicit workflow link
3. Add inline context after skill reference: `"This ensures consistent quality assessment across all scenarios."`

**Estimated Effort**: 10-15 minutes  
**Risk**: LOW — Semantic change only, no workflow impact  
**Validation**: Verify skill link resolves and prompt execution contract remains unchanged

---

## History Guard Check

**Purpose**: Detect breaking changes or drift since last review.

- ✓ No breaking changes detected since Phase 1b.
- ⚠ Skill routing drift detected — not a breaking change, but requires alignment.
- ✓ No untracked modifications in source.

---

## Sign-Off

✓ **Audit Complete**: Prompt approved with advisory.  
⚠ **Quality Assurance**: Remediation recommended for Phase 1d (non-blocking).  
✓ **Disposition**: PASS WITH ADVISORIES — Ready for Phase 1d remediation planning.

**Auditor**: audit-prompts skill  
**Date**: 2026-05-06
