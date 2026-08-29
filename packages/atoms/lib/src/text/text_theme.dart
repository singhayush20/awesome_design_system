import 'package:flutter/material.dart';
import 'package:awesome_design_system_tokens/tokens.dart';
import 'text_enums.dart';

/// ThemeExtension for [DSText] typography and text color styling.
@immutable
class DSTextThemeData extends ThemeExtension<DSTextThemeData> {
  const DSTextThemeData({
    required this.typography,
    required this.colors,
    required this.brightness,
  });

  factory DSTextThemeData.fromTokens(
    DesignTokens tokens,
    ColorScheme colors,
    Brightness brightness,
  ) {
    return DSTextThemeData(
      typography: tokens.typography.scale,
      colors: colors,
      brightness: brightness,
    );
  }

  final TypographyScale typography;
  final ColorScheme colors;
  final Brightness brightness;

  @override
  DSTextThemeData copyWith({
    TypographyScale? typography,
    ColorScheme? colors,
    Brightness? brightness,
  }) {
    return DSTextThemeData(
      typography: typography ?? this.typography,
      colors: colors ?? this.colors,
      brightness: brightness ?? this.brightness,
    );
  }

  @override
  DSTextThemeData lerp(ThemeExtension<DSTextThemeData>? other, double t) {
    if (other is! DSTextThemeData) return this;
    return DSTextThemeData(
      typography: typography,
      colors: ColorScheme.lerp(colors, other.colors, t),
      brightness: t < 0.5 ? brightness : other.brightness,
    );
  }
}
