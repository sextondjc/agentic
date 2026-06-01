---
name: probabilistic-forecasting
description: Use when throughput data, cycle time records, or flow signals must be turned into confidence-based forecasts using simulation or percentile mechanics — covering Monte Carlo simulation, cycle time scatterplots, throughput histograms, and percentile-based service level agreements.
---

# Probabilistic Forecasting

## Specialization

Convert flow data into explicit probabilistic forecasts using quantitative mechanics.

This skill is the method-level complement to `delivery-forecasting`. Where `delivery-forecasting` owns the forecast artifact contract, risk framing, and decision recommendation, this skill teaches *how* to build confidence bands from data: which calculation to use, how to read the result, and what the numbers mean for commitment decisions.

## Objective

Produce a forecast grounded in simulation or percentile mechanics with explicit data inputs, calculation method, confidence bands, and interpretation guidance — replacing intuition and point estimates with evidence.

## Trigger Conditions

- A team needs a date or scope forecast but only has throughput counts, cycle time records, or flow metrics rather than intuition.
- `delivery-forecasting` produced a confidence range but no calculation method was specified.
- A commitment is being made for a fixed-scope or fixed-date delivery that has material consequences if missed.
- Stakeholders are demanding a single-point date and the team needs a principled way to respond with confidence ranges instead.
- Existing estimates are consistently late or consistently early, signaling a calibration problem.

## Scope Boundaries

In scope:

- Throughput-based Monte Carlo simulation for scope delivery forecasting.
- Cycle time percentile analysis for single-item service level expectations.
- Throughput histogram construction and shape interpretation.
- Cycle time scatterplot construction and aging analysis.
- Percentile-based SLA design (50th, 85th, 95th).
- Assumption and comparability review of historical data.
- Confidence band interpretation and commitment guidance.

Out of scope:

- Flow policy design and WIP limit setting (use `flow-metrics`).
- Forecast decision artifacts and commitment risk summaries (use `delivery-forecasting`).
- Story point estimation and velocity-based planning.
- Team capacity modelling.
- Tool-specific configuration for forecasting software.

## Inputs

- Historical throughput: items completed per time unit (week is preferred) for a comparable period.
- Historical cycle time: elapsed time from started to finished per item, with item type noted.
- Target scope: number of items to be delivered, or item types if mixed.
- Target date (optional): needed for scope-for-date questions.
- Data comparability notes: periods to exclude (holidays, team changes, dependency freezes).
- Evaluation date in ISO format (`YYYY-MM-DD`) for source freshness checks.

## Required Outputs

- Data review: comparable period selected, exclusions listed, data shape described.
- Simulation or percentile result: confidence bands at 50th, 85th, and 95th percentile.
- Histogram or scatterplot interpretation: distribution shape, outlier note, tail risk.
- Service level expectation (SLE): stated as "X% of items of this type are completed within N days."
- Interpretation note: what the result means in plain language for a commitment decision.
- Data quality flag: whether the data is strong enough to produce a reliable forecast.

## Deterministic Workflow

1. Classify the question: scope-for-date, date-for-scope, or single-item SLE.
2. Gather the data and review comparability. Remove non-comparable periods and document exclusions.
3. Describe the data shape: mean, range, outlier weeks, and trend direction.
4. Select the calculation method: Monte Carlo for multi-item scope questions; percentile for single-item SLE.
5. Run the calculation. For Monte Carlo: minimum 10,000 trials, report 50th/85th/95th.
6. Interpret the result in plain language: what the 85th percentile means for this commitment.
7. Flag data quality: is the dataset large enough and comparable enough for reliable output?
8. Recommend a commitment posture: accept the 85th percentile, request scope reduction, or decline commitment pending better data.

## Anti-Patterns

- Reporting only the median as the commitment date.
- Averaging throughput before simulation (destroys distribution information).
- Using data from non-comparable periods without noting the distortion.
- Mixing item types without acknowledging the bias.
- Ignoring aging items when they are leading indicators of tail risk.
- Producing a forecast without a data quality flag.

## Done Criteria

- Forecast question is classified.
- Data review is complete with exclusions noted and quality flagged.
- Calculation method is selected and applied correctly.
- Three confidence bands (50th, 85th, 95th) are reported.
- Interpretation note is in plain language.
- Commitment recommendation is present.
- Source catalog entries are current for this evaluation cycle.

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
