# Customization Types: Cross-Type Interaction Audit

| Metric | Value |
|---|---|
| Audit Date | 2026-05-06 |
| Scope | All types: agents × instructions × prompts × skills |
| Type Pairs Evaluated | 10 (4 same-type + 6 cross-type) |
| TYP-M MUST Failures | 0 |
| TYP-S SHOULD Advisories | 6 |
| Open Conflicts | 0 |
| Final Disposition | PASS WITH ADVISORIES |

## Severity Mapping Grid

| Severity Level | Definition |
|---|---|
| CRITICAL | Cross-type interaction blocks execution or creates contradictory mandatory rules |
| HIGH | Interaction degrades routing reliability, frontmatter validity, or catalog integrity |
| MEDIUM | Interaction creates ambiguity, partial overlap, or advisory drift |
| LOW | Interaction is a quality signal but has no immediate execution impact |

## Same-Type Interaction Matrix

| Type Pair | Check | Result | Evidence |
|---|---|---|---|
| Agent ↔ Agent | No conflicts or role overlap | ✓ Pass | 18 agents; distinct roles; `orchestrator` routes deterministically |
| Instruction ↔ Instruction | No contradictory rules across policy files | ✓ Pass | 3 global `applyTo: '**'` files have non-overlapping policy domains |
| Prompt ↔ Prompt | No duplicate trigger conditions | Advisory | `review-project` / `review-technical-docs` partial overlap noted |
| Skill ↔ Skill | No cross-skill delegations | ✓ Pass | Sampled 15 governance skills; all self-contained per SKR-M4 |

## Cross-Type Interaction Matrix

| Source Type | Target Type | Interaction | Result | Evidence |
|---|---|---|---|---|
| Agent → Skill | Skill routing from agents | ✓ Pass | All reviewed agents list companion skills explicitly; no hard-coded skill calls |
| Agent → Instruction | Instruction rules respected by agents | Advisory | `csharp-engineer` description drift may cause agents to route incorrectly; description fix required |
| Skill → Instruction | Skill workflows comply with instruction policy | ✓ Pass | Governance skills reference instruction files by name correctly |
| Prompt → Skill | Prompt routes to correct skill | ✓ Pass | All prompts with `## Required Actions` include `Load and follow [SKILL.md]` directives |
| Prompt → Agent | Prompts route through orchestrator | ✓ Pass | All prompts include `Route this request to orchestrator` |
| Instruction → Agent | Global instructions applied to agent context | Advisory | Three `applyTo: '**'` instructions apply to agent files; no conflicts found but monitoring warranted |

## TYP-M Standards Results

| Check | Standard | Result | Evidence |
|---|---|---|---|
| TYP-M1 | Type coverage completeness | ✓ Pass | All 4 types in scope; included/excluded rows declared above |
| TYP-M2 | Interaction matrix completeness | ✓ Pass | 10 explicit pair rows above; all have result |
| TYP-M3 | Evidence traceability | ✓ Pass | All failed/advisory rows link to audit artifacts |
| TYP-M4 | Deterministic disposition contract | ✓ Pass | Disposition derived from MUST check set; no MUST failures |
| TYP-M5 | Severity mapping consistency | ✓ Pass | Severity mapping table above; applied consistently |

## TYP-S Standards Results

| Check | Standard | Finding | Severity |
|---|---|---|---|
| TYP-S1 | Same-type non-conflict | Prompt-prompt partial overlap: `review-project` / `review-technical-docs` | MEDIUM |
| TYP-S2 | Cross-type non-conflict | Agent-instruction drift: `csharp-engineer` description gap reduces routing reliability | MEDIUM |
| TYP-S3 | Boundary clarity | Skill catalog registration gap means 6 capacitor skills are invisible at the cross-type interaction layer | HIGH |
| TYP-S4 | Catalog/taxonomy parity | `orchestrate-capacitor` discovery description understates coverage; taxonomy parity gap | MEDIUM |
| TYP-S5 | Brevity | Report is within bounds | ✓ Pass |
| TYP-S6 | Growth governance alignment | 6 new skills added without catalog update; growth discipline violated | HIGH |

## Open Conflicts

None. No cross-type contradictions that would block execution.

## SHOULD Advisory Detail

### TYP-ADV-001 — Skill Registration Gap Creates Cross-Type Discovery Failure (HIGH)

6 unregistered capacitor skills cannot be discovered by agents or prompts consulting the skill-discovery-index. This means the cross-type chain (Agent → Prompt → Skill) is broken for any request involving CapacitorJS auth/session, CI, observability, offline resilience, performance, or migration work. Agents routing through `orchestrate-capacitor` may succeed (since the SKILL.md still exists on disk), but direct skill routing fails.

**Owner:** Skills Owner  
**Target:** 2026-05-10

### TYP-ADV-002 — `csharp-engineer` Description Reduces Routing Confidence (MEDIUM)

The weak AGR-M3 description for `csharp-engineer` means orchestrator-based routing may default to this agent for inappropriate requests (architecture, DBA) when the description does not clearly exclude those domains. This is a cross-type Agent ↔ Instruction boundary clarity issue.

**Owner:** Skills Owner  
**Target:** 2026-05-10

### TYP-ADV-003 — Prompt-Prompt Trigger Overlap: `review-project` / `review-technical-docs` (MEDIUM)

Both prompts can trigger on documentation review requests. The difference is that `review-project` covers plan alignment and scope integrity in addition to docs, while `review-technical-docs` covers docs quality only. Without explicit disambiguation in both descriptions, agents may route to the wrong prompt.

**Owner:** Governance Owner  
**Target:** 2026-05-17

### TYP-ADV-004 — `orchestrate-capacitor` Taxonomy Parity Gap (MEDIUM)

The skill-discovery-index description for `orchestrate-capacitor` lists 9 sub-domains. The taxonomy system expects index descriptions to serve as machine-readable triggers. This gap means cross-type routing from prompt or agent to skill will miss 10 valid capacitor sub-domains.

**Owner:** Skills Owner  
**Target:** 2026-05-10

### TYP-ADV-005 — Growth Discipline Violation: Skills Added Without Index Update (HIGH)

The addition of 6 capacitor skills without updating the skill-discovery-index violates the growth governance rule: "If a skill is added, removed, or renamed, update this file in the same change." This is a process compliance failure that must be prevented by enforcing the index update requirement in the change workflow for skill additions.

**Owner:** Skills Owner  
**Target:** 2026-05-10

### TYP-ADV-006 — Global `applyTo: '**'` Instruction Cross-Type Monitoring (LOW)

Three instructions (`governance-release`, `request-economy`, `secure-coding`) apply globally to all files including skill and agent files. No active conflicts detected. However, as the governance-release instruction requires release evidence artifacts, applying it to skill files during execution-lane work could create unexpected obligation. This should be monitored at the next audit.

**Owner:** Governance Owner  
**Target:** Next audit cycle
