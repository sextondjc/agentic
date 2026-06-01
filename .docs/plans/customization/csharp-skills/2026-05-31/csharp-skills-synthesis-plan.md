# C# Skills Synthesis Plan

## Metadata
- Plan ID: PLAN-CSHARP-SKILLS-2026-05-31-01
- Date: 2026-05-31
- Primary Lane: Planning
- Secondary Lane: Execution
- Owner: orchestrator intake completed; plan execution handoff pending
- Scope: Update reusable C# skill assets in this repository using cross-project evidence from C:\Projects
- Focus Order: 1) *.Models and *.Repositories, 2) *.Tests.*
- Source Evidence:
  - C:\Projects\agentic\.artifacts\analysis\csharp-scan-summary.json
  - C:\Projects\agentic\.artifacts\analysis\csharp-scan-records.json
  - C:\Projects\agentic\.artifacts\analysis\csharp-scan-samples.json
  - C:\Projects\agentic\.artifacts\analysis\csharp-diverse-sample-paths.json
  - C:\Projects\agentic\.artifacts\analysis\csharp-scan-buckets-by-project.json

## Objective
Synthesize and apply a reusable, discoverable C# skills update strategy that reflects real code patterns across C:\Projects while avoiding overfitting to any single repository.

## Boundaries
- In scope:
  - Skill content updates for model validation patterns, repository data-access patterns, and test patterns.
  - Skill-family orchestration and discovery index alignment.
  - Reference sample curation (good patterns and anti-patterns).
- Out of scope:
  - Product application code changes in external repositories.
  - CI/CD workflow changes.
  - Release promotion execution.

## Evidence Summary
- Total C# files scanned: 22477
- Model-classified files: 2067
- Repository-classified files: 596
- Test-classified files: 12734
- xUnit-related files scanned: 7428
- xUnit files with fixtures: 2843
- xUnit files with generator helpers: 1
- Most common xUnit project buckets: Syrx_2.0.0, Syrx_3.0.0, Syrx, Rook_backup, Syrx_

## Phase-Output Ownership Matrix
| Required Output | Owning Phase | Owner | Status |
|---|---|---|---|
| Cross-project pattern inventory (Models/Repositories first) | Planning | plan-researcher equivalent workflow | Completed |
| Reference sample pack with rationale | Planning | plan-researcher equivalent workflow | Completed |
| Skill delta specification | Planning | this plan artifact | Completed |
| Skill markdown updates | Execution | skills-authoring workflow | Not Started |
| Skill discovery index alignment | Execution | skills-authoring workflow | Not Started |
| Severity-tagged quality review | Review | audit-skill workflow | Not Started |

## Step-by-Step Execution Plan With Status

### Step 1 - Lock intake contract
- Status: Completed
- Action:
  - Capture objective, boundaries, ownership, and required outputs in one deterministic intake.
- Deliverable:
  - Plan metadata and matrix in this document.

### Step 2 - Run corpus scan over C:\Projects
- Status: Completed
- Action:
  - Inventory all *.cs files and classify by namespace/path into Models, Repositories, and Tests buckets.
- Deliverable:
  - Evidence artifacts listed in Metadata.

### Step 3 - Build focused taxonomy for Models and Repositories
- Status: Completed
- Action:
  - Identify recurring patterns and anti-patterns in *.Models and *.Repositories first.
- Deliverable:
  - Reference sample pack and style guidance below.

### Step 4 - Build tests taxonomy for *.Tests.*
- Status: Completed
- Action:
  - Classify test lifecycle patterns, async behavior patterns, and assertion style quality.
- Deliverable:
  - Test sample pack and anti-pattern checks below.

### Test Pattern Observations
- Folder structure is mostly `test\integration\<assembly-name>` with nested subject folders such as `DomainRepositoryTests`, `GroupRepositoryTests`, and `Controllers`.
- Test class names often mirror the file name and execution shape, including `CreateAsync`, `DeleteAsync`, `RetrieveAllAsync`, `RetrieveAsync`, and controller classes ending in `IntegrationTests`.
- Method names are behavior-first and descriptive, commonly using `SubjectExpectation` or `ActionExpectation` forms such as `CreateDomainSuccessfully`, `GetDomainsWithInvalidPageReturnsBadRequest`, and `ValidateAliasWithValidAliasReturnsOk`.
- Underscores ARE NOT PERMITTED in test method names. 
- Fixtures are common in integration test assemblies, especially test-assembly markers and repository/service bootstrap fixtures; the corpus shows 2843 xUnit files with fixture usage.
- Generator helpers are rare but present; the scan found one `Generators.cs` helper in a shared test-data area under `Syrx_3.0.0`.

