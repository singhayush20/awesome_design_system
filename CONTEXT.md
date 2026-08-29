# Awesome Design System

A Flutter design system that gives product teams a consistent set of visual primitives and UI components to build Material 3 interfaces. Organized as atomic layers — tokens → atoms → molecules → organisms — so teams can adopt as much or as little as they need.

## Language

### Layers

**Tokens**:
The foundational visual primitives of the system: color, spacing, radius, typography, elevation, sizing, borders, and breakpoints. The bottom of the atomic stack; everything else is built on them.
_Avoid_: theme, styles

**Atoms**:
The smallest reusable UI components (button, text, card, input, badge, avatar). Each atom ships with variants and states but carries no domain meaning.
_Avoid_: components, primitives, widgets

**Molecules**:
Composite components combining two or more atoms into a reusable unit. Currently a placeholder package awaiting v1 scope.
_Avoid_: groups

**Organisms**:
Large, self-contained sections composed of molecules and atoms, representing distinct regions of an interface. Currently a placeholder package awaiting v1 scope.
_Avoid_: templates, modules

### Design tokens

**Design token**:
A named, reusable value describing a single design decision (a spacing step, a type style, a color role). Consumers reference tokens, never hardcoded values.
_Avoid_: variable, constant

**Scale**:
A family of related token values sharing one dimension, e.g. `SpacingScale` (4px base), `RadiusScale`, `TypographyScale`, `SizingScale`, `BorderScale`, `BreakpointScale`. Each scale has a canonical default that factories fall back to.
_Avoid_: set, collection

**Brand color**:
The consumer's seed color(s) passed in at theme construction (`brandPrimary`, `brandSecondary`, `brandTertiary`, `brandError`). Both light and dark themes derive their palettes from the same brand colors — teams never hand-pick per-theme colors.
_Avoid_: primary color, brand palette

**Semantic color**:
A color defined by its role in the UI (`primary`, `onPrimary`, `surface`, `onSurface`, `outline`, `error`) rather than its raw value. Components consume semantic colors so they adapt automatically to light and dark modes.
_Avoid_: role color, theme color

**Base color**:
A raw, non-semantic color constant (whites, greys, status colors). Not for direct use by components — semantic colors are derived from these.
_Avoid_: palette, raw color

**Status color**:
The semantic family for messaging a state to the user: success, warning, error, info.
_Avoid_: state color, feedback color

**Breakpoint**:
A named screen-width threshold the system uses to switch layouts across device sizes.
_Avoid_: media query, viewport

### Theming

**Theme**:
The consumer-facing configuration of the system — light and dark `ThemeData` built from the same brand colors. Runtime switching between them is controlled by the host app's theme mode.
_Avoid_: theme object, stylesheet

**Theme extension**:
The mechanism by which the system's tokens travel with Flutter's theme so components can read them at build time.
_Avoid_: theme provider

**Token provider**:
An alternative way to expose tokens to a subtree without going through Flutter's theme. Rarely needed; the theme path is the default.
_Avoid_: provider, token context

### Components

**Component**:
A reusable UI element shipped by the system. Every component name carries the `DS` prefix (`DSButton`, `DSInput`, `DSAvatar`) to avoid collision with Flutter's own widgets.
_Avoid_: widget (when the Flutter widget is meant), element

**Variant**:
A distinct visual style of a component, e.g. a button can be filled, outlined, tonal, text, or elevated. Variants share behavior but differ in appearance.
_Avoid_: style, type, theme

**Size**:
A named step in a component's size family (small, medium, large) mapped to tokens.
_Avoid_: scale (component), dimension

**State**:
A component's condition that changes its appearance and/or behavior, e.g. disabled, loading, selected, error.
_Avoid_: mode, status

**Story**:
A curated showcase of a component's variants and states used to browse and demo the system live.
_Avoid_: example, sample, case