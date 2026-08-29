import 'package:flutter/material.dart';
import 'package:awesome_design_system_tokens/tokens.dart';
import 'badge_style.dart';

/// ThemeExtension for [DSBadge] variant styling across the design system.
@immutable
class DSBadgeThemeData extends ThemeExtension<DSBadgeThemeData> {
  const DSBadgeThemeData({
    required this.filledStyle,
    required this.outlinedStyle,
    required this.tonalStyle,
    required this.lightStyle,
  });

  factory DSBadgeThemeData.fromTokens(DesignTokens tokens, ColorScheme colors) {
    final RadiusScale radius = tokens.radius.scale;
    final SpacingScale spacing = tokens.spacing.scale;
    final TypographyScale typography = tokens.typography.scale;
    final SizingScale sizing = tokens.sizing.scale;

    return DSBadgeThemeData(
      filledStyle: DSBadgeStyle(
        backgroundColor: colors.primaryContainer,
        foregroundColor: colors.onPrimaryContainer,
        borderColor: Colors.transparent,
        borderWidth: 0,
        borderRadius: radius.mdRadius,
        padding: EdgeInsets.symmetric(
          horizontal: spacing.sm,
          vertical: spacing.xxs,
        ),
        textStyle: typography.labelMedium.copyWith(
          color: colors.onPrimaryContainer,
        ),
        iconSize: sizing.iconXs,
        gap: spacing.xxs,
      ),
      outlinedStyle: DSBadgeStyle(
        backgroundColor: Colors.transparent,
        foregroundColor: colors.primary,
        borderColor: colors.outline,
        borderWidth: 1,
        borderRadius: radius.mdRadius,
        padding: EdgeInsets.symmetric(
          horizontal: spacing.sm,
          vertical: spacing.xxs,
        ),
        textStyle: typography.labelMedium.copyWith(color: colors.primary),
        iconSize: sizing.iconXs,
        gap: spacing.xxs,
      ),
      tonalStyle: DSBadgeStyle(
        backgroundColor: colors.secondaryContainer,
        foregroundColor: colors.onSecondaryContainer,
        borderColor: Colors.transparent,
        borderWidth: 0,
        borderRadius: radius.mdRadius,
        padding: EdgeInsets.symmetric(
          horizontal: spacing.sm,
          vertical: spacing.xxs,
        ),
        textStyle: typography.labelMedium.copyWith(
          color: colors.onSecondaryContainer,
        ),
        iconSize: sizing.iconXs,
        gap: spacing.xxs,
      ),
      lightStyle: DSBadgeStyle(
        backgroundColor: colors.primaryContainer.withValues(alpha: 0.5),
        foregroundColor: colors.onPrimaryContainer,
        borderColor: Colors.transparent,
        borderWidth: 0,
        borderRadius: radius.mdRadius,
        padding: EdgeInsets.symmetric(
          horizontal: spacing.sm,
          vertical: spacing.xxs,
        ),
        textStyle: typography.labelMedium.copyWith(
          color: colors.onPrimaryContainer,
        ),
        iconSize: sizing.iconXs,
        gap: spacing.xxs,
      ),
    );
  }

  final DSBadgeStyle filledStyle;
  final DSBadgeStyle outlinedStyle;
  final DSBadgeStyle tonalStyle;
  final DSBadgeStyle lightStyle;

  @override
  DSBadgeThemeData copyWith({
    DSBadgeStyle? filledStyle,
    DSBadgeStyle? outlinedStyle,
    DSBadgeStyle? tonalStyle,
    DSBadgeStyle? lightStyle,
  }) {
    return DSBadgeThemeData(
      filledStyle: filledStyle ?? this.filledStyle,
      outlinedStyle: outlinedStyle ?? this.outlinedStyle,
      tonalStyle: tonalStyle ?? this.tonalStyle,
      lightStyle: lightStyle ?? this.lightStyle,
    );
  }

  @override
  DSBadgeThemeData lerp(ThemeExtension<DSBadgeThemeData>? other, double t) {
    if (other is! DSBadgeThemeData) return this;
    return DSBadgeThemeData(
      filledStyle: DSBadgeStyle.lerp(filledStyle, other.filledStyle, t)!,
      outlinedStyle: DSBadgeStyle.lerp(outlinedStyle, other.outlinedStyle, t)!,
      tonalStyle: DSBadgeStyle.lerp(tonalStyle, other.tonalStyle, t)!,
      lightStyle: DSBadgeStyle.lerp(lightStyle, other.lightStyle, t)!,
    );
  }
}
