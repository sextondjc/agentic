# Docker Baseline Checklist Template

- [ ] Multi-stage build is used for production image.
- [ ] Runtime image uses non-root user.
- [ ] Base image is pinned to supported .NET version.
- [ ] Dockerfile excludes secrets from layers.
- [ ] dockerignore excludes build outputs and local tooling artifacts.
- [ ] Container exposes only required port(s).
- [ ] Entrypoint runs only the intended service binary.
