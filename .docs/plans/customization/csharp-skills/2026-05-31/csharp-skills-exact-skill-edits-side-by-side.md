# C# Skills Exact Skill Edits (Side-by-Side)

## Metadata
- Document ID: PLAN-CSHARP-SKILLS-2026-05-31-01-EDIT-PREVIEW
- Date: 2026-06-01
- Primary Lane: Planning
- Parent Plan: PLAN-CSHARP-SKILLS-2026-05-31-01
- Purpose: Provide an exact, reviewable old/new diff specification before applying skill-file edits.

## Reviewer Instructions
- Every edit has a stable Edit ID.
- Reply with IDs and your preferred wording to override any proposed `New Text`.
- `Line` is the current line number in the target file at time of drafting.
- `Change Type` values: `Wording`, `Addition`, `Removal`, `Row Update`.
- Code samples are included below as explicit edit IDs with exact insertion points and exact snippets.

## Planned New Reference Files / Templates
- None in this change set.
- No new reference files or templates are planned in this draft.

## Code Sample Status
- Planned code sample additions are included in `SV-007`, `SDA-010`, and `XTD-008`.
- No code sample additions are planned for `.github/skills/csharp-orchestrator/SKILL.md`, `.github/skills/xunit-orchestrator/SKILL.md`, or `.github/catalogs/skills-discovery-index.md` in this change set.

---

## File: .github/skills/syrx-validation/SKILL.md

### SV-001
- Change Type: Wording
- Line: 10
- Current Text:
```md
Use this skill to standardize boundary validation with `Syrx.Validation.Contract.Throw<TException>` across repository and application entry points.
```
- New Text:
```md
Use this skill to standardize boundary validation with `Syrx.Validation.Contract.Throw<TException>` across repository and application entry points, with explicit retrieval-parameter versus state-changing model guard rules.
```

### SV-002
- Change Type: Wording
- Line: 21
- Current Text:
```md
- Replacing repository SQL/data-access patterns (use this skill for that).
```
- New Text:
```md
- Replacing repository SQL/data-access patterns (use `syrx-data-access` for that).
```

### SV-003
- Change Type: Addition
- Line: insert after 38
- Current Text:
```md
N/A (new bullets inserted in Repository-Bound Model Rules)
```
- New Text:
```md
- Retrieval contracts may use validated primitive parameters for identifiers and paging only.
- State-changing contracts (`Create*`, `Update*`, `Delete*`) should use validated complex models/options instead of primitive parameter lists.
```

### SV-004
- Change Type: Wording
- Line: 92
- Current Text:
```md
1. Findings Table
```
- New Text:
```md
1. Findings Table (split by model-boundary findings and repository-signature findings)
```

### SV-005
- Change Type: Addition
- Line: insert after 96
- Current Text:
```md
N/A (new field in Findings Table)
```
- New Text:
```md
   - Finding Category (`Model-Boundary` | `Repository-Signature`)
```

### SV-006
- Change Type: Wording
- Line: 109
- Current Text:
```md
- this skill for repository SQL/data-access implementation patterns.
```
- New Text:
```md
- `syrx-data-access`: repository SQL/data-access implementation patterns.
```

### SV-007
- Change Type: Addition
- Line: insert after 78
- Current Text:
```md
N/A (new code-sample subsection between `Contract.Throw Usage` and `Rationale`)
```
- New Text:
````md
## Repository-Bound Guard Examples

```csharp
using static Syrx.Validation.Contract;

public sealed record UpdateUserOptions
{
   public int Id { get; }
   public string DisplayName { get; }

   public UpdateUserOptions(int id, string displayName)
   {
      Throw<ArgumentOutOfRangeException>(id > 0, nameof(id));
      Throw<ArgumentException>(!string.IsNullOrWhiteSpace(displayName), nameof(displayName));
      Id = id;
      DisplayName = displayName.Trim();
   }
}

public sealed record DeleteUserOptions
{
   public int Id { get; }

   public DeleteUserOptions(int id)
   {
      Throw<ArgumentOutOfRangeException>(id > 0, nameof(id));
      Id = id;
   }
}
```
````

