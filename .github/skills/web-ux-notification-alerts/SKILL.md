---
name: web-ux-notification-alerts
description: Use when implementing or reviewing web UX notification and alert outcomes with deterministic frequency, timing, dismissal, and user-control checks and evidence-backed release recommendations.
---

# Web UX Notification and Alert Strategy

## Specialization

Evaluate notification and alert UX for attention economy, accessibility, clarity, and user control over interruption cost.

Notifications are often sources of friction: excessive frequency, unclear priority, poor dismissal, and forced attention create fatigue and trust loss. This skill encodes deterministic checks for notification frequency limits, timing heuristics, dismissal clarity, and user agency over alerts.

## Objective

Produce a severity-ranked findings report and a pass/warning/block release recommendation for notification and alert UX covering:

- Notification frequency and fatigue risk
- Timing heuristics and interruption predictability
- Dismissal clarity and permanence (one-time vs. persistent)
- User control and notification preference settings
- Accessibility and priority signaling
- Real-time notification delivery and persistence across sessions

## Trigger Conditions

- A release introduces new notifications, alerts, or push messages
- Notification strategy or frequency policies are updated
- User feedback surfaces notification fatigue or confusion
- Accessibility audit surfaces notification accessibility issues
- Real-time or alert-based workflow materially changes user interaction pattern

## Scope Boundaries

**In scope:**
- In-app notifications (toast, banner, modal, popover)
- Push notifications (browser, mobile, email)
- Inline alerts and form validation feedback
- Notification frequency policies and rate-limiting
- Dismissal UX and persistence across sessions
- Accessibility attributes (role, live regions, ARIA alerts)
- Notification priority and urgency signaling
- User notification preference and control surfaces

**Out of scope:**
- Deep notification content strategy (covered by content-clarity skill)
- Push notification analytics or engagement optimization (covered by telemetry skill)
- Real-time data synchronization (covered separately by real-time skills if added)
- Email notification design (covered separately if added)

## Inputs

- Deployed prototype or staging URL with notification triggers
- Notification specification (types, frequency, timing, dismissal behavior)
- User research or support data on notification pain points
- Analytics on notification engagement or dismissal rates if available
- Notification preference or settings UI documentation

## Required Outputs

- Notification and Alert Findings Report (`.md`) with severity tagging
- Notification Frequency and Timing Matrix (mapping notification type, trigger, frequency limit, timing)
- Dismissal and Persistence Audit Report (documenting dismissal UX and cross-session behavior)
- User Control Inventory (documenting preference settings and user agency over notifications)
- Accessibility Audit Report (role, live regions, keyboard dismissal)
- Unified Release Recommendation with pass/warning/block disposition

## Deterministic Workflow

### Phase 1: Notification Catalog and Frequency Audit
1. Identify all notification types triggered by the product (confirmation, warning, error, informational, promotional).
2. For each notification type:
   - Document trigger condition and frequency limit (e.g., "max 1 per session", "max 3 per day").
   - Test frequency by simulating trigger conditions; count how many notifications appear.
   - Log frequency violations as high-severity if limit is exceeded or undefined.
3. Assess fatigue risk: products with >5 distinct notification types or >2 notifications per user action face high fatigue risk.

### Phase 2: Timing and Interruption Heuristics
1. For each notification, record timing characteristics:
   - **Automatic vs. user-triggered**: Does notification appear unprompted or in response to user action?
   - **Auto-dismiss timing**: If auto-dismiss, measure delay (tooltips: 1-2s, toasts: 3-5s, modals: indefinite until dismiss).
   - **Interruption cost**: Does notification interrupt user task or wait for task completion?
2. Apply heuristics:
   - Confirmations and successes: auto-dismiss 3-5s, low interruption cost.
   - Errors and warnings: persist until dismissed, medium-high interruption cost.
   - Promotional: auto-dismiss 5-7s or include prominent dismiss option, low-medium interruption cost.
3. Log timing misalignment or excessive interruption as medium-severity findings.

### Phase 3: Dismissal Clarity and Persistence Audit
1. For each notification type, verify:
   - Dismissal is obvious and labeled (close icon, "Dismiss" button, click-outside if safe).
   - One-time dismiss: notification does not reappear unless trigger re-occurs.
   - Persistent dismiss: if user dismisses, notification does not appear again that session (or across sessions if user preference allows).
2. Test persistence:
   - Dismiss notification; reload page or return next session.
   - Verify notification does not reappear (or reappears only if intentional per business logic).
3. Log unclear dismissal or accidental re-appearance as medium-severity findings.

### Phase 4: User Control and Notification Preferences
1. Identify settings or preference UI for user notification control.
2. For each notification type, document:
   - Can user disable this notification type? (yes/no)
   - Can user set frequency preference? (e.g., "digest mode", "urgent only")
   - Is preference UI discoverable and clear? (yes/no)
3. Check for critical notification types (security, account changes) that cannot be disabled; mark as high-severity if disabled without strong rationale.
4. Log missing user control for non-critical notifications as medium-severity findings.

### Phase 5: Accessibility Audit
1. For each notification type, verify:
   - Role attribute correct: `role="alert"` for urgent, `role="status"` for status updates, `role="region"` with aria-live for dynamic updates.
   - Live region announced via screen reader.
   - Keyboard-dismissable: all notifications dismissable via Escape key or Tab+Enter.
   - Focus management: after dismiss, focus returns to trigger or reasonable default.
2. Test with screen reader enabled (NVDA, JAWS, VoiceOver).
3. Log accessibility issues as high-severity findings.

### Phase 6: Priority and Urgency Signaling
1. Verify notification priority is clear:
   - **Critical/Error**: high-contrast color (red, orange), icon, prominent placement.
   - **Warning**: yellow/orange, icon, placement.
   - **Confirmation/Success**: green, icon, lower-contrast acceptable.
   - **Informational**: blue/neutral, lower emphasis.
2. Check icon and color are not the only priority signal (color-blind accessibility).
3. Log unclear priority signaling as medium-severity findings.

### Phase 7: Severity and Recommendation
1. Tally findings by severity: critical, high, medium, low.
2. Apply recommendation rules:
   - **Block**: Notification fatigue (>5 types or >2 per action); critical notification can be disabled; accessibility blocker (unannounced, inert).
   - **Warning**: High-frequency notification without limits; non-dismissable promotional; missing or unclear user control.
   - **Pass**: All findings at medium/low severity or explicitly deferred with owner.

## Done Criteria

- [ ] Notification and Alert Findings Report created with at least critical and high findings documented.
- [ ] Notification Frequency and Timing Matrix covers all notification types and triggers.
- [ ] Dismissal and Persistence Audit Report confirms dismissal clarity and cross-session behavior.
- [ ] User Control Inventory documents preference settings and user agency.
- [ ] Accessibility Audit Report confirms live-region announcements and keyboard support.
- [ ] All findings are severity-tagged (critical/high/medium/low).
- [ ] Unified recommendation is unambiguous: pass, warning, or block.
- [ ] Remediation owners are assigned for all deferred findings.

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
