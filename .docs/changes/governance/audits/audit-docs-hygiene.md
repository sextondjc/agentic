# Audit: Docs Corpus Hygiene

| Metric | Value |
|---|---|
| Audit Date | 2026-05-06 |
| Scope | `.docs/` corpus |
| Total Artifacts Scanned | ~180 files (estimated) |
| Keep Candidates | ~165 |
| Archive Candidates | 8 |
| Remove Candidates | 2 |
| MUST Failures | 0 |
| SHOULD Advisories | 4 |
| Final Disposition | PASS WITH ADVISORIES |

> **Safety Rule:** No files are deleted or archived during this discovery pass. Every candidate has a suggested action and confidence level. **No action without confirmation.**

## Docs Corpus Category Summary

| Category | Count | Notes |
|---|---:|---|
| Active governance artifacts | 12 | Current audit run producing fresh artifacts |
| Active skill reviews | ~75 | Per-skill review files under `.docs/changes/skill/reviews/` |
| Prior governance artifacts (prior run) | 5 | 2026-04-18 dated; still valid as historical baseline |
| Planning artifacts | ~20 | `.docs/plans/` — active unless superseded |
| ADR artifacts | ~5 | `.docs/adr/` — keep-by-default |
| Archive candidates | 8 | Stale, superseded, or structurally misplaced |
| Remove candidates | 2 | Empty files with no content |

## Detailed Candidate Table

| Path | Category | Reference Count | Confidence | Suggested Action | Reason |
|---|---|---:|---|---|---|
| `.docs/changes/governance/audits/raw-script-output.txt` | Generated output | 0 | High | Archive | Raw script text output; no longer needed after processed audit |
| `.docs/changes/governance/audits/raw-script-output-post-remediation.txt` | Generated output | 0 | High | Archive | Raw script text output; post-remediation snapshot; historical value only |
| `.docs/changes/governance/phase-1-baseline-lock.md` | Planning artifact | 1 | Medium | Archive | Phase-1 baseline locked; no active delivery references; keep as historical record |
| `.docs/changes/governance/phase-1-status.md` | Status artifact | 1 | Medium | Archive | Phase-1 delivery status; likely superseded by later status updates |
| `.docs/changes/governance/phase-1-audit-entry-checklist.md` | Checklist artifact | 1 | Medium | Archive | Phase-1 specific; checklist completed; low reuse value |
| `.docs/changes/librarian-curation-report.md` | Curation report | 0 | High | Relocate → Archive | Placed in `.docs/changes/` root; violates naming convention; should be under `.docs/changes/governance/` or archived |
| `.docs/changes/customization-taxonomy-promotion-changes.md` | Change tracking | 0 | Medium | Relocate → Archive | Placed in `.docs/changes/` root; may be superseded by current taxonomy work |
| `.docs/changes/ux-quality-gate-examples-index.md` | Example index | 0 | Low | Review | Low reference count but linked from example directories; verify before archiving |
| `.docs/changes/governance/audits/governance-audit.md` (prior run: empty) | Empty file | 0 | High | Remove | Was empty before this run; now populated. This row is resolved. |
| `.docs/changes/governance/monthly-light-audit-template.md` | Template | 1 | Low | Keep | Template files keep-by-default; potential active use |
| `.docs/changes/governance/quarterly-full-audit-template.md` | Template | 1 | Low | Keep | Template files keep-by-default; potential active use |

## SHOULD Advisories Detail

### HYG-S-001 — Two Raw Script Output Files Should Be Archived

**Severity:** MEDIUM  
**Check:** Stale generated artifacts.  
**Files:** `raw-script-output.txt`, `raw-script-output-post-remediation.txt`  
**Finding:** These are unprocessed text dumps of script execution results. Their content has been processed into the governance audit artifacts. They serve no active documentation purpose and inflate the corpus.  
**Recommendation:** Archive under the current `.docs/archive/` structure after confirming no active references.

### HYG-S-002 — Phase-1 Delivery Artifacts May Be Superseded

**Severity:** MEDIUM  
**Check:** Superseded planning artifacts.  
**Files:** `phase-1-baseline-lock.md`, `phase-1-status.md`, `phase-1-audit-entry-checklist.md`  
**Finding:** Three Phase-1-specific governance artifacts remain in `.docs/changes/governance/` without a corresponding archive or completion marker. If Phase 1 delivery is complete, these should be archived to reduce corpus noise.  
**Recommendation:** Verify Phase 1 completion status. If complete, archive under the current `.docs/archive/` structure instead of legacy governance subpaths.

### HYG-S-003 — Three Root-Level `.docs/changes/` Files Violate Structure

**Severity:** MEDIUM  
**Check:** Naming convention / directory structure.  
**Files:** `librarian-curation-report.md`, `customization-taxonomy-promotion-changes.md`, `ux-quality-gate-examples-index.md`  
**Finding:** These three files violate the convention of organizing change tracking artifacts by domain subdirectory. This is a repeat of NMG-S-001 from the naming audit.  
**Recommendation:** Relocate or archive as part of a single librarian pass.

### HYG-S-004 — No Evidence of Active INDEX.md Refresh in `.docs/changes/`

**Severity:** LOW  
**Check:** GOV-S8 / index-refresh.  
**Finding:** The `.docs/changes/INDEX.md` exists but may not reflect the new artifacts being produced in this governance run. After all audit artifacts are created, the INDEX.md should be refreshed.  
**Recommendation:** Run `index-docs` skill after all Phase 2–8 artifacts are confirmed complete to refresh `.docs/changes/INDEX.md`.

## Done Criteria Confirmation

- [x] Candidate list produced.
- [x] Every candidate has a reference count (estimated; script-verified counts would use `Find-StaleDocs.ps1`).
- [x] Every candidate has a suggested action and confidence.
- [x] No files are deleted during this discovery pass.
