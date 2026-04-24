# Accessibility Findings

Workstream ID: web-ux-quality-gate-example
Date: 2026-04-24
Owner: UX Accessibility Lead

## Summary

- Scope: checkout journey and account sign-in flow.
- Status: pass with exceptions.
- Critical findings: 0
- High findings: 1
- Medium findings: 2
- Low findings: 3

## Findings

| Finding ID | Severity | Impact | Disposition | Owner | Due Date |
|---|---|---|---|---|---|
| A11Y-001 | High | Keyboard focus is lost after payment modal close on Safari | fix-next | Frontend Engineer | 2026-04-30 |
| A11Y-002 | Medium | Error helper text not tied to input for one coupon field | fix-now | Frontend Engineer | 2026-04-26 |
| A11Y-003 | Medium | Heading hierarchy skips one level on summary panel | fix-next | Frontend Engineer | 2026-04-30 |

## Evidence

- Automated scan report: ./scan-results.json
- Checklist outcome: ./gate-checklist.md
- Consolidated recommendation: ./ux-quality-gate-recommendation.md
