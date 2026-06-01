# Integration Testcontainers Checklist Template

- [ ] Fixture owns container startup and cleanup.
- [ ] Wait strategy validates dependency readiness.
- [ ] Connection settings are deterministic for each test run.
- [ ] Tests avoid reliance on pre-existing local services.
- [ ] CI command path matches local execution mode.
- [ ] Failure logs are captured for diagnostics.
