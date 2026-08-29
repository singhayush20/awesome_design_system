import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:awesome_design_system_tokens/tokens.dart';
import 'text_enums.dart';

/// Immutable style parameters for DSText.
@immutable
class DSTextStyle with Diagnosticable {
  const DSTextStyle({
    this.style,
    this.fontWeight,
    this.fontStyle,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.softWrap,
    this.textDirection,
    this.locale,
    this.textScaler,
  });

  final TextStyle? style;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final bool? softWrap;
  final TextDirection? textDirection;
  final Locale? locale;
  final TextScaler? textScaler;

  DSTextStyle copyWith({
    TextStyle? style,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
    bool? softWrap,
    TextDirection? textDirection,
    Locale? locale,
    TextScaler? textScaler,
  }) {
    return DSTextStyle(
      style: style ?? this.style,
      fontWeight: fontWeight ?? this.fontWeight,
      fontStyle: fontStyle ?? this.fontStyle,
      textAlign: textAlign ?? this.textAlign,
      overflow: overflow ?? this.overflow,
      maxLines: maxLines ?? this.maxLines,
      softWrap: softWrap ?? this.softWrap,
      textDirection: textDirection ?? this.textDirection,
      locale: locale ?? this.locale,
      textScaler: textScaler ?? this.textScaler,
    );
  }

  DSTextStyle merge(DSTextStyle? other) {
    if (other == null) return this;
    return copyWith(
      style: style?.merge(other.style) ?? other.style,
      fontWeight: other.fontWeight ?? fontWeight,
      fontStyle: other.fontStyle ?? fontStyle,
      textAlign: other.textAlign ?? textAlign,
      overflow: other.overflow ?? overflow,
      maxLines: other.maxLines ?? maxLines,
      softWrap: other.softWrap ?? softWrap,
      textDirection: other.textDirection ?? textDirection,
      locale: other.locale ?? locale,
      textScaler: other.textScaler ?? textScaler,
    );
  }

  static TextStyle resolveBaseStyle(
    TextVariant variant,
    TypographyScale typography,
  ) {
    return switch (variant) {
      TextVariant.displayLarge => typography.displayLarge,
      TextVariant.displayMedium => typography.displayMedium,
      TextVariant.displaySmall => typography.displaySmall,
      TextVariant.headlineLarge => typography.headlineLarge,
      TextVariant.headlineMedium => typography.headlineMedium,
      TextVariant.headlineSmall => typography.headlineSmall,
      TextVariant.titleLarge => typography.titleLarge,
      TextVariant.titleMedium => typography.titleMedium,
      TextVariant.titleSmall => typography.titleSmall,
      TextVariant.bodyLarge => typography.bodyLarge,
      TextVariant.bodyMedium => typography.bodyMedium,
      TextVariant.bodySmall => typography.bodySmall,
      TextVariant.labelLarge => typography.labelLarge,
      TextVariant.labelMedium => typography.labelMedium,
      TextVariant.labelSmall => typography.labelSmall,
    };
  }

  static Color resolveColor(
    TextColorRole role,
    ColorScheme colors,
    Brightness brightness,
  ) {
    return switch (role) {
      TextColorRole.primary => colors.onSurface,
      TextColorRole.secondary => colors.onSurfaceVariant,
      TextColorRole.tertiary => colors.onSurfaceVariant.withValues(alpha: 0.6),
      TextColorRole.inverse =>
        brightness == Brightness.light
            ? colors.onInverseSurface
            : colors.onSurface,
      TextColorRole.error => colors.error,
      TextColorRole.outline => colors.outline,
    };
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<TextStyle?>('style', style));
    properties.add(DiagnosticsProperty<FontWeight?>('fontWeight', fontWeight));
    properties.add(EnumProperty<FontStyle?>('fontStyle', fontStyle));
    properties.add(EnumProperty<TextAlign?>('textAlign', textAlign));
    properties.add(EnumProperty<TextOverflow?>('overflow', overflow));
    properties.add(IntProperty('maxLines', maxLines));
    properties.add(DiagnosticsProperty<bool?>('softWrap', softWrap));
    properties.add(EnumProperty<TextDirection?>('textDirection', textDirection));
    properties.add(DiagnosticsProperty<Locale?>('locale', locale));
    properties.add(DiagnosticsProperty<TextScaler?>('textScaler', textScaler));
  }
}
