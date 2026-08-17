// Color tokens following Material 3 ColorScheme
// Supports light/dark themes with brand color customization

import 'package:flutter/material.dart';

/// Material 3 color roles for light theme
@immutable
class LightColorTokens extends ColorScheme {
  const LightColorTokens({
    required Color primary,
    required Color onPrimary,
    required Color primaryContainer,
    required Color onPrimaryContainer,
    required Color secondary,
    required Color onSecondary,
    required Color secondaryContainer,
    required Color onSecondaryContainer,
    required Color tertiary,
    required Color onTertiary,
    required Color tertiaryContainer,
    required Color onTertiaryContainer,
    required Color error,
    required Color onError,
    required Color errorContainer,
    required Color onErrorContainer,
    required Color background,
    required Color onBackground,
    required Color surface,
    required Color onSurface,
    required Color surfaceVariant,
    required Color onSurfaceVariant,
    required Color outline,
    required Color outlineVariant,
    required Color shadow,
    required Color scrim,
    required Color inverseSurface,
    required Color inversePrimary,
    required Color surfaceTint,
  }) : super(
    brightness: Brightness.light,
    primary: primary,
    onPrimary: onPrimary,
    primaryContainer: primaryContainer,
    onPrimaryContainer: onPrimaryContainer,
    secondary: secondary,
    onSecondary: onSecondary,
    secondaryContainer: secondaryContainer,
    onSecondaryContainer: onSecondaryContainer,
    tertiary: tertiary,
    onTertiary: onTertiary,
    tertiaryContainer: tertiaryContainer,
    onTertiaryContainer: onTertiaryContainer,
    error: error,
    onError: onError,
    errorContainer: errorContainer,
    onErrorContainer: onErrorContainer,
    background: background,
    onBackground: onBackground,
    surface: surface,
    onSurface: onSurface,
    surfaceVariant: surfaceVariant,
    onSurfaceVariant: onSurfaceVariant,
    outline: outline,
    outlineVariant: outlineVariant,
    shadow: shadow,
    scrim: scrim,
    inverseSurface: inverseSurface,
    inversePrimary: inversePrimary,
    surfaceTint: surfaceTint,
  );

  factory LightColorTokens.fromBrand({
    required Color brandPrimary,
    Color? brandSecondary,
    Color? brandTertiary,
    Color? brandError,
  }) {
    // Generate M3 tonal palette from brand colors
    final primaryPalette = _generateTonalPalette(brandPrimary);
    final secondaryPalette = _generateTonalPalette(brandSecondary ?? brandPrimary.withBlue(200));
    final tertiaryPalette = _generateTonalPalette(brandTertiary ?? brandPrimary.withGreen(150));
    final errorPalette = _generateTonalPalette(brandError ?? const Color(0xFFBA1A1A));

    return LightColorTokens(
      primary: primaryPalette[40]!,
      onPrimary: primaryPalette[100]!,
      primaryContainer: primaryPalette[90]!,
      onPrimaryContainer: primaryPalette[10]!,
      secondary: secondaryPalette[40]!,
      onSecondary: secondaryPalette[100]!,
      secondaryContainer: secondaryPalette[90]!,
      onSecondaryContainer: secondaryPalette[10]!,
      tertiary: tertiaryPalette[40]!,
      onTertiary: tertiaryPalette[100]!,
      tertiaryContainer: tertiaryPalette[90]!,
      onTertiaryContainer: tertiaryPalette[10]!,
      error: errorPalette[40]!,
      onError: errorPalette[100]!,
      errorContainer: errorPalette[90]!,
      onErrorContainer: errorPalette[10]!,
      background: const Color(0xFFFFFBFE),
      onBackground: const Color(0xFF1C1B1F),
      surface: const Color(0xFFFFFBFE),
      onSurface: const Color(0xFF1C1B1F),
      surfaceVariant: const Color(0xFFE7E0EC),
      onSurfaceVariant: const Color(0xFF49454F),
      outline: const Color(0xFF79747E),
      outlineVariant: const Color(0xFFCAC4D0),
      shadow: const Color(0xFF000000),
      scrim: const Color(0xFF000000),
      inverseSurface: const Color(0xFF313033),
      inversePrimary: primaryPalette[80]!,
      surfaceTint: primaryPalette[40]!,
    );
  }

  static Map<int, Color> _generateTonalPalette(Color color) {
    final hsl = HSLColor.fromColor(color);
    final map = <int, Color>{};
    for (int i = 0; i <= 100; i += 10) {
      map[i] = hsl.withLightness(i / 100).toColor();
    }
    return map;
  }
}