---

## File: .github/skills/syrx-data-access/SKILL.md

### SDA-001
- Change Type: Wording
- Line: 72
- Current Text:
```md
- Use async APIs and pass `CancellationToken`.
```
- New Text:
```md
- Use async APIs, pass `CancellationToken`, and keep CRUD contracts async-only (do not mix sync and async CRUD members in one repository contract).
```

### SDA-002
- Change Type: Addition
- Line: insert after 72
- Current Text:
```md
N/A (new Core Rules bullet)
```
- New Text:
```md
- Prefer canonical CRUD verb families: `Create`, `Retrieve`, `RetrieveAll`, `Update`, `Delete` (and async variants).
```

### SDA-003
- Change Type: Addition
- Line: insert after 73
- Current Text:
```md
N/A (new Core Rules bullet)
```
- New Text:
```md
- Avoid synonym drift (`Save`, `Get`, `List`, `Remove`) unless bounded-context semantics require distinct behavior.
```

### SDA-004
- Change Type: Wording
- Line: 77
- Current Text:
```md
Define interface -> inject `ICommander<TRepository>` -> call async query/execute methods -> isolate mapping/materialization -> register repository in DI.
```
- New Text:
```md
Define read/write interfaces (optionally composed into one repository facade) -> inject `ICommander<TRepository>` -> call async query/execute methods -> isolate mapping/materialization -> register repositories in DI.
```

### SDA-005
- Change Type: Addition
- Line: insert after 84
- Current Text:
```md
N/A (new Configuration Patterns bullet)
```
- New Text:
```md
- Keep repository method signatures independent from command-key resolution concerns; use mapping configuration rather than signature leakage.
```

### SDA-006
- Change Type: Addition
- Line: insert after 92
- Current Text:
```md
N/A (new Query Patterns bullet)
```
- New Text:
```md
- Prefer primitive parameters for retrieval/paging scenarios only; prefer complex options/models for state-changing operations.
```

### SDA-007
- Change Type: Addition
- Line: insert after 131
- Current Text:
```md
N/A (new Anti-Patterns bullet)
```
- New Text:
```md
- Mixing sync and async CRUD members inside one repository contract.
```

### SDA-008
- Change Type: Addition
- Line: insert after 132
- Current Text:
```md
N/A (new Anti-Patterns bullet)
```
- New Text:
```md
- Using `Save*` naming where canonical CRUD verb families are expected.
```

### SDA-009
- Change Type: Addition
- Line: insert after 133
- Current Text:
```md
N/A (new Anti-Patterns bullet)
```
- New Text:
```md
- Using primitive identifier parameters for state-changing operations when a validated complex options model is expected.
```

### SDA-010
- Change Type: Addition
- Line: insert after 100
- Current Text:
```md
N/A (new code-sample subsection between `Query Patterns` and `Pattern Selection Grid`)
```
- New Text:
````md
## Repository Contract and Options Examples

```csharp
using static Syrx.Validation.Contract;

public sealed record UserQuery
{
   public int Page { get; }
   public int Size { get; }

   public UserQuery(int page = 1, int size = 100)
   {
      Throw<ArgumentOutOfRangeException>(page > 0, nameof(page));
      Throw<ArgumentOutOfRangeException>(size > 0, nameof(size));
      Page = page;
      Size = size;
   }
}

public sealed record CreateUserOptions
{
   public string Email { get; }
   public string DisplayName { get; }

   public CreateUserOptions(string email, string displayName)
   {
      Throw<ArgumentException>(!string.IsNullOrWhiteSpace(email), nameof(email));
      Throw<ArgumentException>(!string.IsNullOrWhiteSpace(displayName), nameof(displayName));
      Email = email.Trim();
      DisplayName = displayName.Trim();
   }
}

public interface IUserReadRepository
{
   Task<User?> RetrieveAsync(string email, CancellationToken cancellationToken = default);
   Task<IEnumerable<User>> RetrieveAllAsync(UserQuery query, CancellationToken cancellationToken = default);
}

public interface IUserWriteRepository
{
   Task<User> CreateAsync(CreateUserOptions options, CancellationToken cancellationToken = default);
   Task<User> UpdateAsync(UpdateUserOptions options, CancellationToken cancellationToken = default);
   Task<User> DeleteAsync(DeleteUserOptions options, CancellationToken cancellationToken = default);
}

public interface IUserRepository : IUserReadRepository, IUserWriteRepository
{
}
```
````

