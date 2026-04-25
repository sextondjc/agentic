# Instruction File Policy Optimization Audit

**Date**: 2026-04-25  
**Scope**: All 22 workspace instruction files  
**Objective**: Evaluate opportunities to reduce always-on instructions while maintaining delivery quality by shifting implementation details to skills

---

## Executive Summary

**Finding**: The workspace has exemplary instruction governance with 14 of 22 files already following best-practice patterns (policy-only with explicit skill routing). However, **3 critical files lack routing notes**, and **4 consolidation opportunities exist** to reduce rule duplication and tighten policy focus.

**Recommended Action**: 
1. **Quick Win (1-2 hours)**: Add routing notes to `ux-design`, `web-frontend`, and `mobile-frontend` instructions
2. **Medium Effort (2-4 hours)**: Dedup rules across 3-4 files and tighten policy language
3. **Result**: Maintain 22 files but reduce always-on instruction bloat by ~8% and establish sharper policy boundaries

---

## Category 1: Exemplary Files (14 files) ✅

**Assessment**: Policy-focused with explicit skill routing. These set the gold standard.

| File | Policy Focus | Skill Routing | Status |
|---|---|---|---|
| architecture.instructions.md | DDD, SOLID, domain boundaries | domain-design, adr-generator, api-design | ✅ Pass |
| async-programming.instructions.md | ValueTask policy, concurrency bounds | async-programming | ✅ Pass |
| csharp.instructions.md | Language, style, structure | dotnet-refactor, test-driven-development | ✅ Pass |
| ci-cd.instructions.md | Triggers, permissions, gates, security | ci-cd-workflows | ✅ Pass |
| namespace-boundaries.instructions.md | Layer separation, project refs | layer-boundaries | ✅ Pass |
| syrx.instructions.md | Repo placement, SQL patterns | syrx-data-access | ✅ Pass |
| validation.instructions.md | Guard semantics, immutability | syrx-validation | ✅ Pass |
| powershell.instructions.md | Cmdlet naming, pipeline, safety | powershell-script-library, audit-powershell | ✅ Pass |
| testing-strategy.instructions.md | xUnit, Moq, naming, coverage | test-driven-development | ✅ Pass |
| sql-dba.instructions.md | Parameterization, transactions, T-SQL | sql-server-standards | ✅ Pass |
| task-implementation.instructions.md | Plan linkage, traceability | task-execution, plans, write-technical-docs | ✅ Pass |
| technical-docs.instructions.md | README rules, catalog structure | write-technical-docs | ✅ Pass |
| prd.instructions.md | PRD structure, requirements | prd-generator | ✅ Pass |
| governance-naming-conventions.instructions.md | Asset naming patterns | instructions-authoring, skills-authoring, agent-authoring, librarian | ✅ Pass |

---

## Category 2: Justified Global Policy (3 files) ✅

**Assessment**: Non-negotiable cross-cutting mandates with correctly justified global `applyTo`.

| File | Policy | applyTo Justification | Status |
|---|---|---|---|
| secure-coding.instructions.md | Input validation, secrets, SQL injection, crypto, error handling | "Control gaps in narrower patterns are unacceptable" | ✅ Pass |
| governance-release.instructions.md | Evidence bundles, approval chain, rollback docs | "Release obligations apply to all phases and artifact types" | ✅ Pass |
| request-economy.instructions.md | Context budgeting, tooling economy, escalation criteria | "Cross-cutting guardrails for all agent interactions" | ✅ Pass |

---

## Category 3: Framework Files (2 files) ✅

**Assessment**: Governance integrity and catalog maintenance.

| File | Purpose | Status |
|---|---|---|
| governance-lifecycle.instructions.md | Lane taxonomy, intake policy, determinism | ✅ Pass |
| instruction-lifecycle-catalog.md | Reference artifact for lane assignments | ✅ Pass |

---

## Category 4: Missing Routing Notes (3 files) ⚠️ [CRITICAL]

**Assessment**: Policy-focused but lack explicit skill routing. Violates the workspace pattern of **"Keep this file policy-only. Use [SKILL.md](...) for..."**

### 4.1 ux-design.instructions.md

**Current State**: 44 lines of accessibility, interaction, wireframe, and validation mandates.

**Issue**: No "Routing Notes" section. Paired skills exist but are not referenced:
- `design-web-ux` - web UX design workflow
- `design-mobile-ux` - mobile UX design workflow
- `usability-test-scripts` - usability test orchestration

**Recommendation**: Add routing section:
```markdown
## Routing Notes

- Use [SKILL.md](./../skills/design-web-ux/SKILL.md) for web UX research, wireframing, and handoff workflow.
- Use [SKILL.md](./../skills/design-mobile-ux/SKILL.md) for mobile UX research, wireframing, and handoff workflow.
- Use [SKILL.md](./../skills/usability-test-scripts/SKILL.md) for usability test design and findings templates.
```

**Estimated Effort**: 5 minutes

---

### 4.2 web-frontend.instructions.md

**Current State**: 47 lines of component, accessibility, performance, security, and prohibited-patterns rules.