### Step 5 - Draft skill change map
- Status: Not Started
- Action:
  - Convert findings into explicit edit intent for:
    - .github/skills/syrx-validation/SKILL.md
    - .github/skills/syrx-data-access/SKILL.md
    - .github/skills/csharp-orchestrator/SKILL.md
    - .github/skills/xunit-orchestrator/SKILL.md
    - .github/skills/xunit-test-design/SKILL.md
- Deliverable:
  - A change list with section-by-section edits and rationale.

### Step 5 Deliverable - Skill-by-Skill Change Map

#### Skill 1 - syrx-validation
- Target file:
  - .github/skills/syrx-validation/SKILL.md
- Current sections to update:
  - `Overview`
  - `Trigger Conditions`
  - `Repository-Bound Model Rules`
  - `Contract.Throw Usage`
  - `Workflow`
  - `Required Outputs`
- Planned changes:
  - Expand repository-bound model guidance to distinguish retrieval contracts from state-changing contracts.
  - Add explicit guidance that repository-bound models should be immutable and validated at construction or factory boundaries.
  - Add validation examples aligned to complex-type state changes such as `UpdateUserOptions` and `DeleteUserOptions`.
  - Clarify exception selection for primitive retrieval parameters versus complex write models.
  - Add required-output language that calls out model-boundary validation findings separately from repository method-shape findings.
- Rationale:
  - This skill currently covers guards and repository-bound model immutability, but it does not yet encode the read/write separation and complex-type preference now captured in the plan.

#### Skill 2 - syrx-data-access
- Target file:
  - .github/skills/syrx-data-access/SKILL.md
- Current sections to update:
  - `Overview`
  - `Trigger Conditions`
  - `Decision Path`
  - `Core Rules`
  - `Repository Pattern`
  - `Configuration Patterns`
  - `Query Patterns`
  - `Security and Reliability Checks`
  - `Testing Guidance`
  - `Review Checklist`
  - `Anti-Patterns`
  - `Required Outputs`
  - `Workflow`
- Planned changes:
  - Add async-first repository contract guidance and prohibit mixing sync and async CRUD members in one repository contract.
  - Add preferred repository composition guidance: separate read and write interfaces, optionally composed into a combined repository.
  - Add canonical method-family guidance for `Create`, `Retrieve`, `RetrieveAll`, `Update`, and `Delete` with async-first overload examples.
  - Preserve overload resolution guidance by documenting default `ICommander<TRepository>` method resolution and explicit method-name overrides where overload-specific command keys differ.
  - Add rule that primitives are preferred only for retrieval and pagination concerns; state-changing operations should prefer complex types.
  - Add examples using `CreateUserOptions`, `UpdateUserOptions`, `DeleteUserOptions`, and `UserQuery` to reinforce correct command-shape boundaries.
  - Update review checklist and anti-patterns to flag `Save*` naming drift, primitive IDs in state-changing operations, mixed sync/async repositories, and repository signatures that leak command-resolution concerns.
- Rationale:
  - This is the primary skill affected by the plan. Most repository guidance refinements, including method naming, overload policy, interface composition, and `ICommander<>` usage, land here.

#### Skill 3 - csharp-orchestrator
- Target file:
  - .github/skills/csharp-orchestrator/SKILL.md
- Current sections to update:
  - `Objective`
  - `Trigger Conditions`
  - `Capability Catalog`
  - `Deterministic Workflow`
  - `Phase-Output Ownership Matrix Template`
  - `Recommendation`
  - `Reference Assets`
- Planned changes:
  - Add an explicit intake rule that C# requests affecting both repository and test guidance should execute in this order: Tests first, Models/Repositories second.
  - Clarify that repository-contract decisions belong primarily to `Validation and Data Integrity` plus `Data Access and Repository Safety`, with test follow-on routed only after those outputs are stabilized.
  - Add a handoff note to xUnit orchestration when repository patterns imply changed test expectations.
  - Add a reusable intake note for read/write interface composition and complex-type write boundaries as repository-safety concerns.
- Rationale:
  - The plan needs this skill to enforce sequencing and ownership so repository pattern decisions are not diluted by early test-phase expansion.

#### Skill 4 - xunit-orchestrator
- Target file:
  - .github/skills/xunit-orchestrator/SKILL.md
- Current sections to update:
  - `Objective`
  - `Trigger Conditions`
  - `Capability Catalog`
  - `Deterministic Workflow`
  - `Phase-Output Ownership Matrix Template`
  - `Recommendation`
