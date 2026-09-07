import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:awesome_design_system_tokens/tokens.dart';

void main() {
  group('DesignTokens', () {
    test('creates light tokens with brand colors', () {
      final DesignTokens tokens = DesignTokens.light(
        brandPrimary: const Color(0xFF6750A4),
      );
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

    test('resolveLight returns LightColorTokens', () {
      final ColorTokens tokens = ColorTokens.light(
        brandPrimary: const Color(0xFF6750A4),
      );
      final LightColorTokens light = tokens.resolveLight();
      expect(light, isA<LightColorTokens>());
      expect(light.brightness, equals(Brightness.light));
    });

    test('resolveDark returns DarkColorTokens', () {
      final ColorTokens tokens = ColorTokens.light(
        brandPrimary: const Color(0xFF6750A4),
      );
      final DarkColorTokens dark = tokens.resolveDark();
      expect(dark, isA<DarkColorTokens>());
      expect(dark.brightness, equals(Brightness.dark));
    });

    test('resolveTokens returns AppColorTokens with semantic fields', () {
      final ColorTokens tokens = ColorTokens.light(
        brandPrimary: const Color(0xFF6750A4),
      );
      final AppColorTokens lightColors = tokens.resolveTokens(Brightness.light);
      final AppColorTokens darkColors = tokens.resolveTokens(Brightness.dark);

      // Verify Material 3 base fields accessible
      expect(lightColors.primary, isNotNull);
      expect(lightColors.onPrimary, isNotNull);
      expect(lightColors.surface, isNotNull);
      expect(lightColors.onSurface, isNotNull);

      // Verify semantic fields accessible on both
      expect(lightColors.success, isNotNull);
      expect(lightColors.onSuccess, isNotNull);
      expect(lightColors.textPrimary, isNotNull);
      expect(lightColors.backgroundPrimary, isNotNull);
      expect(lightColors.borderDefault, isNotNull);
      expect(lightColors.buttonPrimary, isNotNull);
      expect(lightColors.textFieldBackground, isNotNull);
      expect(lightColors.iconPrimary, isNotNull);
      expect(lightColors.dividerColor, isNotNull);

      expect(darkColors.success, isNotNull);
      expect(darkColors.onSuccess, isNotNull);
      expect(darkColors.textPrimary, isNotNull);
      expect(darkColors.backgroundPrimary, isNotNull);
      expect(darkColors.borderDefault, isNotNull);
      expect(darkColors.buttonPrimary, isNotNull);
      expect(darkColors.textFieldBackground, isNotNull);
      expect(darkColors.iconPrimary, isNotNull);
      expect(darkColors.dividerColor, isNotNull);

      // Light and dark should have different values for same semantic role
      expect(lightColors.backgroundPrimary, isNot(equals(darkColors.backgroundPrimary)));
      expect(lightColors.textPrimary, isNot(equals(darkColors.textPrimary)));
      expect(lightColors.borderDefault, isNot(equals(darkColors.borderDefault)));
    });

    test('AppColorTokens has all semantic fields defined', () {
      final ColorTokens tokens = ColorTokens.light(
        brandPrimary: const Color(0xFF6750A4),
      );
      final AppColorTokens colors = tokens.resolveTokens(Brightness.light);

      // Status
      expect(colors.success, isA<Color>());
      expect(colors.onSuccess, isA<Color>());
      expect(colors.successContainer, isA<Color>());
      expect(colors.onSuccessContainer, isA<Color>());
      expect(colors.warning, isA<Color>());
      expect(colors.onWarning, isA<Color>());
      expect(colors.warningContainer, isA<Color>());
      expect(colors.onWarningContainer, isA<Color>());
      expect(colors.info, isA<Color>());
      expect(colors.onInfo, isA<Color>());
      expect(colors.infoContainer, isA<Color>());
      expect(colors.onInfoContainer, isA<Color>());

      // Text
      expect(colors.textPrimary, isA<Color>());
      expect(colors.textSecondary, isA<Color>());
      expect(colors.textTertiary, isA<Color>());
      expect(colors.textDisabled, isA<Color>());
      expect(colors.textOnDark, isA<Color>());
      expect(colors.textLink, isA<Color>());
      expect(colors.textSuccess, isA<Color>());
      expect(colors.textWarning, isA<Color>());
      expect(colors.textError, isA<Color>());
      expect(colors.textAccent, isA<Color>());

      // Background
      expect(colors.backgroundPrimary, isA<Color>());
      expect(colors.backgroundSurface, isA<Color>());
      expect(colors.backgroundSubtle, isA<Color>());
      expect(colors.backgroundSuccess, isA<Color>());
      expect(colors.backgroundEnabled, isA<Color>());
      expect(colors.backgroundWarning, isA<Color>());
      expect(colors.backgroundError, isA<Color>());
      expect(colors.backgroundInfo, isA<Color>());
      expect(colors.backgroundDisabled, isA<Color>());

      // Border
      expect(colors.borderDefault, isA<Color>());
      expect(colors.borderDefaultSecondary, isA<Color>());
      expect(colors.borderSubtle, isA<Color>());
      expect(colors.borderDisabled, isA<Color>());
      expect(colors.borderPrimary, isA<Color>());
      expect(colors.borderSuccess, isA<Color>());
      expect(colors.borderWarning, isA<Color>());
      expect(colors.borderError, isA<Color>());
      expect(colors.borderInfo, isA<Color>());

      // Button
      expect(colors.buttonPrimary, isA<Color>());
      expect(colors.buttonPrimaryHover, isA<Color>());
      expect(colors.buttonPrimaryDisabled, isA<Color>());
      expect(colors.buttonPrimaryText, isA<Color>());
      expect(colors.buttonPrimaryTextDisabled, isA<Color>());
      expect(colors.buttonPrimaryPressed, isA<Color>());
      expect(colors.buttonSecondary, isA<Color>());
      expect(colors.buttonSecondaryBorder, isA<Color>());
      expect(colors.buttonSecondaryText, isA<Color>());
      expect(colors.buttonSecondaryHover, isA<Color>());
      expect(colors.buttonSecondaryDisabled, isA<Color>());
      expect(colors.buttonSecondaryPressed, isA<Color>());
      expect(colors.buttonSecondaryBorderDisabled, isA<Color>());
      expect(colors.buttonTertiaryText, isA<Color>());
      expect(colors.buttonTertiaryHover, isA<Color>());
      expect(colors.buttonDestructive, isA<Color>());
      expect(colors.buttonDestructiveHover, isA<Color>());
      expect(colors.buttonDestructiveDisabled, isA<Color>());
      expect(colors.buttonDestructiveText, isA<Color>());

      // Text Field
      expect(colors.textFieldBackground, isA<Color>());
      expect(colors.textFieldText, isA<Color>());
      expect(colors.textFieldBorder, isA<Color>());
      expect(colors.textFieldBorderFocused, isA<Color>());
      expect(colors.textFieldBorderHover, isA<Color>());
      expect(colors.textFieldBorderDisabled, isA<Color>());
      expect(colors.textFieldBorderError, isA<Color>());
      expect(colors.textFieldBorderSuccess, isA<Color>());
      expect(colors.textFieldBackgroundDisabled, isA<Color>());
      expect(colors.textFieldTextDisabled, isA<Color>());
      expect(colors.textFieldHint, isA<Color>());
      expect(colors.textFieldCursor, isA<Color>());
      expect(colors.textFieldCursorError, isA<Color>());
      expect(colors.textFieldLabel, isA<Color>());
      expect(colors.textFieldLabelFocused, isA<Color>());
      expect(colors.textFieldHelper, isA<Color>());
      expect(colors.textFieldErrorText, isA<Color>());
      expect(colors.textFieldSuccessText, isA<Color>());

      // Icon
      expect(colors.iconPrimary, isA<Color>());
      expect(colors.iconSecondary, isA<Color>());
      expect(colors.iconDisabled, isA<Color>());
      expect(colors.iconOnPrimary, isA<Color>());
      expect(colors.iconSuccess, isA<Color>());
      expect(colors.iconWarning, isA<Color>());
      expect(colors.iconError, isA<Color>());
      expect(colors.iconInfo, isA<Color>());

      // Utility
      expect(colors.navigationBarShadow, isA<Color>());
      expect(colors.overlayColor, isA<Color>());
      expect(colors.dividerColor, isA<Color>());
      expect(colors.dividerColorSecondary, isA<Color>());
      expect(colors.transparent, isA<Color>());
    });

    test('ColorTokens.lerp preserves runtime types', () {
      final ColorTokens a = ColorTokens.light(brandPrimary: Colors.red);
      final ColorTokens b = ColorTokens.light(brandPrimary: Colors.blue);
      final ColorTokens lerped = a.lerp(b, 0.5);
      expect(lerped.light, isA<LightColorTokens>());
      expect(lerped.dark, isA<DarkColorTokens>());
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
