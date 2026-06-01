# Docker .NET Fast Rules

Use these as quick checks before writing or approving Docker guidance.

- Use Microsoft base images from `mcr.microsoft.com` and pin image versions.
- Use multi-stage builds and keep SDK out of runtime images.
- Run runtime containers as non-root.
- Never bake secrets into image layers.
- Keep build context lean with a `.dockerignore` file.
- Gate push pipelines with vulnerability scanning.