- Planned changes:
  - Add folder-structure guidance that recognizes `test\integration\<assembly>` layouts and subject folders such as `*RepositoryTests` and `Controllers`.
  - Add class-naming guidance that allows execution-shaped file names like `CreateAsync`, `DeleteAsync`, `RetrieveAsync`, and `IntegrationTests` when they map to one test subject.
  - Add explicit intake guidance for repository-driven test changes, especially when interface composition, async-only contracts, or overload-based command resolution change the test surface.
  - Add fixture and ownership language for repository tests that validate composed read/write repositories separately from combined repository facades.
  - Add evidence expectations that verify no sync-over-async behavior appears in repository test setup or teardown.
  - Add generator-helper routing guidance so shared `Generators.cs` files are treated as test-data infrastructure rather than feature code.
- Rationale:
  - This skill should coordinate test-phase work once repository contracts are updated, especially where test ownership splits across read and write repository surfaces.

#### Skill 5 - xunit-test-design
- Target file:
  - .github/skills/xunit-test-design/SKILL.md
- Current sections to update:
  - `Scope Boundaries`
  - `Required Outputs`
  - `Deterministic Workflow`
  - `Decision Rules`
  - `Anti-Pattern Checks`
  - `Recommendation`
- Planned changes:
  - Add naming guidance that prefers behavior-first test methods over implementation-echo names, while tolerating the corpus pattern of file-scoped execution names for one-test-class-per-file layouts.
  - Add folder-structure guidance for integration-heavy assemblies that group tests by subject and by assembly boundary.
  - Add behavior-focused repository test patterns that distinguish read repository tests from write repository tests.
  - Add design guidance for overload-focused tests, including retrieval overloads, query overloads, and options-based state-changing overloads.
  - Add fixture guidance for shared assembly setup, async lifetime handling, and test-data bootstrap scopes.
  - Add anti-pattern checks for sync-over-async test setup, weak assertion grouping, and tests that validate method names instead of behavior.
  - Add data-strategy guidance for repository query models and options models in theory data.
  - Add generator guidance that points shared `Generators.cs` helpers toward deterministic test-data creation and away from ad hoc inline data duplication.
- Rationale:
  - This skill will own the concrete test-design updates implied by the repository guidance changes.

#### Skill 6 - skills-discovery-index
- Target file:
  - .github/catalogs/skills-discovery-index.md
- Current sections to update:
  - rows for `syrx-validation`
  - rows for `syrx-data-access`
  - rows for `csharp-orchestrator`
  - rows for `xunit-orchestrator`
  - rows for `xunit-test-design`
- Planned changes:
  - Refresh `When to Use` descriptions so discovery reflects async-first repositories, read/write interface composition, overload-driven command resolution, and repository-test follow-on routing.
  - Ensure the skill family reads as a coherent path: repository and model guidance first, test guidance second.
- Rationale:
  - If discoverability text does not change with the skill content, the updated guidance will remain harder to find and route correctly.

#### Review Skill - audit-skill
- Target file:
  - .github/skills/audit-skill/SKILL.md
- Planned use, not primary content change:
  - Use this skill in Step 11 to review the changed skills for trigger clarity, self-containment, and reference integrity.
  - Flag whether repository guidance is internally consistent across method naming, overload guidance, async-only policy, and read/write interface composition.
- Rationale:
  - The plan currently assumes a review pass; this note makes the review target explicit without making `audit-skill` a primary content-update target.

### Step 6 - Update model-boundary guidance skill
- Status: Not Started
- Action:
  - Add explicit model immutability and constructor guard standards using cross-project references.
- Deliverable:
  - Updated syrx-validation skill sections and examples.

### Step 7 - Update repository safety and contract guidance skill
- Status: Not Started
- Action:
  - Tighten repository return-nullability contract, cancellation token usage, paging guard rules, and commander usage patterns.
  - Standardize repository verb families to `Create`, `Retrieve`, `RetrieveAll`, `Update`, and `Delete`, plus async variants, so overload sets remain discoverable and reusable across projects.
  - Prohibit mixing sync and async CRUD methods in the same repository contract; prefer async repository contracts by default.
- Deliverable:
  - Updated syrx-data-access skill sections and examples, including canonical overload samples for each repository verb family.

### Step 8 - Update C# orchestration skill for phased handoff
- Status: Not Started
- Action:
  - Encode mandatory focus order: Models/Repositories before Tests.
  - Add ownership handoff to xUnit orchestration when test workstream begins.
- Deliverable:
  - Updated csharp-orchestrator decision and workflow sections.

