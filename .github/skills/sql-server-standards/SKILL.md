---
name: sql-server-standards
description: Use when authoring or reviewing T-SQL for SQL Server with safety, parameterization, naming, and compatibility standards.
---

# SQL Server Standards

## Specialization

Apply deterministic SQL Server standards for safe, maintainable, and secure T-SQL scripts.

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

## Trigger Conditions

Use this skill when one or more are true:

- Authoring or reviewing `*.sql` scripts.
- Writing migration, maintenance, or DDL/DML scripts.
- Reviewing SQL safety, parameterization, or compatibility compliance.

## Inputs

- User request context and SQL scope.
- Target SQL Server version and environment constraints.
- Script intent (migration, maintenance, reporting, transactional write, or schema change).

## Required Outputs

- SQL changes aligned to safety, parameterization, naming, and compatibility rules.
- Compliance summary of applied standards and explicit exceptions.
- Risk notes for destructive or privileged operations.

## Workflow

1. Classify script intent and risk (read-only, write, destructive, migration).
2. Apply mandatory safety and parameterization rules before optimization.
3. Validate naming, compatibility, and query pattern standards.
4. Add explicit justifications for any exception (for example `NOLOCK`).
5. Summarize compliance and residual risks.
