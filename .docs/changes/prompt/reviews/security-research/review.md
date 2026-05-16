# Prompt Audit Review: security-research

**Review Date**: 2026-05-06  
**Auditor**: audit-prompts skill  
**Outcome**: PASS WITH ADVISORIES  

---

## Metadata

| Field | Value |
|-------|-------|
| Prompt Name | security-research |
| Prompt Type | Research & synthesis |
| Classification | Research |
| Last Updated | 2026-05-06 |
| Location | `.github/prompts/security-research.prompt.md` |

---

## Outcome Grid

| Category | Status | Notes |
|----------|--------|-------|
| **MUST Failures** | ✓ PASS | 0 critical issues |
| **SHOULD Advisories** | ⚠ ADVISORY | 1 advisory (PRR-M3) |
| **PRR Checks** | ⚠ ADVISORY | 1 advisory, 6 pass |
| **Source Alignment** | ✓ PASS | Mostly aligns with canonical standards |
| **Quality Gate** | ✓ PASS | Approved with remediation recommendation |

---

## Standards Evaluation (7-Point PRR Checklist)

| Check | Status | Evidence & Notes |
|-------|--------|----------|
| **PRR-M1**: Execution boundary clarity | ✓ PASS | Clear invocation contract; security research scope explicit |
| **PRR-M2**: Frontmatter specification | ✓ PASS | Standard fields present; metadata complete |
| **PRR-M3**: Output structure consistency | ⚠ ADVISORY | Missing explicit output grid format specification; result structure implicit |
| **PRR-M4**: Skill routing pattern | ✓ PASS | Standard skill loading pattern used |
| **PRR-S1**: Prompt length & clarity | ✓ PASS | Word count ~500; concise yet complete |
| **PRR-S2**: Source citation & accuracy | ✓ PASS | All references current; no dependency drift |
| **PRR-S3**: Governance alignment | ✓ PASS | Aligns with security governance model |

---

## Source Alignment Check

| Artifact | Status | Reference |
|----------|--------|-----------|
| Output structure spec | ⚠ CURRENT BUT LACKS DETAIL | `.docs/specs/output-format-specification.md` |
| Security standards | ✓ Current | `.docs/specs/security-research-patterns.md` |
| Prompt conventions | ✓ Current | `.github/instructions/governance-naming-conventions.instructions.md` |

---

## Recommendations

### Advisory F-002: Missing Output Grid Format

**Priority**: HIGH  
**Status**: Proposed  
**Severity**: SHOULD  

**Issue**: Prompt does not specify explicit output grid format, reducing machine readability and vulnerability prioritization consistency.

**Remediation**:
1. Add section: `"## Output Format"` after research scope definition
2. Define Findings Grid: `"| Vulnerability | Category | Severity | Evidence |"`
3. Define Recommendations Grid: `"| Rec ID | Title | Risk Mitigation | Effort |"`
4. Specify result cardinality: "Return all critical/high findings, top 5 recommendations prioritized by CVSS score"

**Estimated Effort**: 15-20 minutes  
**Risk**: LOW — Clarification only; no workflow impact  
**Validation**: Verify grid structure is honored across multiple security research executions

---

## History Guard Check

**Purpose**: Detect breaking changes or drift since last review.

- ✓ No breaking changes detected since Phase 1b.
- ⚠ Output format specification gap detected — not blocking, but impacts result consistency.
- ✓ No untracked modifications in source.

---

## Sign-Off

✓ **Audit Complete**: Prompt approved with advisory.  
⚠ **Quality Assurance**: Remediation recommended for Phase 1d (non-blocking).  
✓ **Disposition**: PASS WITH ADVISORIES — Ready for Phase 1d remediation planning.

**Auditor**: audit-prompts skill  
**Date**: 2026-05-06
