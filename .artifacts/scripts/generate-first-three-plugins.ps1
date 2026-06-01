$ErrorActionPreference = "Stop"

$root = (Get-Location).Path
$stageRoot = Join-Path $root ".artifacts/agent-plugins"
$version = "1.0.0"
$generatedAt = (Get-Date).ToUniversalTime().ToString("o")
$sourceCommit = (git rev-parse --short=12 HEAD).Trim()
$author = (git config user.name).Trim()
if ([string]::IsNullOrWhiteSpace($author)) { $author = "workspace-stakeholder" }

function New-DirectoryIfMissing([string]$path) {
    if (-not (Test-Path -LiteralPath $path)) {
        New-Item -ItemType Directory -Path $path -Force | Out-Null
    }
}

function Copy-Asset([string]$src, [string]$dst) {
    New-DirectoryIfMissing (Split-Path -Parent $dst)
    Copy-Item -LiteralPath $src -Destination $dst -Recurse -Force
}

function Rel([string]$base, [string]$target) {
    $b = [System.Uri]((Resolve-Path $base).Path.TrimEnd("\\") + [IO.Path]::DirectorySeparatorChar)
    $t = [System.Uri](Resolve-Path $target).Path
    return [System.Uri]::UnescapeDataString($b.MakeRelativeUri($t).ToString()).Replace("\\", "/")
}

function Get-FallbackPurpose([string]$relativePath) {
    if ($relativePath -eq "plugin.json") { return "Plugin manifest metadata and dependency declarations." }
    if ($relativePath -eq "manifest.json") { return "Integrity manifest with per-file and aggregate SHA-256 digests." }
    if ($relativePath -eq "asset-inventory.json") { return "Asset inventory including purpose and SHA-256 metadata." }

    if ($relativePath -match "^skills/([^/]+)/SKILL\.md$") {
        return "Core capability definition for skill '$($Matches[1])'."
    }

    if ($relativePath -match "^skills/([^/]+)/") {
        return "Supporting artifact for skill '$($Matches[1])'."
    }

    if ($relativePath -match "^agents/") {
        return "Agent definition supporting plugin capability workflows."
    }

    if ($relativePath -match "^instructions/") {
        return "Instruction policy asset enforcing plugin governance behavior."
    }

    if ($relativePath -match "^prompts/") {
        return "Prompt contract used to execute plugin-specific workflows."
    }

    return "Plugin support asset."
}

function Get-AssetGuideSection([string]$relativePath) {
    if ($relativePath -eq "plugin.json") {
        return [ordered]@{ key = "plugin-metadata"; header = "Plugin Metadata"; description = "Defines the plugin package contract and dependency declaration." }
    }

    if ($relativePath -eq "manifest.json") {
        return [ordered]@{ key = "integrity-manifest"; header = "Integrity Manifest"; description = "Captures canonical per-file hashes and aggregate plugin digest evidence." }
    }

    if ($relativePath -eq "asset-inventory.json") {
        return [ordered]@{ key = "asset-inventory"; header = "Asset Inventory"; description = "Lists packaged files with purpose and hash metadata for auditing." }
    }

    if ($relativePath -match "^agents/") {
        return [ordered]@{ key = "agents"; header = "Agents"; description = "Agent definitions used to drive plugin workflows and routing behavior." }
    }

    if ($relativePath -match "^instructions/") {
        return [ordered]@{ key = "instructions"; header = "Instructions"; description = "Instruction policies that enforce standards and execution controls." }
    }

    if ($relativePath -match "^prompts/") {
        return [ordered]@{ key = "prompts"; header = "Prompts"; description = "Prompt contracts used to run repeatable, bounded workflow actions." }
    }

    if ($relativePath -match "^skills/") {
        return [ordered]@{ key = "skills"; header = "Skills"; description = "Reusable skill assets that provide focused capability workflows." }
    }

    return [ordered]@{ key = "other"; header = "Other Assets"; description = "Additional supporting assets included in the plugin bundle." }
}

function Get-AssetType([string]$relativePath) {
    if ($relativePath -eq "plugin.json") { return "Plugin Manifest" }
    if ($relativePath -match "^agents/") { return "Agent" }
    if ($relativePath -match "^instructions/") { return "Instruction" }
    if ($relativePath -match "^prompts/") { return "Prompt" }
    if ($relativePath -match "^skills/[^/]+/SKILL\.md$") { return "Skill" }
    if ($relativePath -match "^skills/") { return "Skill Supporting Artifact" }
    return "Other"
}

function Get-DescriptionField([string]$filePath) {
    if (-not (Test-Path -LiteralPath $filePath)) {
        return $null
    }

    $lines = Get-Content -LiteralPath $filePath -TotalCount 80
    foreach ($line in $lines) {
        if ($line -match '^description:\s*(.+)$') {
            $value = $Matches[1].Trim()
            if (($value.StartsWith("'") -and $value.EndsWith("'")) -or ($value.StartsWith('"') -and $value.EndsWith('"'))) {
                $value = $value.Substring(1, $value.Length - 2)
            }

            if (-not [string]::IsNullOrWhiteSpace($value)) {
                return $value
            }
        }
    }

    return $null
}

