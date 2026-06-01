# core-intake-governance

## Overview

- Purpose: Provide a shared governance control plane that standardizes request intake, policy routing, and lifecycle guardrails across plugin compositions.
- Capability Provided: Deterministic intake, governance enforcement, and cross-plugin composition control.
- Why Install: Install this plugin to ensure all downstream workflows start with consistent routing, boundary control, and compliance defaults.

## Version

- Plugin Name: core-intake-governance
- Semantic Version: 1.0.1
- Author: David Sexton
- Source Commit: af3203d710a9
- Generated At (UTC): 2026-06-01T22:48:36.4803723Z
- Plugin SHA-256: 12d45457295b5b9715b0852d028a9b1f0f6f96a0d02dd9c44948d66264e0d015

## Skills Catalog

- Catalog Version: 2026.06.01.1
- Source Path: .github/catalogs/skills-discovery-index.md
- Source Commit: af3203d710a9
- Generated At (UTC): 2026-06-01T22:48:36.4803723Z

| Catalog Asset | SHA-256 |
|---|---|
| catalogs/skills-discovery-index.md | a722055bb3dd803325af6c87d08aba3d00aa39f60818c704525e956bcfa175b7 |
| catalogs/skills-catalog.version.json | 0e9642e615c761840119abe6bf4ba6ec7028180650abbc052ce6e785e84c778e |
## Agent Purpose Guide

| Asset Path | Asset Type | Purpose |
|---|---|---|
| skills/work-intake-governance/SKILL.md | Skill | Use when raw requests, ideas, incidents, or stakeholder asks must be classified, bounded, and admitted, deferred, rejected, or routed before they enter planning or delivery. |
| skills/taxonomy-tag-registry/SKILL.md | Skill | Use when maintaining consistent Phase x Discipline x Lane tags across catalogs, plans, and workspace artifacts to prevent taxonomy drift. |
| skills/task-research/SKILL.md | Skill | Use when comprehensive project research is needed before planning or implementation decisions. |
| skills/task-execution/SKILL.md | Skill | Use when executing implementation plans with independent tasks in the current session |
| skills/scope-change-control/SKILL.md | Skill | Use when active delivery scope is under pressure from adds, swaps, descopes, or exceptions and each change must be evaluated, approved, rejected, or deferred with explicit impact analysis. |
| skills/route-customization/SKILL.md | Skill | Use when deciding whether a behavior should be implemented as a custom agent, an instruction file, or a reusable skill. |
| skills/plans/SKILL.md | Skill | Use when you have a written implementation plan to execute in a separate session with review checkpoints |
| skills/compose-skills/SKILL.md | Skill | Use when a request needs deterministic multi-skill composition through an explicit orchestration contract while preserving skill self-containment. |
| prompts/run-delivery-pattern.prompt.md | Prompt | Invoke the workspace ratified delivery pattern for a named workstream. Routes through orchestrator with the approved 12-phase sequence, enforces all approval gates, and produces a durable artifact at every phase. |
| prompts/review-project.prompt.md | Prompt | Wave-transition pre-flight prompt. Run before starting any new execution wave to verify plan alignment, artifact hygiene, and scope integrity. Satisfies GOV-S4 governance cadence requirement. |
| prompts/execute-delivery.prompt.md | Prompt | Session-start prompt for orchestrator-first execution continuation with parallel-safe dispatch, aggressive traceability updates, and status-first reporting. |
| instructions/secure-coding.instructions.md | Instruction | Consolidated secure coding rules for .NET-focused work, aligned with OWASP and workspace conventions. |
| instructions/request-economy.instructions.md | Instruction | Policy to minimize premium-request usage and context-window consumption while preserving high-confidence reasoning. |
| instructions/governance-release.instructions.md | Instruction | Mandatory rules for release artifact evidence, approval chain, rollback documentation, and release notes format. |
| instructions/governance-naming-conventions.instructions.md | Instruction | Asset naming standards for agents, instructions, skills, and prompts to ensure consistency, discoverability, and cross-project portability. |
| instructions/governance-lifecycle.instructions.md | Instruction | Defines mandatory Planning, Execution, and Review lane classification and traceable handoff requirements for customization artifacts. |
| agents/orchestrator.agent.md | Agent | Coordination and scope-control agent that classifies requests, routes category-based handoffs to specialist assets, and enforces enterprise delivery and review phase boundaries. |
| skills/writing-plans/SKILL.md | Skill | Use when you have a spec or requirements for a multi-step task, before touching code |

## Asset Inventory

