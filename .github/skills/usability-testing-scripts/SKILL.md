---
name: usability-testing-scripts
description: Use when preparing structured usability test scenarios, task scripts, and scoring rubrics for mobile app UX validation with 5+ participants before or after launch.
---

# Usability Testing Scripts

## Scope

Design and document repeatable usability test workflows that measure task completion, identify friction points, and surface accessibility gaps without requiring professional research infrastructure.

## Outcomes

- Participant screener and consent flow.
- Structured task scripts with think-aloud prompts and neutral observation cues.
- Success/failure scoring rubrics for each task (binary + severity scale).
- Post-test survey or interview guide to capture qualitative insights.
- Results template for aggregating findings and identifying unambiguous improvement priorities.
- Accessibility observation checklist (keyboard navigation, screen reader compat, color contrast).

## When to Use

- You have wireframes or a prototype and need evidence of usability before launch.
- You want to validate a specific flow (exchange request, drop location picker) with real users.
- You must identify blockers and severity-rank them so product/eng can prioritize fixes.
- You're preparing for accessibility compliance validation (WCAG-AA) and need a structured audit path.
- You have a post-launch app and want to measure improvement iteration-to-iteration.

## When NOT to Use

- This skill is NOT a replacement for ongoing analytics or telemetry; use both together.
- This skill is NOT for design exploration; use `design-mobile-ux` for that.
- This skill is NOT a substitute for consulting professional UX researchers for large-scale or high-stakes studies.
- This skill focuses on structured tasks, not exploratory interviews; if your goal is to discover new use cases, combine with `learn-topics` for open-ended interviews first.

## Required Collaborators

- `design-mobile-ux` — Provides wireframes/prototype and usability heuristics to test against.
- `critical-thinking` — Pressure-tests task wording (leading questions?) and scoring criteria (objective or subjective?).
- `test-driven-development` — Frames test scenarios as testable accept/reject criteria, not narrative stories.
- `learn-topics` — Optionally used to build domain knowledge about accessibility standards and testing best practices before scripting.

## Workflow

### 1. Define test objective and success criteria
Articulate what you're validating:
- **Objective example**: "Can new users complete a Seed workflow (ISBN → Tag) without assistance?"
- **Success criterion**: "≥80% of participants complete Seed in <2 minutes without error."
- **Alternative**: "Can participants locate the exchange status within 3 taps from Home?"

Record the business or UX metric tied to each objective.

