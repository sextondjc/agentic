# External Source Interrogation Guidance

## Purpose

This guide defines how to interrogate external repositories for candidate compendium enhancements without cloning or direct import.

## Policy

1. Use interrogation as a read-only discovery activity.
2. Pin every discovery run to an immutable source commit.
3. Record approval chain and security sign-off references in a durable evidence bundle.
4. Decide Adopt, Adapt, or Reject for each candidate group before any implementation.
5. Implement accepted items as local adaptations aligned with workspace governance, naming, and lane ownership.

## Required Artifacts

1. Candidate manifest: `.github/skills/sync-compendium/references/.compendium/external-intake/latest-candidate-manifest.json`
2. Evidence bundle: `.github/skills/sync-compendium/references/.compendium/external-intake/latest-evidence-bundle.json`
3. Decision record: `external-ingestion-decision-template.md` (instantiated per run)

## Standard Command

```powershell
./.github/skills/sync-compendium/references/scripts/Invoke-CompendiumSourceInterrogation.ps1 \
    -SourceRepositoryUrl https://github.com/github/awesome-copilot \
    -WorkstreamId WS-EXT-INTAKE-001 \
    -EngineeringOwner eng-owner \
    -DeliveryOwner delivery-owner \
    -SecuritySignOffReference SEC-REF-123 \
    -RollbackReference RB-PLAYBOOK-01
```

## Promotion Rule

Interrogation output is not an approval to import. Promotion remains blocked until a decision record is approved and required release evidence fields are complete.
