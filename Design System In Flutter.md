# Figma Prompt: Flutter Mobile Design System

Design a complete, production-ready **Flutter mobile design system in Figma**, structured using Atomic Design methodology (Tokens → Atoms → Molecules → Organisms → Templates). The system must support **Light and Dark themes** and be **responsive/adaptive** across mobile screen sizes (small phones ~360px to large phones/foldables ~480px+). use the screen

## 1. Foundations — Design Tokens
Create a dedicated "Tokens" page using Figma Variables (collections + modes for Light/Dark).

- **Color Palette (Material 3 based)**
  - Generate a full M3 tonal palette: Primary, Secondary, Tertiary, Error, Neutral, Neutral Variant (tones 0–100).
  - Map tonal values to M3 semantic roles: `primary`, `onPrimary`, `primaryContainer`, `onPrimaryContainer`, `secondary`, `surface`, `surfaceVariant`, `onSurface`, `outline`, `error`, etc.
  - Set up two modes (Light/Dark) per variable collection so components auto-swap on theme toggle.
- **Spacing** — scale (e.g., 4, 8, 12, 16, 20, 24, 32, 40, 48) as `spacing-xs` → `spacing-3xl`.
- **Padding** — component-level padding tokens (e.g., `padding-compact`, `padding-comfortable`, `padding-spacious`) derived from the spacing scale.
- **Border Radius** — `radius-none/xs/sm/md/lg/xl/full` (e.g., 0, 4, 8, 12, 16, 24, 999).
- **Border Width** — `border-thin (1px)`, `border-medium (2px)`, `border-thick (4px)`.
- **Sizing** — icon sizes, avatar sizes, min tap-target (44–48px), component height scale (sm/md/lg).
- **Typography** — Material 3 type scale (Display, Headline, Title, Body, Label × Large/Medium/Small) as text styles, using a Flutter-friendly font (e.g., Roboto/Inter). Define font family, weight, size, line-height, and letter-spacing tokens.
- **Elevation** (optional but recommended) — shadow tokens for M3 elevation levels 0–5, adapted for dark mode (tonal overlay instead of shadow).

## 2. Atoms
Build each as a Figma component with variants for **state** (default, hover/pressed, focused, disabled, error) and **theme** (light/dark), all bound to the tokens above:

- **List Tile** — leading icon/avatar, title, subtitle, trailing icon/action; variants: one-line/two-line/three-line, with/without leading, with/without trailing.
- **Button** — variants: Filled, Outlined, Text, Elevated, Tonal (M3 button types) × sizes (sm/md/lg) × states (default/pressed/disabled/loading) × with/without icon.
- **Radio List Tile** — radio control + label, selected/unselected/disabled states.
- **Checkbox** — checked/unchecked/indeterminate/disabled, with optional label.
- **Tag** — filled/outlined variants, small pill shape, optional leading icon.
- **Badge** — dot badge and numeric badge, positioned as an overlay variant.
- **Stripe** (status/accent bar) — color variants mapped to semantic colors (success/warning/error/info).
- **Snackbar** — default, with action, with icon; auto-dismiss visual style; light/dark variants.

## 3. Molecules
- **Textbox (Input Field)** — variants: outlined/filled, states (default/focused/error/disabled), with label, helper text, error text, prefix/suffix icon.
- **Grid Item** — composed of image/thumbnail + title + subtitle/meta + optional badge; responsive variant for 2-column vs 3-column grid layouts.

## 4. Organisms
- **Card** — elevated/outlined/filled variants; composed from List Tile / Grid Item / Buttons; content-adaptive height.
- **App Bar** — variants: default, with search, with actions, collapsed/expanded (for large title / SliverAppBar-style behavior), light/dark.

## 5. Templates (Full Screens)
Design each at multiple breakpoints (e.g., 360×800 compact, 412×915 standard, tablet-portrait 600×960) using Auto Layout so elements reflow/resize adaptively:

- **OTP Page** — app bar, instructional text, OTP input boxes (built from Textbox atom), resend timer/link, primary button, error state.
- **Sign In Page** — logo/header, email & password Textbox fields, forgot-password link, primary button, divider, social sign-in buttons, sign-up link.
- **Forgot Password Page** — app bar, instructional text, email Textbox, submit button, success/confirmation state.

Each template must include a **Light** and **Dark** frame pair.

## 6. Structural & Technical Requirements
- Use **Auto Layout** everywhere (no fixed absolute positioning) so frames adapt to content and screen width; use resizing constraints (Fill/Hug) for adaptive behavior.
- Bind all fills, strokes, text styles, radii, and spacing to **Variables/Tokens**, not hardcoded values.
- Name layers/components using a clear convention: `Category/ComponentName/Variant` (e.g., `Atom/Button/Filled-Default`).
- Organize into Figma pages: `Tokens`, `Atoms`, `Molecules`, `Organisms`, `Templates`, `Documentation`.
- Add a documentation frame per component showing all variants, states, and usage notes (spacing, do's/don'ts) to ease Flutter developer handoff (map tokens to Dart `ThemeData`/`ColorScheme` equivalents where relevant).
- Ensure minimum tap targets (48×48dp) and WCAG-compliant contrast ratios in both themes.
- Provide a theme-toggle mechanism (Figma mode switcher) so any frame can preview Light/Dark instantly.
