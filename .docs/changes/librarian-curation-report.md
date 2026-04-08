<!-- markdownlint-disable-file -->
# Release Changes: Librarian Curation Report

**Related Plan**: librarian.prompt.md (ad-hoc curation task)
**Implementation Date**: 2026-04-08

## Summary

Documentation corpus curation pass over `.docs/` (252 markdown files, 125 folders). Read-only analysis — no files moved, renamed, or deleted. Index refresh completed: 125 folders, 229 documents indexed via `index-docs`.

---

## Naming Violations

### Files

| Path | Type | Violation | Suggested Name |
|---|---|---|---|
| `.docs/adr/README.md` | File | `README.md` not kebab-case | `index.md` |
| `.docs/changes/README.md` | File | `README.md` not kebab-case | `index.md` |
| `.docs/changes/governance-audits/README.md` | File | `README.md` not kebab-case | `index.md` |
| `.docs/changes/customization-reviews/conflicts/CON-CUSTOM-20260403-001.md` | File | Uppercase ID prefix violates kebab-lowercase rule | `con-custom-20260403-001.md` |
| `.docs/changes/customization-reviews/conflicts/CON-CUSTOM-20260403-002.md` | File | Uppercase ID prefix violates kebab-lowercase rule | `con-custom-20260403-002.md` |
| `.docs/changes/customization-reviews/conflicts/CON-CUSTOM-20260403-003.md` | File | Uppercase ID prefix violates kebab-lowercase rule | `con-custom-20260403-003.md` |
| `.docs/reference/.docs/agent-routing-guide.md.ref.md` | File | Double-extension `.md.ref.md` violates naming policy | `agent-routing-guide-ref.md` |
| `.docs/reference/.github/copilot-instructions.md.ref.md` | File | Double-extension `.md.ref.md` violates naming policy | `copilot-instructions-ref.md` |
| `.docs/reference/.github/agents/*.agent.md.ref.md` (7 files) | File | Triple-extension `.agent.md.ref.md` violates naming policy | `<name>-agent-ref.md` |
| `.docs/reference/.github/instructions/*.instructions.md.ref.md` (13 files) | File | Triple-extension `.instructions.md.ref.md` | `<name>-instructions-ref.md` |
| `.docs/reference/.github/prompts/*.prompt.md.ref.md` (5 files) | File | Triple-extension `.prompt.md.ref.md` | `<name>-prompt-ref.md` |
| `.docs/reference/.github/skills/**/SKILL.md.ref.md` (12 files) | File | Contains `SKILL.md.ref.md` (uppercase + double extension) | `skill-ref.md` |

> **Note:** `README.md` files and conflict-ID uppercase tokens were flagged by the lint regex but are borderline — see Curation Candidates table. Mirror `.ref.md` files under `.docs/reference/.github/` are confirmed intentional but still break the naming rule.

### Folders

| Folder | Violation | Suggested Name |
|---|---|---|
| `.docs/changes/customization-maintenance` | Hyphenated compound name | `.docs/changes/customization/maintenance` |
| `.docs/changes/customization-renames` | Hyphenated compound name | `.docs/changes/customization/renames` |
| `.docs/changes/customization-reviews` | Hyphenated compound name | `.docs/changes/customization/reviews` |
| `.docs/changes/customization-reviews/conflicts` | Correct — single word | — |
| `.docs/changes/customization-reviews/*.agent` folders (8+) | Dot in folder name | Move to `customization/reviews/<name>-agent/` or collapse |
| `.docs/changes/customization-reviews/*.instructions` folders (15+) | Dot in folder name | Move to `customization/reviews/<name>-instructions/` or collapse |
| `.docs/changes/governance-audits` | Hyphenated compound name | `.docs/changes/governance/audits` |
| `.docs/changes/powershell-script-reviews` | Hyphenated compound name | `.docs/changes/powershell/reviews` |
| `.docs/changes/skill-conflicts` | Hyphenated compound name | `.docs/changes/skill/conflicts` |
| `.docs/changes/skill-maintenance` | Hyphenated compound name | `.docs/changes/skill/maintenance` |
| `.docs/changes/skill-reviews` | Hyphenated compound name | `.docs/changes/skill/reviews` |
| `.docs/changes/skill-reviews/<skill-name>` (80+ subfolders) | All contain hyphens | See note below |
| `.docs/reference/.docs` | Dot-prefixed folder name violates folder-naming rules | `docs-mirror` |
| `.docs/reference/.github` | Dot-prefixed folder name violates folder-naming rules | `github-mirror` |

> **Note:** Per the critical-thinking pass, `.docs/reference/.github/` and `.docs/reference/.docs/` are documented mirror artifacts. Renaming them is a break-risk unless all internal links are also updated. Flagged here for awareness; recommend defer to a dedicated mirror-refactor session.

---

## Structural Recommendations