### Step 9 - Update xUnit orchestration and design skills
- Status: Not Started
- Action:
  - Add async fixture lifecycle contract, fixture-boundary guidance, and ban blocking async calls in tests.
  - Add behavior-first naming, integration-folder structure, and deterministic data-source decision checks.
  - Add generator-helper handling for shared `Generators.cs` infrastructure.
- Deliverable:
  - Updated xunit-orchestrator and xunit-test-design sections.

### Step 10 - Synchronize discovery catalog
- Status: Not Started
- Action:
  - Ensure .github/catalogs/skills-discovery-index.md reflects revised C# skill family routing.
- Deliverable:
  - Catalog rows updated in same change set.

### Step 11 - Run review gate
- Status: Not Started
- Action:
  - Perform severity-tagged audit of updated skill assets.
- Deliverable:
  - Findings table with pass/fail recommendation and remediation notes.

### Step 12 - Close plan with execution handoff
- Status: Not Started
- Action:
  - Record execution checkpoint and open items for next session.
- Deliverable:
  - Updated status markers and next-session start point.

## Reference Samples To Use In Skills (Before Applying Changes)

## Models

### Model Sample A - Immutable request model with normalization and boundary guards
Source: C:\Projects\Rook_backup\20260406\Rook\src\Rook.Api.Models\CaptureRequest.cs

```csharp
public sealed record CaptureRequest
{
    public string Tag { get; }

    public CaptureRequest(string tag)
    {
        Throw<ArgumentException>(!string.IsNullOrWhiteSpace(tag), nameof(tag));

        var normalizedTag = tag.Trim().ToUpperInvariant();
        Throw<ArgumentException>(TagFormat.IsValid(normalizedTag), nameof(tag));

        Tag = normalizedTag;
    }
}
```

Rationale and style:
- Preserves immutability at the boundary.
- Enforces invariants before assignment.
- Normalizes once at creation time to avoid downstream divergence.

### Model Sample B - Base entity identity and audit guard contract
Source: C:\Projects\anonyme_1x\2025.11.14\src\backend\Anonyme.Server.Models\Entities\BaseEntity.cs

```csharp
public abstract record BaseEntity
{
    public Guid Id { get; init; }
    public DateTime CreatedAt { get; init; }
    public DateTime? UpdatedAt { get; init; }

    protected BaseEntity(Guid id, DateTime createdAt, DateTime? updatedAt = null)
    {
        Throw<ArgumentException>(id != Guid.Empty, nameof(id));
        Throw<ArgumentException>(createdAt != default, nameof(createdAt));

        Id = id;
        CreatedAt = createdAt;
        UpdatedAt = updatedAt;
    }
}
```

Rationale and style:
- Makes identity and timestamp constraints explicit.
- Supports consistent boundary rules across many entity types.

## Repositories

### Repository Naming Policy For Skill Updates
- Canonical repository verbs must remain `Create`, `Retrieve`, `RetrieveAll`, `Update`, and `Delete`.
- Async variants must remain `CreateAsync`, `RetrieveAsync`, `RetrieveAllAsync`, `UpdateAsync`, and `DeleteAsync`.
- Skills should prefer overload families on these verbs instead of introducing synonym verbs such as `Save`, `Get`, `List`, `Remove`, or `Upsert` unless a bounded context has a strict semantic reason.
- Repositories should not mix sync and async CRUD methods in the same interface or implementation.
- Skills should prefer async repository contracts over sync contracts.
- Skills should prefer separate read and write interfaces that can be composed into a single repository surface when needed.
- Skills should prefer complex types over primitives for state-changing operations.
- Primitive parameters are acceptable for retrieval and pagination concerns, but should be avoided for create, update, and delete contracts unless a strict bounded-context reason exists.
- If sync guidance is documented at all, it should be shown as a separate alternative pattern, not combined into the same repository contract as async members.
- Skills should include overload examples for identity-based retrieval, alternate-key retrieval, paged retrieval, and delete-by-entity versus delete-by-id patterns when those patterns are supported.

### Preferred Repository Composition Pattern - Separate read and write interfaces

