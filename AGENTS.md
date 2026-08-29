# AGENTS.md — Awesome Design System

This file is the operating blueprint for coding agents working in this repository.
Follow it together with the user’s request. The repository is a Flutter pub
workspace pinned to Flutter `3.44.7` through `.fvmrc`.

## Mission

Maintain a production-quality Material 3 design system with a clear dependency
direction:

```text
tokens → atoms → molecules → organisms → consuming apps / Widgetbook
```

Prefer the smallest complete change. Reuse existing tokens, components, types,
and package patterns before introducing anything new.

## Repository map

| Location | Responsibility |
| --- | --- |
| `packages/tokens` | Color schemes, spacing, sizing, radius, typography, elevation, borders, breakpoints, and `DesignTokens`. |
| `packages/atoms` | Primitive components such as `DSText`, `DSButton`, `DSIconButton`, `DSCard`, `DSInput`, `DSBadge`, `DSAvatar`, `DSCheckbox`, and `DSRadio`. |
| `packages/molecules` | Compositions of atoms: tiles, avatar compositions, card subcomponents, select, and snackbar. |
| `packages/organisms` | Larger sections: `DSAppBar`, `DSBottomSheet`, and `DSDialog`. |
| `widgetbook` | Interactive component catalog and theme previews. |
| `lib/design_system.dart` | Public umbrella export for all packages. |
| `REFACTOR_BLUEPRINT.md` | Historical refactor specification and backlog reference. Verify it against the current tree before implementing backlog items. |

## Non-negotiable boundaries

- `tokens` must never import atoms, molecules, organisms, or Widgetbook.
- `atoms` may import only tokens and Flutter. An atom must not import a higher layer.
- `molecules` may import tokens and atoms, never organisms.
- `organisms` may import tokens, atoms, and molecules.
- Consumers should import package public barrels, not another package’s `lib/src`.
- Every public component is prefixed with `DS`.
- Update the owning package barrel and the root umbrella export when adding a public component.

## Coding practices

- Read the affected package, its barrel, callers, stories, and tests before editing.
- Use the existing token/theme APIs. Component code reads `Theme.of(context)` and
  falls back to the canonical token scales; do not introduce raw design values
  when a token exists.
- Keep widgets immutable and use `const` constructors wherever valid.
- Put a component in its own directory. For a styled component, prefer the
  established pattern: public facade, base presentation engine, immutable style,
  theme extension, and `index.dart` barrel. Do not create speculative files or
  abstractions for one use.
- Use dedicated private/public widget classes for reusable layout pieces. Keep
  builders short and avoid functional `_build...()` widget trees for component
  presentation.
- Dogfood the design system: use `DSText`, `DSButton`, and `DSIconButton` when
  those atoms cover the need. Raw Flutter widgets are appropriate only when no
  design-system atom exists or when implementing that atom itself.
- Add `debugFillProperties` for public widget/style data and describe all public
  constructor properties.
- Preserve accessibility: semantic labels for interactive/icon-only controls,
  useful focus/disabled states, and at least 48×48 logical-pixel touch targets.
- Validate trust-boundary inputs and preserve error handling; simplicity must not
  remove safety or data-loss protection.
- Keep public APIs typed and configurable. Avoid hardcoded user-facing labels,
  dummy callbacks, hidden global state, and horizontal layouts that can overflow.
- Add the smallest focused test for non-trivial behavior. Prefer existing Flutter
  widget-test patterns in the owning package.

## Themes and tokens

`DesignTokens.light(...)` and `DesignTokens.dark(...)` produce the light and dark
`ThemeData` used by consumers and Widgetbook. Components must use semantic
`ColorScheme` roles (`primary`, `onPrimary`, `surface`, `onSurface`, `error`, and
similar), not fixed light-theme colors.

When adding a color or visual state:

1. Add or reuse a token/semantic role in `packages/tokens`.
2. Consume it through the active `ThemeData` in the component.
3. Check both brightness modes in Widgetbook.
4. Add a test when the behavior is not a simple delegation.

Never make a Widgetbook-only color workaround the component’s production API.

