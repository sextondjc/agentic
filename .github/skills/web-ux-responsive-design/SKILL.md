---
name: web-ux-responsive-design
description: Use when implementing or reviewing web UX responsive design outcomes with deterministic breakpoint, touch-target, layout, and device-adaptation checks and evidence-backed release recommendations.
---

# Web UX Responsive Design

## Specialization

Evaluate responsive design and multi-device adaptation for consistent usability, accessibility, and performance across viewport sizes and device types.

Responsive design is foundational for modern web: poor breakpoint strategy, undersized touch targets, and layout reflow issues degrade UX on mobile and tablet. This skill encodes deterministic checks for viewport strategy, touch-target sizing, reflow coherence, and device-parity across breakpoints.

## Objective

Produce a severity-ranked findings report and a pass/warning/block release recommendation for responsive design covering:

- Viewport configuration and responsive breakpoint strategy
- Touch-target sizing (minimum 44x44px, 48x48px recommended)
- Layout reflow and content reordering at breakpoints
- Text readability and zoom support
- Consistent interaction patterns across device classes
- Performance impact of responsive images and layout shifts

## Trigger Conditions

- A release targets multiple device types (mobile, tablet, desktop)
- Layout changes are made affecting breakpoint logic
- Touch interactions are introduced or modified
- Device-specific usability complaints surface
- Responsive design audit or multidevice testing reveals issues

## Scope Boundaries

**In scope:**
- Viewport configuration and meta viewport tags
- CSS media queries and breakpoint alignment
- Touch-target sizing across surfaces
- Layout reflow logic and content reordering
- Responsive image strategy (srcset, picture element)
- Text scaling and zoom support
- Safe areas and notch handling on mobile
- Cumulative Layout Shift (CLS) measurement across breakpoints

**Out of scope:**
- Content strategy or information architecture changes (covered by IA skill)
- Typography at different sizes (covered by content-clarity skill)
- Performance optimization beyond layout impact (covered by performance skill)

## Inputs

- Deployed prototype or staging URL with responsive breakpoints
- Responsive design specification or breakpoint strategy document
- Device test matrix (mobile phones, tablets, 2-in-1s, large desktop, ChromeOS)
- Touch interaction documentation (buttons, forms, gestures)
- Analytics data on device and screen-size distribution if available

## Required Outputs

- Responsive Design Findings Report (`.md`) with severity tagging
- Breakpoint and Layout Reflow Matrix (mapping viewport ranges, layout type, content changes)
- Touch-Target Audit Report (documenting touch-target sizes across interactive elements)
- Multi-Device Test Matrix (capturing viewport, OS, browser, and usability outcome per device)
- CLS and Reflow Impact Assessment (documenting layout-shift cost across breakpoints)
- Unified Release Recommendation with pass/warning/block disposition

## Deterministic Workflow

### Phase 1: Viewport Configuration Audit
1. Inspect HTML `<meta viewport>` tag and CSS media queries.
2. Verify viewport tag includes `width=device-width, initial-scale=1, viewport-fit=cover` (or project-specific variant).
3. Verify user-scalability is not disabled (`user-scalable=no` is a critical finding).
4. Document all defined breakpoints (mobile, tablet, desktop thresholds).

### Phase 2: Breakpoint and Layout Reflow Audit
1. For each defined breakpoint:
   - Test at exact breakpoint width and 1-2px around the threshold.
   - Verify layout reflow is smooth with no content jumping.
   - Document content reordering (sidebar moves, columns collapse, etc.).
   - Check for horizontal scrolling or layout overflow.
2. Log layout issues as high-severity findings if they affect core user tasks.

### Phase 3: Touch-Target Sizing Audit
1. For each interactive element (button, link, checkbox, input field):
   - Measure interactive area in device pixels.
   - Verify minimum 44x44px (accessible); prefer 48x48px (comfortable on mobile).
   - Check spacing between touch targets (minimum 8px recommended).
   - Test with browser DevTools device emulation and real touch device if available.
2. Mark undersized touch targets as high-severity findings on mobile; medium on desktop.

### Phase 4: Text Readability and Zoom
1. Measure base font size on each breakpoint.
2. Verify minimum 16px font size on mobile for body text (WCAG level AAA).
3. Test zoom functionality: pinch-zoom should work; text zoom should not break layout.
4. Verify line-height >= 1.5 and column width <= 80 characters for readability.

### Phase 5: Responsive Image and Layout Shift Assessment
1. Profile `srcset` and `picture` element usage for responsive images.
2. Measure CLS across breakpoints using Lighthouse or WebVitals.js.
3. Identify layout shifts caused by image loading, ad rendering, or widget expansion.
4. Document CLS impact; flag high CLS (>0.1) as high-severity finding.

### Phase 6: Multi-Device Testing
1. Test on representative device mix:
   - Mobile: iOS iPhone 14+, Android Pixel 7+ (or similar current-generation devices)
   - Tablet: iPad 12.9", Android tablet (if in scope)
   - Desktop: macOS, Windows with 1920x1080 and 2560x1440 resolutions
2. For each device, document:
   - Viewport size and orientation (portrait/landscape)
   - Interaction success (buttons clickable, forms usable, no horizontal scroll)
   - Visual consistency against design spec
   - Performance: page load time, interaction latency

### Phase 7: Severity and Recommendation
1. Tally findings by severity: critical, high, medium, low.
2. Apply recommendation rules:
   - **Block**: User-scalability disabled; critical touch-target sizing gap on primary flow; layout collapse affecting core task.
   - **Warning**: Touch-target sizing issue on secondary surface; reflow jerky but not breaking; CLS slightly elevated.
   - **Pass**: All findings at medium/low severity or explicitly deferred with owner.

## Done Criteria

- [ ] Responsive Design Findings Report created with at least critical and high findings documented.
- [ ] Breakpoint and Layout Reflow Matrix covers all defined breakpoints.
- [ ] Touch-Target Audit Report documents sizes across at least mobile and desktop.
- [ ] Multi-Device Test Matrix includes at least 2 mobile and 1 desktop result.
- [ ] CLS measurement is captured for each breakpoint.
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
