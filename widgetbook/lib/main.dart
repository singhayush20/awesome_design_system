import 'package:awesome_design_system_tokens/tokens.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import 'main.directories.g.dart';

void main() {
  runApp(const WidgetbookApp());
}

@widgetbook.App()
class WidgetbookApp extends StatelessWidget {
  const WidgetbookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      directories: directories,
      addons: [
        MaterialThemeAddon(
          themes: [
            WidgetbookTheme(name: 'Light', data: lightTheme),
            WidgetbookTheme(name: 'Dark', data: darkTheme),
          ],
        ),
      ],
    );
  }
}

ThemeData get lightTheme =>
    DesignTokens.light(brandPrimary: const Color(0xFF6750A4)).toLightThemeData();

ThemeData get darkTheme =>
    DesignTokens.dark(brandPrimary: const Color(0xFFD0BCFF)).toDarkThemeData();