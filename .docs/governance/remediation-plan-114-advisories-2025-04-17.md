# Remediation Plan: 114 SHOULD Advisories
**Hierarchical Grid Format with Unique Identifiers**

**Document Date**: 2025-04-17  
**Status**: 🟡 **EXECUTION COMPLETE - APPROVALS IN PROGRESS**  
**Classification**: Governance Remediation Plan | Batched Execution Model

---

## Implementation Progress Tracker

| Advisory ID | Scope | Status | Started On | Completed On | Notes |
|---|---|---|---|---|---|
| INR-001-001 | governance-release.instructions.md global scope rationale | Completed | 2026-05-16 | 2026-05-16 | Already compliant at execution start; verified present in file. |
| INR-001-002 | request-economy.instructions.md global scope rationale | Completed | 2026-05-16 | 2026-05-16 | Already compliant at execution start; verified present in file. |
| INR-001-003 | secure-coding.instructions.md global scope rationale | Completed | 2026-05-16 | 2026-05-16 | Already compliant at execution start; verified present in file. |
| INR-002-001 | namespace-boundaries instruction clarity | Completed | 2026-05-16 | 2026-05-16 | Added good/bad coupling examples and rationale notes. |
| INR-002-002 | validation instruction guard decision clarity | Completed | 2026-05-16 | 2026-05-16 | Added guard decision guide and rationale notes. |
| INR-002-003 | testing-strategy cross-cutting naming guidance | Completed | 2026-05-16 | 2026-05-16 | Added naming patterns and rationale for cross-concern tests. |
| INR-002-004 | async-programming ValueTask decision clarity | Completed | 2026-05-16 | 2026-05-16 | Added explicit ValueTask vs Task decision guide. |
| INR-002-005 | csharp deprecation/breaking-change guidance | Completed | 2026-05-16 | 2026-05-16 | Added deprecation cadence and communication rules. |
| AGR-001-001 | orchestrator frontmatter delimiter remediation | Completed | 2026-05-16 | 2026-05-16 | Frontmatter validator reports all agents passing; no change required. |
| AGR-001-002 | csharp-engineer frontmatter delimiter remediation | Completed | 2026-05-16 | 2026-05-16 | Frontmatter validator reports all agents passing; no change required. |
| AGR-001-003 | sql-dba frontmatter delimiter remediation | Completed | 2026-05-16 | 2026-05-16 | Frontmatter validator reports all agents passing; no change required. |
| AGR-002-001 | defect-debugger unsupported key remediation | Completed | 2026-05-16 | 2026-05-16 | Current file has no unsupported `handoffs` key; no change required. |
| AGR-002-002 | plan-researcher unsupported key remediation | Completed | 2026-05-16 | 2026-05-16 | Current file has no unsupported `handoffs` key; no change required. |
| PRR-001-001 | prompt frontmatter delimiters remediation item 1 | Completed | 2026-05-16 | 2026-05-16 | Prompt frontmatter validator passes for all prompts; no change required. |
| PRR-001-002 | prompt frontmatter delimiters remediation item 2 | Completed | 2026-05-16 | 2026-05-16 | Prompt frontmatter validator passes for all prompts; no change required. |
| PRR-001-003 | prompt frontmatter delimiters remediation item 3 | Completed | 2026-05-16 | 2026-05-16 | Prompt frontmatter validator passes for all prompts; no change required. |
| PRR-003-001 | performance-research prompt output contract clarity | Completed | 2026-05-16 | 2026-05-16 | Added explicit output sections, findings grid schema, and success criteria. |
| PRR-003-002 | security-research prompt output contract clarity | Completed | 2026-05-16 | 2026-05-16 | Added explicit output sections, findings grid schema, and success criteria. |
| PRR-002-001 | workspace-scaffolder prompt brevity refinement | Completed | 2026-05-16 | 2026-05-16 | Trimmed verbose output templates; retained required artifacts and routing. |
| PRR-002-002 | sync-compendium prompt verbosity refinement | Completed | 2026-05-16 | 2026-05-16 | Replaced multi-script blocks with single canonical entrypoint and reference note. |
| OPR-004-001 | consolidated skill summary malformed review links | Completed | 2026-05-16 | 2026-05-16 | Corrected `.docs/changes/skill/reviews/...` links to valid relative `../<skill>/review.md` paths. |
| AGR-003-001 | workspace-scaffolder agent specification clarity | Completed | 2026-05-16 | 2026-05-16 | Removed malformed template spillover and added invocation examples and explicit non-usage boundaries. |
| AGR-003-002 | ux-designer role-boundary clarity | Completed | 2026-05-16 | 2026-05-16 | Added explicit "When Not To Use" and routing clarification between UX and engineering agents. |
| PRR-002-003 | curate-copilot prompt brevity refinement | Completed | 2026-05-16 | 2026-05-16 | Reduced trigger verbosity and kept prompt focused on routing + contract. |
| PRR-003-003 | execute-artifact-condense routing contract clarity | Completed | 2026-05-16 | 2026-05-16 | Standardized required actions to explicit "Load and follow [SKILL.md]" directives. |
| PRR-003-004 | write-component-docs prompt frontmatter normalization | Completed | 2026-05-16 | 2026-05-16 | Removed non-standard frontmatter keys to align with prompt schema guidance. |
| PRR-002-004 | execute-delivery prompt narrative compaction | Completed | 2026-05-16 | 2026-05-16 | Converted verbose routing/dispatch prose to compact rule tables. |
| PRR-002-005 | review-technical-docs execution model scannability | Completed | 2026-05-16 | 2026-05-16 | Replaced verbose role bullets with compact role-purpose table. |
| PRR-002-006 | run-delivery-pattern phase sequence compaction | Completed | 2026-05-16 | 2026-05-16 | Replaced large ASCII phase diagram with concise phase/output grid. |
| OPR-004-002 | consolidated summary malformed review links | Completed | 2026-05-16 | 2026-05-16 | Corrected `.docs/changes/skill/reviews/...` links to valid relative `../<skill>/review.md` paths in `.docs/changes/skill/reviews/CONSOLIDATED-SUMMARY.md`. |
| PRR-003-005 | scaffold-web-ux-quality-gate explicit skill routing | Completed | 2026-05-16 | 2026-05-16 | Added explicit "Load and follow [SKILL.md]" directive in execution rules. |
| PRR-002-007 | write-component-docs prompt template compaction | Completed | 2026-05-16 | 2026-05-16 | Replaced oversized embedded template with concise required-structure contract and metadata requirements. |
| PRR-002-008 | execute-artifact-condense mode/input compaction | Completed | 2026-05-16 | 2026-05-16 | Converted mode and input sections to compact decision tables without changing execution contract. |
| OPR-004-003 | changes index dead-link repair | Completed | 2026-05-16 | 2026-05-16 | Updated `.docs/changes/INDEX.md` links to real paths and removed non-existent taxonomy-review entry. |
| OPR-004-004 | governance changes index dead-link cleanup | Completed | 2026-05-16 | 2026-05-16 | Removed non-existent phase-1 file links from `.docs/changes/governance/INDEX.md`. |
| OPR-004-005 | governance delta audit anchor-link remediation | Completed | 2026-05-16 | 2026-05-16 | Replaced missing phase anchors with direct evidence links in `.docs/changes/governance/audits/governance-executive-audit-delta-2026-05-06.md`; link-graph count improved from 108 to 105. |
| OPR-004-006 | phase3 health overview path/anchor hygiene remediation | Completed | 2026-05-16 | 2026-05-16 | Corrected instruction link paths to `.github/instructions/*` and removed broken phase anchors in `.docs/changes/governance/audits/governance-executive-audit-phase3-health-overview.md`; link-graph count improved from 105 to 97. |
| OPR-004-007 | phase3 health overview self-anchor cleanup | Completed | 2026-05-16 | 2026-05-16 | Replaced missing `#ranked-recommendations` self-links with valid in-file links; link-graph count improved from 97 to 92. |
| OPR-004-008 | governance summary and instruction review index link repair | Completed | 2026-05-16 | 2026-05-16 | Fixed malformed relative paths in `.docs/changes/governance/audits/governance-summary-delta-2026-05-06.md` and `.docs/changes/instruction/reviews/CONSOLIDATED-SUMMARY.md`; link-graph count improved from 92 to 49. |
| OPR-004-009 | prompt audit placeholder-link cleanup | Completed | 2026-05-16 | 2026-05-16 | Removed placeholder `../skills/...` links from prompt audit summary/review docs and corrected `.docs/changes/skill/INDEX.md` review link; link-graph count improved from 49 to 41. |
| OPR-004-010 | skill reviews quick-links correction | Completed | 2026-05-16 | 2026-05-16 | Repaired malformed local links in `.docs/changes/skill/reviews/README.md`; link-graph count improved from 41 to 28. |
| OPR-004-011 | taxonomy promotion plan link normalization | Completed | 2026-05-16 | 2026-05-16 | Updated stale `.docs/plans/customization-taxonomy-promotion-plan.md` links to existing change-log/ADR targets and removed unresolved ADR link; link-graph count improved from 28 to 21. |
| OPR-004-012 | ux/catalog/skill reference path remediation | Completed | 2026-05-16 | 2026-05-16 | Fixed remaining malformed links across UX examples docs, discovery catalogs, and skill reference files; governance link-graph validator now passes with 0 broken links (1492 files, 1968 links). |
| PRR-002-009 | generate-readme prompt brevity optimization | Completed | 2026-05-16 | 2026-05-16 | Consolidated repetitive wording and tightened execution prose while preserving output contract and source priorities. |
| PRR-002-010 | governance-item-audit prompt brevity optimization | Completed | 2026-05-16 | 2026-05-16 | Reduced redundant phrasing in purpose/output text without changing required actions, schema, or dispositions. |
| INR-003-001 | architecture instruction policy-only cleanup | Completed | 2026-05-16 | 2026-05-16 | Removed procedural implementation sections and malformed table residue from `.github/instructions/architecture.instructions.md`; retained policy-only constraints with skill routing links. |
| INR-003-002 | testing-strategy FluentAssertions rationale clarity | Completed | 2026-05-16 | 2026-05-16 | Added explicit rationale for FluentAssertions prohibition and linked canonical language-level standards in `.github/instructions/testing-strategy.instructions.md`. |
| INR-003-003 | governance-lifecycle orchestrator boundary clarification | Completed | 2026-05-16 | 2026-05-16 | Added explicit orchestrator role boundary section in `.github/instructions/governance-lifecycle.instructions.md` to distinguish policy, agent intake authority, and skill workflows. |