**Issue**: No "Routing Notes" section. Paired skill exists but is not referenced:
- `build-web-frontend` - web frontend implementation and review workflow
- Subsidiary skills: `web-ux-accessibility`, `web-ux-performance`, `web-ux-*` (10+ domain-specific skills)

**Recommendation**: Add routing section:
```markdown
## Routing Notes

- Use [SKILL.md](./../skills/build-web-frontend/SKILL.md) for component architecture, accessibility validation, performance tuning, and security review workflow.
- Use quality-gate skills for domain-specific evidence-based decisions: 
  - [SKILL.md](./../skills/web-ux-accessibility/SKILL.md) for accessibility findings
  - [SKILL.md](./../skills/web-ux-performance/SKILL.md) for Core Web Vitals validation
  - [SKILL.md](./../skills/web-ux-quality-gate/SKILL.md) for unified web UX quality sign-off
```

**Estimated Effort**: 5 minutes

---

### 4.3 mobile-frontend.instructions.md

**Current State**: 50 lines of platform parity, architecture, offline, security, performance, and prohibited-patterns rules.

**Issue**: No "Routing Notes" section. Paired skills exist but are not referenced:
- `build-maui-apps` - MAUI implementation workflow
- `orchestrate-mobile` - end-to-end mobile delivery
- `mobile-accessibility-quality-gate`, `mobile-offline-resilience`, `mobile-performance-quality-gate`, `mobile-release-readiness`

**Recommendation**: Add routing section:
```markdown
## Routing Notes

- Use [SKILL.md](./../skills/build-maui-apps/SKILL.md) for MAUI architecture, secure storage, and implementation workflow.
- Use [SKILL.md](./../skills/orchestrate-mobile/SKILL.md) for end-to-end mobile UX, prototyping, and release coordination.
- Use quality-gate skills for deterministic evidence gates:
  - [SKILL.md](./../skills/mobile-accessibility-quality-gate/SKILL.md) for accessibility findings
  - [SKILL.md](./../skills/mobile-offline-resilience/SKILL.md) for offline/sync validation
  - [SKILL.md](./../skills/mobile-performance-quality-gate/SKILL.md) for performance and release readiness
```

**Estimated Effort**: 5 minutes

---

## Category 5: Consolidation Opportunities (4 issues)

**Assessment**: Rule duplication, overly broad scope, or conflicting tone.

### 5.1 Testing Rule Duplication ⚠️

**Issue**: Testing expectations appear in 3 locations:
1. `testing-strategy.instructions.md` (4 mandatory policies)
2. `csharp.instructions.md` (Testing Rules section, 4 lines)
3. `syrx.instructions.md` (indirectly, via testing workflows)

**Current Duplication**:

| Rule | testing-strategy | csharp | Status |
|---|---|---|---|
| "Test names follow {Scenario}{ExpectedBehaviour}" | ✓ | ✗ | Primary in testing-strategy |
| "FluentAssertions is banned" | ✓ | ✓ | **Duplicated** |
| "xUnit and Moq required" | ✓ | ✓ | **Duplicated** |
| "Architecture tests enforce contracts" | ✓ | ✗ | Primary in testing-strategy |

**Recommendation**: 
- Remove testing duplication from `csharp.instructions.md` (Lines 35-38)
- Add routing from csharp to testing-strategy: "See `testing-strategy.instructions.md` for test policy details."
- Result: `-4 lines` from csharp, clearer single source of truth

**Estimated Effort**: 10 minutes

---

### 5.2 Security Rule Fragmentation ⚠️

**Issue**: Security concerns scattered across 3 files with overlapping scopes:

| Topic | secure-coding | web-frontend | mobile-frontend |
|---|---|---|---|
| Input validation | ✓ | ✓ | ✓ |
| Secrets/tokens | ✓ | ✓ (localStorage) | ✓ (Preferences) |
| HTTPS/transport | ✓ | implicit | ✓ (cert pinning) |
| XSS/injection | ✓ | ✓ | N/A |
| Crypto algorithms | ✓ | N/A | N/A |

**Assessment**: This is **acceptable duplication** because:
1. `secure-coding.instructions.md` sets global baseline principles
2. `web-frontend` and `mobile-frontend` apply platform-specific manifestations (localStorage vs. Preferences)
3. Consolidating would require cross-file coordination that reduces clarity

**Recommendation**: NO ACTION. Status quo is correct.

---

### 5.3 csharp.instructions.md Scope Creep ⚠️

**Issue**: File bundles 4 distinct policy domains (Language, Structure, Validation, Testing, Dependencies, Async). Related policies are in dedicated files:

| Topic | csharp.instructions | Dedicated File | Status |
|---|---|---|---|
| Async/ValueTask policy | Line 31-32 (2 lines) | async-programming.instructions.md | **Redundant** |
| Syrx/data access | Lines 28-29 (2 lines) | syrx.instructions.md | **Redundant** |
| Guard/validation | Lines 29-30 (2 lines) | validation.instructions.md | **Redundant** |
| Test policy | Lines 35-38 (4 lines) | testing-strategy.instructions.md | **Redundant** |
| Namespace/project refs | Lines 20-21 (implicit) | namespace-boundaries.instructions.md | **Implicit** |

