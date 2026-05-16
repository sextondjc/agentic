# Instruction Audit Review: architecture

**Review Date:** 2025-04-20  
**Reviewer Skill:** audit-instructions  
**Target Instruction:** architecture.instructions.md  
**Target Path:** `.github/instructions/architecture.instructions.md`  
**Review Scope:** INR-M1 through INR-S5

## Summary Outcome Grid

| Field | Value |
|-------|-------|
| **Overall Outcome** | Pass With Advisories |
| **MUST Failures** | 0 |
| **SHOULD Advisories** | 1 |
| **Disposition** | Pass With Advisories |

## Standards Evaluation

| Standard | Result | Evidence | Notes |
|----------|--------|----------|-------|
| **INR-M1: Singular Policy Domain** | ✅ PASS | File scopes to single domain: Architecture Policy | Focus on DDD, SOLID, and .NET architecture. Comprehensive but single domain. |
| **INR-M2: Valid Frontmatter** | ✅ PASS | Name, description, applyTo all present; valid YAML | Frontmatter: `name: architecture`, `description: Consolidated DDD, SOLID, and .NET architecture...`, `applyTo: **/*.cs` |
| **INR-M3: applyTo Scope** | ✅ PASS | applyTo scoped to C# files; appropriate narrowing | Pattern `**/*.cs` correctly targets C# code. Not over-broad. |
| **INR-M4: Policy Only** | ⚠️ ADVISORY | Content includes policy but also contains additional sections beyond policy | File includes "Evolution Strategy", "Observability Hooks", and "Security Embedding" sections that appear to be procedural guidance rather than pure policy. Additionally, table in "Domain Model Rules" appears to show architecture decision examples rather than policy constraints. |
| **INR-S1: No Conflict with Other Instructions** | ✅ PASS | No contradictory rules vs other active instructions | Architecture policy aligns with csharp, syrx, namespace-boundaries, and secure-coding instructions. No conflicts detected. |
| **INR-S2: Rationale Present** | ✅ PASS | Non-obvious rules include rationale | Example: "Value objects must be immutable and compare by value" - rationale is domain-driven design principle. ADR requirement justified by decision traceability. |
| **INR-S3: No Agent/Skill Boundary Conflict** | ✅ PASS | Routing notes properly delegate to architecture skills | Delegates workflow to domain-design, adr-generator, and api-design skills. No boundary violations. |
| **INR-S4: Brevity & Wording Economy** | ⚠️ ADVISORY | File includes extended sections with operational guidance | Beyond policy, file includes "Evolution Strategy", "Observability Hooks", "Security Embedding", "Global Usings Guidance" with code examples. These sections blur the line between policy and procedural guidance. |
| **INR-S5: Growth Governance Alignment** | ✅ PASS | References existing skills; reuse-before-create pattern followed | No redundant rules. Delegates to skills. Delta-first approach. |

## Source Alignment Check

| Item | Status | Notes |
|------|--------|-------|
| **File Location** | ✅ Valid | Located at `.github/instructions/architecture.instructions.md`. |
| **Frontmatter Semantics** | ✅ Valid | `applyTo` pattern is valid glob. `name` matches file stem. |
| **Auto-Apply Behavior** | ✅ Correct | Will auto-apply to `*.cs` files. |

## Recommendations

| ID | Priority | Recommendation | Status |
|----|---------|----|--------|
| REC-001 | MEDIUM | Separate procedural/operational guidance (Evolution Strategy, Observability Hooks, Security Embedding, Global Usings examples) into a separate execution skill or guide. Keep architecture.instructions.md focused on policy constraints only. | Proposed |

## History Guard Check

| Check | Status | Notes |
|-------|--------|-------|
| **Deny-List Entries** | N/A | First audit; no deny-list entries. |
| **Suppressed Recommendations** | N/A | None exist. |

## Next Actions

- ✅ Audit complete. One medium-priority advisory (REC-001).
- File approved for continued use with note on advisory.
- Recommended: Refactor extended sections into skills or separate guidance documents.