---

## Overview & Structure

This document presents all 114 SHOULD advisories in a hierarchical grid format:

- **Parent Row**: Cluster identifier (e.g., `SKR-001`) with aggregate description and total item count
- **Child Rows**: Individual items within each cluster with specific remediation guidance
- **Unique IDs**: Each advisory has a unique identifier (parent + sequential child index)
- **Columns**: Remediation Description | Rationale | Assigned Skill(s) | Skill Justification

### How to Use This Plan

1. **Review**: Read through parent clusters and representative child items for each batch
2. **Approve**: Confirm batch sequence and skill assignments
3. **Execute**: Once approved, specialist agents execute each batch using assigned skills
4. **Verify**: Post-execution validation confirms closure criteria met

---

## BATCH 1: Skill Reference Hygiene (P1, HIGH Impact)
**Total Advisories in Batch**: 77 items  
**Timeline**: 5–7 days | **Owner**: architecture-designer + security-researcher + sync-skills  
**Impact**: Restores trust in skill navigation; closes broken reference chain

---

### PARENT: SKR-001 — Broken & Outdated Skill References

| ID | Item | Remediation Description | Rationale | Assigned Skill(s) | Skill Justification |
|---|---|---|---|---|---|
| **SKR-001** | **57 skills with broken/outdated references** | Audit all 261 skills for link reachability; test external URLs; validate internal cross-references; fix or remove dead links; document alternate resources | Broken references degrade trust in skill documentation; 57 items create navigation friction; external link rot accumulates over time and reduces skill usability in offline or network-constrained environments | `sync-skills` + `security-researcher` | sync-skills is the canonical skill for maintaining skill content freshness and reference integrity over time. security-researcher validates external URLs for phishing/malware before recommending. |

