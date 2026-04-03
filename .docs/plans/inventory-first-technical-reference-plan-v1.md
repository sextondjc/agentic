---
goal: Build an inventory-first technical reference documentation set for all 49 inventoried workspace files under .docs/reference.
version: 1.0
date_created: 2026-03-23
status: Planned
scope_files: 49
doc_root: .docs/reference
---

## Inputs And Constraints
- Inventory source: .docs/_workspace-file-inventory.txt (49 files).
- Documentation standards: .github/instructions/documentation-and-specifications.instructions.md.
- Technical documentation output contract and trust gates: .github/skills/technical-documentation/SKILL.md.
- Security posture for claims: evidence-only, no speculation, no fabricated behavior.
- Update policy: prefer updating existing docs in place; create only missing docs.

## Phase 1: Inventory Baseline And Normalization
- TASK-001: Read inventory and lock canonical path list in execution memory (49 entries).
  - Success criteria: normalized forward-slash paths, duplicates removed, count remains 49.
- TASK-002: Classify each path by artifact type and path segment.
  - Segments: .docs, .github/agents, .github/instructions, .github/prompts, .github/skills/*, .github/skills/*/references.
  - Success criteria: each file assigned exactly one segment and one artifact class.
- TASK-003: Load existing documentation tree state under .docs/reference.
  - Success criteria: each planned output marked as Create or Update before authoring.
Validation: deterministic inventory manifest exists for all 49 files and pre-authoring status is known.