---

## File: .github/skills/csharp-orchestrator/SKILL.md

### CO-001
- Change Type: Wording
- Line: 23
- Current Text:
```md
- A change requires explicit ownership across language, async, architecture, validation, testing, or performance.
```
- New Text:
```md
- A change requires explicit ownership across language, async, architecture, validation, testing, or performance, including repository-contract decisions that require a test-guidance follow-on.
```

### CO-002
- Change Type: Addition
- Line: insert after 71
- Current Text:
```md
N/A (new Capability Catalog note)
```
- New Text:
```md
- Repository and model-contract decisions must stabilize in `Validation and Data Integrity` plus `Data Access and Repository Safety` before routing follow-on work to `Testing and Evidence`.
```

### CO-003
- Change Type: Addition
- Line: insert after 78
- Current Text:
```md
N/A (new Deterministic Workflow step)
```
- New Text:
```md
3a. When repository/model guidance and test guidance both apply, complete repository/model contract outputs first, then hand off test-surface changes as a bounded follow-on.
```

### CO-004
- Change Type: Wording
- Line: 94
- Current Text:
```md
| Test strategy and risk coverage decision | Testing and Evidence | Unit, integration, and edge-case coverage matrix |
```
- New Text:
```md
| Test strategy and risk coverage decision (after repository/model contract stabilization) | Testing and Evidence | Unit, integration, and edge-case coverage matrix aligned to repository contract outputs |
```

---

## File: .github/skills/xunit-orchestrator/SKILL.md

### XO-001
- Change Type: Wording
- Line: 20
- Current Text:
```md
- A testing request spans multiple xUnit capability areas.
```
- New Text:
```md
- A testing request spans multiple xUnit capability areas, including repository-driven test-surface changes.
```

### XO-002
- Change Type: Addition
- Line: insert after 70
- Current Text:
```md
N/A (new Capability Catalog phase)
```
- New Text:
```md
- Repository-Driven Test Surface Changes
```

### XO-003
- Change Type: Addition
- Line: insert after 78
- Current Text:
```md
N/A (new Deterministic Workflow step)
```
- New Text:
```md
3a. For repository-driven changes, lock test folder taxonomy (`test/integration/<assembly>/<subject>`) and class ownership boundaries before fixture and async phase decisions.
```

### XO-004
- Change Type: Addition
- Line: insert after 90
- Current Text:
```md
N/A (new matrix row)
```
- New Text:
```md
| Repository-driven test-surface decision (folder/class ownership, read/write split) | Repository-Driven Test Surface Changes | Folder map, class ownership map, and read/write repository test split |
```

### XO-005
- Change Type: Addition
- Line: insert after 91
- Current Text:
```md
N/A (new matrix row)
```
- New Text:
```md
| Shared generator-helper policy (`Generators.cs` and equivalents) | Test Design and Data Strategy | Deterministic test-data ownership and reuse policy |
```

---

## File: .github/skills/xunit-test-design/SKILL.md

### XTD-001
- Change Type: Addition
- Line: insert after 30
- Current Text:
```md
N/A (new Scope Boundaries bullet)
```
- New Text:
```md
- Integration layout decisions for repository tests, including assembly boundary (`<Assembly>.Tests.Integration.csproj`), type folder naming (`<TypeName>Tests`), and method-focused test class ownership.
```