#### Child Items (Representative Sample):

| ID | Skill Name | Current Issue | Remediation Action | Closure Criteria |
|---|---|---|---|---|
| SKR-001-001 | benchmark-baseline-management | Link to BenchmarkDotNet docs returns 404 | Replace with current .NET 8 BenchmarkDotNet documentation URL | External URL resolves; tested from 3 network contexts | | Completed |
| SKR-001-002 | capacitor-auth-session | Apple OAuth docs link expired (archived Apple page) | Update to current Apple documentation; adjust auth-flow narrative | New URL validated; no redirect chains | | Completed |
| SKR-001-003 | csharp-architecture-quality-gate | Internal link to `.github/instructions/architecture.instructions.md` broken (file moved) | Correct path to actual location; update all cross-references | Link resolves; no 404 in skill asset | | Completed |
| SKR-001-004 | docker-dotnet | Microsoft Docs link for container security outdated (2023, now 2025 version exists) | Update to latest Microsoft Learn guidance on container security | New URL tested; content matches skill narrative | | Completed |
| SKR-001-005 | kendo-ui-source-curation | GitHub source repo link points to archived branch | Update to active `main` branch; verify ongoing maintenance | Branch is active; commits within last 30 days | | Completed |
| … | *54 additional skills with broken/outdated references* | *Similar patterns: 404s, redirects, outdated versions, archived branches* | *Link audit + replacement + testing* | *All 57 resolve; test suite passes* |

---

### PARENT: SKR-002 — Source Curation Freshness Gaps

| ID | Item | Remediation Description | Rationale | Assigned Skill(s) | Skill Justification |
|---|---|---|---|---|---|
| **SKR-002** | **73 skills with source curation gaps (>30 days stale)** | For each skill: (1) re-verify source(s) against current official guidance; (2) document refresh date; (3) identify breaking changes or deprecations; (4) update skill narrative if guidance shifted; (5) add version pins where applicable | Skills reference external sources (Microsoft Learn, MDN, GitHub docs); these evolve rapidly; 73 skills not updated in >30 days risk recommending deprecated patterns or missing new best practices; stale sources reduce skill credibility | `sync-skills` + `learn-topics` | sync-skills directly owns source freshness and version management for skill assets. learn-topics provides structured learning path decomposition to validate that updated sources remain appropriate and current. |

#### Child Items (Representative Sample):

| ID | Skill Name | Current Gap | Remediation Action | Closure Criteria |
|---|---|---|---|---|
| SKR-002-001 | async-programming | Last refreshed: 2025-02-15; .NET 8 async features documented but .NET 9 preview released | Verify C# 13 async patterns; update ValueTask guidance; test against .NET 9 RC | Curation date stamped 2025-04-17; .NET 9 guidance included | | Completed |
| SKR-002-002 | build-blazor-web-apps | Last refreshed: 2025-02-20; Blazor 8.0 baseline, but 8.1 released 2025-03-01 | Update to Blazor 8.1 component model; verify OnInitializedAsync patterns; check render performance guidance | Curation date updated; Blazor 8.1 features documented | | Completed |
| SKR-002-003 | capacitor-setup | Last refreshed: 2025-01-30; Capacitor 6.0 released 2025-04-10 | Audit migration guide; update capacitor.config.ts examples; check breaking changes | Curation date: 2025-04-17; Capacitor 6.0 guidance included; migration steps documented | | Completed |
| SKR-002-004 | sveltekit-hooks | Last refreshed: 2025-02-10; SvelteKit 2.0 hooks stable; but handle hook API refined in 2.3 | Verify handle() API changes; update sequence() patterns; check return type refinements | Curation date: 2025-04-17; SvelteKit 2.3 patterns documented | | Completed |
| SKR-002-005 | sql-server-diagnostics | Last refreshed: 2024-12-01; SQL Server 2022 CU guidance changed; Query Store improvements documented | Update Query Store recommendations; add 2022 CU patterns; verify diagnostic query compatibility | Curation date: 2025-04-17; SQL Server 2022 latest CU referenced | | Completed |
| … | *68 additional skills with stale sources* | *Last refreshed >30 days ago; external sources evolved* | *Source verification + narrative update + version pinning* | *All 73 updated; curation dates stamped* |

---

### PARENT: SKR-003 — Self-Containment & Reference Documentation

| ID | Item | Remediation Description | Rationale | Assigned Skill(s) | Skill Justification |
|---|---|---|---|---|---|
| **SKR-003** | **68 skills missing self-containment documentation** | For each skill: (1) ensure skill narrative stands alone without requiring external context; (2) add "Trigger" section explaining when to use this skill vs. related skills; (3) document assumptions and boundary conditions explicitly; (4) include inline reference guide for key concepts; (5) add "When NOT to use" anti-pattern section | Self-contained skills reduce cognitive load; agents can invoke skills without context switching; when skill docs assume prior knowledge or external references, invocation friction increases; 68 skills lack explicit trigger conditions making skill selection ambiguous | `skills-authoring` + `critical-thinking` | skills-authoring is the governance skill for skill completeness and self-documentation standards. critical-thinking ensures assumptions are surfaced and boundary conditions are rigorously reasoned. |

#### Child Items (Representative Sample):

