import 'package:flutter/material.dart';
import 'package:awesome_design_system_tokens/tokens.dart';
import 'input_style.dart';

/// ThemeExtension for DSInput styling across the design system.
@immutable
class DSInputThemeData extends ThemeExtension<DSInputThemeData> {
  const DSInputThemeData({
    required this.style,
  });

  factory DSInputThemeData.fromTokens(DesignTokens tokens, ColorScheme colors) {
    final RadiusScale radius = tokens.radius.scale;
    final SpacingScale spacing = tokens.spacing.scale;
    final TypographyScale typo = tokens.typography.scale;

    return DSInputThemeData(
      style: DSInputStyle(
        fillColor: colors.surfaceContainerHighest.withValues(alpha: 0.5),
        labelStyle: typo.bodyLarge.copyWith(color: colors.onSurfaceVariant),
        hintStyle: typo.bodyLarge.copyWith(
          color: colors.onSurfaceVariant.withValues(alpha: 0.6),
        ),
        helperStyle: typo.bodySmall.copyWith(color: colors.onSurfaceVariant),
        errorStyle: typo.bodySmall.copyWith(color: colors.error),
        counterStyle: typo.bodySmall.copyWith(color: colors.onSurfaceVariant),
        contentPadding: EdgeInsets.symmetric(
          horizontal: spacing.md,
          vertical: spacing.xs,
        ),
        borderRadius: radius.mdRadius,
        borderSide: BorderSide(color: colors.outline),
      ),
    );
  }

  final DSInputStyle style;

  @override
  DSInputThemeData copyWith({
    DSInputStyle? style,
  }) {
    return DSInputThemeData(
      style: style ?? this.style,
    );
  }

  @override
  DSInputThemeData lerp(ThemeExtension<DSInputThemeData>? other, double t) {
    if (other is! DSInputThemeData) return this;
    return DSInputThemeData(
      style: DSInputStyle.lerp(style, other.style, t)!,
    );
  }
}