```csharp
public interface IUserReadRepository
{
  Task<User?> RetrieveAsync(string email, CancellationToken cancellationToken = default);
  Task<IEnumerable<User>> RetrieveAllAsync(int page = 1, int size = 100, CancellationToken cancellationToken = default);
}

public interface IUserWriteRepository
{
  Task<User> CreateAsync(User user, CancellationToken cancellationToken = default);
  Task<User> UpdateAsync(User user, CancellationToken cancellationToken = default);
  Task<User> DeleteAsync(User user, CancellationToken cancellationToken = default);
}

public interface IUserRepository : IUserReadRepository, IUserWriteRepository
{
}

public sealed class UserReadRepository : IUserReadRepository
{
  private readonly ICommander<UserReadRepository> _commander;

  public UserReadRepository(ICommander<UserReadRepository> commander)
  {
    _commander = commander;
  }

  public async Task<User?> RetrieveAsync(string email, CancellationToken cancellationToken = default)
  {
    Throw<ArgumentException>(!string.IsNullOrWhiteSpace(email), nameof(email));
    var result = await _commander.QueryAsync<User>(new { email }, cancellationToken);
    return result.SingleOrDefault();
  }

  public async Task<IEnumerable<User>> RetrieveAllAsync(
    int page = 1,
    int size = 100,
    CancellationToken cancellationToken = default)
  {
    Throw<ArgumentOutOfRangeException>(page > 0, nameof(page));
    Throw<ArgumentOutOfRangeException>(size > 0, nameof(size));
    return await _commander.QueryAsync<User>(new { page, size }, cancellationToken);
  }
}

public sealed class UserWriteRepository : IUserWriteRepository
{
  private readonly ICommander<UserWriteRepository> _commander;

  public UserWriteRepository(ICommander<UserWriteRepository> commander)
  {
    _commander = commander;
  }

  public async Task<User> CreateAsync(User user, CancellationToken cancellationToken = default)
  {
    Throw<ArgumentNullException>(user is not null, nameof(user));
    return await _commander.ExecuteAsync(user!, cancellationToken)
      ? user
      : throw new InvalidOperationException("Create failed.");
  }

  public async Task<User> UpdateAsync(User user, CancellationToken cancellationToken = default)
  {
    Throw<ArgumentNullException>(user is not null, nameof(user));
    return await _commander.ExecuteAsync(user!, cancellationToken)
      ? user
      : throw new InvalidOperationException("Update failed.");
  }

  public async Task<User> DeleteAsync(User user, CancellationToken cancellationToken = default)
  {
    Throw<ArgumentNullException>(user is not null, nameof(user));
    return await _commander.ExecuteAsync(user!, cancellationToken)
      ? user
      : throw new InvalidOperationException("Delete failed.");
  }
}

public sealed class UserRepository : IUserRepository
{
  private readonly IUserReadRepository _read;
  private readonly IUserWriteRepository _write;

  public UserRepository(IUserReadRepository read, IUserWriteRepository write)
  {
    _read = read;
    _write = write;
  }

  public async Task<User?> RetrieveAsync(string email, CancellationToken cancellationToken = default) =>
    await _read.RetrieveAsync(email, cancellationToken);

  public async Task<IEnumerable<User>> RetrieveAllAsync(int page = 1, int size = 100, CancellationToken cancellationToken = default) =>
    await _read.RetrieveAllAsync(page, size, cancellationToken);

  public async Task<User> CreateAsync(User user, CancellationToken cancellationToken = default) =>
    await _write.CreateAsync(user, cancellationToken);

  public async Task<User> UpdateAsync(User user, CancellationToken cancellationToken = default) =>
    await _write.UpdateAsync(user, cancellationToken);

  public async Task<User> DeleteAsync(User user, CancellationToken cancellationToken = default) =>
    await _write.DeleteAsync(user, cancellationToken);
}
```

Rationale and style:
- Makes read/write separation explicit and composable.
- Keeps repository interfaces narrower and easier to test.
- Preserves the option to publish a combined repository surface when consumers need one.
- Keeps command resolution concerns inside `ICommander<>` usage.

### Canonical Repository Contract Sample - Async-first overload reference

```csharp
public interface IUserRepository
{
  Task<User> CreateAsync(User user, CancellationToken cancellationToken = default);
  Task<User> CreateAsync(User user, CreateUserOptions options, CancellationToken cancellationToken = default);

  Task<User?> RetrieveAsync(Guid id, CancellationToken cancellationToken = default);
  Task<User?> RetrieveAsync(string email, CancellationToken cancellationToken = default);

  Task<IEnumerable<User>> RetrieveAllAsync(int page, int size, CancellationToken cancellationToken = default);
  Task<IEnumerable<User>> RetrieveAllAsync(UserQuery query, CancellationToken cancellationToken = default);

  Task<User> UpdateAsync(User user, CancellationToken cancellationToken = default);
  Task<User> UpdateAsync(User user, UpdateUserOptions options, CancellationToken cancellationToken = default);

  Task<User> DeleteAsync(User user, CancellationToken cancellationToken = default);
  Task<User> DeleteAsync(User user, DeleteUserOptions options, CancellationToken cancellationToken = default);
}
```

