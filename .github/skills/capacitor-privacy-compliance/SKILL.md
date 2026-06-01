---
name: capacitor-privacy-compliance
description: Use when a CapacitorJS app must satisfy Apple Privacy Manifest requirements, App Tracking Transparency prompts, Android Play Store data safety declarations, or GDPR/CCPA consent flows — covering authoring, SDK disclosure, and submission-readiness verification.
---

# Capacitor Privacy Compliance

## Specialization

Implement and verify privacy compliance artifacts required for App Store and Play Store submission of CapacitorJS applications. Covers the full surface: iOS `PrivacyInfo.xcprivacy` authoring and required-reason API declarations, third-party SDK privacy disclosures, App Tracking Transparency (ATT) prompt design and timing, Android Play Store data safety form completion, and GDPR/CCPA in-app consent flow patterns at the Capacitor layer.

## Scope Boundaries

In scope:

- iOS `PrivacyInfo.xcprivacy` — authoring, required-reason API categories, and SDK aggregation.
- Apple required-reason APIs: file timestamps (`NSPrivacyAccessedAPICategoryFileTimestamp`), user defaults (`NSPrivacyAccessedAPICategoryUserDefaults`), system boot time, disk space, and active keyboard APIs.
- Third-party SDK privacy manifest aggregation — identifying which Capacitor plugins and native dependencies require their own `PrivacyInfo.xcprivacy`.
- App Tracking Transparency (ATT): `NSUserTrackingUsageDescription`, ATT prompt timing strategy, denial handling, and SKAdNetwork configuration.
- Android Play Store data safety form — mapping app data collection to form categories, retention periods, and sharing disclosures.
- GDPR/CCPA consent UI patterns at the Capacitor layer: consent capture, storage, and propagation to analytics/ad SDKs.
- Privacy audit: detecting undisclosed API usage and third-party SDKs missing privacy manifests.

Out of scope:

- Full legal compliance review (GDPR DPA, CCPA CPRA regulatory interpretation — requires legal counsel).
- App Store review appeal processes.
- General security hardening (`capacitor-security`).
- Analytics SDK integration depth (`capacitor-observability`).
- Full release submission workflow (`capacitor-release-readiness`).

## Trigger Conditions

- App Store submission was rejected due to missing or incomplete `PrivacyInfo.xcprivacy`.
- Xcode build produces a "missing privacy manifest" warning for a Capacitor plugin or dependency.
- The app uses ATT-gated advertising or cross-app tracking and has no ATT prompt implementation.
- Play Store data safety form is incomplete or does not reflect actual data collection.
- A privacy audit or legal review identified undisclosed data collection.
- A new Capacitor plugin is being added and its privacy implications are unknown.
- GDPR/CCPA consent capture is missing or not propagating correctly to SDKs.

## Inputs

- Xcode project output: list of `PrivacyInfo.xcprivacy` warnings from build log.
- Full list of Capacitor plugins in use (from `package.json`).
- List of native third-party SDKs (CocoaPods, Swift Package Manager, Gradle dependencies).
- Whether the app uses advertising identifiers (IDFA) or cross-app tracking.
- Target markets and applicable regulations (EU → GDPR, California → CCPA/CPRA, etc.).
- Analytics, crash reporting, and ad SDKs in use.
- Evaluation date in ISO format (`YYYY-MM-DD`).

## Required Outputs

- `PrivacyInfo.xcprivacy` file with all required-reason API categories and SDK privacy disclosures.
- SDK privacy manifest gap report: plugins/SDKs that need their own manifests but are missing them.
- ATT implementation (if cross-app tracking is used): usage description string, prompt timing strategy, and denial handler.
- Android data safety form completion guide mapped to actual app data collection.
- GDPR/CCPA consent capture pattern (if regulated markets are targeted).
- Privacy audit findings: undisclosed API usage, missing SDK manifests, ATT gaps.
- Rejected-candidate table with deterministic reason codes.
- Closure check: build produces no privacy manifest warnings; submission checklist passes.

## Deterministic Workflow

1. Run an Xcode archive build and capture all `PrivacyInfo.xcprivacy`-related warnings.
2. Enumerate all Capacitor plugins from `package.json` and all native SDKs from `Podfile.lock` and `build.gradle` dependency tree.
3. For each plugin and SDK, determine: (a) does it use a required-reason API category? (b) does it ship its own `PrivacyInfo.xcprivacy`? If not, it must be declared in the app-level manifest.
4. Author or update `ios/App/App/PrivacyInfo.xcprivacy` with all required-reason API entries and collected-data types for first-party collection.
5. Determine whether the app uses IDFA or cross-app tracking. If yes, implement ATT: add `NSUserTrackingUsageDescription` to `Info.plist`, request permission at the correct lifecycle point, handle granted/denied states.
6. Complete the Android Play Store data safety form: map each collected data type to form categories, set sharing and retention disclosures, and save the form.
7. If GDPR/CCPA is applicable, implement consent capture: show consent UI before any analytics/ad SDK initializes; store consent decision; propagate to SDKs on each app launch.
8. Run a privacy audit pass: confirm no required-reason API is used without disclosure; confirm all third-party SDKs have manifests; confirm ATT is implemented if tracking is present.
9. Re-run Xcode archive — zero privacy manifest warnings is the gate.
10. Document SDK inventory with privacy manifest status, data collection categories, and owner.

## Done Criteria

- `PrivacyInfo.xcprivacy` is authored and committed; Xcode build is clean.
- All third-party SDK privacy manifest gaps are resolved or risk-accepted with owner.
- ATT implementation is in place if cross-app tracking is used.
- Android data safety form is complete and saved in Play Console.
- GDPR/CCPA consent flow captures, stores, and propagates consent before SDK initialization (if applicable).
- SDK privacy inventory is documented with manifest status, data categories, and owner.
- Pre-submission privacy checklist passes with zero open blockers.

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
