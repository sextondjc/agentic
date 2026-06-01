---
name: jquery-security
description: Use when reviewing jQuery code for XSS vulnerabilities, unsafe HTML injection, insecure AJAX patterns, CSRF exposure, and Content Security Policy compliance.
---

# jQuery Security

## Specialization

Identify and remediate jQuery-specific security vulnerabilities covering XSS via `.html()`, `$.parseHTML()`, and `$(htmlString)` constructor injection; CSRF in AJAX requests; insecure JSONP usage; and CSP violations from jQuery's inline event model — grounded in OWASP and official jQuery security guidance.

## Trigger Conditions

- Reviewing code that passes user-controlled or server-supplied data to `.html()`, `.append()`, `.prepend()`, `.before()`, `.after()`, `.replaceWith()`, or `.wrap()`.
- Auditing `$()` constructor calls with dynamic HTML strings.
- Reviewing `$.parseHTML()` usage.
- Auditing AJAX calls for CSRF token handling.
- Reviewing JSONP usage for cross-origin data.
- Assessing jQuery version for known CVEs.
- Reviewing inline event handlers (`onclick="..."`) in jQuery-generated HTML for CSP compliance.
- A `jquery-quality-gate` audit identifies a security finding.

## Scope Boundaries

In scope:

- XSS via jQuery DOM manipulation methods with dynamic content.
- `$('<tag>', props)` constructor injection.
- `$.parseHTML()` context and `keepScripts` parameter risks.
- CSRF exposure in `$.ajax()` calls.
- JSONP security and deprecation.
- Known jQuery CVEs and version-specific vulnerabilities.
- CSP compatibility of jQuery patterns.

Out of scope:

- Server-side security controls.
- Authentication and session management.
- Network transport security beyond AJAX header configuration.

## Inputs

- Code under review (file paths or snippets).
- jQuery version in use.
- Endpoint trust model: server-controlled content vs. user-supplied content.
- CSP policy if defined.

## Required Outputs

- XSS risk inventory: each sink consuming dynamic content, with trust classification.
- Remediation for each sink: `.text()` substitution, DOMPurify integration, or structured DOM construction.
- CSRF token strategy for non-idempotent AJAX calls.
- JSONP replacement recommendation if JSONP is found.
- jQuery CVE assessment for the version in use.
- CSP compatibility finding if inline event handlers are generated.

## Done Criteria

- No unsanitized user input reaches a jQuery HTML sink.
- All non-GET AJAX calls inject a CSRF token.
- jQuery version is ≥ 3.5.0.
- No JSONP to untrusted origins.
- `$.globalEval()` is absent.
- Every finding has a severity and explicit remediation.

## Workflow

1. Capture inputs and constraints.
2. Execute this skill's deterministic steps.
3. Publish outputs with status and next actions.

## Execution Context
### Input Context

- Request objective and scope boundary.
- Applicable constraints and required outputs.

### Process Context

- Follow this skill's deterministic workflow from intake to closure.
- Record ownership and decisions for required outputs.

### Output Context

- Deliverables with explicit completion status.
- Residual risks and next actions.
## References Assets

- [Reference assets](./references/README.md)