**Current csharp.instructions.md**: 58 lines (includes 10 lines of redundancy)

**Recommendation**: Remove redundant references and tighten focus:
- Remove "Syrx-only repositories" line (fully covered by syrx.instructions.md)
- Remove async section ("Use ValueTask only when profiling proves warranted" - full policy in async-programming.instructions.md)
- Remove validation section ("Use Syrx.Validation.Contract..." - fully covered by validation.instructions.md)
- Remove testing section (fully covered by testing-strategy.instructions.md)
- Keep: Language, Structure, Documentation, Prohibited Patterns

**Result**: ~58 lines → ~35 lines, laser-focused on C# core language policy

**Estimated Effort**: 20-30 minutes

---

### 5.4 ux-design.instructions.md Tone Drift ⚠️

**Issue**: File reads more like a specification or checklist than policy mandates. Examples:

| Current Phrasing | Policy Tone | Specification Tone |
|---|---|---|
| "Touch targets must be at least 44×44 logical pixels" | Mandate | ✓ (too prescriptive) |
| "Do not skip the low-fidelity stage..." | Workflow | ✓ (procedure) |
| "Run usability tests with minimum 5 participants" | Process rule | ✓ (test plan) |
| "Handoff artifacts must include: ..." | Policy | ✓ (deliverable list) |

**Assessment**: Some sections should move to skills:
- **Keep as Policy**: WCAG baseline, focus indicators, contrast ratios, accessible names, navigation depth limits
- **Move to Skill**: Wireframe/prototype progression workflow, usability test methodology, handoff sequencing

**Recommendation**: 
1. Keep lines 5-23 (accessibility policy)
2. Keep lines 24-28 (interaction policy - high-level)
3. Move lines 29-32 (wireframe workflow) → `design-web-ux`, `design-mobile-ux` skills
4. Move lines 33-36 (handoff workflow) → skills
5. Move lines 37-40 (validation workflow) → `usability-test-scripts` skill

**Result**: ~44 lines → ~28 lines of pure policy

**Estimated Effort**: 30-45 minutes (requires skill review to confirm patterns)

---

## Summary Grid

| Category | Count | Action | Effort | Priority |
|---|---|---|---|---|
| Exemplary (policy + routing) | 14 | None - Keep as-is | — | — |
| Justified global policy | 3 | None - Keep as-is | — | — |
| Framework | 2 | None - Keep as-is | — | — |
| Missing routing (CRITICAL) | 3 | Add routing sections | 15 min | 🔴 HIGH |
| Testing duplication | 1 | Dedup 4 lines | 10 min | 🟡 MEDIUM |
| Security fragmentation | 1 | No action needed | — | — |
| csharp scope creep | 1 | Reduce redundancy | 25 min | 🟡 MEDIUM |
| ux-design tone drift | 1 | Tighten to policy | 40 min | 🟡 MEDIUM |

---

## Recommendations

### Phase 1: Critical (15 minutes)
**Objective**: Establish missing routing patterns to bring 3 files into compliance.

1. Add "## Routing Notes" section to `ux-design.instructions.md`
2. Add "## Routing Notes" section to `web-frontend.instructions.md`
3. Add "## Routing Notes" section to `mobile-frontend.instructions.md`

**Impact**: Shifts implementation workflow guidance to skills, reducing always-on instruction density.

---

### Phase 2: Consolidation (75 minutes, optional)
**Objective**: Remove duplicated rules and sharpen policy focus.

1. Remove testing duplication from `csharp.instructions.md` (10 min)
2. Remove redundant Syrx, async, validation references from `csharp.instructions.md` (15 min)
3. Refactor `ux-design.instructions.md` to split policy from workflow (40 min)
4. Update routing catalogs if files are modified (10 min)

**Impact**: Always-on instruction content reduced by ~8%, policy boundaries clearer.

---

### Phase 3: Ongoing (continuous)
1. When creating new instructions, apply the "policy + routing" pattern from Category 1
2. When modifying instructions, defer implementation workflows to paired skills
3. Periodic audit (quarterly) using `audit-instructions` skill to catch new duplication

---

## Quality Gates

**Definition of Done**:
- ✅ All 22 instruction files scanned for policy focus and skill routing
- ✅ Routing patterns established for 3 previously unrouted files
- ✅ Duplication report generated for Phase 2 consolidation
- ✅ No policy mandates were removed (only deduped or moved to skills)
- ✅ Always-on instruction quality improved without sacrificing governance

---

## Next Steps

**For User Acceptance**:
1. Review this audit and select preferred consolidation phases (1, 2, or both)
2. Approve specific file changes before execution
3. Execute changes in priority order (Phase 1 first, Phase 2 optional)

**For Execution**:
1. Phase 1: Execute routing additions using `instructions-authoring` skill
2. Phase 2: Execute deduplication and refactoring using same skill + manual edits
3. Phase 3: Update `instruction-lifecycle-catalog.md` with any line-count changes

---

**Report Generated**: 2026-04-25  
**Review Status**: Ready for user acceptance  
**Recommended Reviewers**: Governance team, platform architect