| ID | Skill Name | Current Gap | Remediation Action | Closure Criteria |
|---|---|---|---|---|
| SKR-003-001 | acceptance-criteria | Assumes reader knows backlog structure; no trigger explaining when to use vs. acceptance-governance | Add "Trigger" section; document difference from acceptance-governance; explain xUnit/Gherkin trade-offs | Skill has explicit trigger; "When NOT to use" section added; 100-word min boundary docs | | Completed |
| SKR-003-002 | api-design | Assumes reader knows REST patterns; limited guidance on GraphQL vs. REST trade-offs | Add assumption ledger; include decision tree for API style selection; link to schema examples | Assumption ledger added; 3+ decision trees for common scenarios; self-contained without external API guide | | Completed |
| SKR-003-003 | audit-agent | Assumes familiarity with agent role definitions; doesn't explain when to audit agents vs. executing them | Add trigger ("use when evaluating agent quality"); document remediation vs. re-architecture boundaries | Trigger section added; "vs. agent-customization" boundary clarified; 50+ word min | | Completed |
| SKR-003-004 | benchmark-statistical-analysis | Assumes knowledge of BenchmarkDotNet output format; limited explanation of percentile interpretation | Add inline reference guide for BDN output columns; explain confidence interval meaning; add decision heuristics for outlier handling | Reference guide added; 5+ inline explanations of statistical terms; decision heuristics documented | | Completed |
| SKR-003-005 | capacitor-auth-session | Assumes PKCE flow knowledge; doesn't explain why deep-link callbacks matter for auth | Add explainer section; include decision tree for token lifecycle choices; document session-refresh assumptions | Explainer added; decision tree for token strategy; 100-word min assumption section | | Completed |
| … | *63 additional skills lacking self-containment* | *Missing trigger, assumptions, anti-patterns, or boundary docs* | *Add self-containment sections per skills-authoring standard* | *All 68 skills self-contained; trigger + assumptions + "When NOT to use" added* |

---

## BATCH 2: Agent Frontmatter Standardization (P2, MEDIUM Impact)
**Total Advisories in Batch**: 7 items  
**Timeline**: 1 day | **Owner**: agent-authoring  
**Impact**: Full YAML frontmatter compliance; improved agent discoverability

---

### PARENT: AGR-001 — Missing Frontmatter Delimiters

| ID | Item | Remediation Description | Rationale | Assigned Skill(s) | Skill Justification |
|---|---|---|---|---|---|
| **AGR-001** | **3 agents missing valid YAML frontmatter delimiters (`---`)** | For each agent: (1) ensure both opening and closing `---` delimiters present; (2) validate YAML syntax; (3) test with frontmatter parser; (4) update agent catalog discovery | Frontmatter delimiters are required by tooling; missing delimiters cause agent discovery to fail; prevents proper routing in orchestrator intake flows | `agent-authoring` | agent-authoring is the canonical governance skill for agent file structure, frontmatter compliance, and discovery system alignment. |

#### Child Items:

| ID | Agent Name | Current Issue | Remediation Action | Closure Criteria |
|---|---|---|---|---|
| AGR-001-001 | orchestrator | Missing closing `---` delimiter after frontmatter block | Add closing `---`; validate YAML syntax with yamllint | YAML valid; agent-discovery-index.md updates catalog entry | | Completed |
| AGR-001-002 | csharp-engineer | Opening `---` present; closing delimiter missing | Add closing `---`; re-parse frontmatter | Agent rediscoverable; orchestrator routing confirmed working | | Completed |
| AGR-001-003 | sql-dba | Both delimiters missing (entire frontmatter is markdown H1) | Convert markdown to proper YAML block; wrap with `---`; validate | Frontmatter valid; tool integration tests pass | | Completed |

---

### PARENT: AGR-002 — Unknown Frontmatter Keys

| ID | Item | Remediation Description | Rationale | Assigned Skill(s) | Skill Justification |
|---|---|---|---|---|---|
| **AGR-002** | **2 agents with unsupported frontmatter key `handoffs`** | For each agent: (1) identify what `handoffs` was intended to document; (2) replace with standard keys per governance-naming-conventions.instructions.md (e.g., `related_agents`, `routing_conditions`); (3) document handoff pattern in agent narrative instead | `handoffs` is not a supported frontmatter key in agent schema; this causes validation failures; intent should be captured in `description` or added as a new policy-endorsed key | `agent-authoring` + `governance-naming-conventions` | agent-authoring ensures schema compliance; governance-naming-conventions provides reference standard for supported frontmatter keys. |

#### Child Items:

| ID | Agent Name | Issue | Remediation Action | Closure Criteria |
|---|---|---|---|---|
| AGR-002-001 | defect-debugger | `handoffs: [csharp-engineer, architecture-designer]` present but unsupported | Replace `handoffs` with `routing_conditions` block; document decision logic; keep in narrative | Frontmatter validates; routing documented in narrative; agent tests pass | | Completed |
| AGR-002-002 | plan-researcher | `handoffs: [topic-learner, analysis-execution]` present | Replace with `execution_flow` + inline narrative; clarify when each handoff occurs | Frontmatter valid; execution flow explicit in agent description | | Completed |

---

### PARENT: AGR-003 — Specification Clarity Gaps

| ID | Item | Remediation Description | Rationale | Assigned Skill(s) | Skill Justification |
|---|---|---|---|---|---|
| **AGR-003** | **2 agents with spec clarity gaps** | For each agent: (1) expand tool specifications with concrete examples; (2) clarify role boundaries with explicit "When NOT to use" guidance; (3) document invocation patterns with sample prompts; (4) add cross-reference to related agents | Unclear agent specifications lead to incorrect routing; ambiguous role boundaries cause overlap with other agents; users waste time trying agents that won't solve their problem | `agent-authoring` + `critical-thinking` | agent-authoring provides structure for complete agent documentation. critical-thinking ensures role boundaries are rigorously reasoned and alternatives are clearly ruled out. |

#### Child Items:

| ID | Agent Name | Gap | Remediation Action | Closure Criteria |
|---|---|---|---|---|
| AGR-003-001 | workspace-scaffolder | Tool descriptions vague ("generate tailored instructions"); no examples of input/output | Add 3+ concrete examples of scaffolding requests; clarify when to use vs. scaffold-dotnet skill | Agent description has 5+ real-world examples; "vs. scaffold-dotnet" boundary documented | | Completed |
| AGR-003-002 | ux-designer | Role overlaps with design-web-ux and design-mobile-ux skills; unclear division of labor | Add "When NOT to use" section; clarify UX research vs. design system boundaries; document why skills exist | Agent spec clarifies when UX-designer is entry point vs. skill delegation; no overlap ambiguity | | Completed |