$plugins = @(
    [ordered]@{
        pluginId = "PLG-01"
        pluginName = "core-intake-governance"
        description = "Deterministic intake, lifecycle governance, and cross-plugin control plane."
        purpose = "Provide a shared governance control plane that standardizes request intake, policy routing, and lifecycle guardrails across plugin compositions."
        capability = "Deterministic intake, governance enforcement, and cross-plugin composition control."
        valueProposition = "Install this plugin to ensure all downstream workflows start with consistent routing, boundary control, and compliance defaults."
        assets = [ordered]@{
            agents = @("orchestrator.agent.md")
            instructions = @("governance-lifecycle.instructions.md", "request-economy.instructions.md", "secure-coding.instructions.md", "governance-release.instructions.md", "governance-naming-conventions.instructions.md")
            prompts = @("run-delivery-pattern.prompt.md", "execute-delivery.prompt.md", "review-project.prompt.md")
            skills = @("work-intake-governance", "route-customization", "compose-skills", "writing-plans", "task-research", "task-execution", "plans", "scope-change-control", "taxonomy-tag-registry")
        }
        purposes = [ordered]@{
            "agents/orchestrator.agent.md" = "Mandatory intake and routing authority for deterministic workflows."
            "instructions/governance-lifecycle.instructions.md" = "Defines lane controls and handoff traceability."
            "instructions/request-economy.instructions.md" = "Enforces bounded discovery and efficient operation."
            "instructions/secure-coding.instructions.md" = "Provides cross-cutting security defaults."
            "instructions/governance-release.instructions.md" = "Defines approval and release evidence policy."
            "instructions/governance-naming-conventions.instructions.md" = "Standardizes asset naming and discoverability conventions."
            "prompts/run-delivery-pattern.prompt.md" = "Encodes approved delivery pattern invocation."
            "prompts/execute-delivery.prompt.md" = "Supports controlled execution resumption."
            "prompts/review-project.prompt.md" = "Provides pre-execution review posture check."
            "skills/work-intake-governance/SKILL.md" = "Specializes intake classification and admission control."
            "skills/route-customization/SKILL.md" = "Maps requests to correct customization type."
            "skills/compose-skills/SKILL.md" = "Defines deterministic multi-skill composition contracts."
            "skills/writing-plans/SKILL.md" = "Produces execution-ready plans when absent."
            "skills/task-research/SKILL.md" = "Supports bounded research before implementation."
            "skills/task-execution/SKILL.md" = "Executes approved plans with traceability."
            "skills/plans/SKILL.md" = "Supports checkpointed plan execution in dedicated sessions."
            "skills/scope-change-control/SKILL.md" = "Governs adds, swaps, and descopes during delivery."
            "skills/taxonomy-tag-registry/SKILL.md" = "Maintains tag consistency across artifacts."
        }
    },
    [ordered]@{
        pluginId = "PLG-04"
        pluginName = "plugin-authoring-lifecycle"
        description = "End-to-end authoring and publishing workflows for agent plugins."
        purpose = "Provide a focused lifecycle toolkit for designing, implementing, hardening, and publishing agent plugins."
        capability = "Plugin scaffolding, implementation-path selection, tool integration, security hardening, and publishing readiness."
        valueProposition = "Install this plugin to accelerate plugin delivery with repeatable authoring patterns and release-grade integrity controls."
        assets = [ordered]@{
            agents = @("workspace-scaffolder.agent.md")
            instructions = @("governance-naming-conventions.instructions.md", "secure-coding.instructions.md", "request-economy.instructions.md")
            prompts = @("workspace-scaffolder.prompt.md")
            skills = @("agent-plugin-setup", "agent-plugin-design", "agent-plugin-implementation-markdown", "agent-plugin-implementation-extension", "agent-plugin-tools-integration", "agent-plugin-security-hardening", "agent-plugin-publishing", "agent-authoring", "instructions-authoring", "skills-authoring", "route-customization", "agent-plugin-integrity")
        }
        purposes = [ordered]@{
            "agents/workspace-scaffolder.agent.md" = "Provides scaffolding specialization for new plugin and workspace setup."
            "instructions/governance-naming-conventions.instructions.md" = "Enforces naming standards for authored assets."
            "instructions/secure-coding.instructions.md" = "Applies security requirements to authoring and tool usage."
            "instructions/request-economy.instructions.md" = "Limits unnecessary request expansion and context use."
            "prompts/workspace-scaffolder.prompt.md" = "Operational prompt for scaffold execution flows."
            "skills/agent-plugin-setup/SKILL.md" = "Covers plugin skeleton and base manifest initialization."
            "skills/agent-plugin-design/SKILL.md" = "Defines persona, workflow, permissions, and boundaries."
            "skills/agent-plugin-implementation-markdown/SKILL.md" = "Implements simple .agent.md based agents."
            "skills/agent-plugin-implementation-extension/SKILL.md" = "Implements TypeScript extension-based agents."
            "skills/agent-plugin-tools-integration/SKILL.md" = "Handles built-in, MCP, and extension tool wiring."
            "skills/agent-plugin-security-hardening/SKILL.md" = "Performs hardening and threat-control checks."
            "skills/agent-plugin-publishing/SKILL.md" = "Defines packaging and publishing lifecycle."
            "skills/agent-authoring/SKILL.md" = "Improves .agent.md quality and role boundaries."
            "skills/instructions-authoring/SKILL.md" = "Improves instruction scope and applyTo quality."
            "skills/skills-authoring/SKILL.md" = "Improves skill trigger clarity and self-containment."
            "skills/route-customization/SKILL.md" = "Selects correct customization format per requirement."
            "skills/agent-plugin-integrity/SKILL.md" = "Produces deterministic per-file and bundle-level SHA-256 integrity evidence."
        }
    },
    [ordered]@{
        pluginId = "PLG-03"
        pluginName = "governance-review-audit"
        description = "Review-lane governance workflows for audits, findings, optimization, and release readiness decisions."
        purpose = "Provide a review-lane governance bundle for auditing customization quality, consolidating findings, and supporting release decisions."
        capability = "Structured governance audits, acceptance checks, remediation guidance, and readiness evaluation workflows."
        valueProposition = "Install this plugin to strengthen quality gates and produce decision-ready evidence before broader rollout or release."
        assets = [ordered]@{
            agents = @("code-reviewer.agent.md", "manual-code-reviewer.agent.md", "governance-briefer.agent.md", "powershell-reviewer.agent.md")
            instructions = @("governance-lifecycle.instructions.md", "technical-docs.instructions.md", "task-implementation.instructions.md")
            prompts = @("execute-customization-audit.prompt.md", "governance-audit-types.prompt.md", "governance-item-audit.prompt.md", "audit-customization-types.prompt.md", "audit-agent.prompt.md", "optimize-customizations.prompt.md", "execute-artifact-condense.prompt.md", "execute-manual-review.prompt.md")
            skills = @("governance-audit", "execute-customization-audit", "audit-executor", "audit-customization-types", "audit-agent", "audit-instructions", "audit-prompts", "audit-skill", "audit-powershell", "acceptance-governance", "optimize-customizations", "governance-health-overview", "governance-summarize", "matrix-skill-mapping", "delivery-status-grid", "remediate-review", "request-code-review", "test-design-review", "test-orchestration", "release-readiness", "release-simulation", "post-release-retrospective")
        }
        purposes = [ordered]@{
            "agents/code-reviewer.agent.md" = "Specialist for standards-based implementation review."
            "agents/manual-code-reviewer.agent.md" = "Captures structured manual review observations."
            "agents/governance-briefer.agent.md" = "Produces concise governance summaries from evidence."
            "agents/powershell-reviewer.agent.md" = "Reviews PowerShell assets for safety and maintainability."
            "instructions/governance-lifecycle.instructions.md" = "Governs lane ownership and handoff behavior."
            "instructions/technical-docs.instructions.md" = "Governs documentation quality and structure."
            "instructions/task-implementation.instructions.md" = "Governs plan-linked execution change traceability."
            "prompts/execute-customization-audit.prompt.md" = "Runs executive aggregate customization governance audits."
            "prompts/governance-audit-types.prompt.md" = "Runs deep type-level governance audits."
            "prompts/governance-item-audit.prompt.md" = "Runs focused single-item governance audit."
            "prompts/audit-customization-types.prompt.md" = "Executes deterministic cross-type interaction audits."
            "prompts/audit-agent.prompt.md" = "Executes agent-focused audit workflows."
            "prompts/optimize-customizations.prompt.md" = "Runs optimization-focused customization reviews."
            "prompts/execute-artifact-condense.prompt.md" = "Produces concise rewrite guidance for artifacts."
            "prompts/execute-manual-review.prompt.md" = "Applies and validates recorded manual review findings."
            "skills/governance-audit/SKILL.md" = "Baseline workspace governance assessment workflow."
            "skills/execute-customization-audit/SKILL.md" = "Aggregates governance outputs into executive disposition."
            "skills/audit-executor/SKILL.md" = "Coordinates full multi-type governance audit execution."
            "skills/audit-customization-types/SKILL.md" = "Evaluates customization type interactions and boundaries."
            "skills/audit-agent/SKILL.md" = "Evaluates .agent.md quality and invocation boundaries."
            "skills/audit-instructions/SKILL.md" = "Evaluates instruction integrity and applyTo correctness."
            "skills/audit-prompts/SKILL.md" = "Evaluates prompt execution contracts and safety."
            "skills/audit-skill/SKILL.md" = "Evaluates skill quality, triggers, and self-containment."
            "skills/audit-powershell/SKILL.md" = "Evaluates PowerShell script safety and style quality."
            "skills/acceptance-governance/SKILL.md" = "Evaluates outputs against acceptance criteria and sign-off rules."
            "skills/optimize-customizations/SKILL.md" = "Applies concise optimization checks across customization assets."
            "skills/governance-health-overview/SKILL.md" = "Synthesizes governance health into unified status view."
            "skills/governance-summarize/SKILL.md" = "Produces concise governance brief artifacts."
            "skills/matrix-skill-mapping/SKILL.md" = "Maintains matrix-to-skill coverage mapping integrity."
            "skills/delivery-status-grid/SKILL.md" = "Produces table-first delivery progress views."
            "skills/remediate-review/SKILL.md" = "Validates and applies review feedback rigorously."
            "skills/request-code-review/SKILL.md" = "Standardizes code-review request workflow."
            "skills/test-design-review/SKILL.md" = "Reviews test strategy and coverage rationale."
            "skills/test-orchestration/SKILL.md" = "Coordinates multi-discipline test evidence and outcomes."
            "skills/release-readiness/SKILL.md" = "Governs release gate evidence and promotion checks."
            "skills/release-simulation/SKILL.md" = "Supports pre-release rehearsal and rollback drill validation."
            "skills/post-release-retrospective/SKILL.md" = "Captures post-release outcomes and follow-up actions."
        }
    },
    [ordered]@{
        pluginId = "PLG-02"
        pluginName = "planning-strategy-design"
        description = "Planning, shaping, and strategy artifacts for multi-phase delivery."
        purpose = "Provide planning-first strategy support for shaping work, defining outcomes, and preparing execution-ready delivery slices."
        capability = "Research-informed planning, product slicing, forecasting, and decision-structure artifacts."
        valueProposition = "Install this plugin to improve planning quality and reduce execution ambiguity before implementation begins."
        assets = [ordered]@{
            agents = @("plan-researcher.agent.md", "architecture-designer.agent.md", "topic-learner.agent.md", "ux-designer.agent.md")
            instructions = @("technical-docs.instructions.md", "prd.instructions.md", "ux-design.instructions.md")
            prompts = @("review-technical-docs.prompt.md")
            skills = @("critical-thinking", "analysis-execution", "backlog-structuring", "product-scope-slicing", "opportunity-mapping", "delivery-operating-system", "delivery-orchestration", "delivery-forecasting", "probabilistic-forecasting", "flow-metrics", "experiment-design", "acceptance-criteria", "adr-generator", "prd-generator", "learn-topics", "governance-delivery", "refine-ideas")
        }
        purposes = [ordered]@{}
    },
    [ordered]@{
        pluginId = "PLG-05"
        pluginName = "compendium-sync-docs"
        description = "Compendium synchronization, technical docs, and curation workflows."
        purpose = "Provide synchronization and documentation workflows that keep customization assets curated, current, and navigable."
        capability = "Documentation generation, indexing, curation, sync maintenance, and pruning support."
        valueProposition = "Install this plugin to keep compendium assets organized and reduce drift between docs and customization inventory."
        assets = [ordered]@{
            agents = @("workspace-scaffolder.agent.md", "governance-briefer.agent.md")
            instructions = @("technical-docs.instructions.md", "governance-lifecycle.instructions.md")
            prompts = @("curate-copilot.prompt.md", "generate-readme.prompt.md", "librarian.prompt.md", "write-component-docs.prompt.md")
            skills = @("curate-copilot-instructions", "index-docs", "librarian", "write-technical-docs", "sync-customizations", "sync-skills", "sync-editorconfig", "powershell-script-library", "prune-sync-assets", "prune-doc-artifacts")
        }
        purposes = [ordered]@{}
    },
    [ordered]@{
        pluginId = "PLG-06"
        pluginName = "dotnet-csharp-engineering"
        description = ".NET/C# implementation, architecture, data access, and testing."
        purpose = "Provide a domain-focused .NET engineering bundle for implementation, architecture quality, and testing excellence."
        capability = "C# development workflows spanning architecture, data access, resilience, testing, and release-quality gates."
        valueProposition = "Install this plugin to deliver .NET changes with stronger architecture discipline, test rigor, and release confidence."
        assets = [ordered]@{
            agents = @("csharp-engineer.agent.md", "defect-debugger.agent.md", "architecture-designer.agent.md", "code-reviewer.agent.md")
            instructions = @("architecture.instructions.md", "async-programming.instructions.md", "csharp.instructions.md", "namespace-boundaries.instructions.md", "syrx.instructions.md", "validation.instructions.md", "testing-strategy.instructions.md", "secure-coding.instructions.md")
            prompts = @("execute-testing-xunit.prompt.md")
            skills = @("csharp-orchestrator", "build-blazor-web-apps", "build-maui-apps", "dotnet-refactor", "dotnet-resilience", "domain-design", "layer-boundaries", "async-programming", "syrx-data-access", "syrx-validation", "data-design", "api-design", "scaffold-dotnet", "csharp-architecture-quality-gate", "csharp-async-quality-gate", "csharp-data-access-quality-gate", "csharp-language-quality-gate", "csharp-testing-quality-gate", "csharp-release-quality-gate", "test-driven-development", "current-test-coverage", "xunit-async-testing", "xunit-ci-observability", "xunit-fixture-lifecycle", "xunit-moq-collaboration", "xunit-orchestrator", "xunit-quality-gate", "xunit-runner-platforms", "xunit-source-curation", "xunit-test-design", "xunit-theory-data-stability", "xunit-traits-and-selection", "xunit-v2-v3-migration", "branch-completion")
        }
        purposes = [ordered]@{}
    },
    [ordered]@{
        pluginId = "PLG-07"
        pluginName = "sql-server-dba"
        description = "SQL Server operations, tuning, automation, and security."
        purpose = "Provide SQL Server operational and tuning capability with strong security and standards guardrails."
        capability = "SQL Server automation, diagnostics, query tuning, security hardening, and T-SQL standards workflows."
        valueProposition = "Install this plugin to handle SQL Server administration and performance work with domain-specific governance controls."
        assets = [ordered]@{
            agents = @("sql-dba.agent.md")
            instructions = @("sql-dba.instructions.md", "secure-coding.instructions.md")
            prompts = @("review-project.prompt.md")
            skills = @("sql-server-orchestrator", "sql-server-automation", "sql-server-diagnostics", "sql-server-query-tuning", "sql-server-security", "sql-server-standards")
        }
        purposes = [ordered]@{}
    },
    [ordered]@{
        pluginId = "PLG-08"
        pluginName = "mcp-server-engineering"
        description = "MCP server design, implementation, hardening, and release quality gates."
        purpose = "Provide an MCP-focused engineering bundle for authoring, refining, securing, testing, and promoting MCP servers."
        capability = "MCP contracts, transport architecture, auth hardening, regression testing, observability, and release readiness."
        valueProposition = "Install this plugin to deliver MCP servers with consistent contracts and production-grade operational controls."
        assets = [ordered]@{
            agents = @("workspace-scaffolder.agent.md")
            instructions = @("secure-coding.instructions.md", "request-economy.instructions.md")
            prompts = @("workspace-scaffolder.prompt.md")
            skills = @("write-mcp-servers", "refine-mcp-servers", "mcp-servers-orchestrator", "mcp-source-curation", "mcp-sdk-selection-csharp-typescript", "mcp-transport-architecture", "mcp-contract-versioning", "mcp-authn-authz-hardening", "mcp-regression-test-design", "mcp-inspector-ci-observability", "mcp-server-quality-gate", "mcp-release-readiness-gate")
        }
        purposes = [ordered]@{}
    },
    [ordered]@{
        pluginId = "PLG-09"
        pluginName = "web-frontend-ux"
        description = "Web frontend implementation plus UX quality and design checks."
        purpose = "Provide a web domain bundle combining frontend engineering and UX quality capabilities."
        capability = "Web frontend implementation, UX design support, and web UX quality-gate specialization workflows."
        valueProposition = "Install this plugin to deliver web experiences with stronger UX outcomes, accessibility, and performance confidence."
        assets = [ordered]@{
            agents = @("web-frontend-engineer.agent.md", "ux-designer.agent.md")
            instructions = @("web-frontend.instructions.md", "ux-design.instructions.md", "secure-coding.instructions.md")
            prompts = @("scaffold-web-ux-quality-gate.prompt.md", "review-technical-docs.prompt.md")
            skills = @("build-web-frontend", "design-web-ux", "web-ux-quality-gate", "web-ux-accessibility", "web-ux-account-identity-flows", "web-ux-content-clarity", "web-ux-data-dense-interfaces", "web-ux-experimentation-evidence", "web-ux-feedback-status", "web-ux-forms-conversion", "web-ux-information-architecture", "web-ux-localization", "web-ux-motion-animation", "web-ux-notification-alerts", "web-ux-offline-resilience", "web-ux-onboarding-progressive-disclosure", "web-ux-performance", "web-ux-privacy-consent", "web-ux-responsive-design", "web-ux-supportability-self-service", "web-ux-telemetry-instrumentation", "web-ux-trust-risk-signals", "web-ux-usability", "web-ux-visual-consistency")
        }
        purposes = [ordered]@{}
    },
    [ordered]@{
        pluginId = "PLG-10"
        pluginName = "mobile-maui-ux"
        description = "Mobile MAUI capability with UX, resilience, and release readiness."
        purpose = "Provide a MAUI-centered mobile engineering bundle with UX quality, resilience, performance, and release readiness workflows."
        capability = "Cross-platform MAUI implementation with mobile UX design and mobile quality-gate specialization."
        valueProposition = "Install this plugin to deliver MAUI mobile features with stronger UX and release confidence."
        assets = [ordered]@{
            agents = @("mobile-frontend-engineer.agent.md", "ux-designer.agent.md")
            instructions = @("mobile-frontend.instructions.md", "ux-design.instructions.md", "secure-coding.instructions.md")
            prompts = @("execute-delivery.prompt.md")
            skills = @("build-mobile-apps", "build-maui-apps", "mobile-orchestrator", "mobile-accessibility-quality-gate", "mobile-offline-resilience", "mobile-performance-quality-gate", "mobile-release-readiness", "design-mobile-ux", "prototype-mobile-ui", "usability-test-scripts")
        }
        purposes = [ordered]@{}
    },
    [ordered]@{
        pluginId = "PLG-11"
        pluginName = "capacitor-mobile"
        description = "Capacitor hybrid mobile capability with setup, security, testing, and release controls."
        purpose = "Provide a Capacitor-focused mobile bundle for hybrid app architecture, native integration, security, and release operations."
        capability = "Capacitor setup, native APIs, auth/session, deep linking, push, observability, security, testing, and release readiness."
        valueProposition = "Install this plugin to implement and operate Capacitor mobile apps with consistent platform-specific controls."
        assets = [ordered]@{
            agents = @("mobile-frontend-engineer.agent.md", "web-frontend-engineer.agent.md")
            instructions = @("mobile-frontend.instructions.md", "secure-coding.instructions.md")
            prompts = @("execute-delivery.prompt.md")
            skills = @("capacitor-orchestrator", "capacitor-setup", "capacitor-web-integration", "capacitor-native-apis", "capacitor-plugin-authoring", "capacitor-auth-session", "capacitor-deep-linking", "capacitor-environment-config", "capacitor-push-notifications", "capacitor-live-updates", "capacitor-accessibility", "capacitor-offline-resilience", "capacitor-observability", "capacitor-security", "capacitor-performance-quality-gate", "capacitor-testing", "capacitor-ci-integration", "capacitor-migration-upgrades", "capacitor-privacy-compliance", "capacitor-release-readiness", "capacitor-source-curation")
        }
        purposes = [ordered]@{}
    },
    [ordered]@{
        pluginId = "PLG-12"
        pluginName = "sveltekit-engineering"
        description = "SvelteKit framework capability for routing, server endpoints, state, auth, and deployment workflows."
        purpose = "Provide a SvelteKit-specific engineering bundle for full framework lifecycle delivery."
        capability = "SvelteKit routing, load/actions/endpoints/hooks/state/auth/testing/observability/packaging workflows."
        valueProposition = "Install this plugin to build and evolve SvelteKit applications with framework-specific best practices."
        assets = [ordered]@{
            agents = @("web-frontend-engineer.agent.md")
            instructions = @("web-frontend.instructions.md", "secure-coding.instructions.md")
            prompts = @("execute-delivery.prompt.md")
            skills = @("sveltekit-orchestrator", "sveltekit-routing", "sveltekit-advanced-routing", "sveltekit-load", "sveltekit-actions", "sveltekit-server-endpoints", "sveltekit-hooks", "sveltekit-errors", "sveltekit-state-management", "sveltekit-auth", "sveltekit-environment", "sveltekit-configuration", "sveltekit-page-options", "sveltekit-adapters", "sveltekit-testing", "sveltekit-observability", "sveltekit-packaging")
        }
        purposes = [ordered]@{}
    },
    [ordered]@{
        pluginId = "PLG-13"
        pluginName = "shadcn-tailwind-system"
        description = "shadcn and Tailwind setup, component patterns, and quality gates."
        purpose = "Provide a design-system focused bundle for shadcn and Tailwind implementation, governance, and quality gates."
        capability = "shadcn and Tailwind setup, component design, theming, testing, source curation, and CI quality workflows."
        valueProposition = "Install this plugin to build and evolve consistent UI systems using shadcn and Tailwind best practices."
        assets = [ordered]@{
            agents = @("web-frontend-engineer.agent.md", "ux-designer.agent.md")
            instructions = @("web-frontend.instructions.md", "ux-design.instructions.md")
            prompts = @("scaffold-web-ux-quality-gate.prompt.md")
            skills = @("shadcn-orchestrator", "shadcn-setup", "shadcn-component-design", "shadcn-forms", "shadcn-data-display", "shadcn-accessibility", "shadcn-animation", "shadcn-registry", "shadcn-testing", "shadcn-source-curation", "shadcn-quality-gate", "shadcn-design-system", "shadcn-migration", "shadcn-theming", "shadcn-ci-integration", "tailwind-orchestrator", "tailwind-setup", "tailwind-component-design", "tailwind-design-system", "tailwind-source-curation", "tailwind-quality-gate", "tailwind-ci-integration", "generate-web-icons")
        }
        purposes = [ordered]@{}
    },
    [ordered]@{
        pluginId = "PLG-14"
        pluginName = "jquery-engineering"
        description = "jQuery implementation, migration, security, and testing."
        purpose = "Provide a jQuery specialization bundle for implementation, modernization, security, and test quality workflows."
        capability = "jQuery core, events, AJAX, plugin patterns, migration, performance, security, and quality-gate workflows."
        valueProposition = "Install this plugin to execute targeted jQuery work with stronger migration and quality controls."
        assets = [ordered]@{
            agents = @("web-frontend-engineer.agent.md")
            instructions = @("web-frontend.instructions.md", "secure-coding.instructions.md")
            prompts = @("execute-delivery.prompt.md")
            skills = @("jquery-orchestrator", "jquery-source-curation", "jquery-core", "jquery-events", "jquery-ajax", "jquery-plugins", "jquery-performance", "jquery-migration", "jquery-security", "jquery-testing", "jquery-ci-integration", "jquery-quality-gate")
        }
        purposes = [ordered]@{}
    },
    [ordered]@{
        pluginId = "PLG-15"
        pluginName = "kendo-engineering"
        description = "Kendo UI implementation, performance, and governance gates."
        purpose = "Provide a Kendo-focused bundle for component implementation, performance, security, and release quality validation."
        capability = "Kendo UI core/data/grid/chart/theming/testing/security/performance and quality-gate workflows."
        valueProposition = "Install this plugin to deliver Kendo UI solutions with framework-specific depth and governance checks."
        assets = [ordered]@{
            agents = @("web-frontend-engineer.agent.md")
            instructions = @("web-frontend.instructions.md", "secure-coding.instructions.md")
            prompts = @("execute-delivery.prompt.md")
            skills = @("kendo-orchestrator", "kendo-ui-source-curation", "kendo-ui-core", "kendo-ui-data-binding", "kendo-ui-grid-advanced", "kendo-ui-charts-dataviz", "kendo-ui-export-printing", "kendo-ui-localization", "kendo-ui-state-persistence", "kendo-ui-real-time-updates", "kendo-ui-upload-file-workflows", "kendo-ui-observability", "kendo-ui-theming", "kendo-ui-accessibility", "kendo-ui-forms", "kendo-ui-security", "kendo-ui-performance", "kendo-ui-migration", "kendo-ui-testing", "kendo-ui-ci-integration", "kendo-ui-quality-gate")
        }
        purposes = [ordered]@{}
    },
    [ordered]@{
        pluginId = "PLG-16"
        pluginName = "performance-security-research"
        description = "Research-only performance and security assessment capability bundle."
        purpose = "Provide an evidence-first research bundle that separates performance and security assessment from implementation work."
        capability = "Performance diagnostics, benchmarking governance, security research, and dependency risk scanning workflows."
        valueProposition = "Install this plugin to run high-confidence performance and security research without mixing implementation responsibilities."
        assets = [ordered]@{
            agents = @("performance-assessor.agent.md", "benchmark-researcher.agent.md", "security-researcher.agent.md")
            instructions = @("secure-coding.instructions.md", "governance-release.instructions.md")
            prompts = @("performance-research.prompt.md", "security-research.prompt.md")
            skills = @("performance-research", "security-research", "perf-benchmark", "benchmark-orchestrator", "benchmark-source-curation", "benchmark-baseline-management", "benchmark-statistical-analysis", "benchmark-profiler-integration", "benchmark-ci-integration", "benchmark-quality-gate", "dependency-security-scan")
        }
        purposes = [ordered]@{}
    }
)

