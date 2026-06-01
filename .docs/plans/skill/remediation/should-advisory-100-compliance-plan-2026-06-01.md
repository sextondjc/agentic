# SHOULD Advisory Remediation Plan

## Plan Metadata

| Field | Value |
|---|---|
| Plan ID | PLAN-SKILL-SHOULD-2026-06-01 |
| Source Review | .docs/changes/skill/reviews/governance-audit-types-skills.md |
| Date | 2026-06-01 |
| Target State | 100% skills at Pass with zero SHOULD advisories |
| Advisory Skills | 206 |
| Total SHOULD Advisories | 282 |

## Success Criteria

| ID | Requirement | Verification |
|---|---|---|
| REQ-001 | Every advisory-bearing skill updated with deterministic remediation changes. | Diff review per skill folder |
| REQ-002 | SHOULD advisory count reaches zero across all skills. | Re-run governance audit grid |
| REQ-003 | Skill catalog and cross-links remain valid after edits. | Local link checker and catalog checks |
| REQ-004 | No new MUST failures introduced while remediating SHOULD items. | Post-remediation governance audit |

## Step-by-Step Execution Workflow

1. Baseline lock: snapshot current advisory grid and skill discovery index.
2. Wave planning: execute in wave order W01 to W06 based on advisory density and risk.
3. For each skill, apply the assigned playbook (PB-01, PB-02, PB-03).
4. Edit only skill-scoped artifacts first: SKILL.md and directly linked reference docs.
5. Run per-wave link and structure validation before moving forward.
6. Run per-wave review refresh and update the aggregate grid.
7. Record exceptions as explicit decisions with owner and due date.
8. After all waves, run full audit and confirm zero SHOULD advisories.
9. Publish closure artifact with before/after counts and evidence links.

## Remediation Playbooks

### PB-01 (1 advisory)
1. Open the skill advisory report.
2. Implement the single recommendation in SKILL.md or referenced guidance.
3. Align trigger language and deterministic output contract.
4. Validate links and cross-file references.
5. Mark advisory as resolved and capture evidence.

### PB-02 (2 advisories)
1. Perform PB-01 steps.
2. Apply anti-pattern and boundary clarifications where missing.
3. Add or tighten decision rules and expected deliverables.
4. Re-verify against sibling skills for consistency in the family.
5. Mark both advisories resolved with evidence references.

### PB-03 (3 advisories)
1. Perform PB-02 steps.
2. Add deterministic orchestration contract section with ownership and handoff gates.
3. Validate composition and escalation behavior explicitly.
4. Run targeted peer review before closing advisories.
5. Mark all advisories resolved with explicit traceability.

## Skill-by-Skill Backlog