### XTD-002
- Change Type: Addition
- Line: insert after 31
- Current Text:
```md
N/A (new Scope Boundaries bullet)
```
- New Text:
```md
- Test class naming rules where each test class name must exactly match the public repository method being tested (for example, `RetrieveAsync`, `RetrieveAllAsync`).
```

### XTD-003
- Change Type: Addition
- Line: insert after 52
- Current Text:
```md
N/A (new Required Outputs item)
```
- New Text:
```md
- Integration test ownership map including assembly name, `<TypeName>Tests` folder, per-method test classes, and fixture name.
```

### XTD-004
- Change Type: Addition
- Line: insert after 68
- Current Text:
```md
N/A (new Decision Rules bullet)
```
- New Text:
```md
- Prefer behavior-first test method names without underscores; reserve exact class-name matching for the method-under-test class boundary.
```

### XTD-005
- Change Type: Addition
- Line: insert after 69
- Current Text:
```md
N/A (new Decision Rules bullet)
```
- New Text:
```md
- Prioritize failure-path coverage first for repository methods, then include at least one validated happy-path assertion per method.
```

### XTD-006
- Change Type: Addition
- Line: insert after 75
- Current Text:
```md
N/A (new Anti-Pattern Checks bullet)
```
- New Text:
```md
- Sync-over-async setup or teardown in async repository tests.
```

### XTD-007
- Change Type: Addition
- Line: insert after 76
- Current Text:
```md
N/A (new Anti-Pattern Checks bullet)
```
- New Text:
```md
- Tests that assert method names or overload shapes instead of externally observable behavior.
```

### XTD-008
- Change Type: Addition
- Line: insert after 70
- Current Text:
```md
N/A (new code-sample subsection between `Decision Rules` and `Anti-Pattern Checks`)
```
- New Text:
````md
## Repository Test Design Examples

```csharp
namespace My.Application.Repositories.Tests.Integration.UserReadRepositoryTests;

public sealed class RetrieveAsync
{
   [Fact]
   public async Task EmailIsNullOrWhitespaceThrowsArgumentException()
   {
      // failure-path validation
   }

   [Fact]
   public async Task EmailTooLongThrowsArgumentException()
   {
      // failure-path validation
   }

   [Fact]
   public async Task InvalidEmailThrowsInvalidEmailException()
   {
      // failure-path validation
   }

   [Fact]
   public async Task UnknownEmailReturnsNull()
   {
      // failure-path validation
   }

   [Fact]
   public async Task CancellationRequestedIsSuccessful()
   {
      // cancellation-path validation
   }

   [Fact]
   public async Task Success()
   {
      // happy-path validation returning User
   }
}

public sealed class RetrieveAllAsync
{
   [Fact]
   public async Task PageIsNonPositiveThrowsArgumentOutOfRangeException()
   {
      // failure-path validation
   }

   [Fact]
   public async Task SizeIsNonPositiveThrowsArgumentOutOfRangeException()
   {
      // failure-path validation
   }

   [Fact]
   public async Task CancellationRequestedIsSuccessful()
   {
      // cancellation-path validation
   }

   [Fact]
   public async Task Success()
   {
      // happy-path validation returning users
   }
}

public sealed class UserReadRepositoryTestsFixture
{
   // shared integration setup for UserReadRepositoryTests
}
```
````

### XTD-009
- Change Type: Addition
- Line: insert after 77
- Current Text:
```md
N/A (new Anti-Pattern Checks bullet)
```
- New Text:
```md
- Test classes that mix assertions for multiple repository methods instead of one class per public method (`RetrieveAsync`, `RetrieveAllAsync`, etc.).
```

### XTD-010
- Change Type: Addition
- Line: insert after 78
- Current Text:
```md
N/A (new Anti-Pattern Checks bullet)
```
- New Text:
```md
- Missing repository-specific fixture in `<TypeName>Tests` integration folders (for example, `UserReadRepositoryTestsFixture`).
```

---