New-DirectoryIfMissing $stageRoot
$marketEntries = @()

foreach ($p in $plugins) {
    $pluginRoot = Join-Path $stageRoot $p.pluginName
    if (Test-Path -LiteralPath $pluginRoot) { Remove-Item -LiteralPath $pluginRoot -Recurse -Force }

    New-DirectoryIfMissing $pluginRoot
    New-DirectoryIfMissing (Join-Path $pluginRoot "agents")
    New-DirectoryIfMissing (Join-Path $pluginRoot "instructions")
    New-DirectoryIfMissing (Join-Path $pluginRoot "prompts")
    New-DirectoryIfMissing (Join-Path $pluginRoot "skills")

    foreach ($a in $p.assets.agents) { Copy-Asset (Join-Path $root ".github/agents/$a") (Join-Path $pluginRoot "agents/$a") }
    foreach ($i in $p.assets.instructions) { Copy-Asset (Join-Path $root ".github/instructions/$i") (Join-Path $pluginRoot "instructions/$i") }
    foreach ($pr in $p.assets.prompts) { Copy-Asset (Join-Path $root ".github/prompts/$pr") (Join-Path $pluginRoot "prompts/$pr") }
    foreach ($s in $p.assets.skills) { Copy-Asset (Join-Path $root ".github/skills/$s") (Join-Path $pluginRoot "skills/$s") }

    $pluginJson = [ordered]@{
        schemaVersion = "1.0"
        id = $p.pluginName
        name = $p.pluginName
        version = $version
        author = $author
        sourceCommit = $sourceCommit
        generatedAtUtc = $generatedAt
        description = $p.description
        capabilities = @($p.description)
        dependencies = @()
        assets = [ordered]@{
            agents = $p.assets.agents
            instructions = $p.assets.instructions
            prompts = $p.assets.prompts
            skills = $p.assets.skills
        }
    }

    if ($p.pluginId -eq "PLG-04") { $pluginJson.dependencies = @("core-intake-governance", "governance-review-audit") }
    elseif ($p.pluginId -eq "PLG-03") { $pluginJson.dependencies = @("core-intake-governance") }
    elseif ($p.pluginId -eq "PLG-02") { $pluginJson.dependencies = @("core-intake-governance") }
    elseif ($p.pluginId -eq "PLG-05") { $pluginJson.dependencies = @("core-intake-governance", "governance-review-audit") }
    elseif ($p.pluginId -eq "PLG-06") { $pluginJson.dependencies = @("core-intake-governance", "governance-review-audit") }
    elseif ($p.pluginId -eq "PLG-07") { $pluginJson.dependencies = @("core-intake-governance", "governance-review-audit") }
    elseif ($p.pluginId -eq "PLG-08") { $pluginJson.dependencies = @("core-intake-governance", "governance-review-audit") }
    elseif ($p.pluginId -eq "PLG-09") { $pluginJson.dependencies = @("core-intake-governance", "governance-review-audit") }
    elseif ($p.pluginId -eq "PLG-10") { $pluginJson.dependencies = @("core-intake-governance", "governance-review-audit") }
    elseif ($p.pluginId -eq "PLG-11") { $pluginJson.dependencies = @("core-intake-governance", "governance-review-audit") }
    elseif ($p.pluginId -eq "PLG-12") { $pluginJson.dependencies = @("core-intake-governance", "governance-review-audit") }
    elseif ($p.pluginId -eq "PLG-13") { $pluginJson.dependencies = @("core-intake-governance", "governance-review-audit", "web-frontend-ux") }
    elseif ($p.pluginId -eq "PLG-14") { $pluginJson.dependencies = @("core-intake-governance", "governance-review-audit", "web-frontend-ux") }
    elseif ($p.pluginId -eq "PLG-15") { $pluginJson.dependencies = @("core-intake-governance", "governance-review-audit", "web-frontend-ux") }
    elseif ($p.pluginId -eq "PLG-16") { $pluginJson.dependencies = @("core-intake-governance", "governance-review-audit") }

    ($pluginJson | ConvertTo-Json -Depth 8) | Out-File -LiteralPath (Join-Path $pluginRoot "plugin.json") -Encoding utf8

    $files = Get-ChildItem -LiteralPath $pluginRoot -Recurse -File | Where-Object { $_.Name -notin @("manifest.json", "README.md", "asset-inventory.json", "bundle.sha256.json") }
    $entries = foreach ($f in $files) {
        $rel = Rel $pluginRoot $f.FullName
        $purpose = $p.purposes[$rel]
        if ([string]::IsNullOrWhiteSpace($purpose)) {
            $purpose = Get-FallbackPurpose -relativePath $rel
        }

        [ordered]@{
            path = $rel
            sha256 = (Get-FileHash -Algorithm SHA256 -LiteralPath $f.FullName).Hash.ToLowerInvariant()
            purpose = $purpose
        }
    }

    $entries = $entries | Sort-Object path
    $canonical = ($entries | ForEach-Object { "{0}:{1}" -f $_.path, $_.sha256 }) -join "`n"
    $aggBytes = [Text.Encoding]::UTF8.GetBytes($canonical)
    $aggHash = [Security.Cryptography.SHA256]::Create().ComputeHash($aggBytes)
    $aggregateDigest = -join ($aggHash | ForEach-Object { $_.ToString("x2") })

    $manifest = [ordered]@{
        pluginId = $p.pluginId
        pluginName = $p.pluginName
        pluginVersion = $version
        author = $author
        sourceCommit = $sourceCommit
        generatedAtUtc = $generatedAt
        digestAlgorithm = "SHA-256"
        artifactEntries = ($entries | ForEach-Object { [ordered]@{ path = $_.path; sha256 = $_.sha256 } })
        aggregateDigest = $aggregateDigest
    }

    ($manifest | ConvertTo-Json -Depth 8) | Out-File -LiteralPath (Join-Path $pluginRoot "manifest.json") -Encoding utf8
    ([ordered]@{
        pluginId = $p.pluginId
        pluginName = $p.pluginName
        pluginVersion = $version
        generatedAtUtc = $generatedAt
        artifactEntries = $entries
    } | ConvertTo-Json -Depth 8) | Out-File -LiteralPath (Join-Path $pluginRoot "asset-inventory.json") -Encoding utf8
    $pluginSha = $aggregateDigest

    $readmeLines = @(
        "# $($p.pluginName)",
        "",
        "## Overview",
        "",
        "- Purpose: $($p.purpose)",
        "- Capability Provided: $($p.capability)",
        "- Why Install: $($p.valueProposition)",
        "",
        "## Version",
        "",
        "- Plugin Name: $($p.pluginName)",
        "- Semantic Version: $version",
        "- Author: $author",
        "- Source Commit: $sourceCommit",
        "- Generated At (UTC): $generatedAt",
        "- Plugin SHA-256: $pluginSha",
        "",
        "## Agent Purpose Guide",
        ""
    )

    $readmeLines += @(
        "| Asset Path | Asset Type | Purpose |",
        "|---|---|---|"
    )

    foreach ($e in $entries) {
        $isAgenticAsset = (
            ($e.path -match "^agents/") -or
            ($e.path -match "^instructions/") -or
            ($e.path -match "^prompts/") -or
            ($e.path -match "^skills/[^/]+/SKILL\.md$")
        )

        if (-not $isAgenticAsset) {
            continue
        }

        $descriptionField = Get-DescriptionField -filePath (Join-Path $pluginRoot $e.path)
        $purpose = $descriptionField
        if ([string]::IsNullOrWhiteSpace($purpose)) {
            $purpose = $e.purpose
        }

        $purpose = ($purpose -replace "\|", "/")
        $assetType = Get-AssetType -relativePath $e.path
        $readmeLines += "| $($e.path) | $assetType | $purpose |"
    }

    $readmeLines += @(
        "",
        "## Asset Inventory",
        "",
        "| Asset Path | SHA-256 |",
        "|---|---|"
    )

    foreach ($e in $entries) {
        $readmeLines += "| $($e.path) | $($e.sha256) |"
    }

    $readmeLines += @(
        "",
        "## Verification",
        "",
        "1. Validate per-asset hashes from manifest: Get-FileHash -Algorithm SHA256 -LiteralPath <asset>",
        "2. Recompute plugin SHA-256 as manifest aggregate digest from canonical <path>:<sha256> lines and compare to Plugin SHA-256.",
        "3. Confirm source commit exists: git cat-file -t $sourceCommit"
    )

    [IO.File]::WriteAllLines((Join-Path $pluginRoot "README.md"), $readmeLines)

    $marketEntries += [ordered]@{
        pluginId = $p.pluginId
        pluginName = $p.pluginName
        version = $version
        description = $p.description
        author = $author
        sourceCommit = $sourceCommit
        generatedAtUtc = $generatedAt
        pluginSha256 = $pluginSha
        manifestPath = (Rel $root (Join-Path $pluginRoot "manifest.json"))
        readmePath = (Rel $root (Join-Path $pluginRoot "README.md"))
        assetInventoryPath = (Rel $root (Join-Path $pluginRoot "asset-inventory.json"))
    }
}