| Wave | Skill | SHOULD Advisories | Playbook | Owner | Status |
|---|---|---:|---|---|---|
| W01 | capacitor-orchestrator | 3 | PB-03 | unassigned | planned |
| W01 | shadcn-migration | 3 | PB-03 | unassigned | planned |
| W01 | agentic-workflow-patterns | 2 | PB-02 | unassigned | planned |
| W01 | benchmark-baseline-management | 2 | PB-02 | unassigned | planned |
| W01 | benchmark-ci-integration | 2 | PB-02 | unassigned | planned |
| W01 | benchmark-orchestrator | 2 | PB-02 | unassigned | planned |
| W01 | benchmark-profiler-integration | 2 | PB-02 | unassigned | planned |
| W01 | benchmark-quality-gate | 2 | PB-02 | unassigned | planned |
| W01 | benchmark-source-curation | 2 | PB-02 | unassigned | planned |
| W01 | benchmark-statistical-analysis | 2 | PB-02 | unassigned | planned |
| W01 | build-web-frontend | 2 | PB-02 | unassigned | planned |
| W01 | capacitor-accessibility | 2 | PB-02 | unassigned | planned |
| W01 | capacitor-auth-session | 2 | PB-02 | unassigned | planned |
| W01 | capacitor-ci-integration | 2 | PB-02 | unassigned | planned |
| W01 | capacitor-deep-linking | 2 | PB-02 | unassigned | planned |
| W01 | capacitor-environment-config | 2 | PB-02 | unassigned | planned |
| W01 | capacitor-live-updates | 2 | PB-02 | unassigned | planned |
| W01 | capacitor-migration-upgrades | 2 | PB-02 | unassigned | planned |
| W01 | capacitor-native-apis | 2 | PB-02 | unassigned | planned |
| W01 | capacitor-observability | 2 | PB-02 | unassigned | planned |
| W01 | capacitor-offline-resilience | 2 | PB-02 | unassigned | planned |
| W01 | capacitor-performance-quality-gate | 2 | PB-02 | unassigned | planned |
| W01 | capacitor-plugin-authoring | 2 | PB-02 | unassigned | planned |
| W01 | capacitor-privacy-compliance | 2 | PB-02 | unassigned | planned |
| W01 | capacitor-push-notifications | 2 | PB-02 | unassigned | planned |
| W01 | capacitor-release-readiness | 2 | PB-02 | unassigned | planned |
| W01 | capacitor-security | 2 | PB-02 | unassigned | planned |
| W01 | capacitor-setup | 2 | PB-02 | unassigned | planned |
| W01 | capacitor-source-curation | 2 | PB-02 | unassigned | planned |
| W01 | capacitor-testing | 2 | PB-02 | unassigned | planned |
| W01 | capacitor-web-integration | 2 | PB-02 | unassigned | planned |
| W01 | delivery-orchestration | 2 | PB-02 | unassigned | planned |
| W01 | dependency-security-scan | 2 | PB-02 | unassigned | planned |
| W01 | design-web-ux | 2 | PB-02 | unassigned | planned |
| W01 | jquery-ci-integration | 2 | PB-02 | unassigned | planned |
| W02 | jquery-orchestrator | 2 | PB-02 | unassigned | planned |
| W02 | jquery-security | 2 | PB-02 | unassigned | planned |
| W02 | kendo-orchestrator | 2 | PB-02 | unassigned | planned |
| W02 | kendo-ui-accessibility | 2 | PB-02 | unassigned | planned |
| W02 | kendo-ui-charts-dataviz | 2 | PB-02 | unassigned | planned |
| W02 | kendo-ui-ci-integration | 2 | PB-02 | unassigned | planned |
| W02 | kendo-ui-core | 2 | PB-02 | unassigned | planned |
| W02 | kendo-ui-data-binding | 2 | PB-02 | unassigned | planned |
| W02 | kendo-ui-export-printing | 2 | PB-02 | unassigned | planned |
| W02 | kendo-ui-forms | 2 | PB-02 | unassigned | planned |
| W02 | kendo-ui-grid-advanced | 2 | PB-02 | unassigned | planned |
| W02 | kendo-ui-localization | 2 | PB-02 | unassigned | planned |
| W02 | kendo-ui-migration | 2 | PB-02 | unassigned | planned |
| W02 | kendo-ui-observability | 2 | PB-02 | unassigned | planned |
| W02 | kendo-ui-performance | 2 | PB-02 | unassigned | planned |
| W02 | kendo-ui-quality-gate | 2 | PB-02 | unassigned | planned |
| W02 | kendo-ui-real-time-updates | 2 | PB-02 | unassigned | planned |
| W02 | kendo-ui-security | 2 | PB-02 | unassigned | planned |
| W02 | kendo-ui-source-curation | 2 | PB-02 | unassigned | planned |
| W02 | kendo-ui-state-persistence | 2 | PB-02 | unassigned | planned |
| W02 | kendo-ui-testing | 2 | PB-02 | unassigned | planned |
| W02 | kendo-ui-theming | 2 | PB-02 | unassigned | planned |
| W02 | kendo-ui-upload-file-workflows | 2 | PB-02 | unassigned | planned |
| W02 | probabilistic-forecasting | 2 | PB-02 | unassigned | planned |
| W02 | shadcn-accessibility | 2 | PB-02 | unassigned | planned |
| W02 | shadcn-animation | 2 | PB-02 | unassigned | planned |
| W02 | shadcn-ci-integration | 2 | PB-02 | unassigned | planned |
| W02 | shadcn-component-design | 2 | PB-02 | unassigned | planned |
| W02 | shadcn-data-display | 2 | PB-02 | unassigned | planned |
| W02 | shadcn-design-system | 2 | PB-02 | unassigned | planned |
| W02 | shadcn-forms | 2 | PB-02 | unassigned | planned |
| W02 | shadcn-orchestrator | 2 | PB-02 | unassigned | planned |
| W02 | shadcn-quality-gate | 2 | PB-02 | unassigned | planned |
| W02 | shadcn-registry | 2 | PB-02 | unassigned | planned |
| W02 | shadcn-setup | 2 | PB-02 | unassigned | planned |
| W03 | shadcn-testing | 2 | PB-02 | unassigned | planned |
| W03 | shadcn-theming | 2 | PB-02 | unassigned | planned |
| W03 | syrx-validation | 2 | PB-02 | unassigned | planned |
| W03 | web-ux-notification-alerts | 2 | PB-02 | unassigned | planned |
| W03 | acceptance-criteria | 1 | PB-01 | unassigned | planned |
| W03 | acceptance-governance | 1 | PB-01 | unassigned | planned |
| W03 | agent-plugin-design | 1 | PB-01 | unassigned | planned |
| W03 | agent-plugin-implementation-extension | 1 | PB-01 | unassigned | planned |
| W03 | agent-plugin-implementation-markdown | 1 | PB-01 | unassigned | planned |
| W03 | agent-plugin-publishing | 1 | PB-01 | unassigned | planned |
| W03 | agent-plugin-security-hardening | 1 | PB-01 | unassigned | planned |
| W03 | agent-plugin-tools-integration | 1 | PB-01 | unassigned | planned |
| W03 | analysis-execution | 1 | PB-01 | unassigned | planned |
| W03 | async-programming | 1 | PB-01 | unassigned | planned |
| W03 | audit-agent | 1 | PB-01 | unassigned | planned |
| W03 | audit-executor | 1 | PB-01 | unassigned | planned |
| W03 | audit-skill | 1 | PB-01 | unassigned | planned |
| W03 | backlog-structuring | 1 | PB-01 | unassigned | planned |
| W03 | build-blazor-web-apps | 1 | PB-01 | unassigned | planned |
| W03 | build-maui-apps | 1 | PB-01 | unassigned | planned |
| W03 | csharp-architecture-quality-gate | 1 | PB-01 | unassigned | planned |
| W03 | csharp-async-quality-gate | 1 | PB-01 | unassigned | planned |
| W03 | csharp-data-access-quality-gate | 1 | PB-01 | unassigned | planned |
| W03 | csharp-language-quality-gate | 1 | PB-01 | unassigned | planned |
| W03 | csharp-orchestrator | 1 | PB-01 | unassigned | planned |
| W03 | csharp-release-quality-gate | 1 | PB-01 | unassigned | planned |
| W03 | csharp-testing-quality-gate | 1 | PB-01 | unassigned | planned |
| W03 | customer-feedback-synthesis | 1 | PB-01 | unassigned | planned |
| W03 | data-design | 1 | PB-01 | unassigned | planned |
| W03 | delivery-forecasting | 1 | PB-01 | unassigned | planned |
| W03 | delivery-operating-system | 1 | PB-01 | unassigned | planned |
| W03 | design-mobile-ux | 1 | PB-01 | unassigned | planned |
| W03 | docker-dotnet-buildkit-optimization | 1 | PB-01 | unassigned | planned |
| W03 | docker-dotnet-ci-cd | 1 | PB-01 | unassigned | planned |
| W03 | docker-dotnet-compose-workflows | 1 | PB-01 | unassigned | planned |
| W04 | docker-dotnet-foundations | 1 | PB-01 | unassigned | planned |
| W04 | docker-dotnet-quality-gate | 1 | PB-01 | unassigned | planned |
| W04 | docker-dotnet-security-supply-chain | 1 | PB-01 | unassigned | planned |
| W04 | docker-dotnet-source-curation | 1 | PB-01 | unassigned | planned |
| W04 | docker-dotnet-testcontainers | 1 | PB-01 | unassigned | planned |
| W04 | docker-orchestrator | 1 | PB-01 | unassigned | planned |
| W04 | experiment-design | 1 | PB-01 | unassigned | planned |
| W04 | flow-metrics | 1 | PB-01 | unassigned | planned |
| W04 | generate-web-icons | 1 | PB-01 | unassigned | planned |
| W04 | governance-delivery | 1 | PB-01 | unassigned | planned |
| W04 | jquery-ajax | 1 | PB-01 | unassigned | planned |
| W04 | jquery-core | 1 | PB-01 | unassigned | planned |
| W04 | jquery-events | 1 | PB-01 | unassigned | planned |
| W04 | jquery-migration | 1 | PB-01 | unassigned | planned |
| W04 | jquery-performance | 1 | PB-01 | unassigned | planned |
| W04 | jquery-plugins | 1 | PB-01 | unassigned | planned |
| W04 | jquery-quality-gate | 1 | PB-01 | unassigned | planned |
| W04 | jquery-source-curation | 1 | PB-01 | unassigned | planned |
| W04 | jquery-testing | 1 | PB-01 | unassigned | planned |
| W04 | layer-boundaries | 1 | PB-01 | unassigned | planned |
| W04 | mcp-authn-authz-hardening | 1 | PB-01 | unassigned | planned |
| W04 | mcp-contract-versioning | 1 | PB-01 | unassigned | planned |
| W04 | mcp-inspector-ci-observability | 1 | PB-01 | unassigned | planned |
| W04 | mcp-regression-test-design | 1 | PB-01 | unassigned | planned |
| W04 | mcp-release-readiness-gate | 1 | PB-01 | unassigned | planned |
| W04 | mcp-sdk-selection-csharp-typescript | 1 | PB-01 | unassigned | planned |
| W04 | mcp-server-quality-gate | 1 | PB-01 | unassigned | planned |
| W04 | mcp-servers-orchestrator | 1 | PB-01 | unassigned | planned |
| W04 | mcp-source-curation | 1 | PB-01 | unassigned | planned |
| W04 | mcp-transport-architecture | 1 | PB-01 | unassigned | planned |
| W04 | mobile-accessibility-quality-gate | 1 | PB-01 | unassigned | planned |
| W04 | mobile-offline-resilience | 1 | PB-01 | unassigned | planned |
| W04 | mobile-orchestrator | 1 | PB-01 | unassigned | planned |
| W04 | mobile-performance-quality-gate | 1 | PB-01 | unassigned | planned |
| W04 | mobile-release-readiness | 1 | PB-01 | unassigned | planned |
| W05 | operability-design | 1 | PB-01 | unassigned | planned |
| W05 | opportunity-mapping | 1 | PB-01 | unassigned | planned |
| W05 | outcome-review | 1 | PB-01 | unassigned | planned |
| W05 | post-release-retrospective | 1 | PB-01 | unassigned | planned |
| W05 | product-scope-slicing | 1 | PB-01 | unassigned | planned |
| W05 | prototype-mobile-ui | 1 | PB-01 | unassigned | planned |
| W05 | refine-mcp-servers | 1 | PB-01 | unassigned | planned |
| W05 | release-readiness | 1 | PB-01 | unassigned | planned |
| W05 | release-simulation | 1 | PB-01 | unassigned | planned |
| W05 | scope-change-control | 1 | PB-01 | unassigned | planned |
| W05 | shadcn-source-curation | 1 | PB-01 | unassigned | planned |
| W05 | sql-server-automation | 1 | PB-01 | unassigned | planned |
| W05 | sql-server-diagnostics | 1 | PB-01 | unassigned | planned |
| W05 | sql-server-orchestrator | 1 | PB-01 | unassigned | planned |
| W05 | sql-server-query-tuning | 1 | PB-01 | unassigned | planned |
| W05 | sql-server-security | 1 | PB-01 | unassigned | planned |
| W05 | sql-server-standards | 1 | PB-01 | unassigned | planned |
| W05 | sre-practices | 1 | PB-01 | unassigned | planned |
| W05 | support-runbook-generator | 1 | PB-01 | unassigned | planned |
| W05 | support-triage | 1 | PB-01 | unassigned | planned |
| W05 | sveltekit-orchestrator | 1 | PB-01 | unassigned | planned |
| W05 | tailwind-ci-integration | 1 | PB-01 | unassigned | planned |
| W05 | tailwind-component-design | 1 | PB-01 | unassigned | planned |
| W05 | tailwind-design-system | 1 | PB-01 | unassigned | planned |
| W05 | tailwind-orchestrator | 1 | PB-01 | unassigned | planned |
| W05 | tailwind-quality-gate | 1 | PB-01 | unassigned | planned |
| W05 | tailwind-setup | 1 | PB-01 | unassigned | planned |
| W05 | tailwind-source-curation | 1 | PB-01 | unassigned | planned |
| W05 | task-execution | 1 | PB-01 | unassigned | planned |
| W05 | test-design-review | 1 | PB-01 | unassigned | planned |
| W05 | test-orchestration | 1 | PB-01 | unassigned | planned |
| W05 | web-ux-accessibility | 1 | PB-01 | unassigned | planned |
| W05 | web-ux-account-identity-flows | 1 | PB-01 | unassigned | planned |
| W05 | web-ux-content-clarity | 1 | PB-01 | unassigned | planned |
| W05 | web-ux-data-dense-interfaces | 1 | PB-01 | unassigned | planned |
| W06 | web-ux-experimentation-evidence | 1 | PB-01 | unassigned | planned |
| W06 | web-ux-feedback-status | 1 | PB-01 | unassigned | planned |
| W06 | web-ux-forms-conversion | 1 | PB-01 | unassigned | planned |
| W06 | web-ux-information-architecture | 1 | PB-01 | unassigned | planned |
| W06 | web-ux-localization | 1 | PB-01 | unassigned | planned |
| W06 | web-ux-motion-animation | 1 | PB-01 | unassigned | planned |
| W06 | web-ux-offline-resilience | 1 | PB-01 | unassigned | planned |
| W06 | web-ux-onboarding-progressive-disclosure | 1 | PB-01 | unassigned | planned |
| W06 | web-ux-performance | 1 | PB-01 | unassigned | planned |
| W06 | web-ux-privacy-consent | 1 | PB-01 | unassigned | planned |
| W06 | web-ux-quality-gate | 1 | PB-01 | unassigned | planned |
| W06 | web-ux-responsive-design | 1 | PB-01 | unassigned | planned |
| W06 | web-ux-supportability-self-service | 1 | PB-01 | unassigned | planned |
| W06 | web-ux-telemetry-instrumentation | 1 | PB-01 | unassigned | planned |
| W06 | web-ux-trust-risk-signals | 1 | PB-01 | unassigned | planned |
| W06 | web-ux-usability | 1 | PB-01 | unassigned | planned |
| W06 | web-ux-visual-consistency | 1 | PB-01 | unassigned | planned |
| W06 | work-intake-governance | 1 | PB-01 | unassigned | planned |
| W06 | write-mcp-servers | 1 | PB-01 | unassigned | planned |
| W06 | xunit-async-testing | 1 | PB-01 | unassigned | planned |
| W06 | xunit-ci-observability | 1 | PB-01 | unassigned | planned |
| W06 | xunit-fixture-lifecycle | 1 | PB-01 | unassigned | planned |
| W06 | xunit-moq-collaboration | 1 | PB-01 | unassigned | planned |
| W06 | xunit-orchestrator | 1 | PB-01 | unassigned | planned |
| W06 | xunit-quality-gate | 1 | PB-01 | unassigned | planned |
| W06 | xunit-runner-platforms | 1 | PB-01 | unassigned | planned |
| W06 | xunit-source-curation | 1 | PB-01 | unassigned | planned |
| W06 | xunit-test-design | 1 | PB-01 | unassigned | planned |
| W06 | xunit-theory-data-stability | 1 | PB-01 | unassigned | planned |
| W06 | xunit-traits-and-selection | 1 | PB-01 | unassigned | planned |
| W06 | xunit-v2-v3-migration | 1 | PB-01 | unassigned | planned |