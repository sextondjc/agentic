# Lane Intent Reference

Use this table when a new asset needs to be named and the correct lane is unclear, or when reviewing an existing name for lane/vocabulary alignment.

## Lane Definitions

| Lane | Primary Intent | Outputs | Prompt to Caller |
|---|---|---|---|
| Planning | Analyze intent, design, research, decide | Plan, map, decision record, specification, research note | "What does this asset produce — a plan/design, or an implementation artifact, or an evaluation?" |
| Execution | Build, generate, transform, produce concrete artifacts | Code, docs, config, scripts, applied changes | "Does this asset transform inputs into a deliverable output?" |
| Review | Evaluate, validate, audit, assess, remediate | Findings, scores, dispositions, forecasts, recommendations | "Does this asset assess or judge an artifact rather than producing one?" |

## Lane Assignment Rules

- Every asset has exactly **one** primary lane and optionally **one** secondary lane.
- Secondary lane indicates where the asset can assist without owning the phase.
- When lane is ambiguous, use the **outputs** column above: the type of output produced determines the primary lane, not the subject matter.
- Lane conflicts must be resolved by explicit phase split; mixed ownership must not be left implicit.

## Clarification Prompts

When a caller cannot identify the correct lane, ask the following in order until the lane is clear:

1. **Output type**: "What does this asset produce — a plan or design, a working implementation, or an evaluation/assessment?"
2. **Consumer**: "Who consumes its output — a specialist about to execute, something being built, or a reviewer/decision-maker?"
3. **Trigger**: "When is this asset invoked — before doing work (planning), during doing work (execution), or after doing work (review)?"

## Synonyms for Lane Names

These synonyms may appear in legacy naming and should be treated as equivalent during migration.

| Lane | Accepted synonyms in prose | Not accepted in asset names |
|---|---|---|
| Planning | design, research, analysis, scoping, discovery | plan (standalone), scope, discovery |
| Execution | implementation, authoring, generation, build, transform | impl, gen |
| Review | audit, validation, assessment, evaluation, quality | eval, QA, check (standalone) |

## Known Vocabulary Exceptions

Assets whose naming verb does not match their lane vocabulary but are canonically assigned:

| Asset | Lane | Name Verb | Justification |
|---|---|---|---|
| `write-technical-docs` | Review (secondary Execution) | `write` (Execution verb) | Named for the output artifact type, not the act of evaluation; review is primary because it validates content against standards |
| `delivery-status-grid` | Review | `delivery` (noun, Planning-adjacent) | Named for the deliverable artefact; assessment of delivery state is the function |
| `current-test-coverage` | Review | `current` (adjective modifier) | Named for the freshness requirement of the metric; collection and evaluation is the function |
| `branch-completion` | Execution | `completion` (noun) | Named for the workflow outcome; the act of completing/integrating is Execution |
| `librarian` | Execution | noun (role name) | Named by role analogy; corpus organisation and naming enforcement is Execution |