$marketplace = [ordered]@{
    name = "agentic-local-marketplace"
    owner = [ordered]@{
        name = $author
        email = "local@example.invalid"
    }
    metadata = [ordered]@{
        description = "Local marketplace for agentic governance plugins."
        version = "1.0.0"
    }
    plugins = @(
        $marketEntries | ForEach-Object {
            [ordered]@{
                name = $_.pluginName
                description = $_.description
                version = $_.version
                source = "plugins/$($_.pluginName)"
            }
        }
    )
}

($marketplace | ConvertTo-Json -Depth 8) | Out-File -LiteralPath (Join-Path $stageRoot "marketplace.json") -Encoding utf8

$marketReadme = @(
    "# Agent Plugins Marketplace Mirror",
    "",
    "This folder mirrors the intended marketplace structure for staged plugin bundles.",
    "",
    "- Generated At (UTC): $generatedAt",
    "- Source Commit: $sourceCommit",
    "- Digest Algorithm: SHA-256",
    "",
    "## Staged Plugins",
    "",
    "| Plugin | Version | Plugin SHA-256 | Manifest |",
    "|---|---|---|---|"
)

foreach ($m in $marketEntries) {
    $marketReadme += "| $($m.pluginName) | $($m.version) | $($m.pluginSha256) | $($m.manifestPath) |"
}

[IO.File]::WriteAllLines((Join-Path $stageRoot "README.md"), $marketReadme)

Write-Output "Generated plugins: $($marketEntries.pluginName -join ', ')"
Write-Output "Marketplace index: .artifacts/agent-plugins/marketplace.json"
