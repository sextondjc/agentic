# Performance Evidence Matrix

Workstream ID: web-ux-quality-gate-full-example
Date: 2026-04-24
Owner: Performance Lead
Status: warning

| Journey | LCP | CLS | INP | Wait Point | Risk Band | Status |
|---|---|---|---|---|---|---|
| Checkout landing | 2.3s | 0.07 | 170ms | 0.8s totals paint | watch | pass |
| Payment submit | 2.0s | 0.04 | 245ms | 1.9s pending state | elevated | warning |
| Registration submit | 1.9s | 0.03 | 190ms | 1.0s | watch | pass |

## Key Findings

| Finding ID | Severity | Impact | Disposition | Owner | Due Date |
|---|---|---|---|---|---|
| PERF-FULL-001 | High | Submit latency exceeds threshold on low-end Android | fix-next | Frontend Engineer | 2026-05-03 |
