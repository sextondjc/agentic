# 13 · Customization Taxonomy

**Lane:** Planning  
**Primary Assets:** `customization-taxonomy-v1.md`, `taxonomy-tag-registry/SKILL.md`, `matrix-skill-mapping/SKILL.md`  
**Location:** `.github/skills/governance-audit/references/customization-taxonomy-v1.md`  
**Status:** Approved baseline (2026-04-02, related plan: PLAN-20260402-001)  
**Back to:** [Executive Summary](./executive-summary.md) · [INDEX](./INDEX.md)

---

## Purpose

Provide a five-field classification model for every customization asset in the workspace. The taxonomy enables consistent classification, catalog integrity checks, and routing determinism without requiring readers to parse every asset's content. It is the conceptual foundation that the four catalog indexes implement.

---

## The Five-Field Taxonomy

Every customization asset (agent, instruction, skill, prompt) is classified across five fields:

| Field | Meaning | Examples |
|---|---|---|
| **ASSET** | Canonical asset name — must match catalog entry exactly | `governance-audit`, `orchestrator`, `audit-agent` |
| **LANE** | Lifecycle lane | `planning`, `execution`, `review` |
| **FAMILY** | Conceptual grouping for related assets | `governance`, `planning`, `delivery`, `execution`, `orchestration`, `review`, `test`, `security`, `standards`, `synchronization` |
| **TYPE** | Asset kind — structural form | `agent`, `instruction`, `prompt`, `skill` |
| **ROLE** | Primary functional role for routing and intent matching | Concise verb-noun that describes what the asset does |

---

## Source-of-Truth Precedence

The taxonomy is authoritative for **conceptual classification only**. Operational routing and lane ownership remain governed by the catalog indexes.

**Precedence chain:**
1. `planning-execution-review-governance.md` — canonical three-lane model definition
2. Catalog indexes — authoritative for routing decisions
3. `customization-taxonomy-v1.md` — authoritative for conceptual family and role classification

When the taxonomy and a catalog index conflict on lane assignment, the catalog index governs.

---

## Approved Families (v1)

The ten approved families in taxonomy v1:

| Family | Assets That Belong |
|---|---|
| `governance` | Assets whose primary purpose is governance assessment, enforcement, or reporting |
| `planning` | Assets that produce planning artifacts: plans, research, ADRs, requirements |
| `delivery` | Assets that coordinate multi-discipline delivery: RAID, dependency maps, milestones |
| `execution` | Assets that produce code, tests, docs, scripts, or configuration from approved plans |
| `orchestration` | Assets that route, compose, or coordinate other assets (e.g., orchestrator, compose-skills) |
| `review` | Assets that evaluate existing work against standards and produce disposition findings |
| `test` | Assets focused on test design, execution, and quality gates (including performance) |
| `security` | Assets focused on security research, vulnerability assessment, and secure coding |
| `standards` | Assets that maintain or enforce technical standards (architecture, C#, Syrx, etc.) |
| `synchronization` | Assets that keep workspace assets current with sources or each other |

### V1 Family Decisions

| Decision | Rationale |
|---|---|
| `delivery` and `execution` remain separate families | Delivery coordinates multi-discipline work; execution builds artifacts. Different functions despite similar lane placement. |
| Performance assets are under `test` family | Performance testing is a test discipline in v1. If a dedicated `performance` family is needed, it requires an ADR and PDL matrix revisit. |
| `architecture-designer` is under `standards` family | The architecture-designer agent enforces architectural standards; it does not produce primary planning artifacts. |

---

## Phase/Discipline/Lane Matrix

The PDL matrix maps delivery phases to discipline ownership within the three-lane model.

**Key policy (DEC-PDL-07):** Adding a discipline column to the matrix requires a full matrix revisit and an ADR entry. This prevents the discipline list from growing inconsistently.

**Matrix-skill-mapping skill:** Maintains the PDL matrix and its mapping to skill assets, including bundle ownership, discipline change checks, and catalog alignment.

**Taxonomy-tag-registry skill:** Maintains consistent Phase × Discipline × Lane tags across catalogs, plans, and workspace artifacts to prevent taxonomy drift.

---

## Version Control

The taxonomy is versioned (v1 = approved 2026-04-02). Breaking changes to the taxonomy — adding fields, renaming families, changing ASSET values — require:
1. A new version file (e.g., `customization-taxonomy-v2.md`)
2. An ADR documenting the change, rationale, and migration path from v1
3. Catalog index updates in the same change

Backward-compatible additions (new family values within the approved field set) require a taxonomy update and catalog alignment check, but not a new version file.

---

## Integration Points

| Governance Type | Connection |
|---|---|
| [Lifecycle & Lanes](./04-lifecycle-lanes.md) | Taxonomy lane field must align with catalog lane assignment |
| [Naming & Taxonomy](./03-naming-taxonomy.md) | ASSET field must exactly match canonical catalog name |
| [Customization Types](./02-customization-types.md) | TYP-S4 checks catalog and taxonomy parity as part of cross-type audit |
| [Health & Audit Overview](./10-health-audit.md) | `test-catalog-integrity.ps1` validates taxonomy-to-catalog alignment |
| [Cadenced Audits](./12-cadenced-audits.md) | Taxonomy drift is evaluated during quarterly full audit |
