# Agent Web UX Resource-to-Skill Mapping Template

## Purpose

Use this template to convert external UX/design resources into deterministic, agent-usable skill behavior.

## Use Process

1. Pick one resource with clear authority and scope.
2. Extract only testable rules and measurable thresholds.
3. Map each rule to one skill outcome and one agent action.
4. Define pass/fail acceptance checks and evidence artifacts.
5. Set a refresh cadence and owner for source drift control.

## Mapping Template

| Resource | URL | Authority Level | Skill Outcome | Extraction Rule | Agent Action | Acceptance Checks | Evidence Output | Refresh Cadence | Owner |
|---|---|---|---|---|---|---|---|---|---|
| <resource name> | <url> | <standard, vendor, research, community> | <what skill must produce> | <specific rule to encode> | <what the agent does> | <objective pass/fail checks> | <artifact path and format> | <monthly/quarterly/etc.> | <role or name> |

## Starter Mapping (Web UX and Design)

| Resource | URL | Authority Level | Skill Outcome | Extraction Rule | Agent Action | Acceptance Checks | Evidence Output | Refresh Cadence | Owner |
|---|---|---|---|---|---|---|---|---|---|
| WCAG 2.2 | https://www.w3.org/TR/WCAG22/ | standard | Accessibility baseline in UX skill outputs | Convert applicable success criteria into checklist items by flow and breakpoint | Validate annotated wireframes and implementation notes against criteria | 0 unresolved critical accessibility issues; contrast and keyboard checks explicitly passed | .docs/changes/<id>/ux-accessibility-evidence.md | quarterly | UX lead |
| WAI-ARIA APG | https://www.w3.org/WAI/ARIA/apg/ | standard | Component interaction behavior rules | Extract keyboard interaction patterns for each widget type in scope | Verify component behavior spec includes expected key handling and focus flow | Dialog, menu, tabs, and form interactions match APG patterns where used | .docs/changes/<id>/interaction-pattern-audit.md | quarterly | Frontend lead |
| web.dev Core Web Vitals guidance | https://web.dev/ | vendor | Performance thresholds in frontend skill reviews | Encode LCP, CLS, and INP targets into readiness gates | Require metric capture before and after major UI changes | LCP <= 2.5s, CLS <= 0.1, INP <= 200ms unless approved exception exists | .docs/changes/<id>/web-vitals-report.md | monthly | Performance owner |
| Lighthouse docs | https://developer.chrome.com/docs/lighthouse/ | vendor | Repeatable UX quality audit | Define required Lighthouse categories and minimum score policy | Run audit workflow and summarize failures with remediation owners | Accessibility and Best Practices scores meet project threshold | .docs/changes/<id>/lighthouse-summary.md | monthly | Frontend lead |
| axe-core docs | https://github.com/dequelabs/axe-core | vendor | Automated accessibility validation | Map critical/serious violation policy into skill done criteria | Execute scan and classify findings by severity and page | 0 critical and serious violations at sign-off | .docs/changes/<id>/axe-results.json and .md summary | per release | QA owner |
| NN/g research library | https://www.nngroup.com/ | research | Heuristic quality checks in UX design flow | Convert relevant heuristics into scenario-based review prompts | Run severity-ranked heuristic review on key user journeys | All critical/high issues have remediation or explicit deferral owner | .docs/changes/<id>/heuristic-review.md | quarterly | UX lead |
| Material Design | https://m3.material.io/ | design system | Consistent component and layout guidance | Extract component states, spacing, and interaction expectations for selected UI set | Compare design specs and components against selected system patterns | No undocumented divergence for reused components | .docs/changes/<id>/design-system-conformance.md | quarterly | Design system owner |
| VS Code Agent Skills docs | https://code.visualstudio.com/docs/copilot/customization/agent-skills | platform | Skill packaging and reusability standard | Encode frontmatter, required outputs, workflow, and references into skill template | Validate skill file structure before publishing | Skill includes clear triggers, deterministic workflow, and done criteria | .github/skills/<skill>/SKILL.md and references/source-catalog.md | monthly | AI customization owner |

## Acceptance Checklist for the Mapping

- Each row has one primary skill outcome.
- Each extraction rule is specific and testable.
- Acceptance checks are objective, measurable, and binary where possible.
- Evidence output points to a durable artifact path.
- Refresh cadence and owner are explicitly assigned.

## Compact Skill Wiring Block (Copy/Paste)

Use this block when moving one row into a skill draft.

```md
### Source Contract
- Source: <resource name> (<url>)
- Authority level: <level>
- Last reviewed: <YYYY-MM-DD>

### Encoded Rules
- <rule 1>
- <rule 2>

### Execution Checks
- <check 1>
- <check 2>

### Evidence Artifact
- <path/to/evidence-file.md>
```
