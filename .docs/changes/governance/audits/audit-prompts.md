# Audit: Prompts

| Metric | Value |
|---|---|
| Audit Date | 2026-05-06 |
| Scope | All `.prompt.md` files in `.github/prompts/` |
| Total Prompts Reviewed | 21 |
| MUST Failures | 0 |
| SHOULD Advisories | 5 |
| Final Disposition | PASS WITH ADVISORIES |

## Aggregate Results Grid

| Prompt File | Outcome | PRR-M1 | PRR-M2 | PRR-M3 | PRR-M4 | PRR-S1 | PRR-S2 | PRR-S3 |
|---|---|---|---|---|---|---|---|---|
| audit-agent.prompt.md | Pass | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| audit-customization-types.prompt.md | Pass | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| curate-copilot.prompt.md | Pass | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| execute-artifact-condense.prompt.md | Pass | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| execute-customization-audit.prompt.md | Pass | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| execute-delivery.prompt.md | Pass | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| execute-manual-review.prompt.md | Pass | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| execute-testing-xunit.prompt.md | Pass | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| generate-readme.prompt.md | Pass | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| governance-audit-types.prompt.md | Pass With Advisories | ✓ | ✓ | Advisory | ✓ | ✓ | ✓ | ✓ |
| governance-item-audit.prompt.md | Pass With Advisories | ✓ | ✓ | Advisory | ✓ | ✓ | ✓ | ✓ |
| librarian.prompt.md | Pass | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| optimize-customizations.prompt.md | Pass | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| performance-research.prompt.md | Pass | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| review-project.prompt.md | Pass | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| review-technical-docs.prompt.md | Pass With Advisories | ✓ | ✓ | ✓ | ✓ | Advisory | ✓ | ✓ |
| scaffold-web-ux-quality-gate.prompt.md | Pass | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| security-research.prompt.md | Pass | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| sync-compendium.prompt.md | Pass | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| workspace-scaffolder.prompt.md | Pass With Advisories | ✓ | ✓ | ✓ | ✓ | ✓ | Advisory | ✓ |
| write-component-docs.prompt.md | Pass | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |

## SHOULD Advisories Detail

### PRR-S-001 — `governance-audit-types.prompt.md`: Output Contract Section Sparse

**Severity:** MEDIUM  
**Check:** PRR-M3 (advisory level) — Required output structure should be explicitly defined.  
**Finding:** The `governance-audit-types.prompt.md` file includes an `## Output Contract` section header but the content is incomplete; it appears to be cut off. The section does not enumerate required columns or output file paths.  
**Recommendation:** Complete the Output Contract section with: output file path, required sections, and column schema for the delta/failure-ID grids.

### PRR-S-002 — `governance-item-audit.prompt.md`: Output Contract Section Sparse

**Severity:** MEDIUM  
**Check:** PRR-M3 (advisory level) — Required output structure should be explicitly defined.  
**Finding:** Similar to governance-audit-types; the `governance-item-audit.prompt.md` output contract section does not fully enumerate the expected output structure. Given this prompt drives item-level audits, a weak output contract increases the risk of inconsistent artifacts.  
**Recommendation:** Add explicit output file path, per-item finding table schema, and disposition values to the Output Contract section.

### PRR-S-003 — `review-technical-docs.prompt.md`: Overlap with `review-project.prompt.md`

**Severity:** MEDIUM  
**Check:** PRR-S1 — No harmful overlap with other prompts.  
**Finding:** `review-technical-docs` and `review-project` share trigger conditions. Both can be used to evaluate documentation quality before a new execution wave. The overlap is partial rather than full (review-project also covers plan alignment and scope integrity), but the documentation review trigger is ambiguous.  
**Recommendation:** Clarify in `review-technical-docs` description that it is scoped to documentation artifact quality only (not plan alignment); differentiate from `review-project` in both descriptions.

### PRR-S-004 — `workspace-scaffolder.prompt.md`: Description Verbosity

**Severity:** LOW  
**Check:** PRR-S2 — Brevity.  
**Finding:** The `workspace-scaffolder.prompt.md` description and routing section contain detailed inline guidance that duplicates the skill body content. This violates the principle that prompts should be lightweight entry points routing to skills.  
**Recommendation:** Trim the prompt body to routing directive and output contract only; move workflow content to the `workspace-scaffolder` skill.

### PRR-S-005 — Prompt Count Delta: 2 New Prompts Since Prior Audit

**Severity:** LOW  
**Check:** PRR-S3 — Growth governance alignment.  
**Finding:** Two prompts (`scaffold-web-ux-quality-gate.prompt.md` and one other) are present in the directory but were absent from the prior audit (2026-04-18 count was 19; current count is 21). Neither has a history file under `.docs/changes/prompt/history/`. This is expected for new assets but should be tracked.  
**Recommendation:** Create prompt history files for the 2 new prompts to establish review lineage.

## Summary Table

| MUST Failures | SHOULD Advisories | Prompts Passing | Prompts With Advisories | Prompts Failing |
|---:|---:|---:|---:|---:|
| 0 | 5 | 17 | 4 | 0 |