## File: .github/catalogs/skills-discovery-index.md

### IDX-001
- Change Type: Row Update
- Line: 157
- Current Text:
```md
| csharp-orchestrator | Planning | Execution | Use when one C# and .NET request spans multiple capability areas and needs one deterministic intake, explicit phase ownership, and a unified execution contract. | [SKILL.md](./../skills/csharp-orchestrator/SKILL.md) |
```
- New Text:
```md
| csharp-orchestrator | Planning | Execution | Use when one C# and .NET request spans multiple capability areas and needs deterministic intake, repository/model-first phase ownership, and unified execution handoff into test guidance. | [SKILL.md](./../skills/csharp-orchestrator/SKILL.md) |
```

### IDX-002
- Change Type: Row Update
- Line: 166
- Current Text:
```md
| xunit-orchestrator | Planning | Execution | Use when one xUnit request spans multiple capability areas and needs deterministic intake, explicit phase ownership, and a unified execution contract. | [SKILL.md](./../skills/xunit-orchestrator/SKILL.md) |
```
- New Text:
```md
| xunit-orchestrator | Planning | Execution | Use when one xUnit request spans multiple capability areas and needs deterministic intake, explicit phase ownership, and a unified execution contract for repository-driven and fixture-driven test surfaces. | [SKILL.md](./../skills/xunit-orchestrator/SKILL.md) |
```

### IDX-003
- Change Type: Row Update
- Line: 232
- Current Text:
```md
| syrx-data-access | Execution | Review | Use when implementing or reviewing .NET repository data access that must use Syrx ICommander<TRepository>, explicit parameterized SQL, and project-approved command configuration patterns. | [SKILL.md](./../skills/syrx-data-access/SKILL.md) |
```
- New Text:
```md
| syrx-data-access | Execution | Review | Use when implementing or reviewing .NET repository data access that must use Syrx ICommander<TRepository>, async-only CRUD contracts, canonical CRUD verb families, explicit parameterized SQL, and project-approved command configuration patterns. | [SKILL.md](./../skills/syrx-data-access/SKILL.md) |
```

### IDX-004
- Change Type: Row Update
- Line: 233
- Current Text:
```md
| syrx-validation | Review | Execution | Use when applying or reviewing Syrx.Validation.Contract guard patterns at public boundaries with deterministic validation outcomes. | [SKILL.md](./../skills/syrx-validation/SKILL.md) |
```
- New Text:
```md
| syrx-validation | Review | Execution | Use when applying or reviewing Syrx.Validation.Contract guard patterns at public boundaries with deterministic validation outcomes for retrieval parameters and state-changing models. | [SKILL.md](./../skills/syrx-validation/SKILL.md) |
```

### IDX-005
- Change Type: Row Update
- Line: 280
- Current Text:
```md
| xunit-test-design | Execution | Planning | Use when designing expert-level xUnit tests with deterministic Fact/Theory selection, data strategy, assertion quality, and boundary coverage. | [SKILL.md](./../skills/xunit-test-design/SKILL.md) |
```
- New Text:
```md
| xunit-test-design | Execution | Planning | Use when designing expert-level xUnit tests with deterministic Fact/Theory selection, per-method class naming, integration folder and fixture conventions, failure-path-first coverage, and assertion quality. | [SKILL.md](./../skills/xunit-test-design/SKILL.md) |
```

---

## Change-Set Summary
- Total planned edits: 41
- Files to edit: 6
- New files planned: 0
- Removals planned: 0 direct line removals (all removals are implicit via wording replacement)
- Code sample insertions planned: 3

## Open Review Questions
1. Confirm whether method-name policy should explicitly ban underscore naming (`XTD-004`) or be phrased as a preferred style only.
2. Confirm whether csharp orchestration sequence language should remain repository/model-first (`CO-002`, `CO-003`) across all request types.
3. Confirm whether `syrx-validation` should continue to carry repository-signature reporting (`SV-004`, `SV-005`) or keep pure validation-only reporting.
