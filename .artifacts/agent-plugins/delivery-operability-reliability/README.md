# delivery-operability-reliability

## Overview

- Purpose: Operability design, SRE practices, support triage/runbooks, and post-release outcome review workflows.
- Capability Provided: Operability design, SRE practices, support triage/runbooks, and post-release outcome review workflows.
- Why Install: Install this plugin to activate the bundled capabilities in this domain.

## Version

- Plugin Name: delivery-operability-reliability
- Semantic Version: 1.0.0
- Author: David Sexton
- Source Commit: af3203d710a9
- Generated At (UTC): 2026-06-01T22:55:16.6471142Z
- Plugin SHA-256: be472f4187c24203e6c78490967e8525418649c4abc02635ec5a9bd9e392ac2d

## Agent Purpose Guide

| Asset Path | Asset Type | Purpose |
|---|---|---|
| skills/operability-design/SKILL.md | Skill | Bundled capability for operability-design. |
| skills/outcome-review/SKILL.md | Skill | Bundled capability for outcome-review. |
| skills/sre-practices/SKILL.md | Skill | Bundled capability for sre-practices. |
| skills/support-runbook-generator/SKILL.md | Skill | Bundled capability for support-runbook-generator. |
| skills/support-triage/SKILL.md | Skill | Bundled capability for support-triage. |

## Asset Inventory

| Asset Path | SHA-256 |
|---|---|
| catalogs\skills-catalog.version.json | 0f3eca9de6a673993b8fec0308e56789b5033e4664e8d1d01621d779f39eab1e |
| catalogs\skills-discovery-index.md | a722055bb3dd803325af6c87d08aba3d00aa39f60818c704525e956bcfa175b7 |
| plugin.json | 775cdac2cc394bd95cd3c9c5259d1bbd3e8c508f185fc94535f3d465172db7b5 |
| skills\operability-design\SKILL.md | d1e35f5b5559605d546e51327ac0cb3c1a9f7d785fe98f51f09f783257f6053b |
| skills\outcome-review\references\source-catalog.md | 48f1385f13360c2095e6b2daa992de2346749085c7e07c6fc3c347aef3828c0e |
| skills\outcome-review\SKILL.md | 9b4447fb72dc2abc55dbe802ddd12dfc161b70b72f0cc575c7f929aa9fa934e6 |
| skills\sre-practices\SKILL.md | 13f5a0b30397bb72c26bab425cac18ad12cf3c3d8086f4812992f5e17b56bdde |
| skills\support-runbook-generator\SKILL.md | d7dff954f66c75890923c3b9a2d9278b7bea11f1a99e6a965a67bce8f64e487e |
| skills\support-triage\SKILL.md | 352ab39466084206d70fcd46a9d937ea6d0062c535b39f5e24f0091e146aa31a |

## Verification

1. Validate per-asset hashes from manifest: Get-FileHash -Algorithm SHA256 -LiteralPath <asset>
2. Recompute plugin SHA-256 as manifest aggregate digest from canonical <path>:<sha256> lines and compare to Plugin SHA-256.
3. Confirm source commit exists: git cat-file -t af3203d710a9
