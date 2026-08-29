# Awesome Design System

This document is the visual source of truth for Google Stitch prompts and for
agents generating screens that consume this Flutter design system. Generate
interfaces that feel like Material 3 adapted into a calm, semantic, reusable
component library. Prefer the existing component vocabulary over inventing new
visual treatments.

## Design identity

The system is clean, approachable, and quietly expressive. It uses generous
but controlled whitespace, clear hierarchy, softly rounded geometry, restrained
elevation, and accessible contrast. The visual density is comfortable rather
than compact. Surfaces should feel layered, not decorated: use color, borders,
and small tonal shifts before adding shadows.

The default Widgetbook brand is a muted violet Material 3 theme. Product teams
may replace the brand seed, but the semantic roles and relationships remain the
same in light and dark mode.

## Color system

Use semantic roles, never raw color names in generated UI. The default light
theme is generated from primary seed `#6750A4`; the dark Widgetbook theme uses
the lightness-appropriate seed `#D0BCFF`. Brand seeds generate tonal palettes,
so exact primary shades may vary when a product supplies its own brand color.

### Stable surface and utility roles

| Role | Light | Dark | Use |
| --- | --- | --- | --- |
| Surface | `#FFFBFE` | `#1C1B1F` | Main page and component surfaces |
| On surface | `#1C1B1F` | `#E6E1E5` | Primary text and icons on surface |
| Surface container highest | `#E7E0EC` | `#49454F` | Secondary cards, filled controls, grouped areas |
| On surface variant | `#49454F` | `#CAC4D0` | Secondary text, supporting labels, muted icons |
| Outline | `#79747E` | `#938F99` | Strong borders and field outlines |
| Outline variant | `#CAC4D0` | `#49454F` | Dividers and subtle borders |
| Inverse surface | `#313033` | `#E6E1E5` | Inverse snackbar and transient surfaces |
| Shadow/scrim | `#000000` | `#000000` | Modal scrims and elevation shadows |

### Brand and state roles

Use the active theme's generated values for these roles:

- `primary` / `onPrimary`: main actions, selected controls, links, and focused
  affordances.
- `primaryContainer` / `onPrimaryContainer`: selected or emphasized tonal
  surfaces.
- `secondary` / `onSecondary`: supporting actions and alternate emphasis.
- `secondaryContainer` / `onSecondaryContainer`: supporting selection states.
- `tertiary` / `onTertiary`: limited complementary emphasis.
- `error` / `onError`: validation, destructive actions, and failure states.
- `errorContainer` / `onErrorContainer`: error messaging surfaces.

Generated screens must preserve readable foreground/background pairs. In dark
mode, do not reuse light surface values or darken primary actions manually.

## Typography

The default typeface is Inter. Keep the Material 3 type scale and use weight to
establish hierarchy rather than decorative fonts.

- Display styles are reserved for hero metrics and major page introductions.
- Headline styles introduce a screen or major section.
- Title styles label cards, dialogs, app bars, and list content.
- Body styles carry descriptions and normal reading content.
- Label styles serve buttons, chips, tabs, badges, and compact metadata.
- Primary text uses `onSurface`; secondary text uses `onSurfaceVariant`.
- Keep body copy readable, with sentence-case labels and concise action names.

## Geometry, spacing, and depth

Use the 4-point spacing rhythm. The canonical values are 2, 4, 8, 12, 16, 24,
32, 40, 48, and 64 pixels. Prefer 8 or 12 pixels between related controls,
16 pixels for component padding, and 24 pixels for page or section breathing
room.

Corner radii are softly rounded: 4 pixels for small controls, 8 pixels for
chips and compact components, 12 pixels for cards and fields, 16 pixels for
large containers, and 24 pixels for prominent sheets or hero surfaces. Use
fully pill-shaped geometry only for badges, tags, and chip-like controls.

Elevation is quiet and Material-like. Most content is flat on a surface. Use a
whisper-soft shadow only when a card, menu, dialog, snackbar, or bottom sheet
must separate from the content behind it. Avoid ornamental gradients, glass
effects, thick outlines, and multiple competing shadows.

## Component language

Use these patterns when asking Stitch to generate screens:

- **Buttons:** use filled primary actions for the single most important action;
  outlined or text actions are secondary. Keep labels short and touch targets
  at least 48 pixels high.
- **Cards:** use surface or surface-container tones, 12-pixel corners, and
  restrained elevation. Group related information instead of adding borders to
  every child.
- **Inputs:** use clear labels, semantic error states, outline or filled
  Material 3 fields, and visible focus treatment.
- **List tiles:** place optional leading and trailing content on a comfortable
  row with a clear title/subtitle hierarchy. Use a subtle border only when the
  tile needs separation from its surface.
- **Badges and tags:** keep them compact and informational. Filled tags use a
  semantic emphasis color; outlined tags use the same role for the border and a
  transparent surface. Tags are not primary actions.
- **Chips:** use choice chips for one selection and filter-style chips for
  multiple selections. Selected states should be obvious through tonal color,
  iconography, or both.
- **Tabs:** use concise labels, semantic primary color for the active tab, and
  a clear indicator. Do not use tabs for more than a small set of peer views.
- **App bars:** use surface-based backgrounds. Lucid app bars may be
  transparent over content; solid app bars are opaque and should remain
  visually distinct from the page body.
- **Dialogs and bottom sheets:** use them for focused decisions or contained
  tasks. Preserve a strong title, concise body, and explicit actions.
- **Snackbars:** use inverse-surface styling for transient feedback, with one
  optional action. They belong above the bottom content safe area.
- **Progress indicators:** use primary color and reserve determinate progress
  for measurable completion. Indeterminate indicators communicate waiting.
- **Images:** use images as purposeful content, clipped to the surrounding
  component geometry. Provide a meaningful fallback/error state and preserve
  the aspect ratio unless the design explicitly calls for a crop.

## Layout rules for generated screens

Start with a responsive page frame rather than a fixed desktop canvas. Use a
single clear content column on narrow screens and a restrained grid or split
layout on wide screens. Align headings, controls, and content edges to the same
grid. Keep primary actions near the content they affect and avoid horizontal
rows that require scrolling unless the pattern is explicitly tabs or chips.

Use whitespace to communicate grouping. A section heading should have more
space above it than between its heading and its content. Keep repeated rows
visually consistent, and use dividers sparingly as a structural cue.

## Theme requirements

Every generated screen must work in both light and dark themes. Preserve the
same hierarchy, spacing, typography, and component geometry across themes;
change semantic surface, content, outline, and brand tones through the active
ColorScheme. Never encode a light-only white background or a dark-only black
background into a component.

## Stitch prompt contract

When generating a new screen, include these constraints in the prompt:

1. Use the Awesome Design System visual language: Material 3, Inter, semantic
   ColorScheme roles, softly rounded corners, 4-point spacing, and quiet depth.
2. Use the exact component pattern named in this document when one exists.
3. Generate light and dark theme variants with equivalent contrast and layout.
4. Keep text concise, sentence-case, and realistic; do not use placeholder
   lorem ipsum for important content.
5. Describe interaction states for selected, focused, disabled, loading, error,
   and transient feedback components when they are relevant.

## Implementation handoff

Generated designs map to this repository's layers:

```text
tokens → atoms → molecules → organisms → consuming apps / Widgetbook
```

Use existing public `DS*` components first. New visual primitives belong in
`packages/atoms`; compositions belong in `packages/molecules`; larger sections
belong in `packages/organisms`. Add a Widgetbook story and verify both themes
before treating a new component as complete.