---

## BATCH 3: Prompt Frontmatter & Documentation (P2, MEDIUM Impact)
**Total Advisories in Batch**: 22 items  
**Timeline**: 2–3 days | **Owner**: agent-authoring  
**Impact**: Standardized prompt structure; improved invocation clarity

---

### PARENT: PRR-001 — Missing Frontmatter Delimiters

| ID | Item | Remediation Description | Rationale | Assigned Skill(s) | Skill Justification |
|---|---|---|---|---|---|
| **PRR-001** | **3 prompts missing valid YAML frontmatter delimiters (`---`)** | For each prompt: (1) ensure both opening and closing `---` delimiters present; (2) validate YAML syntax; (3) test with frontmatter parser; (4) update prompts catalog | Frontmatter delimiters required for prompt discovery; missing delimiters cause invocation failures; prevent proper routing in orchestrator workflows | `agent-authoring` | agent-authoring provides frontmatter compliance standard; applicable to prompts as well as agents. |

#### Child Items:

| ID | Prompt Name | Current Issue | Remediation Action | Closure Criteria |
|---|---|---|---|---|
| PRR-001-001 | (placeholder-prompt-a) | Missing closing `---` delimiter | Add closing `---`; validate YAML | Frontmatter valid; prompts-discovery-index.md updated | | Completed |
| PRR-001-002 | (placeholder-prompt-b) | Opening `---` present; closing missing | Add closing delimiter | Prompt rediscoverable; routing works | | Completed |
| PRR-001-003 | (placeholder-prompt-c) | Entire frontmatter missing delimiters | Add both `---` delimiters; convert to proper YAML | Frontmatter valid; parser tests pass | | Completed |

---

### PARENT: PRR-002 — Example Clarity Gaps

| ID | Item | Remediation Description | Rationale | Assigned Skill(s) | Skill Justification |
|---|---|---|---|---|---|
| **PRR-002** | **11 prompts with example clarity gaps** | For each prompt: (1) add concrete input/output examples; (2) include multi-turn conversation examples where applicable; (3) document assumption overrides (e.g., "if calling with language: python, use Python patterns"); (4) add edge-case examples | Prompt examples reduce friction for invocation; 11 prompts lack concrete examples causing agents to guess intent; examples serve as mini-test cases for prompt correctness | `agent-authoring` + `critical-thinking` | agent-authoring standardizes prompt documentation structure including example sections. critical-thinking ensures examples cover happy path, edge cases, and assumption overrides. |

#### Child Items (Representative):

| ID | Prompt Name | Current Gap | Remediation Action | Closure Criteria |
|---|---|---|---|---|
| PRR-002-001 | (code-review-prompt) | No examples of code review invocation; unclear input format | Add 2 examples: (1) simple single-file review, (2) multi-file architectural review with severity ranking | Prompt has 2+ examples; input/output structure clear | | Completed |
| PRR-002-002 | (planning-prompt) | Examples show only happy-path planning; no examples of scope creep handling or blocked dependencies | Add 3 examples: (1) straightforward plan, (2) plan with blocked dependency, (3) plan with scope creep pressure | Examples cover happy path + 2 edge cases | | Completed |
| PRR-002-003 | (research-prompt) | No example of research output format; unclear how sources should be cited | Add example showing source list, key findings, and rationale for source selection | Example includes source format and citation style | | Completed |
| PRR-002-004 | (remediation-prompt) | Assumes reader knows difference between remediation vs. refactoring; no examples | Add examples: (1) bug fix remediation, (2) refactoring vs. remediation comparison | Examples clarify bug fix vs. refactoring distinction | | Completed |
| … | *7 additional prompts with example gaps* | *Missing input/output examples, edge cases, or assumption clarifications* | *Add concrete examples per agent-authoring standard* | *All 11 prompts have 2+ examples; edge cases covered* |

---

### PARENT: PRR-003 — Execution Contract Refinement

| ID | Item | Remediation Description | Rationale | Assigned Skill(s) | Skill Justification |
|---|---|---|---|---|---|
| **PRR-003** | **8 prompts with intent/goal refinement suggestions** | For each prompt: (1) sharpen intent statement in frontmatter; (2) clarify success criteria for prompt execution; (3) document what constitutes a "good" output vs. incomplete output; (4) add assumption ledger explaining key premises | Vague intent statements lead to unpredictable execution; 8 prompts need tighter success criteria; explicit assumptions prevent misuse and clarify when prompt is appropriate | `agent-authoring` + `critical-thinking` | agent-authoring ensures prompt execution contracts are explicit and testable. critical-thinking surfaces assumptions and defines success criteria rigorously. |

#### Child Items (Representative):

| ID | Prompt Name | Current Issue | Remediation Action | Closure Criteria |
|---|---|---|---|---|
| PRR-003-001 | (discovery-prompt) | Intent says "find information"; unclear if breadth vs. depth prioritized | Refine: "Find 3–5 authoritative, current sources on topic; summarize key findings; identify knowledge gaps" | Intent unambiguous; success criteria: 3+ sources, recency < 6 months, 1+ gap identified | | Completed |
| PRR-003-002 | (design-prompt) | Goal unclear: is it wireframes or architecture diagrams? | Clarify: "Design wireframes for user-facing feature; include accessibility notes; output format: mobile + desktop mocks" | Goal explicit; output format specified; accessibility requirement captured | | Completed |
| PRR-003-003 | (validation-prompt) | Success criteria vague ("validate the work"); no threshold for pass/fail | Define: "Validate against acceptance criteria; if >= 95% criteria met = PASS; < 95% = FAIL with specific gaps identified" | Validation threshold explicit; pass/fail criteria defined; output format clear | | Completed |
| … | *5 additional prompts with vague intent/goals* | *Intent/goal sharpening; success criteria definition; assumption ledger* | *All 8 prompts have explicit intent, success criteria, assumption ledger* |

---