## Phase 2: Parallel Evidence Exploration By Path Segment
- TASK-004: Execute parallel read-only exploration lanes.
  - Lane A: .docs (1 file)
  - Lane B: .github/agents + .github root guidance file (10 files)
  - Lane C: .github/instructions (13 files)
  - Lane D: .github/prompts (8 files)
  - Lane E: .github/skills SKILL.md files (10 files)
  - Lane F: .github/skills/*/references templates (7 files)
- TASK-005: Extract evidence cards per file.
  - Required fields: purpose, primary sections, constraints, inputs/outputs, explicit unknowns.
- TASK-006: Record claim provenance.
  - Every non-trivial statement must reference one or more source files.
Validation: all 49 files have evidence cards; unresolved unknowns are explicitly labeled.

## Phase 3: Documentation Authoring And Update-In-Place
- TASK-007: Create or update core docs.
  - [index.md](./../reference/index.md)
  - [code-structure.md](./../reference/code-structure.md)
  - [coverage-report.md](./../reference/coverage-report.md)
- TASK-008: Create or update directory landing pages mirroring repo structure.
  - Generate index.md at each mirrored directory path in the file map section.
- TASK-009: Create or update file-level reference pages.
  - Mapping rule: <source-path> -> .docs/reference/<source-path>.ref.md
  - Example: [defect-debugger.agent.md](./../../.github/agents/defect-debugger.agent.md) -> [defect-debugger.agent.md.ref.md](./../reference/.github/agents/defect-debugger.agent.md.ref.md)
- TASK-010: Enforce evidence-only writing gate.
  - Unknown behavior text must use Not observed in code.
Validation: each planned page is present and contains source-backed content or explicit unknowns.

## Phase 4: Coverage Accounting And Exclusion Tracking
- TASK-011: Build coverage matrix from inventory manifest.
  - Columns: Source File, Doc Page, Status (Created/Updated/Unchanged), Included/Excluded, Exclusion Reason.
- TASK-012: Track exclusions explicitly with reasons.
  - Current target: no exclusions expected for the 49-file inventory.
  - If exclusion is introduced, reason must be one of: generated artifact, binary/opaque artifact, out-of-scope by approved decision.
- TASK-013: Compute coverage percent and per-segment coverage.
Validation: coverage-report.md shows full matrix with explicit exclusions section (or explicit None).

## Phase 5: Link Validation, Drift Checks, And Finalization
- TASK-014: Validate internal relative links across .docs/reference.
  - Check all markdown links resolve to existing files.
- TASK-015: Validate heading anchors for intra-doc links.
  - Normalize headings and verify anchor targets exist.
- TASK-016: Run drift gate review.
  - Remove or revise statements contradicted by source evidence.
- TASK-017: Publish final summary in index and coverage report.
Validation: no unresolved dead links; trust gates all pass.

## Partition Strategy For Parallel Exploration
| Lane | Path segment | File count | Focus |
|---|---|---:|---|
| A | .docs | 1 | Existing internal docs context |
| B | .github/agents and [copilot-instructions.md](./../../.github/copilot-instructions.md) | 10 | Agent behavior and orchestration contracts |
| C | .github/instructions | 13 | Policy constraints and standards |
| D | .github/prompts | 8 | Prompt workflows and expected outputs |
| E | .github/skills/*/SKILL.md | 10 | Skill contracts, scope, and invocation guidance |
| F | .github/skills/*/references | 7 | Templates and canonical doc structures |

Execution policy:
- Run lanes A-F in parallel read-only passes.
- Merge evidence into one canonical claim ledger before writing docs.
- Author docs in deterministic order: core pages, directory indexes, file pages, coverage, validation.

## Documentation File Map To Be Created Or Updated
Core pages:
- [index.md](./../reference/index.md)
- [code-structure.md](./../reference/code-structure.md)
- [coverage-report.md](./../reference/coverage-report.md)

Directory indexes (mirror structure):
- [index.md](./../reference/.docs/index.md)
- [index.md](./../reference/.github/index.md)
- [index.md](./../reference/.github/agents/index.md)
- [index.md](./../reference/.github/instructions/index.md)
- [index.md](./../reference/.github/prompts/index.md)
- [index.md](./../reference/.github/skills/index.md)
- [index.md](./../reference/.github/skills/adr-generator/index.md)
- [index.md](./../reference/.github/skills/api-design/index.md)
- [index.md](./../reference/.github/skills/critical-thinking/index.md)
- .docs/reference/.github/skills/dotnet-modernization/index.md
- [index.md](./../reference/.github/skills/technical-documentation/index.md)
- [index.md](./../reference/.github/skills/technical-documentation/references/index.md)
- [index.md](./../reference/.github/skills/performance-research/index.md)
- [index.md](./../reference/.github/skills/performance-research/references/index.md)
- [index.md](./../reference/.github/skills/prd-generator/index.md)
- [index.md](./../reference/.github/skills/prd-generator/references/index.md)
- [index.md](./../reference/.github/skills/security-research/index.md)
- [index.md](./../reference/.github/skills/security-research/references/index.md)
- [index.md](./../reference/.github/skills/syrx-data-access/index.md)
- [index.md](./../reference/.github/skills/task-research/index.md)
- [index.md](./../reference/.github/skills/task-research/references/index.md)

File-level pages:
- For every file path in .docs/_workspace-file-inventory.txt, create or update
  .docs/reference/<source-path>.ref.md
- Expected file-level page count: 49
- Expected total docs impacted: 3 core + 21 directory indexes + 49 file pages = 73

## Coverage Calculation Method
Definitions:
- discovered_files = total inventory entries (49)
- excluded_files = files explicitly excluded with approved reason
- eligible_files = discovered_files - excluded_files
- documented_files = eligible files with existing generated page and status in {Created, Updated, Unchanged}

Formula:
- coverage_percent = (documented_files / eligible_files) * 100

Rules:
- If eligible_files = 0, set coverage_percent = 100 and record why.
- Report both global coverage and per-segment coverage.
- Coverage is valid only if each documented file has evidence references and link checks pass.

## Link Validation Method
Pass 1: file target resolution
- Parse all markdown links in .docs/reference.
- For relative file links, resolve path from current file and verify target exists.
- Record failures with source page, broken target, and reason.

Pass 2: anchor resolution
- For links with #anchor, normalize target headings using markdown-anchor normalization.
- Verify anchor exists in target document.
- Record missing anchors separately from missing files.

Pass 3: navigation sweep
- Start at [index.md](./../reference/index.md) and traverse all linked docs.
- Confirm coverage-report.md, code-structure.md, directory indexes, and file pages are reachable.

Pass criteria:
- dead_file_links = 0
- dead_anchor_links = 0
- unreachable_required_pages = 0

## Exclusion Register Policy
- Exclusions are allowed only with explicit reason and approver note in coverage-report.md.
- Required columns: Source Path, Reason, Decision Owner, Date.
- If no exclusions: record explicit line None with date and reviewer.

## Risks And Mitigations
| Risk | Category | Impact | Likelihood | Mitigation |
|---|---|---|---|---|
| Missing evidence for claims | Quality | High | Medium | Block publication until claim has source backing or explicit unknown marker |
| Broken links after file moves | Reliability | Medium | Medium | Re-run link validation after each structural update |
| Coverage inflation from weak status checks | Process | Medium | Medium | Count documented only when page exists and includes evidence section |
| Parallel lane drift in terminology | Consistency | Medium | Low | Merge through one canonical terminology pass before finalization |

## Completion Metrics
- 100 percent of inventory files appear in coverage matrix.
- 100 percent of exclusions have explicit reasons.
- All required baseline pages exist.
- All internal links and anchors pass validation.
- No non-evidence technical claim remains.

PLAN SUMMARY: Inventory-first technical reference documentation generation for 49 files.
Total Phases: 5 | Total Tasks: 17 | Risks: 4 (High: 1)
Next Action: Execute Phase 1 tasks and generate the normalized inventory manifest for doc production.