Rationale and style:
- Keeps repository vocabulary stable across projects and skills.
- Promotes overload discovery by grouping behavior under one verb family instead of fragmenting names.
- Makes identity-based and alternate-key retrieval patterns explicit.
- Separates unpaged and paged retrieval without forcing a different verb.
- Keeps one repository contract style per repository.
- Prefers async as the portable default for modern repository guidance.
- Uses primitives for retrieval and pagination, but prefers complex types for state-changing operations.

Usage note:
- Prefer the separate `IUserReadRepository` and `IUserWriteRepository` pattern above as the default design.
- Use the combined `IUserRepository` surface when a consumer truly benefits from a single composed contract.

### Optional Sync Repository Contract Sample - Separate alternative only

```csharp
public interface IUserRepository
{
  User Create(User user);
  User Create(User user, CreateUserOptions options);

  User? Retrieve(Guid id);
  User? Retrieve(string email);

  IEnumerable<User> RetrieveAll();
  IEnumerable<User> RetrieveAll(int page, int size);
  IEnumerable<User> RetrieveAll(UserQuery query);

  User Update(User user);
  User Update(User user, UpdateUserOptions options);

  User Delete(User user);
  User Delete(User user, DeleteUserOptions options);
}
```

Rationale and style:
- Included only as a separate fallback pattern for environments that intentionally remain synchronous.
- Must not be combined with async CRUD members in the same repository contract.

### Repository Method Family Samples - Minimal reference set

#### CreateAsync overloads

```csharp
public async Task<User> CreateAsync(
  User user,
  CancellationToken cancellationToken = default)
{
  Throw<ArgumentNullException>(user is not null, nameof(user));
  return await _commander.ExecuteAsync(user!, cancellationToken)
    ? user
    : throw new InvalidOperationException("Create failed.");
}

public async Task<User> CreateAsync(
  User user,
  CreateUserOptions options,
  CancellationToken cancellationToken = default)
{
  Throw<ArgumentNullException>(user is not null, nameof(user));
  Throw<ArgumentNullException>(options is not null, nameof(options));
  var model = new { user = user!, options = options! };
  return await _commander.ExecuteAsync(model, cancellationToken, method: "CreateWithOptionsAsync")
    ? user
    : throw new InvalidOperationException("Create failed.");
}
```

Reference intent:
- Use one canonical verb family for insertion behavior.
- Show overload promotion within async-first guidance.
- Keep CallerMemberName concerns inside `ICommander<>` signatures, not repository signatures.
- Override method name explicitly only when an overload maps to a distinct command key.

#### RetrieveAsync overloads

```csharp
public async Task<User?> RetrieveAsync(
  Guid id,
  CancellationToken cancellationToken = default)
{
  Throw<ArgumentException>(id != Guid.Empty, nameof(id));
  var results = await _commander.QueryAsync<User>(new { id }, cancellationToken);
  return results.SingleOrDefault();
}

public async Task<User?> RetrieveAsync(
  string email,
  CancellationToken cancellationToken = default)
{
  Throw<ArgumentException>(!string.IsNullOrWhiteSpace(email), nameof(email));
  var results = await _commander.QueryAsync<User>(new { email }, cancellationToken, method: "RetrieveByEmailAsync");
  return results.SingleOrDefault();
}
```

Reference intent:
- Prefer overloads over bespoke names such as `RetrieveById` and `RetrieveByEmail` in reusable guidance.
- Keep overload promotion inside async-first repository contracts.
- Use default `ICommander<>` command resolution for primary overload and explicit method override for alternate-key overload routing.

#### RetrieveAllAsync overloads

```csharp
public async Task<IEnumerable<User>> RetrieveAllAsync(
  CancellationToken cancellationToken = default)
{
  // Call the overload with default paging values.
  return await RetrieveAllAsync(page: 1, size: 100, cancellationToken: cancellationToken);
}

public async Task<IEnumerable<User>> RetrieveAllAsync(
  int page = 1,
  int size = 100,
  CancellationToken cancellationToken = default)
{
  Throw<ArgumentOutOfRangeException>(page > 0, nameof(page));
  Throw<ArgumentOutOfRangeException>(size > 0, nameof(size));
  return await _commander.QueryAsync<User>(new { page, size }, cancellationToken);
}

public async Task<IEnumerable<User>> RetrieveAllAsync(
  UserQuery query,
  CancellationToken cancellationToken = default)
{
  Throw<ArgumentNullException>(query is not null, nameof(query));
  return await _commander.QueryAsync<User>(query!, cancellationToken, method: "RetrieveByQueryAsync");
}
```

