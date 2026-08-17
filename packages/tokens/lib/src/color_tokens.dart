// Color tokens following Material 3 ColorScheme
// Supports light/dark themes with brand color customization

import 'package:flutter/material.dart';

/// Material 3 color roles for light theme
@immutable
class LightColorTokens extends ColorScheme {
  const LightColorTokens({
    required super.primary,
    required super.onPrimary,
    required Color super.primaryContainer,
    required Color super.onPrimaryContainer,
    required super.secondary,
    required super.onSecondary,
    required Color super.secondaryContainer,
    required Color super.onSecondaryContainer,
    required Color super.tertiary,
    required Color super.onTertiary,
    required Color super.tertiaryContainer,
    required Color super.onTertiaryContainer,
    required super.error,
    required super.onError,
    required Color super.errorContainer,
    required Color super.onErrorContainer,
    required super.surface,
    required super.onSurface,
    required Color super.surfaceContainerHighest,
    required Color super.onSurfaceVariant,
    required Color super.outline,
    required Color super.outlineVariant,
    required Color super.shadow,
    required Color super.scrim,
    required Color super.inverseSurface,
    required Color super.inversePrimary,
    required Color super.surfaceTint,
  }) : super(brightness: Brightness.light);

  factory LightColorTokens.fromBrand({
    required Color brandPrimary,
    Color? brandSecondary,
    Color? brandTertiary,
    Color? brandError,
  }) {
    // Generate M3 tonal palette from brand colors
    final Map<int, Color> primaryPalette = _generateTonalPalette(brandPrimary);
    final Map<int, Color> secondaryPalette = _generateTonalPalette(
      brandSecondary ?? brandPrimary.withBlue(200),
    );
    final Map<int, Color> tertiaryPalette = _generateTonalPalette(
      brandTertiary ?? brandPrimary.withGreen(150),
    );
    final Map<int, Color> errorPalette = _generateTonalPalette(
      brandError ?? const Color(0xFFBA1A1A),
    );

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
      surface: const Color(0xFFFFFBFE),
      onSurface: const Color(0xFF1C1B1F),
      surfaceContainerHighest: const Color(0xFFE7E0EC),
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
    final HSLColor hsl = HSLColor.fromColor(color);
    final Map<int, Color> map = <int, Color>{};
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
    required super.primary,
    required super.onPrimary,
    required Color super.primaryContainer,
    required Color super.onPrimaryContainer,
    required super.secondary,
    required super.onSecondary,
    required Color super.secondaryContainer,
    required Color super.onSecondaryContainer,
    required Color super.tertiary,
    required Color super.onTertiary,
    required Color super.tertiaryContainer,
    required Color super.onTertiaryContainer,
    required super.error,
    required super.onError,
    required Color super.errorContainer,
    required Color super.onErrorContainer,
    required super.surface,
    required super.onSurface,
    required Color super.surfaceContainerHighest,
    required Color super.onSurfaceVariant,
    required Color super.outline,
    required Color super.outlineVariant,
    required Color super.shadow,
    required Color super.scrim,
    required Color super.inverseSurface,
    required Color super.inversePrimary,
    required Color super.surfaceTint,
  }) : super(brightness: Brightness.dark);

  factory DarkColorTokens.fromBrand({
    required Color brandPrimary,
    Color? brandSecondary,
    Color? brandTertiary,
    Color? brandError,
  }) {
    final Map<int, Color> primaryPalette =
        LightColorTokens._generateTonalPalette(brandPrimary);
    final Map<int, Color> secondaryPalette =
        LightColorTokens._generateTonalPalette(
          brandSecondary ?? brandPrimary.withBlue(200),
        );
    final Map<int, Color> tertiaryPalette =
        LightColorTokens._generateTonalPalette(
          brandTertiary ?? brandPrimary.withGreen(150),
        );
    final Map<int, Color> errorPalette = LightColorTokens._generateTonalPalette(
      brandError ?? const Color(0xFFBA1A1A),
    );

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
      surface: const Color(0xFF1C1B1F),
      onSurface: const Color(0xFFE6E1E5),
      surfaceContainerHighest: const Color(0xFF49454F),
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
  final ColorScheme light;
  final ColorScheme dark;

  ColorScheme resolve(Brightness brightness) =>
      brightness == Brightness.light ? light : dark;

  @override
  ColorTokens copyWith({ColorScheme? light, ColorScheme? dark}) {
    return ColorTokens(light: light ?? this.light, dark: dark ?? this.dark);
  }

  @override
  ColorTokens lerp(ThemeExtension<ColorTokens>? other, double t) {
    if (other is! ColorTokens) return this;
    return ColorTokens(
      light: ColorScheme.lerp(light, other.light, t),
      dark: ColorScheme.lerp(dark, other.dark, t),
    );
  }
}
