# 08 · Security Governance

**Lane:** Review  
**Primary Assets:** `secure-coding.instructions.md`, `security-research/SKILL.md`, `dependency-security-scan/SKILL.md`, `security-researcher.agent.md`  
**Back to:** [Executive Summary](./executive-summary.md) · [INDEX](./INDEX.md)

---

## Purpose

Apply security controls across all artifacts and execution paths through three mechanisms: always-on coding policy (via instruction), research-only vulnerability assessment (via skill), and dependency CVE scanning with SBOM generation (via skill). Security governance applies to all file types — code, scripts, docs, and configuration.

---

## 8.1 Secure Coding Policy

`secure-coding.instructions.md` uses `applyTo: '**'` — global scope. The rationale: security control gaps created by narrower scoping are treated as unacceptable drift, not acceptable trade-offs.

### Core Principles
- **Least privilege** — every component operates with minimum required permissions
- **Deny by default** — access is denied unless explicitly granted
- **Explicit allow-lists** for external systems, URLs, and privileged actions

### Input Validation
- Validate all external input at system boundaries
- Use Syrx guard semantics for invalid input — fail fast before state mutation
- Reject path traversal, malformed identifiers, and invalid enum or range values immediately

### Secrets and Sensitive Data
- Never hardcode secrets, connection strings, or tokens
- Load secrets from environment variables or an approved secret manager
- Redact secrets and sensitive identifiers from logs

### Data Access and Injection
- Use explicit, parameterized SQL only — no concatenation of SQL, shell commands, URLs, or file paths from untrusted input
- For .NET data access: use Syrx only

### Web and API Security
- Validate outbound user-supplied URLs to prevent SSRF
- Apply authentication and authorization checks explicitly at protected boundaries
- Prefer secure defaults for cookies, transport, and API surface configuration

### Cryptography
- Use modern, approved algorithms
- Prefer HTTPS for transport
- Use strong hashing for passwords; use standard encryption for sensitive data at rest when required

### Error Handling
- No silent catches
- Log with actionable context, then rethrow or translate to a safe exception
- Do not expose raw internal errors, SQL details, or secrets to callers

### Dependency Hygiene
- Prefer current stable package versions
- Run security scanning as part of CI for both dependencies and code

---

## 8.2 Security Research Skill

The `security-research` skill is **research-only**. It identifies and documents vulnerabilities without implementing any fixes.

**Scope:** .NET/C# codebases — covering input validation, auth/authz, secret handling, SQL/command/path injection, SSRF, unsafe deserialization, cryptography misuse, async/concurrency exploitable patterns, and dependency hygiene.

### Workflow
1. Establish scope (solution, service, or component boundary)
2. Enumerate entry points and trust boundaries
3. Review code for each vulnerability class
4. Cross-reference with OWASP Top 10 and known .NET-specific patterns
5. Classify findings by exploitability and impact
6. Record evidence for each finding
7. Produce prioritized remediation report

### Evidence Requirements
Each finding must include:
- Source file and symbol location
- Analyzer output, reproduction notes, or authoritative reference
- Exploitability assessment
- Impact classification

Incomplete evidence must be explicitly flagged as a gap — not omitted.

### Hard Constraints
- Research only — no remediation implementation
- No production code edits except the report artifact
- Uncertain items are labeled as hypotheses, not findings

**Output path:** `.docs/research/security/<solution>-security-research-report.md`

---

## 8.3 Dependency Security Scan Skill

The `dependency-security-scan` skill provides deterministic CVE identification, SBOM generation, and severity classification across NuGet, npm/yarn, and Python pip ecosystems.

### Depth Modes

| Mode | When to Use | Coverage |
|---|---|---|
| **L1 Manifest Inventory** | Quick triage | Enumerate manifests; no CVE lookup |
| **L2 CVE Scan (direct)** | Standard delivery gate | Scan direct dependencies; gate signal |
| **L3 Full SBOM + Transitive** | Release promotion | Full SBOM; transitive scan; upgrade path analysis |
| **L4 Multi-DB Cross-Reference** | Critical path, regulated context | L3 + cross-reference NVD + GitHub Advisory + OSV |

### Gate Signal

| Signal | Meaning |
|---|---|
| **PASS** | No findings meeting block threshold |
| **CONDITIONAL** | Findings present but below block threshold; documented acknowledgement required |
| **BLOCK** | Critical CVE or policy violation; promotion cannot proceed |

### Output Artifacts
- Dependency findings report: `.docs/changes/[date]-[task]-security-scan.md`
- SBOM inventory (L3+): `.docs/changes/[date]-[task]-sbom.md`

### Default Trigger
Phase P7a of the workspace delivery pattern — the standard delivery gate scan before release promotion.

---

## 8.4 Security Researcher Agent

The `security-researcher` agent is the **specialist persona** for security research engagements. It:
- Applies the `security-research` skill for full .NET/C# security assessments
- Applies the `dependency-security-scan` skill for SBOM and CVE analysis
- Does not implement fixes — research and report only
- Routes remediation decisions back to the `csharp-engineer` or `orchestrator`

---

## Integration Points

| Governance Type | Connection |
|---|---|
| [Release Governance](./05-release.md) | Security gate in release-readiness requires security sign-off from this governance type |
| [Acceptance & Quality](./06-acceptance-quality.md) | Security discipline checklist in acceptance-governance references secure-coding standards |
| [Health & Audit Overview](./10-health-audit.md) | Dependency hygiene is evaluated as part of governance-audit advisory checks |
| CI/CD | `dependency-security-scan` is triggered at CI gate phase P7a |
