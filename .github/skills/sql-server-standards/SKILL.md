---
name: sql-server-standards
description: Use when authoring or reviewing T-SQL for SQL Server with safety, parameterization, naming, and compatibility standards.
---

# SQL Server Standards

## Specialization

Apply deterministic SQL Server standards for safe, maintainable, and secure T-SQL scripts across operational, application, and migration work.

This skill is for correctness, safety, and compatibility governance. It is not a performance-tuning or operational triage workflow.

## Objective

Produce or review SQL artifacts that are safe by default, parameterized, version-aware, and explicit about privileged or destructive risk.

## Scope Boundaries

In scope:

- T-SQL authoring and review.
- Safety, parameterization, naming, and compatibility checks.
- Risk framing for destructive, privileged, or non-deterministic statements.

Out of scope:

- Deep execution-plan analysis.
- Broad server-health diagnostics.
- Estate-wide automation design.
- Identity, auditing, and encryption hardening programs.

## Trigger Conditions

Use this skill when one or more are true:

- Authoring or reviewing `*.sql` scripts.
- Writing migration, maintenance, or DDL/DML scripts.
- Reviewing SQL safety, parameterization, or compatibility compliance.
- Validating whether a SQL change is safe enough to proceed.

## Inputs

- User request context and SQL scope.
- Target SQL Server version and environment constraints.
- Script intent (migration, maintenance, reporting, transactional write, or schema change).
- Privilege model and rollback expectations when relevant.

## Required Outputs

- SQL changes aligned to safety, parameterization, naming, and compatibility rules.
- Compliance summary of applied standards and explicit exceptions.
- Risk notes for destructive or privileged operations.
- Determinism check stating whether behavior and rollback path are explicit.

## Deterministic Workflow

1. Classify script intent and risk: read-only, write, destructive, migration, or privileged.
2. Lock target engine/version assumptions before authoring compatibility-sensitive syntax.
3. Apply mandatory safety and parameterization rules before any optimization discussion.
4. Validate naming, compatibility, and query-pattern standards.
5. Require explicit transaction boundaries and rollback-capable validation for non-trivial writes.
6. Flag every exception with justification, blast radius, and review need.
7. Summarize residual risks and confirm whether the artifact is safe to execute.

## Safety Rules

- Never use `SELECT *` in production queries; enumerate columns explicitly.
- Use explicit transactions for multi-statement writes.
- Wrap destructive operations (`DELETE`, `UPDATE`, `TRUNCATE`) in a transaction with rollback-capable validation conditions.
- Never use `DROP` or `TRUNCATE` in migration scripts without guarded existence checks.

## Parameterization

- Pass all user-supplied values as parameters; never interpolate into SQL strings.
- Use `@ParameterName` syntax for all T-SQL parameters.
- Name parameters for the data they carry when it differs from target column names.

## Naming Conventions

- Tables: `PascalCase`, plural (`Orders`, `Customers`).
- Columns: `PascalCase`, singular noun (`OrderId`, `CreatedAt`).
- Stored procedures: `usp_VerbNoun` (for example `usp_GetOrderById`).
- Indexes: `IX_TableName_ColumnName(s)`.
- Primary keys: `PK_TableName`.
- Foreign keys: `FK_ChildTable_ParentTable`.

## Query Patterns

- Prefer `EXISTS` over `COUNT(*)` for existence checks.
- Use `NOLOCK` hints only when explicitly justified and documented; never as a default.
- Avoid cursors; prefer set-based operations.
- Use `TOP` only with `ORDER BY` when pagination is not implemented.

## Compatibility

- Target SQL Server 2019 or later unless the project explicitly targets an earlier version.
- Avoid deprecated features; flag usage of `SET ROWCOUNT`, `/!=`, `text`/`ntext`/`image`, and non-ANSI joins.
- Prefer `TRY_CAST` and `TRY_CONVERT` over `CAST` and `CONVERT` for untrusted input conversion.

## Security

- Apply least privilege; prefer schema-scoped permissions over blanket database roles unless justified.
- Never store plaintext passwords or secrets in SQL scripts or tables.
- Audit sensitive column access (PII/financial data) with approved controls where required.

## Reference Assets

- Use [sql-exception-log-template.md](./references/sql-exception-log-template.md) to record justified exceptions such as `NOLOCK`, compatibility concessions, or privileged execution decisions.

## Done Criteria

- Trigger conditions are satisfied.
- Required outputs are complete.
- Safety, parameterization, compatibility, and privilege rules are all addressed.
- Exceptions are explicit, justified, and bounded.
- Source catalog is current for this evaluation cycle.

## Workflow

1. Capture inputs and constraints.
2. Execute this skill's deterministic steps.
3. Publish outputs with status and next actions.

## Execution Context
### Input Context

- Request objective and scope boundary.
- Applicable constraints and required outputs.

### Process Context

- Follow this skill's deterministic workflow from intake to closure.
- Record ownership and decisions for required outputs.

### Output Context

- Deliverables with explicit completion status.
- Residual risks and next actions.
## References Assets

- [Reference assets](./references/README.md)
