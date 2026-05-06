# Audit: Agents

| Metric | Value |
|---|---|
| Audit Date | 2026-05-06 |
| Scope | All `.agent.md` files in `.github/agents/` |
| Total Agents Reviewed | 18 |
| MUST Failures | 1 |
| SHOULD Advisories | 4 |
| Final Disposition | FAILED |

## Aggregate Results Grid

| Agent | Outcome | AGR-M1 | AGR-M2 | AGR-M3 | AGR-M4 | AGR-S1 | AGR-S2 | AGR-S3 | AGR-S4 | AGR-S5 |
|---|---|---|---|---|---|---|---|---|---|---|
| orchestrator | Pass With Advisories | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | Advisory |
| topic-learner | Pass | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| plan-researcher | Pass | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| architecture-designer | Pass | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| csharp-engineer | **Fail** | ✓ | ✓ | **✗** | ✓ | ✓ | ✓ | ✓ | ✓ | Advisory |
| defect-debugger | Pass | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| sql-dba | Pass | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| workspace-scaffolder | Pass | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| powershell-reviewer | Pass | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| governance-briefer | Pass With Advisories | ✓ | ✓ | ✓ | ✓ | Advisory | ✓ | ✓ | ✓ | ✓ |
| manual-code-reviewer | Pass | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| code-reviewer | Pass | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| security-researcher | Pass | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| performance-assessor | Pass | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| benchmark-researcher | Pass | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| ux-designer | Pass | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| web-frontend-engineer | Pass | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| mobile-frontend-engineer | Pass | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |

## MUST Failures Detail

### AGR-M3-001 — `csharp-engineer`: Invocation Description Lacks Explicit Context

**Severity:** HIGH  
**Check:** AGR-M3 — Invocation description must be third-person, invocation-focused, stating what the agent does and **when to call it**.  
**Current description:** `'Expert C#/.NET engineering agent consolidating craftsmanship, modernization, and performance guidance.'`  
**Finding:** Description states what the agent knows but does not state when to invoke it. A reader cannot determine from the description alone whether to route .NET implementation, refactoring, testing, or architecture work here.  
**Required fix:**

```yaml
description: 'Use when implementing, modernizing, testing, or reviewing .NET/C# code with workspace canonical standards. Route debugging to defect-debugger and architecture boundary decisions to architecture-designer.'
```

## SHOULD Advisories Detail

### AGR-S1-001 — `governance-briefer`: Duplicate Hard Constraints Section

**Severity:** MEDIUM  
**Check:** AGR-S1 — Required body sections are present and non-duplicated.  
**Finding:** `governance-briefer.agent.md` contains two `## Hard Constraints` sections (lines ~17 and ~37). The second block is identical to the first. This creates ambiguity about which set of constraints is authoritative and inflates the file unnecessarily.  
**Recommendation:** Remove the duplicate block; retain the first occurrence.

### AGR-S5-001 — `orchestrator`: Platform Currency Advisory

**Severity:** LOW  
**Check:** AGR-S5 — New platform fields (`handoffs`, `hooks`, `disable-model-invocation`, `agents`, `model`) should be considered where they improve role clarity.  
**Finding:** The `orchestrator` agent does not declare `model` preferences or `agents` routing registry fields that could improve deterministic handoff behavior. These are optional but would strengthen routing reliability.  
**Recommendation:** Evaluate adding `model: claude-sonnet` (or equivalent) and an `agents` registry list aligned to `agents-discovery-index.md` to make orchestrator routing machine-readable.

### AGR-S5-002 — `csharp-engineer`: Platform Currency Advisory

**Severity:** LOW  
**Check:** AGR-S5 — New platform fields considered where they improve role clarity.  
**Finding:** `csharp-engineer` could benefit from a `model` field pinned to a reasoning-capable model given the complexity of its engineering tasks.  
**Recommendation:** Consider adding `model:` field after resolving the AGR-M3 description fix.

### AGR-S1-002 — `orchestrator`: Missing Explicit `## Specialization` Section Header

**Severity:** LOW  
**Check:** AGR-S1 — `## Specialization` should be the first body section after frontmatter.  
**Finding:** Orchestrator has the content but places it under `# Orchestrator Agent` heading followed directly by `## Specialization`. This is acceptable but the H1 heading before Specialization is non-standard. All other agents omit the H1.  
**Recommendation:** Remove the `# Orchestrator Agent` H1 heading or confirm it is intentional; document the exception.

## Summary Table

| MUST Failures | SHOULD Advisories | Agents Passing | Agents With Advisories | Agents Failing |
|---:|---:|---:|---:|---:|
| 1 | 4 | 15 | 2 | 1 |
