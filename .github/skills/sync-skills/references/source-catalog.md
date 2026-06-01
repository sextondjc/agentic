# Skill Source Catalog

This catalog tracks authoritative sources used to keep workspace skills current and valuable.

| Source | What It Provides | Why It Is Valuable | In Use | Last Evaluated | Current Status | Notes |
|---|---|---|---|---|---|---|
| [Agent Skills](https://agentskills.io/home) | Open standard context, portability goals, and specification entry points. | Defines cross-agent interoperability expectations and keeps skill design vendor-neutral. | Yes | 2026-06-01 | Current | Verified live: standard remains active; progressive disclosure model, portability positioning, and open governance links (GitHub + Discord) are current. |
| [Anthropic Skills Repository](https://github.com/anthropics/skills) | Real-world reference implementations, templates, and evolving examples. | Provides practical patterns and anti-pattern signals from a high-volume public skill set. | Yes | 2026-06-01 | Current | Verified live: repository is active with recent commits and maintained `skills`, `spec`, and `template` surfaces; still includes explicit "test in your environment" disclaimer. |
| [Claude Support: How to Create Custom Skills](https://support.claude.com/en/articles/12512198-how-to-create-custom-skills) | Platform usage constraints, metadata expectations, packaging/testing guidance, and security reminders. | Clarifies operational behavior and invocation-quality factors for custom skills. | Yes | 2026-06-01 | Current | Verified live (updated this week): focused-skill guidance, packaging/testing steps, and security cautions remain aligned; help-center limits still indicate name 64 and description 200 for this channel. |
| [VS Code Agent Skills Documentation](https://code.visualstudio.com/docs/copilot/customization/agent-skills) | GitHub Copilot-specific skill loading model, SKILL.md frontmatter options, directory discovery rules, and slash-command behavior. | Required for workspace compatibility and reliable invocation in VS Code and Copilot tooling. | Yes | 2026-06-01 | Current | Verified live (page edited 2026-05-28): progressive loading, skill locations, required frontmatter, optional fields (`argument-hint`, `user-invocable`, `disable-model-invocation`, `context` experimental), and limits (name 64, description 1024). |

## Freshness Policy

- Default maximum age: 30 days.
- If Last Evaluated exceeds the threshold, set Current Status to Needs Review.
- If a source is sunset, inaccessible, or no longer relevant, set In Use to No and Current Status to Deprecated.
