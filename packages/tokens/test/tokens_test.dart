import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:awesome_design_system_tokens/tokens.dart';

void main() {
  group('DesignTokens', () {
    test('creates light tokens with brand colors', () {
      final DesignTokens tokens = DesignTokens.light(
        brandPrimary: const Color(0xFF6750A4),
      );
      // Primary is generated from tonal palette at index 40
      expect(tokens.colors.light.primary, equals(tokens.colors.light.primary));
      expect(
        tokens.colors.dark.primary,
        isNot(equals(tokens.colors.light.primary)),
      );
    });

    test('builds light ThemeData', () {
      final DesignTokens tokens = DesignTokens.light(
        brandPrimary: const Color(0xFF6750A4),
      );
      final ThemeData theme = tokens.toLightThemeData();
      expect(theme.brightness, equals(Brightness.light));
      expect(theme.useMaterial3, isTrue);
      expect(theme.extension<ColorTokens>(), equals(tokens.colors));
    });

    test('builds dark ThemeData', () {
      final DesignTokens tokens = DesignTokens.light(
        brandPrimary: const Color(0xFF6750A4),
      );
      final ThemeData theme = tokens.toDarkThemeData();
      expect(theme.brightness, equals(Brightness.dark));
      expect(theme.useMaterial3, isTrue);
    });

    test('copyWith creates new instance', () {
      final DesignTokens tokens = DesignTokens.light(
        brandPrimary: const Color(0xFF6750A4),
      );
      final DesignTokens copied = tokens.copyWith(
        spacing: SpacingTokens(
          scale: const SpacingScale(xs: 16.0),
          padding: PaddingTokens.fromScale(const SpacingScale(xs: 16.0)),
        ),
      );
      expect(copied.spacing.scale.xs, equals(16.0));
      expect(tokens.spacing.scale.xs, equals(8.0));
    });
  });

  group('ColorTokens', () {
    test('light and dark have different values', () {
      final ColorTokens tokens = ColorTokens.light(
        brandPrimary: const Color(0xFF6750A4),
      );
      expect(tokens.light.primary, isNot(equals(tokens.dark.primary)));
      expect(tokens.light.surface, isNot(equals(tokens.dark.surface)));
    });

    test('resolve returns correct brightness', () {
      final ColorTokens tokens = ColorTokens.light(
        brandPrimary: const Color(0xFF6750A4),
      );
      expect(tokens.resolve(Brightness.light), equals(tokens.light));
      expect(tokens.resolve(Brightness.dark), equals(tokens.dark));
    });
  });

  group('SpacingTokens', () {
    test('default scale has correct values', () {
      final SpacingTokens tokens = SpacingTokens.defaultTokens();
      expect(tokens.scale.xs, equals(8.0));
      expect(tokens.scale.md, equals(16.0));
      expect(tokens.scale.lg, equals(24.0));
    });

    test('padding derived from scale', () {
      final SpacingTokens tokens = SpacingTokens.defaultTokens();
      expect(tokens.padding.compact, equals(const EdgeInsets.all(8.0)));
      expect(tokens.padding.comfortable, equals(const EdgeInsets.all(16.0)));
    });
  });

  group('TypographyTokens', () {
    test('default scale creates text theme', () {
      final TypographyTokens tokens = TypographyTokens.defaultTokens();
      final TextTheme textTheme = tokens.scale.toTextTheme();
      expect(textTheme.displayLarge, isNotNull);
      expect(textTheme.bodyMedium, isNotNull);
      expect(textTheme.labelLarge, isNotNull);
    });
  });

  group('BreakpointTokens', () {
    test('resolves correct breakpoint', () {
      final BreakpointTokens tokens = BreakpointTokens.defaultTokens();
      expect(tokens.resolve(320).name, equals('xs'));
      expect(tokens.resolve(700).name, equals('sm'));
      expect(tokens.resolve(1000).name, equals('md'));
      expect(tokens.resolve(1400).name, equals('lg'));
    });
  });
}