### 2. Design participant screener
Define participant criteria:
- **Role** (first-time user, repeat user, expert benchmark user).
- **Device** (iPhone 12, Samsung Galaxy A12, iPad—match your target device mix).
- **Accessibility needs** (color blindness, low vision, motor control, hearing loss—recruit intentionally, don't assume).
- **Familiarity** (never used a book exchange app vs regular Goodreads user).
- **Language** (if multi-lingual, recruit native speakers per language).

Target minimum **5 participants per test round**; 8–10 reduces outlier noise. Recruit from real user pool if possible; user research platforms (UserTesting, Respondent) are acceptable second choice.

### 3. Create consent and setup script
Document:
- **Consent verbatim** (privacy, recording, right to exit, no test judgment).
- **Setup** (device passed to participant, task explanation tone).
- **Neutral observation**: "I'm watching you use this; there are no right answers. I can't help you, but I'm here if you want to stop."
- **Think-aloud instruction**: "Please narrate what you're thinking as you do this. It helps me understand your reasoning."

Test this script with a colleague to ensure it's neutral and not leading.

### 4. Write task scripts
For each key flow (Seed, Capture, Exchange, Drop), write a task script:

**Template per task:**

```
Task [N]: [Task Name]
Goal: [What we are testing]

Setup: [Device state; e.g., "You are on the Home screen. You have already signed in."]

Scripted instruction (read verbatim to participant):
"[Scenario]. Your task is to [objective without revealing HOW]. 
Think aloud as you work."

Example: 
"Imagine you have a book copy you want to add to Rook. 
Your task is to generate a unique tag for this copy so you can later find or trade it. 
Start whenever you're ready."

Observation of interest: [What tells us success or struggle?]
Example: Did participant scan ISBN with camera or manually enter? 
Did they recognize the "Generate Tag" button or explore? 
Did they understand what the tag means?

Bail-out rule: [If participant is stuck >2 minutes, offer neutral guidance]
Example: "I can see you're trying to fill in the ISBN field. That's the right spot."
(Do NOT say "You need to click Generate Tag" or reveal the path forward.)

Task end condition: [What signals task is done?]
Example: Participant sees a success screen with their generated tag.
```

**Write 3–7 key tasks covering:**
- Happy path core flows (Seed → Capture → Exchange → Drop).
- One error case per surface (invalid ISBN, tag already claimed, exchange state conflict).
- Edge case if time permits (offline, location denied, network timeout).

### 5. Script observation cues and severity scale
For each task, define:
- **Completion**: Participant achieves the goal without outside help.
- **Partial completion**: Participant completes task but with confusion, hesitation, or exploratory errors.
- **Non-completion**: Participant abandons task or requires critical help.

Create a **severity scale** for barriers:

```
🔴 Blocker (Critical)
- Participant cannot proceed without help.
- Misunderstanding blocks use of feature entirely.
- Example: "I don't know if my copy was added or not."

🟠 Major (High)
- Participant completes task but with significant friction.
- Takes >2x expected time or requires multiple attempts.
- Example: Participant tries 5 different taps to find the Exchange section.

🟡 Minor (Medium)
- Participant completes with slight confusion or extra step.
- Takes 1.5x expected time.
- Example: Participant initially tries wrong input field before correcting.

🟢 Polish (Low)
- No friction; one participant had a preference.
- Example: Preferred icon over text label (subjective).
```

### 6. Prepare accessibility observation checklist
Include these checks per task, marked as Pass/Fail/N/A:
- **Keyboard navigation**: Can participant tab through all inputs and activate buttons without mouse (iOS: use Switch Control or external keyboard; Android: use keyboard)?
- **Screen reader**: Does VoiceOver (iOS) or TalkBack (Android) announce all text, buttons, and state changes clearly?
- **Color contrast**: Are text and icons readable at 3 feet? Test with a contrast checker tool in your prototype tool.
- **Touch target size**: Are buttons and inputs ≥44pt (iOS) or ≥48dp (Android)?
- **Focus visible**: Is focused element clearly marked (border, highlight)?
- **Motor control**: Can a user with tremor or limited fine motor complete the task (broad tap targets, no hover-only states)?
- **Zoom and text scaling**: Does layout reflow when participant enables 200% zoom or large accessibility text?

Document any WCAG-AA violations flagged.

### 7. Prepare post-task survey or interview
After each task or at end of session, ask:
- **Open-ended**: "What was confusing about that flow?" (Listen for patterns.)
- **Closed**: "On a scale of 1–5, how confident are you that [action] saved?" (Measures perceived safety/feedback clarity.)
- **System Usability Scale (SUS)** (10-item standard for overall usability; takes 2 minutes).
- **Accessibility**: "Did you use any accessibility features (zoom, screen reader, keyboard)? How well did they work?"
- **Net Promoter**: "Would you recommend this app to a friend? Why or why not?"

Keep survey < 5 minutes. Excess questions fatigue participants and dilute signal.

### 8. Create results template
Prepare a spreadsheet or markdown table:

```
| Participant | Device | Task | Completed? | Time | Severity | Notes |
|---|---|---|---|---|---|---|
| P1 | iPhone 12 | Seed | Yes | 1m 30s | Green | Smooth. |
| P2 | iPhone 12 | Seed | Yes | 3m 45s | Orange | Took 2 attempts; unclear if ISBN accepted. |
| P3 | Samsung S21 | Seed | No | - | Red | Gave up; thought ISBN entry was search box. |
```

Track:
- Task completion rate (X of N succeeded).
- Time to complete (mean, median, range).
- Severity distribution (count of blocker, major, minor, polish issues).
- Accessibility violations (count and severity).
- Quotes or video clips of key struggle moments (with consent).

Aggregate into a summary table showing which flows need iteration.

### 9. Run test session
Conduct test with one participant at a time (moderated remote or in-person):
- Record screen and audio (with explicit consent).
- Take live notes on your observation template (task, completion, severity, quote).
- Remain neutral: don't nod or react; don't prompt the "right" answer.
- If participant is stuck >2 minutes, offer bail-out help (but mark task as "partial").
- Thank participant; offer incentive (gift card, early feature access, public credit).

Repeat with each participant (5+ target).

### 10. Analyze and report findings
After all sessions:
- Tally completion rates and average times per task.
- Group findings by severity and platform (iPhone vs Android if different).
- List top 5 blockers and majors with participant counts and quotes.
- Identify patterns: "3 of 5 participants thought [copy/location was] unclear."
- Screenshot or clip key moments from recordings.

Produce a **findings report** (1–2 pages):
```
# Usability Test Report: Rook V1 Mobile

## Executive Summary
Seed flow is clear (90% completion, 2m avg). 
Exchange flow has moderate friction (70% completion, 4m avg, 2 blockers). 
Drop privacy countdown labeling confuses (3 of 5 participants missed the timer).

## Blockers (Must fix before launch)
- BC1: [Exchange state transition copy is ambiguous.] (3/5 participants confused by "Accepted" state; didn't know next step.)
- BC2: [Drop countdown not visible until after drop placed.] (3/5 participants didn't realize 15m delay; thought map appeared immediately.)

## Majors (Should fix)
- MJ1: [Capture validation feedback is delayed.] (2/5 participants re-tapped button thinking first attempt failed.)

## Minor / Polish
- MN1: [ISBN lookup icon could be clearer.] (1/5 participant liked barcode icon better than magnifying glass.)

## Accessibility Findings
- PASS: All buttons are ≥48dp.
- FAIL: Drop map region has no keyboard accessible map alternative (needs WCAG-AA fix).
- PASS: Screen reader announces all form fields correctly on iPhone.

## Recommendations
1. Update Exchange state copy: "Accepted — you both said yes. Next: Choose a meet time."
2. Show drop countdown BEFORE user confirms (in review screen).
3. Investigate map accessibility on Android.
```

### 11. Create iteration backlog
Prioritize fixes:
- **P0** (launch blocker): Block release if not fixed.
- **P1** (launch preferred): Ship if possible; defer only if cost is extreme.
- **P2** (post-launch): Backlog for iteration after initial release.

Assign owner and ETA per item. Link findings to code/design issues.

## Running Async or Unmoderated Tests

If synchronous sessions are not feasible:
- Use UserTesting.com or Respondent for unmoderated remote tests (participant records their own screen + voice).
- Upload static mockup or prototype link.
- Provide task scripts verbatim.
- Review recordings and score severity the same way.
- Note: You lose real-time observation and can't give bail-out help, so task wording must be extra clear.

## Accessibility Testing Depth

For WCAG-AA compliance (not just usability):
- Pair this skill with external accessibility audit (WAVE, Axe DevTools, or professional accessibility firm).
- This skill covers user-observable behaviors; automated tools catch markup/code issues.

## Checklist

- [ ] Test objective and success criteria are clear.
- [ ] Participant screener covers device mix, accessibility needs, and user type.
- [ ] Consent script is neutral and complete.
- [ ] Task scripts are numbered, use neutral language (no leading prompts), and include bail-out rules.
- [ ] Observation cues specify what successful task completion looks like.
- [ ] Severity scale is clear and examples are given (blocker, major, minor, polish).
- [ ] Accessibility checklist covers keyboard, screen reader, contrast, touch targets, zoom.
- [ ] Post-task survey is brief (<5 min) and covers open-ended + SUS + NPS.
- [ ] Results template is prepared (spreadsheet or markdown).
- [ ] ≥5 participants recruited, with device/accessibility diversity.
- [ ] All recordings have explicit consent.
- [ ] Findings report aggregates by severity and platform.
- [ ] Iteration backlog is prioritized (P0/P1/P2) with owners and ETAs.

## Common Mistakes

- **Leading task wording** — "Try to find the exchange status" guides user to a feature; instead say "Check on your pending book trade."
- **Mixing concerns in one task** — "Complete a seed AND capture" conflates two flows; test separately.
- **Testing prototype so interactive that UI mistakes aren't exposed** — Over-polish hides UX friction. Test on real device with app, not just prototype.
- **Too many tasks per session** — >7 tasks fatigues participants; response quality drops. Run multiple test rounds if needed.
- **Ignoring accessibility** — Accessibility testing is not optional; include from session 1. Retrofit compliance is 5x harder than building it in.
- **Single platform only** — iPhone and Android users experience different friction (navigation bar position, back behavior, gesture zones). Test both.
- **No bail-out plan** — If participant is stuck >2 minutes, you're watching them abandon the app. Have a neutral help phrase ready.
- **Scoring after the session** — Take live notes during the session; memory fades. Severity ratings drift if you score from video alone weeks later.
- **No incentive or follow-up** — Participants give more honest feedback when they're thanked and feel heard. Send a summary of what changed based on their feedback.

## Inputs

- Approved wireframes or interactive prototype (from `design-mobile-ux` and/or `mobile-ui-prototyping` workflows).
- Target user personas and device mix.
- Key flows to validate (Seed, Capture, Exchange, Drop).
- Accessibility compliance scope (WCAG-AA or internal standard).
- Test modality (moderated remote, in-person, or unmoderated async).

## Required Outputs

- A concrete, workspace-applicable test script package (task scripts, observation templates, scoring rubrics).
- Participant screener and consent flow.
- Results template for aggregating findings.
- Accessibility observation checklist.
- Post-test survey or interview guide.
- (After execution) Findings report with identified blockers, majors, minor issues, and prioritized iteration backlog.

## Workflow

1. Gather required context and constraints from the workspace and user request.
2. Execute the skill-specific steps and produce the required artifacts or decisions.
3. Validate outputs for completeness and consistency with active workspace instructions.