| Current Path | Suggested Path | Reason |
|---|---|---|
| `.docs/agent-routing-guide.md` | `.docs/reference/agent-routing-guide.md` | Root-level document is reference material; belongs under `reference/` |
| `.docs/_workspace-file-inventory.txt` | Remove or move to `.archive/` | Non-markdown text file at corpus root; does not belong in `.docs/` |
| `.docs/changes/customization-maintenance/` | `.docs/changes/customization/maintenance/` | Folder naming rule: one word per level |
| `.docs/changes/customization-renames/` | `.docs/changes/customization/renames/` | Folder naming rule: one word per level |
| `.docs/changes/customization-reviews/` | `.docs/changes/customization/reviews/` | Folder naming rule: one word per level |
| `.docs/changes/governance-audits/` | `.docs/changes/governance/audits/` | Folder naming rule: one word per level |
| `.docs/changes/powershell-script-reviews/` | `.docs/changes/powershell/reviews/` | Folder naming rule: one word per level |
| `.docs/changes/skill-conflicts/` | `.docs/changes/skill/conflicts/` | Folder naming rule: one word per level |
| `.docs/changes/skill-maintenance/` | `.docs/changes/skill/maintenance/` | Folder naming rule: one word per level |
| `.docs/changes/skill-reviews/` | `.docs/changes/skill/reviews/` | Folder naming rule: one word per level |
| `.docs/changes/customization-reviews/*.agent/*` folders | Flatten into `.docs/changes/customization/reviews/` with file prefix | Dot in folder name prohibited; asset-keyed review buckets can use file prefix instead |
| `.docs/changes/customization-reviews/*.instructions/*` folders | Flatten into `.docs/changes/customization/reviews/` with file prefix | Same as above |

---

## Curation Candidates

| Path | Category | Confidence | Suggested Action | Reason |
|---|---|---|---|---|
| `.docs/changes/governance-audits/20260403-comprehensive-workspace-health-audit.md` | Duplicate | High | Investigate — Keep if newest, else Archive Candidate | Same title as three other variants in same folder |
| `.docs/changes/governance-audits/20260407-comprehensive-workspace-health-audit-original.md` | Duplicate | High | Archive Candidate | Title matches `20260407-comprehensive-workspace-health-audit.md`; "original" suffix suggests superseded snapshot |
| `.docs/changes/governance-audits/20260407-comprehensive-workspace-health-audit.md` | Duplicate | High | Keep — likely most current | Newest date, no "original" suffix |
| `.docs/changes/governance-audits/comprehensive-workspace-health-audit.md` | Duplicate | Medium | Archive Candidate | Undated; appears superseded by dated variants; may be legacy leftover |
| `.docs/changes/governance-audits/20260407-governance-audit.md` | Duplicate | High | Investigate | Same title as `governance-audit.md`; one is undated |
| `.docs/changes/governance-audits/governance-audit.md` | Duplicate | Medium | Archive Candidate | Undated version; dated variant (`20260407`) is likely current |
| `.docs/changes/governance-audits/20260403-governance-audit-r2.md` | Duplicate | Medium | Keep | Same title as `20260403-governance-audit.md`; `r2` suggests deliberate revision, keep both |
| `.docs/changes/governance-audits/20260403-governance-audit.md` | Duplicate | Medium | Keep | Earliest dated entry; may be baseline history |
| `.docs/changes/skill-reviews/dotnet-modernization/review.md` | Duplicate | High | Keep — Legacy Anchor | Identical hash to 5 other legacy review.md files; explicitly marked as link-integrity anchor per critical-thinking review |
| `.docs/changes/skill-reviews/finishing-a-development-branch/review.md` | Duplicate | High | Keep — Legacy Anchor | Same as above |
| `.docs/changes/skill-reviews/receiving-code-review/review.md` | Duplicate | High | Keep — Legacy Anchor | Same as above |
| `.docs/changes/skill-reviews/requesting-code-review/review.md` | Duplicate | High | Keep — Legacy Anchor | Same as above |
| `.docs/changes/skill-reviews/subagent-driven-development/review.md` | Duplicate | High | Keep — Legacy Anchor | Same as above |
| `.docs/changes/skill-reviews/technical-documentation/review.md` | Duplicate | High | Keep — Legacy Anchor | Same as above |
| `.docs/agent-routing-guide.md` | Misplaced | High | Move to `.docs/reference/agent-routing-guide.md` | Root-level reference doc; `reference/` is the canonical location |
| `.docs/_workspace-file-inventory.txt` | Misplaced | High | Move to `.archive/` or workspace root | `.txt` file does not belong in the markdown corpus root |
| `.docs/reference/.docs/` (subtree) | Misplaced | Low | Keep — Intentional Mirror | Documented mirror artifact; flagged only for future refactor consideration |
| `.docs/reference/.github/` (subtree) | Misplaced | Low | Keep — Intentional Mirror | Documented mirror artifact; flagged only for future refactor consideration |

---

## Index Status

| Root | Index Action | Status |
|---|---|---|
| `.docs/` | Generated/Refreshed | Complete — 125 folders, 229 documents indexed |

---

## Confirmation Gate

**No files have been moved, renamed, or deleted.** All items above are recommendations only. Explicit user approval is required before any structural action is taken.

---

## Release Summary

**Total Files Affected**: 1 (this report)

### Files Created (1)

- `.docs/changes/20260408-librarian-curation-report.md` — Librarian curation report for .docs corpus

### Files Modified (125 INDEX.md files)

- `.docs/**/INDEX.md` — Generated or refreshed by index-docs step (index files only, no authored content modified)

### Files Removed (0)

- None

### Dependencies & Infrastructure

- **New Dependencies**: None
- **Updated Dependencies**: None
- **Infrastructure Changes**: None
- **Configuration Updates**: None

### Deployment Notes

Approve and action structural recommendations in a separate session using `prune-doc-artifacts` for cleanup candidates and `executing-plans` for folder hierarchy migrations.