## Adding a new component

1. Decide the layer from the dependency rules above. A component combining atoms
   belongs in molecules; a page-level section belongs in organisms.
2. Search for an existing component, enum, token, style, and test before writing.
3. Create the component directory and public barrel in the owning package.
4. Implement the smallest usable API with tokenized styling, semantics, debug
   diagnostics, disabled/loading/error behavior where applicable, and const support.
5. Export it from the package barrel and `lib/design_system.dart` if it is public.
6. Add a focused widget test in the owning package.
7. Add a Widgetbook story under `widgetbook/lib/stories/` and register it in
   `widgetbook/lib/main.directories.g.dart` through the project’s generator when
   safe. The catalog file is tracked; inspect its diff and never accept unrelated
   deletions.
8. Run analysis/tests, review the diff, and commit the component as one logical
   change.

## Starting a new project or workspace package

For a new consuming Flutter app, import `package:awesome_design_system/design_system.dart`
and provide both `theme` and `darkTheme` from `DesignTokens` in `MaterialApp`.
Do not copy token values into the app.

For a new package in this monorepo:

1. Add it to the root `workspace` list in `pubspec.yaml` and `melos.yaml`.
2. Give it a focused package name and `resolution: workspace`.
3. Declare only lower-layer dependencies allowed by the boundary table.
4. Add `lib/<package>.dart`, tests, and a README only when the package has a real
   responsibility.
5. Run workspace dependency resolution and all checks before committing.

Do not add a package, framework, generator, or design-system layer for a single
component or hypothetical future requirement.

## Widgetbook structure

- Stories live in `widgetbook/lib/stories/<component>_stories.dart`.
- Keep one focused use case per visual concern: variants, sizes, states, and
  composition examples.
- Use `@widgetbook.UseCase(name: ..., type: ...)` and import the owning public
  package barrel.
- Shared story layout belongs in `stories/common.dart`; do not duplicate scaffold
  wrappers or theme setup in every story.
- `widgetbook/lib/main.dart` owns the `MaterialThemeAddon` and must expose both
  Light and Dark themes. New stories must work under both without branching on a
  hardcoded brightness.
- Color palette stories should display semantic roles from `Theme.of(context).colorScheme`.
- Interactive overlays must use their required Flutter host: show `SnackBar` via
  `ScaffoldMessenger`, dialogs through a dialog-capable scaffold/context, and
  bottom sheets through the appropriate scaffold/modal flow.
- After story changes, inspect the generated catalog diff. Keep new imports and
  registrations; reject unrelated file deletions or workspace-root changes.

## Verification commands

Use the pinned SDK first:

```powershell
fvm flutter analyze
fvm flutter test
cd widgetbook
fvm flutter analyze
fvm flutter run -d chrome
```

If FVM tries to download or repair its cache, use the already-installed pinned
SDK under `D:\fvm\cache\versions\3.44.7\bin` and report the environment issue.
For analyzer-only checks, the Dart executable is under the corresponding
`bin\cache\dart-sdk\bin` directory. Treat external telemetry permission traces
as environment output, but fix every real warning, info, or compile error in the
repository.

Widgetbook is a long-running process. Confirm that Chrome starts and a dev-server
port is listening; stop the process after the check when no persistent server was
requested. A timed-out Flutter command is not a passing runtime verification.

## Change and commit workflow

- Start with `git status`, recent history, and the relevant plan/spec.
- Preserve unrelated user changes. Never reset, checkout, or delete broad paths.
- Work in thin slices: implement one component or one coherent cleanup, analyze,
  test, inspect the diff, then commit.
- Use descriptive commits such as `feat(widgetbook): add checkbox stories` or
  `fix(snackbar): show preview through scaffold messenger`.
- Before handoff, run `git diff --check`, confirm the intended files are committed,
  and report exact verification results and any environment limitation.

## Definition of done

A change is done only when the requested behavior exists in the correct layer,
public exports resolve, light and dark themes are covered where visual behavior is
involved, focused tests pass, analyzer has no repository diagnostics, Widgetbook
stories are registered, and the final diff contains no unrelated changes.
