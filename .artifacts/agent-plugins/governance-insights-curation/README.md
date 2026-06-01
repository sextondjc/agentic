# governance-insights-curation

## Overview

- Purpose: Agentic workflow patterns, asset naming taxonomy, and customer feedback synthesis curation workflows.
- Capability Provided: Agentic workflow patterns, asset naming taxonomy, and customer feedback synthesis curation workflows.
- Why Install: Install this plugin to activate the bundled capabilities in this domain.

## Version

- Plugin Name: governance-insights-curation
- Semantic Version: 1.0.0
- Author: David Sexton
- Source Commit: af3203d710a9
- Generated At (UTC): 2026-06-01T22:55:16.6471142Z
- Plugin SHA-256: bfdbc6eb70c388110fcd03443fb121017e566e4c65ea93c42fc582fa07183773

## Agent Purpose Guide

| Asset Path | Asset Type | Purpose |
|---|---|---|
| skills/agentic-workflow-patterns/SKILL.md | Skill | Bundled capability for agentic-workflow-patterns. |
| skills/asset-naming-taxonomy/SKILL.md | Skill | Bundled capability for asset-naming-taxonomy. |
| skills/customer-feedback-synthesis/SKILL.md | Skill | Bundled capability for customer-feedback-synthesis. |

## Asset Inventory

| Asset Path | SHA-256 |
|---|---|
| catalogs\skills-catalog.version.json | 0f3eca9de6a673993b8fec0308e56789b5033e4664e8d1d01621d779f39eab1e |
| catalogs\skills-discovery-index.md | a722055bb3dd803325af6c87d08aba3d00aa39f60818c704525e956bcfa175b7 |
| plugin.json | f2545dcb2bab1d5d3fc242105f3f758aa8251f5dd4935c22c699d6a99de5743d |
| skills\agentic-workflow-patterns\references\source-catalog.md | 45b5cacfc2101ffceea8ec75e8be8005e068016165cff946c5b81460eca9cbd9 |
| skills\agentic-workflow-patterns\SKILL.md | 89aa1d6778db51da5f3d256584e0ad60f486aaf7866e4a4e76f78b703af79880 |
| skills\asset-naming-taxonomy\references\function-vocabulary.md | 977e378f655c8a191fa36e155de14a886b96d3b9ed9aa1c6ef169fc0c025e802 |
| skills\asset-naming-taxonomy\references\lane-intent.md | 0117ebf9117ce850443d51e0659bec9436e254dd05aeaf0a7f89268552057fe0 |
| skills\asset-naming-taxonomy\references\naming-conventions.json | d6977ff907e58fb56229a461261430121e0ce9322ab7634f986a1ee7fcb7dfd3 |
| skills\asset-naming-taxonomy\SKILL.md | 4f21ac9b5243fb2fe2e6de2ff34215dff85fab9b2834d4e11cc51b9439b74f62 |
| skills\customer-feedback-synthesis\SKILL.md | a8f8410c89b1ade20b0574f9f6a0373f3f582a4d764ad7b026fc07c8f1da5cc4 |

## Verification

1. Validate per-asset hashes from manifest: Get-FileHash -Algorithm SHA256 -LiteralPath <asset>
2. Recompute plugin SHA-256 as manifest aggregate digest from canonical <path>:<sha256> lines and compare to Plugin SHA-256.
3. Confirm source commit exists: git cat-file -t af3203d710a9
