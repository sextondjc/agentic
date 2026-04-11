---
name: skills-authoring
description: Use when creating or updating skills and validating they are discoverable, specialized, and reusable.
---

# Skills Authoring

## Specialization

Author and maintain high-quality SKILL.md assets that are discoverable, concise, and operationally clear.

## Trigger Conditions

- A new skill is needed.
- An existing skill needs remediation.
- Skill quality must be validated before release.

## Inputs

- Target skill name and purpose.
- Trigger conditions and scope boundaries.
- Required references, scripts, or templates.

## Required Outputs

- Updated SKILL.md with valid frontmatter.
- Clear trigger language and specialization boundaries.
- Canonical sections: Inputs, Required Outputs, Workflow.
- Registered references and catalog updates when needed.

## Workflow

1. Run baseline validation and identify gaps.
2. Draft minimal frontmatter and specialization-first content.
3. Add canonical execution-context sections.
4. Add references only when they improve reuse; a `references/` directory is optional, not required.
5. Validate deterministic completeness: required outputs and workflow must cover the intended scope without omission.
6. If exploration logic is required, keep it bounded with hypothesis, boundary, time-box, success criteria, and closure decision.
7. Validate with skill-review and apply remediation.

## Core Rules

- Keep one objective per skill.
- Keep wording concise and non-redundant.
- Prefer reusable assets over inline duplication.
- Use lowercase hyphenated skill names.
- Default to deterministic behavior and explicit output contracts.
- Treat exploration as an explicit, rare exception pattern, not a default execution mode.
- Never create root-level folders in any workspace.
- Never create top-level reference folders; keep references under the owning asset path (for example `.github/skills/<skill>/references/`).
- **Skills MUST NOT reference, invoke, or delegate to other named skills within their guidance body.** All execution content must be entirely self-contained. Cross-referencing between skills is a SKR-M4 violation and a governance fail. If two skills genuinely require shared logic, introduce a dedicated orchestrator skill as the indirection layer rather than referencing from either skill.

## Done Criteria

- Frontmatter is valid and name matches folder.
- Trigger conditions are explicit and testable.
- Skill is self-contained and concise.
- Required outputs are explicit, deterministic, and complete for in-scope requests.
- Review checks pass with no MUST failures.
