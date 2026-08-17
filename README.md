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

Add the packages via git (private repo pattern). `atoms` depends on `tokens` by version, so pin `tokens` to the same repo via `dependency_overrides`:

```yaml
# consumer_app/pubspec.yaml
dependencies:
  flutter:
    sdk: flutter
  awesome_design_system_atoms:
    git:
      url: https://github.com/<you>/awesome_design_system.git
      path: packages/atoms
      ref: main

dependency_overrides:
  awesome_design_system_tokens:
    git:
      url: https://github.com/<you>/awesome_design_system.git
      path: packages/tokens
      ref: main
```

Then initialize the theme and use the widgets:

```dart
import 'package:awesome_design_system_tokens/tokens.dart';
import 'package:awesome_design_system_atoms/atoms.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: DesignTokens.light(brandPrimary: const Color(0xFF6750A4))
          .toLightThemeData(),
      home: Scaffold(
        body: Center(
          child: DSButton(
            label: 'Hello',
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
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