/// Material 3 color roles for dark theme
@immutable
class DarkColorTokens extends ColorScheme {
  const DarkColorTokens({
    required Color primary,
    required Color onPrimary,
    required Color primaryContainer,
    required Color onPrimaryContainer,
    required Color secondary,
    required Color onSecondary,
    required Color secondaryContainer,
    required Color onSecondaryContainer,
    required Color tertiary,
    required Color onTertiary,
    required Color tertiaryContainer,
    required Color onTertiaryContainer,
    required Color error,
    required Color onError,
    required Color errorContainer,
    required Color onErrorContainer,
    required Color background,
    required Color onBackground,
    required Color surface,
    required Color onSurface,
    required Color surfaceVariant,
    required Color onSurfaceVariant,
    required Color outline,
    required Color outlineVariant,
    required Color shadow,
    required Color scrim,
    required Color inverseSurface,
    required Color inversePrimary,
    required Color surfaceTint,
  }) : super(
    brightness: Brightness.dark,
    primary: primary,
    onPrimary: onPrimary,
    primaryContainer: primaryContainer,
    onPrimaryContainer: onPrimaryContainer,
    secondary: secondary,
    onSecondary: onSecondary,
    secondaryContainer: secondaryContainer,
    onSecondaryContainer: onSecondaryContainer,
    tertiary: tertiary,
    onTertiary: onTertiary,
    tertiaryContainer: tertiaryContainer,
    onTertiaryContainer: onTertiaryContainer,
    error: error,
    onError: onError,
    errorContainer: errorContainer,
    onErrorContainer: onErrorContainer,
    background: background,
    onBackground: onBackground,
    surface: surface,
    onSurface: onSurface,
    surfaceVariant: surfaceVariant,
    onSurfaceVariant: onSurfaceVariant,
    outline: outline,
    outlineVariant: outlineVariant,
    shadow: shadow,
    scrim: scrim,
    inverseSurface: inverseSurface,
    inversePrimary: inversePrimary,
    surfaceTint: surfaceTint,
  );

  factory DarkColorTokens.fromBrand({
    required Color brandPrimary,
    Color? brandSecondary,
    Color? brandTertiary,
    Color? brandError,
  }) {
    final primaryPalette = LightColorTokens._generateTonalPalette(brandPrimary);
    final secondaryPalette = LightColorTokens._generateTonalPalette(brandSecondary ?? brandPrimary.withBlue(200));
    final tertiaryPalette = LightColorTokens._generateTonalPalette(brandTertiary ?? brandPrimary.withGreen(150));
    final errorPalette = LightColorTokens._generateTonalPalette(brandError ?? const Color(0xFFBA1A1A));

    return DarkColorTokens(
      primary: primaryPalette[80]!,
      onPrimary: primaryPalette[20]!,
      primaryContainer: primaryPalette[30]!,
      onPrimaryContainer: primaryPalette[90]!,
      secondary: secondaryPalette[80]!,
      onSecondary: secondaryPalette[20]!,
      secondaryContainer: secondaryPalette[30]!,
      onSecondaryContainer: secondaryPalette[90]!,
      tertiary: tertiaryPalette[80]!,
      onTertiary: tertiaryPalette[20]!,
      tertiaryContainer: tertiaryPalette[30]!,
      onTertiaryContainer: tertiaryPalette[90]!,
      error: errorPalette[80]!,
      onError: errorPalette[20]!,
      errorContainer: errorPalette[30]!,
      onErrorContainer: errorPalette[90]!,
      background: const Color(0xFF1C1B1F),
      onBackground: const Color(0xFFE6E1E5),
      surface: const Color(0xFF1C1B1F),
      onSurface: const Color(0xFFE6E1E5),
      surfaceVariant: const Color(0xFF49454F),
      onSurfaceVariant: const Color(0xFFCAC4D0),
      outline: const Color(0xFF938F99),
      outlineVariant: const Color(0xFF49454F),
      shadow: const Color(0xFF000000),
      scrim: const Color(0xFF000000),
      inverseSurface: const Color(0xFFE6E1E5),
      inversePrimary: primaryPalette[40]!,
      surfaceTint: primaryPalette[80]!,
    );
  }
}

/// Unified color tokens that implements ThemeExtension
@immutable
class ColorTokens extends ThemeExtension<ColorTokens> {
  final ColorScheme light;
  final ColorScheme dark;

  const ColorTokens({required this.light, required this.dark});

  factory ColorTokens.light({
    required Color brandPrimary,
    Color? brandSecondary,
    Color? brandTertiary,
    Color? brandError,
  }) {
    return ColorTokens(
      light: LightColorTokens.fromBrand(
        brandPrimary: brandPrimary,
        brandSecondary: brandSecondary,
        brandTertiary: brandTertiary,
        brandError: brandError,
      ),
      dark: DarkColorTokens.fromBrand(
        brandPrimary: brandPrimary,
        brandSecondary: brandSecondary,
        brandTertiary: brandTertiary,
        brandError: brandError,
      ),
    );
  }

  ColorScheme resolve(Brightness brightness) => brightness == Brightness.light ? light : dark;

  @override
  ColorTokens copyWith({ColorScheme? light, ColorScheme? dark}) {
    return ColorTokens(
      light: light ?? this.light,
      dark: dark ?? this.dark,
    );
  }

  @override
  ColorTokens lerp(ThemeExtension<ColorTokens>? other, double t) {
    if (other is! ColorTokens) return this;
    return ColorTokens(
      light: ColorScheme.lerp(light, other.light, t)!,
      dark: ColorScheme.lerp(dark, other.dark, t)!,
    );
  }
}