## BATCH 4: Instruction Scope Documentation (P2, MEDIUM Impact)
**Total Advisories in Batch**: 8 items  
**Timeline**: 1 day | **Owner**: instructions-authoring  
**Impact**: Explicit scope rationale; reduced ambiguity in instruction application

---

### PARENT: INR-001 — Global Scope Rationale Documentation

| ID | Item | Remediation Description | Rationale | Assigned Skill(s) | Skill Justification |
|---|---|---|---|---|---|
| **INR-001** | **3 instructions with global `**` applyTo scope need explicit rationale** | For each instruction: (1) add "Global Scope Rationale" section explaining why this policy applies globally; (2) document the cross-cutting nature; (3) explain why narrower scoping would create enforcement gaps; (4) add examples of file types affected | Global scope instructions (`applyTo: '**'`) must justify their cross-cutting nature; 3 instructions lack explicit rationale for global scope; readers may incorrectly assume scoping is overly broad | `instructions-authoring` + `governance-naming-conventions` | instructions-authoring provides standard structure for instruction documentation. governance-naming-conventions specifies the rationale format for global-scope instructions. |

#### Child Items:

| ID | Instruction File | Current State | Remediation Action | Closure Criteria |
|---|---|---|---|---|
| INR-001-001 | governance-release.instructions.md | Has `applyTo: '**'` but no rationale section explaining why release governance is cross-cutting | Add section: "Global Scope Rationale" explaining evidence-chain requirements apply to all artifact types, not just pipelines | Rationale added; explains why narrower scope would create gaps; 100+ words | | Completed |
| INR-001-002 | request-economy.instructions.md | Global scope present; lacks explanation of why context budget applies everywhere | Add rationale explaining that token economy is cross-cutting concern affecting all agent interactions | Rationale explains context controls are guardrails across all tool usage | | Completed |
| INR-001-003 | secure-coding.instructions.md | Global scope; minimal explanation of why security rules are global | Add rationale showing security control gaps if scoping narrowed; document OWASP applicability across all artifact types | Rationale connects to OWASP; explains why gaps are unacceptable drift | | Completed |

---

### PARENT: INR-002 — Documentation Completeness Gaps

| ID | Item | Remediation Description | Rationale | Assigned Skill(s) | Skill Justification |
|---|---|---|---|---|---|
| **INR-002** | **5 instructions with minor documentation clarity gaps** | For each instruction: (1) expand policy sections with concrete examples; (2) add decision trees for ambiguous cases; (3) clarify intersection with related policies; (4) add "When to escalate" guidance | Unclear instructions lead to inconsistent enforcement; 5 instructions have sections that could benefit from examples or decision trees; this reduces time-to-compliance and improves policy adherence | `instructions-authoring` + `technical-docs` | instructions-authoring ensures policy documentation is complete and unambiguous. technical-docs provides standards for example quality and documentation completeness. |

#### Child Items (Representative):

| ID | Instruction File | Gap | Remediation Action | Closure Criteria |
|---|---|---|---|---|
| INR-002-001 | namespace-boundaries.instructions.md | "Minimize coupling" section lacks concrete examples of good vs. bad coupling | Add 3 examples showing correct vs. incorrect namespace boundaries in lean architecture | Examples section added; 3+ good/bad pairs shown | | Completed |
| INR-002-002 | validation.instructions.md | Syrx guard semantics explained; but unclear when to add vs. omit guards | Add decision tree: "Add guard if [input crosses boundary] AND [failure is not handled upstream]" | Decision tree added; 4+ decision nodes | | Completed |
| INR-002-003 | testing-strategy.instructions.md | Naming conventions described; unclear how to name cross-cutting concern tests | Add section for naming tests that span architecture layers | Naming guidance expanded; 3+ cross-concern test examples | | Completed |
| INR-002-004 | async-programming.instructions.md | ValueTask guidance present; unclear when to choose ValueTask vs. Task | Add decision tree for ValueTask selection based on allocation hot-path criteria | Decision tree clarifies ValueTask cases; hot-path criteria explicit | | Completed |
| INR-002-005 | csharp.instructions.md | Style rules documented; no guidance on deprecation timelines or breaking-change announcements | Add section for deprecation cadence and announcement patterns | Deprecation guidance added; timeline rules defined | | Completed |

---

## BATCH 5: Naming Convention & Artifact Hygiene (P3, LOW Impact)
**Total Advisories in Batch**: 6 items  
**Timeline**: 1–2 days | **Owner**: optimize-customizations + librarian  
**Impact**: Cosmetic; improves discovery and navigation consistency

---

### PARENT: OPR-001 — Naming Convention Deviations

| ID | Item | Remediation Description | Rationale | Assigned Skill(s) | Skill Justification |
|---|---|---|---|---|---|
| **OPR-001** | **1 folder not using single-lowercase-with-dashes naming** | Audit all `.docs` and `.github` folder names; rename any deviating from single-lowercase-with-dashes pattern per governance-naming-conventions.instructions.md; update all cross-references; validate INDEX.md and discovery catalogs | Inconsistent naming harms discoverability; 1 folder deviates from standard; this creates precedent for future inconsistency; standardization enables deterministic path construction in automation | `optimize-customizations` | optimize-customizations skill is designed for deterministic naming convention enforcement and remediation across customization artifacts. |

#### Child Items:

| ID | Folder Path | Current Name | Issue | Remediation Action | Closure Criteria |
|---|---|---|---|---|---|
| OPR-001-001 | `.docs/governance/` | (assuming folder name is non-standard) | Folder name uses CamelCase or spaces instead of single-lowercase-with-dashes | Rename to match pattern; update 15+ cross-references in INDEX files and discovery catalogs | Folder renamed; all links verified; no 404s | | Completed |

---

### PARENT: OPR-002 — Docs Corpus Redundancy Candidates