Reference intent:
- Keep collection retrieval under one verb family.
- Make paging an overload concern rather than a new method name.
- Demonstrate overload chaining and explicit method-key overrides for non-default command names.

#### UpdateAsync overloads

```csharp
public async Task<User> UpdateAsync(
  User user,
  UpdateUserOptions options,
  CancellationToken cancellationToken = default)
{
  Throw<ArgumentNullException>(user is not null, nameof(user));
  Throw<ArgumentNullException>(options is not null, nameof(options));
  var model = new { user = user!, options = options! };
  return await _commander.ExecuteAsync(model, cancellationToken, method: "UpdateWithOptionsAsync")
    ? user
    : throw new InvalidOperationException("Update failed.");
}

public async Task<User> UpdateAsync(
  User user,
  CancellationToken cancellationToken = default)
{
  Throw<ArgumentNullException>(user is not null, nameof(user));
  return await _commander.ExecuteAsync(user!, cancellationToken)
    ? user
    : throw new InvalidOperationException("Update failed.");
}
```

Reference intent:
- Keep full-entity and entity-plus-options update variants in the same overload family.
- Avoid primitive identifiers for state-changing operations.
- Show explicit method-key override when overload-to-command naming diverges.

#### DeleteAsync overloads

```csharp
public async Task<User> DeleteAsync(
  User user,
  CancellationToken cancellationToken = default)
{
  Throw<ArgumentNullException>(user is not null, nameof(user));
  return await _commander.ExecuteAsync(new { user!.Id }, cancellationToken, method: "DeleteByEntityAsync")
    ? user
    : throw new InvalidOperationException("Delete failed.");
}

public async Task<User> DeleteAsync(
  User user,
  DeleteUserOptions options,
  CancellationToken cancellationToken = default)
{
  Throw<ArgumentNullException>(user is not null, nameof(user));
  Throw<ArgumentNullException>(options is not null, nameof(options));
  var model = new { user = user!, options = options! };
  return await _commander.ExecuteAsync(model, cancellationToken, method: "DeleteWithOptionsAsync")
    ? user
    : throw new InvalidOperationException("Delete failed.");
}
```

Reference intent:
- Demonstrate entity-only and entity-plus-options delete overloads under one verb family.
- Keep nullability and failure behavior explicit.
- Preserve async-only repository behavior in the canonical guidance.
- Use explicit method-key overrides for overload-specific command mappings.
- Avoid primitive identifiers for state-changing operations.

### Repository Sample A - Syrx commander pattern with guarded boundaries and paging
Source: C:\Projects\anonyme_1x\2025.11.14\src\backend\Anonyme.Server.Repositories\AnonymousEmailRepository.cs

```csharp
public async Task<IEnumerable<AnonymousEmail>> RetrieveByUserIdAsync(Guid userId, int page = 1, int size = 100, CancellationToken cancellationToken = default)
{
    Throw<ArgumentException>(userId != Guid.Empty, nameof(userId));
    Throw<ArgumentOutOfRangeException>(page > 0, nameof(page));
    Throw<ArgumentOutOfRangeException>(size > 0, nameof(size));
    return await _commander.QueryAsync<AnonymousEmail>(new { userId, page, size }, cancellationToken);
}
```

Rationale and style:
- Aligns with Syrx command/query separation.
- Uses deterministic paging validation.
- Preserves cancellation token flow.

Observed cross-project corroboration:
- AO repositories already use `CreateAsync`, `RetrieveAsync`, `RetrieveAllAsync`, `UpdateAsync`, and `DeleteAsync` as the stable CRUD vocabulary.
- Anonyme repositories show the same CRUD intent but drift into `RetrieveBy...` variants; the skill update should normalize this toward overload-first reference samples.

### Repository Sample B - Signature mismatch anti-pattern to avoid
Source: C:\Projects\Mira\server\Mira.Online\src\Mira.Online.Repositories\CountryRepository.cs

```csharp
public async Task<Country> SaveAsync(Country country, CancellationToken cancellationToken = default)
{
    Throw<ArgumentNullException>(country != null, nameof(country));
    var result = await _commander.ExecuteAsync(model, cancellationToken);
    return result ? country : null;
}
```

Rationale and style:
- Return type declares non-null but returns null on failure.
- Skill update should enforce nullability-contract consistency.

