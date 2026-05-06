# Optimization Factor Audit

| Metric | Value |
|---|---|
| Audit Date | 2026-05-06 |
| Scope | All agents (18), instructions (21), prompts (21), skills (130 registered + 6 unregistered) |
| Total Artifacts in Scope | 196 |
| OPR-M MUST Failures | 2 |
| OPR-S SHOULD Advisories | 12 |
| Prior Run | 2026-04-24 (see governance-audit-types-optimization.md) |
| Final Disposition | FAILED |

## Consolidated Results Grid

| Asset Type | Count | OPR-M1 Pass | OPR-M2 Pass | OPR-M3 Pass | OPR-M4 Pass | OPR-S1 Pass | OPR-S2 Pass | OPR-S3 Pass | Type Outcome |
|---|---:|---|---|---|---|---|---|---|---|
| Agents | 18 | 17/18 | 18/18 | 18/18 | N/A | 16/18 | 18/18 | 18/18 | FAILED (1 MUST) |
| Instructions | 21 | 21/21 | 21/21 | 21/21 | N/A | 19/21 | 21/21 | 21/21 | Pass With Advisories |
| Prompts | 21 | 21/21 | 21/21 | 21/21 | N/A | 19/21 | 21/21 | 21/21 | Pass With Advisories |
| Skills (registered) | 130 | 130/130 | 130/130 | 129/130 | 130/130 | 122/130 | 128/130 | 127/130 | FAILED (1 MUST) |
| Skills (unregistered) | 6 | — | — | — | — | — | — | — | Blocked |

## MUST Failure Detail

### OPR-M-001 — `csharp-engineer`: Non-Deterministic Invocation Description (OPR-M2)

**Severity:** HIGH  
**Check:** OPR-M2 — Guidance uses testable, concrete directives without ambiguity.  
**Asset:** `csharp-engineer.agent.md`  
**Finding:** The `description` field reads `'Expert C#/.NET engineering agent consolidating craftsmanship, modernization, and performance guidance.'` This does not provide testable, concrete invocation conditions. A test question such as "should I route a .NET refactoring task here?" cannot be answered from this description alone.  
**Required Fix:** Replace with a concrete invocation directive (see AGR-M3-001 in [audit-agents.md](../../governance/audits/audit-agents.md)).

### OPR-M-002 — `orchestrate-capacitor` skill-discovery-index: Contradictory Trigger Description (OPR-M3)

**Severity:** HIGH  
**Check:** OPR-M3 — Artifact does not conflict with active governance instructions or catalogs.  
**Asset:** `skills-discovery-index.md` entry for `orchestrate-capacitor`  
**Finding:** The description conflicts with the actual SKILL.md content by omitting 10 sub-domain triggers. Agents using the index as ground truth receive contradictory results vs reading the SKILL.md directly.  
**Required Fix:** Update skill-discovery-index description to match actual scope of 19 domains.

## OPR-S Advisories by Asset Type

### Agents (2 advisories)

| Agent | Check | Finding | Severity |
|---|---|---|---|
| `governance-briefer` | OPR-S1 | Duplicate Hard Constraints section inflates file | LOW |
| `orchestrator` | OPR-S1 | H1 heading before `## Specialization` non-standard | LOW |

### Instructions (2 advisories)

| Instruction | Check | Finding | Severity |
|---|---|---|---|
| `secure-coding.instructions.md` | OPR-S1 | Language-specific Syrx rules without context qualifier | MEDIUM |
| `request-economy.instructions.md` | OPR-S1 | Escalation Criteria borders on workflow content | LOW |

### Prompts (2 advisories)

| Prompt | Check | Finding | Severity |
|---|---|---|---|
| `governance-audit-types.prompt.md` | OPR-S3 | Output Contract incomplete; missing column schema | MEDIUM |
| `governance-item-audit.prompt.md` | OPR-S3 | Output Contract incomplete; missing file path and schema | MEDIUM |

### Skills (6 advisories)

| Skill | Check | Finding | Severity |
|---|---|---|---|
| `build-mobile-apps` | OPR-S1 | Trigger section enumerates exhaustive framework list | LOW |
| `build-web-frontend` | OPR-S1 | When-to-use description slightly verbose | LOW |
| `design-web-ux` | OPR-S1 | Workflow steps partially duplicate skill description | LOW |
| `syrx-validation` | OPR-S3 | Output contract references unverified external template | MEDIUM |
| `governance-health-overview` | OPR-S1 | Freshness Policy repeated 3× in file body | LOW |
| `audit-agent` | OPR-S1 | Source Governance Rules and Workflow step 4 duplicate instructions | LOW |

## Ranked Remediation Grid

| Rank | Priority | Asset | Recommendation | Target Date | Owner |
|---|---:|---|---|---|---|
| 1 | HIGH | `csharp-engineer.agent.md` | Replace description with concrete invocation directive | 2026-05-10 | Skills Owner |
| 2 | HIGH | `skills-discovery-index.md` | Update `orchestrate-capacitor` description; add 6 missing skills | 2026-05-10 | Skills Owner |
| 3 | MEDIUM | `governance-audit-types.prompt.md` | Complete Output Contract section | 2026-05-17 | Governance Owner |
| 4 | MEDIUM | `governance-item-audit.prompt.md` | Complete Output Contract section | 2026-05-17 | Governance Owner |
| 5 | MEDIUM | `secure-coding.instructions.md` | Add language-context qualifier to .NET-specific rules | 2026-05-17 | Governance Owner |
| 6 | MEDIUM | `syrx-validation` SKILL.md | Verify output contract template reference | 2026-05-17 | Skills Owner |
| 7 | LOW | `governance-briefer.agent.md` | Remove duplicate Hard Constraints block | 2026-05-24 | Skills Owner |
| 8 | LOW | `governance-health-overview` SKILL.md | Consolidate Freshness Policy repetitions | 2026-05-24 | Skills Owner |
| 9 | LOW | `audit-agent` SKILL.md | Remove Source Governance Rules / Workflow duplication | 2026-05-24 | Skills Owner |
| 10 | LOW | `orchestrator.agent.md` | Remove or justify H1 before Specialization | 2026-05-24 | Skills Owner |
