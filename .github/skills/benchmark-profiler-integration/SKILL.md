---
name: benchmark-profiler-integration
description: Use when BenchmarkDotNet diagnosers beyond MemoryDiagnoser are needed — covering hardware counters, ETW/perf_events setup, profiler correlation, and diagnoser co-existence rules.
---

# BenchmarkDotNet Profiler Integration

## Specialization

Use this skill to configure and interpret advanced BenchmarkDotNet diagnosers — hardware performance counters, ETW (Windows) and perf_events (Linux) integration, and correlation with external profiler output.

This skill is specialized for advanced diagnostic configuration. It does not cover basic `MemoryDiagnoser` usage (handled by `benchmark-experiment-design`) or statistical result interpretation (handled by `benchmark-statistical-analysis`).

## Objective

Produce a deterministic profiler integration plan with explicit diagnoser selection, platform requirements, counter selection rationale, co-existence rules, and an interpretation guide for advanced diagnostic output.

## Trigger Conditions

- A benchmark shows acceptable time and allocation metrics but CPU or cache behavior is suspect.
- A profiler trace suggested a bottleneck and the hypothesis must be confirmed with reproducible counter evidence.
- A benchmark suite requires hardware counter columns for branch misprediction, cache miss, or instruction throughput analysis.
- A diagnoser combination is needed and co-existence constraints must be validated.
- Results from BenchmarkDotNet must be correlated with an external profiler (PerfView, dotTrace, VTune).

## Scope Boundaries

In scope:

- `HardwareCounters` enum selection and platform availability matrix.
- ETW diagnoser setup on Windows and perf_events diagnoser setup on Linux.
- `DisassemblyDiagnoser` for instruction-level inspection.
- `EtwProfiler` and `PerfCollectProfiler` integration.
- Diagnoser co-existence rules and conflict table.
- Correlation workflow between BenchmarkDotNet output and external profiler traces.

Out of scope:

- Basic `MemoryDiagnoser` usage (covered by `benchmark-experiment-design`).
- Statistical interpretation of time and allocation results (covered by `benchmark-statistical-analysis`).
- CI artifact storage and threshold enforcement (covered by `benchmark-ci-integration`).

## Inputs

- Benchmark class and target methods.
- Performance hypothesis: which CPU-level behavior is under investigation.
- Host OS (Windows / Linux / cross-platform requirement).
- Available profiler tooling (PerfView, dotTrace, VTune, perf CLI).
- Elevated privilege availability (ETW requires admin; perf_events may require `perf_event_paranoid` tuning).
- Evaluation date in ISO format (`YYYY-MM-DD`).

## Required Outputs

- Diagnoser selection decision with rationale and platform check.
- `HardwareCounters` selection table with counter meaning and expected signal.
- Platform setup checklist (ETW or perf_events).
- Diagnoser co-existence assessment for the selected combination.
- Annotated benchmark configuration showing diagnoser wiring.
- Profiler correlation workflow if external profiler is in scope.
- Interpretation guide for the resulting diagnostic columns.

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