| Asset Path | SHA-256 |
|---|---|
| agents/orchestrator.agent.md | 069094b3998006a9911bae2c38b9122b738b78d71581ad87bd719c91fa32f747 |
| catalogs/skills-catalog.version.json | 0e9642e615c761840119abe6bf4ba6ec7028180650abbc052ce6e785e84c778e |
| catalogs/skills-discovery-index.md | a722055bb3dd803325af6c87d08aba3d00aa39f60818c704525e956bcfa175b7 |
| instructions/governance-lifecycle.instructions.md | c51a9a1ed54894a3cc704bbc098069ea7e0a03125479436089522e9df1a0f529 |
| instructions/governance-naming-conventions.instructions.md | d3de0dee13265b59d79e1c3b5c3fa6cb1d69211dda19d94fcdc89a8ec143d5c9 |
| instructions/governance-release.instructions.md | de32e578be6976e5761ba008abd410ac70484826914b08b93f7b0cb198c1d8e3 |
| instructions/request-economy.instructions.md | c0b5d857d31be675a1795344a12ec10bd393ea4ae6dac532f28afdea3d920268 |
| instructions/secure-coding.instructions.md | 647b74096502508a655973b6161ac10f646620bc63a92beec5084376a7e7630c |
| plugin.json | f2409cf42cb64c0827caae9663cca304f4db24948421c1f90d521325acc5a246 |
| prompts/execute-delivery.prompt.md | 3f95cb30768d39d2f3dd4df306c94c28be1124184ed3e192fac11e5b7d2b0039 |
| prompts/review-project.prompt.md | 6e1791999309b2cce187c7752f48baf83bc585ee093095fb05cd237b5987a92f |
| prompts/run-delivery-pattern.prompt.md | 9b76e9361f442bbd9ffe6a049691131d16fd5a889cf94713a8930beb59ee9076 |
| skills/compose-skills/references/capability-routing-registry.json | 38fb2c148d40c953c2e9341843ef22829af24fe16abb7e233d7783b65c598ea1 |
| skills/compose-skills/references/routing-benchmark-cases.json | cab26107b131ba616a1996c6b82a76c5ecc5c48af8590e63deb6211624fdacce |
| skills/compose-skills/SKILL.md | fbe439579fa2f3ee995dabc55c2c1ef5a2c6dcf231defcf1c45e677196bfb95a |
| skills/plans/references/README.md | 9de657fb68cf11a8f96d2183b11168cc2471cee7c0cabd71a20e9d1c2788192b |
| skills/plans/SKILL.md | 2f8ad36643e85de3f135b0f95f97fd4eca247970b3b273b1f5e514acba215909 |
| skills/route-customization/references/output-template.md | 8bcec8c80ddbbeacdc1f9f4a6217d8247920e85d32c0174eb94c2bb6f0203e48 |
| skills/route-customization/references/README.md | 7fb8379bd1e3d0a31996f9f89705434ad3d11ff08baeba5e4d7e823dbb6d9a1e |
| skills/route-customization/SKILL.md | f2af3bedd821e082867293f0866e282e2aa34ff39c80e898cecb0a19acb7c3b2 |
| skills/scope-change-control/references/source-catalog.md | 9611c3704844a784eac438b10a041b08f2e6c42cac46cb9a0375ef73a1cd245a |
| skills/scope-change-control/SKILL.md | 3eb29081b8b9f6007160396eb8f6ddd97811a35b1f1818ea871f574ed3c209ce |
| skills/task-execution/code-quality-reviewer-prompt.md | 1ee2481f76b22f1bf01d78e64164850ddac8b238f856c1d5b05617c70b134531 |
| skills/task-execution/implementer-prompt.md | a416193f881e5a712c988fffabfe1d5a97bffcd091eb95577c84fe2136588617 |
| skills/task-execution/references/command-patterns.md | 16f0c2a7d1d7fe187b37db3899f70d0abc5b8b2634737050dc3e20451fc69d1d |
| skills/task-execution/references/README.md | c6a4f0ec931006e7281a122e279e1daabbdea9fb5a1662ad1d2a59fccb68214e |
| skills/task-execution/references/subagent-dispatch-patterns.md | 7cc89dd6f7956d5f05640eb39266beb4ab89b08c612798be4257abcafed28e04 |
| skills/task-execution/SKILL.md | bc5b20267a6cce065cbc006485d15026406e990dffde33ab99a96c637539a25f |
| skills/task-execution/spec-reviewer-prompt.md | 631980e472eec5394de8b89b69d432e54fd3f7f523ecf9afa7eb4cda0c9b2baf |
| skills/task-research/references/research-template.md | bc670c280b20b176f5a4dfdc14260dd7bcf593b13ba71f846df01588a863b0bc |
| skills/task-research/SKILL.md | f350b583d8fad5c3ca0b2524ee81ddce3a8973ed283549329703e7110a2d3f25 |
| skills/taxonomy-tag-registry/references/naming-conventions.json | dce0280fb67c8eb57f346d9c239118bb5ed8b1d78e4457b0dd01a62f4cc61e35 |
| skills/taxonomy-tag-registry/SKILL.md | d85432a822c38ab7a3fde223070d2f220ee40b192cb528e3c3d27c79ee45b4b9 |
| skills/work-intake-governance/references/source-catalog.md | 8c921869f4defd54ad5b1dc700bcff6de604a17d8761f2abbf1aba608bece454 |
| skills/work-intake-governance/SKILL.md | e1cb699d69788e4baeb7232c0b08f1bf5ac5f9b9ad08cd1117c8fc26795503b7 |
| skills/writing-plans/plan-document-reviewer-prompt.md | 6fce2aa83c63715697e9dd86050c820716100b91efbd9f12bab8477ecc060256 |
| skills/writing-plans/references/README.md | 59654d9676ff95bd85699c8c8e66fada8911761e1afafea8cad9d0239fb850b7 |
| skills/writing-plans/SKILL.md | 83923567781721ea050232c8cf452b85491af650ef4fa537e45be38434c69047 |

## Verification

1. Validate per-asset hashes from manifest: Get-FileHash -Algorithm SHA256 -LiteralPath <asset>
2. Recompute plugin SHA-256 as manifest aggregate digest from canonical <path>:<sha256> lines and compare to Plugin SHA-256.
3. Confirm source commit exists: git cat-file -t 16d627d5eb2b