### Repository Sample C - Existing async CRUD vocabulary worth preserving
Source: C:\Projects\AO\AO\src\Ao.Repositories\IGroupRepository.cs

```csharp
public interface IGroupRepository
{
  Task<Group> CreateAsync(Group group, CancellationToken cancellationToken = default);
  Task<Group> RetrieveAsync(string email, CancellationToken cancellationToken = default);
  Task<IEnumerable<Group>> RetrieveAllAsync(int page = 1, int size= 100, CancellationToken cancellationToken = default);
  Task<Group> UpdateAsync(Group group, CancellationToken cancellationToken = default);
  Task<Group> DeleteAsync(Group group, CancellationToken cancellationToken = default);
}
```

Rationale and style:
- Already aligns with the desired stable repository verb family.
- Provides a clean async-only baseline that the skill can generalize into async overload families.

## Tests

### Test Sample A - Async lifecycle with deterministic cleanup
Source: C:\Projects\aliasesonline\test\integration\Ao.Repositories.Tests.Integration\GroupRepositoryTests\CreateAsync.cs

```csharp
public sealed class CreateAsync : IClassFixture<IntegrationTestsFixture>, IAsyncLifetime
{
    [Fact]
    public async Task NullGroupThrowsArgumentNullException()
    {
        var result = await ThrowsAsync<ArgumentNullException>(() => _repository.CreateAsync(null!));
        result.ArgumentNull("group");
    }

    public async Task InitializeAsync()
    {
        await GroupRepositoryTestData.CleanupAsync(_repository, _email);
    }

    public async Task DisposeAsync()
    {
        await GroupRepositoryTestData.CleanupAsync(_repository, _email);
    }
}
```

Rationale and style:
- Uses async-aware setup/teardown.
- Keeps behavior assertions explicit.
- Avoids sync-over-async deadlock risks.

### Test Sample B - Blocking async anti-pattern to avoid
Source: C:\Projects\aliasesonline\test\integration\Ao.Repositories.Tests.Integration\DomainRepositoryTests\CreateAsync.cs

```csharp
private void TearDown()
{
    var domain = _repository.RetrieveAsync(TestDomain).Result;
    if (domain != null)
    {
        _repository.DeleteAsync(TestDomain).Wait();
    }
}
```

Rationale and style:
- Uses .Result and .Wait inside test lifecycle.
- Skill update should codify async-only lifecycle patterns.

## Acceptance Checks For Future Skill Edits
- AC-001: Updated skills include at least one reusable reference sample and one anti-pattern per focused domain.
- AC-002: Model guidance enforces immutable boundary contracts and guard-at-construction patterns.
- AC-003: Repository guidance enforces parameterized command usage, cancellation propagation, contract-consistent nullability, and the canonical verb families `Create`, `Retrieve`, `RetrieveAll`, `Update`, and `Delete` plus async variants.
- AC-004: Repository guidance does not mix sync and async CRUD methods in the same repository contract and explicitly prefers async repository contracts.
- AC-005: Repository guidance includes explicit overload samples for alternate-key retrieval, paged retrieval, and delete/update variants where applicable.
- AC-006: Repository overload samples keep method selection internal to `ICommander<>` usage and demonstrate explicit method-name overrides where overload command keys differ.
- AC-007: Repository guidance prefers separate read/write interfaces and shows how they can be composed into a single repository when needed.
- AC-008: Repository guidance uses primitives only for retrieval and pagination examples; state-changing examples prefer complex types.
- AC-009: Test guidance prohibits sync-over-async patterns and requires deterministic fixture lifecycle patterns.
- AC-010: Catalog discoverability remains aligned in .github/catalogs/skills-discovery-index.md in the same change set.
- AC-011: Review output includes severity-tagged findings and explicit disposition.

## Risk Register
| Risk ID | Description | Impact | Mitigation | Status |
|---|---|---|---|---|
| RISK-001 | Overfitting guidance to one repository style | Medium | Require cross-project corroboration before codifying a rule | Active |
| RISK-002 | Ambiguous ownership between C# and xUnit orchestration skills | Medium | Keep single-owner matrix per output and explicit handoff points | Active |
| RISK-003 | Discoverability drift after edits | High | Update skills discovery index in same change | Active |
| RISK-004 | Async anti-patterns retained in test guidance | High | Add explicit prohibition checks and review gate | Active |

## Next Session Resume Point
- Resume from Step 5 (Draft skill change map).
- First execution target: .github/skills/syrx-validation/SKILL.md and .github/skills/syrx-data-access/SKILL.md.
- Keep this plan as the canonical status tracker for subsequent sessions.
