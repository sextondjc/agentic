---
name: powershell
applyTo: '**/*.ps1,**/*.psm1'
description: 'Consolidated PowerShell scripting and cmdlet guidance for safe, idiomatic automation.'
---

# PowerShell Policy

Keep this file policy-only. Use [SKILL.md](./../skills/powershell-script-library/SKILL.md) for detailed script and cmdlet authoring patterns, and [SKILL.md](./../skills/audit-powershell/SKILL.md) for review workflow and correction guidance.

## Naming and Parameters

- Use approved `Verb-Noun` command names with singular nouns.
- Use PascalCase for function and parameter names.
- Use validation attributes for external input.
- Prefer `[switch]` parameters for flags.
- Prefer explicit, automation-friendly parameters over interactive prompts.

## Pipeline and Output

- Support pipeline input only where it is natural for the command contract.
- Return structured objects rather than formatted text.
- Avoid `Write-Host` for data output.
- Stream from `process` rather than buffering unnecessarily large collections.

## Safety and Error Handling

- Mutating commands should use `[CmdletBinding(SupportsShouldProcess = $true)]`.
- Use full cmdlet names and avoid aliases in committed scripts.
- Avoid `Read-Host` in automation-oriented code.
- Prefer structured PowerShell error records over silent failure.

## Documentation and Style

- Public-facing commands should include comment-based help.
- Keep formatting consistent and automation-safe.
- Prefer typed objects and explicit parameter names.

## Routing Notes

- Use [SKILL.md](./../skills/powershell-script-library/SKILL.md) for cmdlet patterns, reuse decisions, and script-catalog workflow.
- Use [SKILL.md](./../skills/audit-powershell/SKILL.md) for safety and maintainability review.
