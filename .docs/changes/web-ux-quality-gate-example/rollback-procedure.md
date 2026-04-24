# Rollback Procedure

Workstream ID: web-ux-quality-gate-example
Rollback Owner: Release Engineer
Reviewed: 2026-04-24

## Trigger Conditions

- Any post-promotion critical regression in checkout completion.
- Payment step conversion drop greater than 5% compared to baseline.
- UX quality gate recommendation invalidated by production telemetry.

## Steps

1. Disable feature flag ux_checkout_v2 in production.
2. Purge CDN cache for checkout and sign-in route bundles.
3. Re-route traffic to prior stable frontend bundle release v2026.04.18.
4. Verify checkout smoke tests from ./smoke-results.md in production-safe mode.
5. Notify engineering owner and product owner that rollback is complete.

## Validation

- Expected completion time: 15 minutes.
- Success criteria: checkout completion rate returns to baseline range within 30 minutes.
