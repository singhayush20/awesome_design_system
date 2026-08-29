# Awesome Design System

Flutter design system monorepo (pub workspace). Layer hierarchy: **tokens → atoms → molecules → organisms**. Tokens and atoms are implemented; molecules/organisms are placeholder packages awaiting v1 scope.

## Packages

| Layer | Package | Status |
|---|---|---|
| Tokens | `packages/tokens` | colors, typography, spacing, radius, elevation, breakpoints, sizing, borders |
| Atoms | `packages/atoms` | Text, Button, Card, Input, Badge, Avatar + variants |
| Molecules | `packages/molecules` | placeholder |
| Organisms | `packages/organisms` | placeholder |
| Docs app | `widgetbook/` | live component browser (web) |

## Consuming from a Flutter app

The repo root is a single umbrella package (`awesome_design_system`) that re-exports all layers. Add one git dependency and import one library:

```yaml
# consumer_app/pubspec.yaml
dependencies:
  flutter:
    sdk: flutter
  awesome_design_system:
    git:
      url: https://github.com/<you>/awesome_design_system.git
      ref: master
```

Then initialize the theme and use the widgets:

```dart
import 'package:awesome_design_system/design_system.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: DesignTokens.light(brandPrimary: const Color(0xFF6750A4))
          .toLightThemeData(),
      darkTheme: DesignTokens.dark(brandPrimary: const Color(0xFF6750A4))
          .toDarkThemeData(),
      themeMode: ThemeMode.system, // or ThemeMode.light / ThemeMode.dark
      home: Scaffold(
        body: Center(
          child: DSButton(
            onPressed: () {},
            child: Text('Hello'),
          ),
        ),
      ),
    );
  }
}
```

## Light / dark theme

Both themes are derived from the **same** brand seed color — you do not hand-pick
per-theme colors. `DesignTokens.light()` and `DesignTokens.dark()` each build an
M3 tonal palette from your seed and map the correct tones to light vs dark roles
(e.g. in light mode `primary` is tone 40 and `primaryContainer` is tone 90; in
dark mode those become tones 80 and 30). Set both `theme` and `darkTheme` on
`MaterialApp`, then pick the behavior with `themeMode`:

- `ThemeMode.system` (recommended) — follows the device setting
- `ThemeMode.light` / `ThemeMode.dark` — lock to one mode
- switch at runtime: `MaterialApp(themeMode: <bool> ? ThemeMode.dark : ThemeMode.light)`

## Using your own brand colors

Pass your brand palette as seed colors to both factories. Only `brandPrimary` is
required; the optional seeds fall back to derived tones if omitted:

| Param | Role | Default when omitted |
|---|---|---|
| `brandPrimary` | **required** — main brand color | none (you must supply it) |
| `brandSecondary` | secondary accent | primary shifted toward blue |
| `brandTertiary` | tertiary accent | primary shifted toward green |
| `brandError` | error / destructive color | Material red `0xFFBA1A1A` |

```dart
const brandPrimary = Color(0xFF0066CC);   // your true brand blue
const brandSecondary = Color(0xFFF59E0B); // your accent amber
const brandError = Color(0xFFDC2626);     // your error red

theme: DesignTokens.light(
  brandPrimary: brandPrimary,
  brandSecondary: brandSecondary,
).toLightThemeData(),
darkTheme: DesignTokens.dark(
  brandPrimary: brandPrimary,
  brandSecondary: brandSecondary,
).toDarkThemeData(),
```

Note: `DSButton` reads `Theme.of(context).extension<DesignTokens>()`, so the app must be wrapped in a `MaterialApp` with the theme above.

## Running the widgetbook

```sh
cd widgetbook
fvm flutter run -d chrome          # or: flutter run -d chrome
```

After adding/editing stories, regenerate `main.directories.g.dart`:

```sh
fvm dart run build_runner build    # or: dart run build_runner build
```

## Local development

The workspace resolves all packages together; `pub get`/`test` work from the repo root or any package:

```sh
fvm flutter pub get
fvm flutter test
```

Requires Dart `^3.9.0` / Flutter `>=3.22` (developed on 3.44.7). Recommended melos driver: `melos format`, `melos analyze`, `melos test` run across all packages. `melos run gen:widgetbook` regenerates the widgetbook catalog.