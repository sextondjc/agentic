# Runtime Diagnostics Report

- Container: `sample-api`
- Image Tag: `ghcr.io/org/sample:1.0.0`
- Failure Mode: `Unhealthy after startup`
- Evidence Collected: `docker logs`, `docker inspect`, health status, environment diff summary
- Likely Cause: `Dependency endpoint not reachable during startup`
- Recovery: `Correct dependency host value and rerun health validation`
