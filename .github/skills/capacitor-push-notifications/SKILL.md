---
name: capacitor-push-notifications
description: Use when implementing end-to-end push notification delivery in a CapacitorJS app including APNs and FCM infrastructure setup, notification channels, silent and data-only pushes, server-side payload design, topic targeting, opt-in UX patterns, and deep-link navigation on tap.
---

# Capacitor Push Notifications

## Specialization

Design and implement production-grade push notification delivery for CapacitorJS apps on iOS (APNs) and Android (FCM). Covers the full pipeline: certificate and key lifecycle, FCM project setup, Capacitor plugin wiring, notification channels (Android API 26+), foreground and background handling, silent/data-only pushes, server-side payload design, topic and segment targeting, opt-in and re-engagement UX, and navigation to the correct in-app route on notification tap.

## Scope Boundaries

In scope:

- APNs certificate and `.p8` key lifecycle management.
- FCM project setup: service account, legacy API migration to HTTP v1, and Firebase `google-services.json` / `GoogleService-Info.plist`.
- `@capacitor/push-notifications` plugin wiring: registration, token persistence, foreground and background event handling.
- Android notification channels: creation, importance levels, sound, vibration, and badge behavior.
- iOS permission request strategy: when to ask, soft-ask pattern, settings deep link on denial.
- Silent / data-only pushes: content-available (iOS) and data-only FCM messages.
- Server-side payload design: `notification` vs. `data` fields, TTL, priority, collapse keys.
- Topic and segment targeting: FCM topic subscriptions, audience conditions.
- Opt-in UX: permission rationale, progressive disclosure, re-engagement prompts.
- Tap navigation: routing to the correct in-app screen from `pushNotificationActionPerformed`.
- Notification analytics: delivery, open rate, conversion attribution.

Out of scope:

- In-app messaging (FCM in-app messaging SDK — not a Capacitor concern).
- Full OAuth/PKCE auth session management (`capacitor-auth-session`).
- Deep-link configuration beyond notification-tap routing (`capacitor-deep-linking`).
- OTA live updates (`capacitor-live-updates`).
- Full CI pipeline authoring (`capacitor-ci-integration`).

## Trigger Conditions

- The app needs to receive push notifications on iOS and/or Android.
- Push notifications are not being delivered — diagnosing APNs or FCM configuration errors.
- Android notifications are missing sound or vibration on API 26+ devices (channel not configured).
- iOS permission request is being shown at the wrong time, harming opt-in rate.
- Background / silent pushes are not waking the app.
- Server is sending notifications using the deprecated FCM legacy API.
- Notification taps are opening the app home screen instead of the target content.
- Token rotation after logout is not being handled, causing cross-user notification leaks.

## Inputs

- Target platforms: iOS, Android, or both.
- APNs method: `.p8` key (preferred) or certificate.
- Push service: FCM (Google), direct APNs, or third-party (OneSignal, Braze, Courier, etc.).
- Notification types required: transactional, marketing, silent/data, or all.
- Whether topic / segment targeting is needed.
- Web framework and router in use.
- Whether deep-link navigation on tap is required (cross-reference `capacitor-deep-linking`).
- Evaluation date in ISO format (`YYYY-MM-DD`).

## Required Outputs

- APNs key / certificate setup guide with rotation policy.
- FCM HTTP v1 service account configuration.
- `google-services.json` and `GoogleService-Info.plist` placement guidance.
- `@capacitor/push-notifications` wiring with token persistence, event handlers, and tap routing.
- Android notification channel definitions.
- iOS permission request strategy with soft-ask pattern.
- Server-side payload design reference.
- Token rotation on logout implementation.
- Rejected-candidate table with deterministic reason codes.
- Closure check: end-to-end delivery verified on physical devices for each notification type.

## Deterministic Workflow

1. Decide APNs method (`.p8` key strongly preferred over certificates for lower rotation overhead).
2. Create APNs `.p8` key in Apple Developer portal; record key ID and team ID; never commit the key file.
3. Create Firebase project; enable Cloud Messaging; add iOS and Android apps; download config files.
4. Place `google-services.json` in `android/app/`; place `GoogleService-Info.plist` in `ios/App/App/`.
5. Install `@capacitor/push-notifications`; run `cap sync`.
6. Register for notifications on app launch; handle `registration` event; persist token to backend; associate with authenticated user.
7. Handle `pushNotificationReceived` (foreground) and `pushNotificationActionPerformed` (tap); extract data payload; route to correct screen.
8. Define Android notification channels for each notification category before first delivery.
9. Implement iOS soft-ask: show rationale UI first; only call `requestPermissions()` after user confirms.
10. Implement token rotation: on logout, deregister the token from the backend and call `removeAllListeners()`.
11. Configure server-side payload using FCM HTTP v1 API; set `priority`, `ttl`, and `collapse_key` as required.
12. Test silent/data-only pushes: `content-available: 1` (iOS), `data`-only FCM message (Android).
13. Verify end-to-end delivery on physical devices; log APNs and FCM delivery receipts.

## Done Criteria

- APNs key and FCM project are configured; no credentials in source.
- Plugin is wired with token persistence, foreground, and tap handlers.
- Android notification channels are defined for each notification category.
- iOS soft-ask permission pattern is implemented.
- Token rotation on logout is implemented and tested.
- End-to-end delivery verified on physical devices for all notification types.
- Server-side payload schema is documented with field reference.
- Channel and topic inventory exists with owner and business purpose per entry.

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
