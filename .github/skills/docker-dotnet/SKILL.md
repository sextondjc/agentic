---
name: docker-dotnet
description: Use when containerizing .NET applications, authoring or reviewing Dockerfiles and docker-compose files, optimizing image builds, or applying container security practices in .NET solutions.
---

# Docker and Containers in .NET

## Specialization

Keep this skill focused on containerization decisions and execution guidance for .NET applications. Keep orchestration-specific implementation details in references.

## When to Use

- Writing or reviewing a Dockerfile for .NET applications.
- Setting up or auditing docker-compose files for local and CI workflows.
- Applying image-size, build-cache, or security hardening improvements.
- Integrating image build, scan, and publish flows in CI.
- Designing integration tests with Testcontainers.

## When Not to Use

- Kubernetes manifests, Helm, or runtime scheduling strategy.
- Cloud-provider container platform architecture decisions beyond image publication.

## Fast Rules

- Use Microsoft base images from mcr.microsoft.com and pin image versions.
- Use multi-stage builds and keep SDK out of runtime images.
- Run runtime containers as non-root.
- Never bake secrets into image layers.
- Keep build context lean with a .dockerignore file.
- Gate push pipelines with vulnerability scanning.

## Required Inputs

- Target .NET app type (ASP.NET, worker, console, or AOT/native).
- Deployment context (local dev, CI-only, or release pipeline).
- Security expectations (non-root, scanning threshold, secret handling).
- Registry and tagging expectations.

## Required Outputs

- A concise containerization decision set for the target service.
- Dockerfile and compose guidance aligned with security and performance rules.
- CI guidance for build, scan, and publish gates.

## Workflow

1. Identify app/runtime shape and deployment target.
2. Apply Dockerfile baseline from the playbook.
3. Apply security hardening and secret-handling checks.
4. Apply compose and integration-testing rules when relevant.
5. Validate CI build, cache, scan, and tagging flow.

## References

- [containerization-checklist.md](./references/containerization-checklist.md)
- [dockerignore-template](./references/dockerignore-template)
- [dockerfile-playbook.md](./references/dockerfile-playbook.md)
- [compose-ci-testcontainers-playbook.md](./references/compose-ci-testcontainers-playbook.md)

## Done Criteria

- Guidance includes pinned base image strategy and multi-stage build use.
- Security posture includes non-root runtime and no secrets in layers.
- Compose and CI guidance are present when requested by scope.
- Output remains concise and points to references for detailed examples.
