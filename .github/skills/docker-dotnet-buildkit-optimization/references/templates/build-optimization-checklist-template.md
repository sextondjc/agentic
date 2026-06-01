# Build Optimization Checklist Template

- [ ] Baseline build duration was measured and recorded.
- [ ] BuildKit is enabled in local and CI workflows.
- [ ] Dockerfile layer ordering minimizes restore invalidation.
- [ ] Package restore uses cache mount where applicable.
- [ ] Buildx command includes cache import/export strategy.
- [ ] Optimized build duration is measured and compared.
- [ ] Regression thresholds are defined for CI gating.
