# Web UX Skills Index

## Purpose

This index groups the reusable web UX agent skills in this compendium by capability family so teams can adopt the right set for different project types.

## Recommended Adoption Order

1. Start with the umbrella quality gate for cross-dimension intake and release decisions.
2. Add the core three dimensions for most product teams.
3. Add extended dimensions only where the product surface or risk profile justifies them.
4. Use the scaffold prompt and worked examples to generate reusable evidence bundles.

## Orchestration Layer

| Skill | Role | Best Use |
|---|---|---|
| [web-ux-quality-gate](../../../.github/skills/web-ux-quality-gate/SKILL.md) | Deterministic umbrella intake and synthesis | Use when one release needs a unified UX recommendation across multiple dimensions |

## Core Dimensions

Use these for most web products.

| Skill | Focus | Best Use |
|---|---|---|
| [web-ux-accessibility](../../../.github/skills/web-ux-accessibility/SKILL.md) | Accessibility compliance and interaction quality | Keyboard, focus, semantics, announcements, WCAG/APG checks |
| [web-ux-usability](../../../.github/skills/web-ux-usability/SKILL.md) | Task completion and friction evidence | Core user journeys, retries, recovery, task success |
| [web-ux-performance](../../../.github/skills/web-ux-performance/SKILL.md) | Responsiveness and perceived latency | LCP, CLS, INP, wait states, abandonment-risk assessment |

## Responsive And Interaction Quality

Use these for multi-device support, motion coherence, and attention management.

| Skill | Focus | Best Use |
|---|---|---|
| [web-ux-responsive-design](../../../.github/skills/web-ux-responsive-design/SKILL.md) | Breakpoint strategy, touch-targets, layout reflow | Mobile, tablet, desktop parity; viewport adaptation |
| [web-ux-motion-animation](../../../.github/skills/web-ux-motion-animation/SKILL.md) | Motion clarity, reduced-motion support, animation coherence | New animations; accessibility motion checks |
| [web-ux-notification-alerts](../../../.github/skills/web-ux-notification-alerts/SKILL.md) | Notification frequency, dismissal clarity, user control | Attention economy; interruption and fatigue management |

## Content And Structure

Use these when wording, hierarchy, or navigation quality materially affects outcomes.

| Skill | Focus | Best Use |
|---|---|---|
| [web-ux-content-clarity](../../../.github/skills/web-ux-content-clarity/SKILL.md) | Labels, helper text, error messages, microcopy | Content-heavy or form-heavy flows |
| [web-ux-information-architecture](../../../.github/skills/web-ux-information-architecture/SKILL.md) | Findability, taxonomy, navigation depth | Multi-step flows, large sites, structural UX changes |
| [web-ux-feedback-status](../../../.github/skills/web-ux-feedback-status/SKILL.md) | Loading, success, empty, error, retry states | Async workflows, transaction-heavy interfaces |
| [web-ux-onboarding-progressive-disclosure](../../../.github/skills/web-ux-onboarding-progressive-disclosure/SKILL.md) | First-run setup and staged reveal | Setup flows, product tours, feature education |

## Conversion And Decision Quality

Use these when business outcomes depend on form completion, experiments, or measurable user actions.

| Skill | Focus | Best Use |
|---|---|---|
| [web-ux-forms-conversion](../../../.github/skills/web-ux-forms-conversion/SKILL.md) | Form friction and abandonment | Checkout, sign-up, payment, settings forms |
| [web-ux-experimentation-evidence](../../../.github/skills/web-ux-experimentation-evidence/SKILL.md) | Hypothesis rigor and experiment guardrails | A/B testing, rollout decisions, experiment review |
| [web-ux-telemetry-instrumentation](../../../.github/skills/web-ux-telemetry-instrumentation/SKILL.md) | Event contracts and measurement completeness | Analytics-heavy teams and evidence-first product decisions |

## Trust, Identity, And Privacy

Use these when the product handles sensitive actions, authentication, or user data control.

| Skill | Focus | Best Use |
|---|---|---|
| [web-ux-trust-risk-signals](../../../.github/skills/web-ux-trust-risk-signals/SKILL.md) | Warnings, irreversible actions, trust cues | Destructive actions, high-stakes user decisions |
| [web-ux-privacy-consent](../../../.github/skills/web-ux-privacy-consent/SKILL.md) | Consent, disclosure, revocation, user control | Cookie banners, permissions, privacy settings |
| [web-ux-account-identity-flows](../../../.github/skills/web-ux-account-identity-flows/SKILL.md) | Sign-in, sign-up, MFA, recovery, session flows | Authentication and account-management surfaces |

## Global And Cross-Market Quality

Use these when products span locales, design systems, or multiple regions.

| Skill | Focus | Best Use |
|---|---|---|
| [web-ux-localization](../../../.github/skills/web-ux-localization/SKILL.md) | Locale formatting and layout adaptation | Multi-locale, RTL, or international products |
| [web-ux-visual-consistency](../../../.github/skills/web-ux-visual-consistency/SKILL.md) | Token conformance and visual drift | Design-system adoption and shared component governance |

## Complex And Operational Interfaces

Use these when products are enterprise-like, high-density, or disruption-prone.

| Skill | Focus | Best Use |
|---|---|---|
| [web-ux-data-dense-interfaces](../../../.github/skills/web-ux-data-dense-interfaces/SKILL.md) | Tables, filters, bulk actions, dashboards | Admin tools, reporting surfaces, expert workflows |
| [web-ux-offline-resilience](../../../.github/skills/web-ux-offline-resilience/SKILL.md) | Offline behavior, retry, sync conflict, continuity | PWAs, field tools, unreliable-network environments |
| [web-ux-supportability-self-service](../../../.github/skills/web-ux-supportability-self-service/SKILL.md) | Help entry points, escalation, self-resolution | Complex workflows with support burden risk |

## Reusable Execution Assets

| Asset | Role | Best Use |
|---|---|---|
| [scaffold-web-ux-quality-gate.prompt.md](../../../.github/prompts/scaffold-web-ux-quality-gate.prompt.md) | Generate core or full evidence bundles | Starting a new workstream evidence set |
| [ux-quality-gate-examples-index.md](../../../.docs/changes/ux-quality-gate-examples-index.md) | Discover worked examples | Finding reference bundles for adaptation |
| [agent-web-ux-resource-skill-mapping-template.md](./agent-web-ux-resource-skill-mapping-template.md) | Convert external resources into skill rules | Creating new portable UX skills from authoritative sources |

## Adoption Profiles

| Project Type | Recommended Skills |
|---|---|
| Standard marketing or product site | quality-gate, accessibility, usability, performance, responsive-design, content-clarity, feedback-status |
| Transactional product | quality-gate, accessibility, usability, performance, responsive-design, forms-conversion, trust-risk-signals, privacy-consent, notification-alerts |
| SaaS application | quality-gate, accessibility, usability, performance, responsive-design, motion-animation, IA, telemetry-instrumentation, feedback-status, account-identity-flows, notification-alerts |
| Enterprise admin or operations tool | quality-gate, accessibility, usability, responsive-design, data-dense-interfaces, supportability-self-service, offline-resilience, notification-alerts |
| International product | quality-gate, responsive-design, localization, content-clarity, visual-consistency, privacy-consent |
| Animation-rich or interactive experience | quality-gate, accessibility, usability, performance, motion-animation, responsive-design, notification-alerts |

## Selection Rule

- Choose the smallest set of dimensions that covers real product risk.
- Use the umbrella quality gate when more than one dimension needs one unified recommendation.
- Add specialist dimensions only when the product surface justifies dedicated evidence.
