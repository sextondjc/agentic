# Instructions Lifecycle Catalog

This catalog assigns each instruction file to a primary lifecycle lane.

## Instruction Mapping

| Instruction File | Primary Lane | Secondary Lane | Rationale |
|---|---|---|---|
| `naming-conventions.instructions.md` | Execution | Planning | Mandatory naming standards for future agents, skills, instructions, and prompts. |
| `architecture.instructions.md` | Planning | Execution | Governs architecture and domain boundary decisions before implementation. |
| `prd.instructions.md` | Planning | Review | Governs PRD/spec quality and requirement traceability. |
| `technical-docs.instructions.md` | Planning | Execution | Defines standards for durable planning and specification docs. |
| `async-programming.instructions.md` | Execution | Review | Governs implementation behavior for async and concurrency. |
| `csharp.instructions.md` | Execution | Review | Governs C# engineering implementation standards. |
| `namespace-and-assembly-boundaries.instructions.md` | Execution | Review | Governs namespace and assembly layer separation rules in .NET projects. |
| `syrx.instructions.md` | Execution | Review | Governs Syrx repository and SQL implementation patterns. |
| `ci-cd.instructions.md` | Execution | Review | Governs CI/CD implementation and secure automation. |
| `sql-dba.instructions.md` | Execution | Review | Governs SQL script implementation and operational safety. |
| `powershell.instructions.md` | Execution | Review | Governs PowerShell automation implementation standards. |
| `task-implementation.instructions.md` | Execution | Review | Governs how plans are executed and tracked in changes artifacts. |
| `testing-strategy.instructions.md` | Execution | Review | Governs test implementation and validation patterns. |
| `validation-and-guards.instructions.md` | Execution | Review | Governs boundary validation in produced code. |
| `security-and-secure-coding.instructions.md` | Execution | Review | Governs secure implementation defaults and review expectations. |
| `lifecycle-governance.instructions.md` | Planning | Review | Governs lane classification, handoffs, and lifecycle traceability. |

## Governance Notes

- Instruction files are policy artifacts and remain always-on within `applyTo` scope.
- Lane assignment reflects the primary decision point each policy influences.