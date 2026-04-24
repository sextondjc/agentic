# Performance Evidence Matrix

Workstream ID: web-ux-quality-gate-example
Date: 2026-04-24
Owner: Web Performance Lead

## Metrics

| Journey | LCP | CLS | INP | Perceived Wait Point | Abandonment Risk Band | Status |
|---|---|---|---|---|---|---|
| Checkout load | 2.4s | 0.06 | 185ms | 0.9s before totals paint | watch | pass |
| Payment submit | 2.1s | 0.03 | 240ms | 1.7s pending state before confirmation | elevated | warning |
| Sign-in submit | 1.6s | 0.02 | 140ms | 0.4s | stable | pass |

## Findings

| Finding ID | Severity | Impact | Disposition | Owner | Due Date |
|---|---|---|---|---|---|
| PERF-001 | High | Payment submit INP exceeds threshold on low-end Android | fix-next | Frontend Engineer | 2026-05-03 |
| PERF-002 | Medium | Spinner state appears without progress cue on 3G profile | fix-now | Frontend Engineer | 2026-04-28 |

## Evidence

- Smoke summary: ./smoke-results.md
- Consolidated recommendation: ./ux-quality-gate-recommendation.md
