# Compose Validation Checklist Template

- [ ] Base compose file has only shared environment behavior.
- [ ] Override file isolates local-only behavior.
- [ ] Secrets are injected from environment variables, not hardcoded.
- [ ] Service dependencies use health checks where needed.
- [ ] Compose startup command succeeds in local validation.
- [ ] CI compose smoke check uses same base file.