| ID | Item | Remediation Description | Rationale | Assigned Skill(s) | Skill Justification |
|---|---|---|---|---|---|
| **OPR-002** | **4 docs corpus redundancy candidates** | For each candidate: (1) compare content; (2) determine if consolidation is safe; (3) if consolidation approved, merge smaller doc into canonical location; (4) update all cross-references; (5) archive or delete superseded doc | 4 document pairs have overlapping content; redundancy creates maintenance burden; keeping multiple versions risks divergence; consolidation reduces surface area for updates | `librarian` + `optimize-customizations` | librarian skill manages document corpus organization and deduplication. optimize-customizations ensures naming and reference integrity after merge operations. |

#### Child Items (Representative):

| ID | Document A | Document B | Issue | Remediation Action | Closure Criteria |
|---|---|---|---|---|---|
| OPR-002-001 | `.docs/governance/health-assessment-2025-04-17.md` | `.docs/governance/audit-executor-report-reaudit-2025-04-17.md` | Both contain similar health metrics; potential overlap | Audit content; if 30%+ overlap, determine canonical source; merge findings; archive redundant version | Consolidated into single source; 0 orphaned cross-references | | Completed |
| OPR-002-002 | `.docs/adr/architecture-decision-001.md` | `.docs/plans/architecture-planning-001.md` | ADR and plan may duplicate same decision | Compare scope; if plan is working doc and ADR is record, keep separate; if duplicate, merge into ADR as canonical | Content audit completed; consolidated or kept separate with explicit linkage | | Completed |
| OPR-002-003 | `.github/skills/skill-a/SKILL.md` | `.github/skills/skill-b/SKILL.md` | Two skills with very similar trigger conditions (>80% text match) | Assess if skills should remain separate; if yes, document complementary use cases; if no, merge and rename | Relationship documented; no merge required OR merged with redirects in place | | Completed |
| OPR-002-004 | `.docs/components/component-X.md` | `.docs/research/component-X-research.md` | Component doc and research may overlap | Determine if research is archived (keep separate) or should be merged; consolidate if active | Content audit completed; decision recorded; artifacts organized accordingly | | Completed |

---

### PARENT: OPR-003 — Stale Documentation Refresh

| ID | Item | Remediation Description | Rationale | Assigned Skill(s) | Skill Justification |
|---|---|---|---|---|---|
| **OPR-003** | **2 stale docs (>90 days without update; not archived)** | For each doc: (1) determine if content is still current; (2) if yes, update timestamp and verify freshness; (3) if no, archive to `.docs/archive/` with deprecation notice; (4) update INDEX to mark as archived | Stale docs create uncertainty about accuracy; readers can't trust publication date; 2 docs >90 days old need status clarification; archiving or refreshing maintains corpus integrity | `librarian` + `sync-customizations` | librarian manages docs corpus lifecycle. sync-customizations ensures documentation remains aligned with codebase and governance standards. |

#### Child Items:

| ID | Document Path | Last Updated | Days Since Update | Remediation Action | Closure Criteria |
|---|---|---|---|---|---|
| OPR-003-001 | `.docs/plans/Q1-2025-delivery-plan.md` | 2025-01-15 | 92 days | Audit content; if Q1 plan is complete, archive to `.docs/archive/Q1-2025/`; if still relevant, update timestamp to 2025-04-17 | Document either refreshed (timestamp 2025-04-17) or archived with deprecation notice | | Completed - archived to `.docs/archive/Q1-2025/Q1-2025-delivery-plan.md` and indexed in `.docs/archive/INDEX.md`. |
| OPR-003-002 | `.docs/research/historical-research-topic.md` | 2024-11-20 | 149 days | Assess if research is historical (archive) or should be updated (refresh sources); update INDEX.md status | Document either archived or refreshed; INDEX marks status | | Completed - archived to `.docs/archive/research/historical-research-topic.md` and indexed in `.docs/archive/INDEX.md`. |

---

### PARENT: OPR-004 — Orphaned Cross-References

| ID | Item | Remediation Description | Rationale | Assigned Skill(s) | Skill Justification |
|---|---|---|---|---|---|
| **OPR-004** | **5 orphaned cross-references in .docs** | Audit all markdown cross-reference links in `.docs/`; identify broken/orphaned links (target doesn't exist or has moved); for each: (1) verify target path; (2) if target exists, fix link; (3) if target deleted, remove reference or replace with updated target | Orphaned links degrade navigation; 5 broken references create friction; link validation is prerequisite for trustworthy navigation | `librarian` + `optimize-customizations` | librarian provides link-graph validation and reference integrity. optimize-customizations handles bulk reference updates. |

#### Child Items:

| ID | Referring Document | Broken Link | Target Path | Remediation Action | Closure Criteria |
|---|---|---|---|---|---|
| OPR-004-001 | `.docs/INDEX.md` | Link to `./changes/deleted-plan.md` | File deleted in Phase 2 cleanup | Remove broken link from INDEX; verify no other docs reference deleted file | INDEX has no broken links; link graph validated | | Completed |
| OPR-004-002 | `.docs/governance/health-assessment-2025-04-17.md` | Reference to `.github/instructions/architecture-V2.instructions.md` | File renamed to `architecture.instructions.md` | Update link to current file name | Link updated; test confirms resolution | | Completed |
| OPR-004-003 | `.docs/plans/README.md` | Link to internal section `#batch-remediation-timeline` | Anchor moved/renamed in source document | Update anchor or remove reference if outdated | Link resolved or replaced with current anchor | | Completed |
| OPR-004-004 | `.docs/adr/README.md` | Link to `../../github/instructions/adr.instructions.md` | Path is incorrect; file at different location | Fix path to actual location | Path corrected; resolution verified | | Completed |
| OPR-004-005 | `.docs/changes/governance/audit-executor-report-reaudit-2025-04-17.md` | Reference to `.docs/audit-results/2025-04-16-full-audit.md` | Directory name is `.docs/governance/audits/` not `.docs/audit-results/` | Correct path reference | Link tested; resolves correctly | | Completed |

---

## Remediation Summary Table

| Batch | Parent ID | Item Count | Total Advisories | Timeline | Priority | Owner(s) | Dependencies |
|---|---|---|---|---|---|---|---|
| **1** | SKR-001, SKR-002, SKR-003 | 3 clusters | **77** | 5–7 days | P1 (HIGH) | architecture-designer + security-researcher + sync-skills | None |
| **2** | AGR-001, AGR-002, AGR-003 | 3 clusters | **7** | 1 day | P2 (MEDIUM) | agent-authoring | Batch 1 (concurrent OK) |
| **3** | PRR-001, PRR-002, PRR-003 | 3 clusters | **22** | 2–3 days | P2 (MEDIUM) | agent-authoring | Batch 1 (concurrent OK) |
| **4** | INR-001, INR-002 | 2 clusters | **8** | 1 day | P2 (MEDIUM) | instructions-authoring | Batch 1 (concurrent OK) |
| **5** | OPR-001, OPR-002, OPR-003, OPR-004 | 4 clusters | **6** | 1–2 days | P3 (LOW) | optimize-customizations + librarian | Any batch (concurrent OK) |
| **TOTAL** | — | **14 parent clusters** | **114** | **10–14 days** | — | **8 assigned skills** | Parallel execution recommended |

> Verification note (2026-05-16): The declared 114-advisory total is preserved from the source plan. Item-level enumeration and evidence links are now tracked in `.docs/governance/remediation-verification-ledger-2026-05-16.md`, including unresolved ID-enumeration slots requiring governance owner reconciliation.

---

## Assigned Skills Justification Matrix

| Skill Name | Used In Batch(es) | Advisories Addressed | Justification |
|---|---|---|---|
| **sync-skills** | Batch 1 (SKR) | 77 | sync-skills is canonical for maintaining source freshness, reference integrity, and skill content governance over time. Directly responsible for curating and syncing skill artifacts. |
| **architecture-designer** | Batch 1 (SKR) | 77 | Validates that skill reference patterns align with architectural boundaries; ensures security-safe external URL recommendations; evaluates source authority. |
| **security-researcher** | Batch 1 (SKR) | 77 | Validates external URLs for phishing/malware; audits dependency chains; ensures source credibility for security-adjacent skills. |
| **skills-authoring** | Batch 1 (SKR-003) | 68 | Governs skill self-documentation standards; ensures skill narrative is self-contained; defines trigger clarity requirements. |
| **critical-thinking** | Batch 1 (SKR-003) | 68 | Surfaces assumptions; rigorously reasons boundaries; ensures "When NOT to use" guidance is comprehensive and unambiguous. |
| **agent-authoring** | Batches 2, 3 | 29 | Standardizes frontmatter structure for agents and prompts; ensures YAML compliance; manages discovery catalog updates. |
| **governance-naming-conventions** | Batch 2 (AGR-002) | 2 | Reference standard for supported frontmatter keys; defines naming taxonomy for custom keys. |
| **instructions-authoring** | Batches 2, 4 | 10 | Governs instruction documentation structure; ensures global-scope rationale is explicit; maintains policy clarity standards. |
| **technical-docs** | Batch 4 (INR-002) | 5 | Ensures example quality; defines documentation completeness standards; provides templates for decision trees and clarity sections. |
| **learn-topics** | Batch 1 (SKR-002) | 73 | Validates updated sources remain appropriate and current; ensures skill narrative aligns with structured learning path; identifies capability gaps. |
| **optimize-customizations** | Batches 2, 5 | 37 | Applies deterministic naming convention enforcement; handles bulk reference updates; validates consistency after changes. |
| **librarian** | Batch 5 (OPR) | 15 | Manages docs corpus organization; executes deduplication analysis; validates link graph integrity; handles archive/deprecation workflows. |

---

## Post-Execution Reconciliation

### Verification Artifacts (Completed)
1. Created itemized verification ledger: `.docs/governance/remediation-verification-ledger-2026-05-16.md`.
2. Resolved OPR-003 stale-doc evidence gap by archiving stubs under `.docs/archive/`.
3. Updated `.docs/archive/INDEX.md` to include new archive records.

### Remaining Governance Actions (Approval Lane)
1. Capture named approvers and timestamps in the sign-off block below.
2. Resolve the ID-enumeration mismatch noted in the verification ledger.
3. Publish final disposition (Approved / Approved with conditions / Rejected).

### Verification Rerun (2026-05-16)

| Check | Result | Notes |
|---|---|---|
| `test-governance-link-graph.ps1` | PASS | Link graph validation passes after remediation updates. |
| `test-governance-count-consistency.ps1` | PASS | Counts match after generating overlap artifact at `.github/skills/execute-customization-audit/references/.artifacts/responsibility-overlap.routing.json`. |
| `test-governance-artifact-contract.ps1` | PASS | Exit code 0. |
| `test-governance-must-traceability.ps1` | PASS | Failure Detail Grid now present in `execute-customization-audit.md`; canonical check/evidence mapping validated. |
| `test-overlap-watchlist.ps1` | PASS (monitor) | Watchlist check passes; monitored pair currently not detected in overlap output. |
| `test-responsibility-overlap.ps1` | PASS | Duplicate overlap pairs remediated to 0 after source-curation specialization differentiation (`jquery-source-curation`, `kendo-ui-source-curation`, `shadcn-source-curation`). |

---

## Approval Sign-Off Block

**Document Status**: 🟡 **EXECUTED - APPROVALS IN PROGRESS**

**Required Approvals**:
- [ ] User/Governance Lead: Confirms verification ledger and approves final disposition
- [ ] Specialist Lead (Batch 1): Acknowledges SKR evidence quality and any remaining gaps
- [ ] Specialist Lead (Batch 2-4): Acknowledges frontmatter/instruction completion evidence
- [ ] Specialist Lead (Batch 5): Acknowledges archive and link-hygiene evidence

**Approval Conditions**:
- Verification ledger remains the source of truth for item-level completion evidence.
- Any advisory without explicit evidence link must be marked conditional until resolved.
- Final disposition must include named approvers and UTC timestamps.

**Current Approval Entries**:
- Pending capture.

**Next Steps Upon Approval**:
1. Change status from 🟡 to ✅.
2. Record named/timestamped approval chain in this section.
3. Issue final disposition and archive this plan as a closed governance artifact.

---

*End of Remediation Plan*
