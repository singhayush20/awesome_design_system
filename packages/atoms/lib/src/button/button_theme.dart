import 'package:flutter/material.dart';
import 'package:awesome_design_system_tokens/tokens.dart';
import 'button_style.dart';

/// ThemeExtension for [DSButton] variant styling across the design system.
@immutable
class DSButtonThemeData extends ThemeExtension<DSButtonThemeData> {
  const DSButtonThemeData({
    required this.filledStyle,
    required this.outlinedStyle,
    required this.elevatedStyle,
    required this.tonalStyle,
    required this.textStyle,
  });

  factory DSButtonThemeData.fromTokens(DesignTokens tokens, ColorScheme colors) {
    final SpacingScale spacing = tokens.spacing.scale;
    final RadiusScale radius = tokens.radius.scale;
    final SizingScale sizing = tokens.sizing.scale;
    final TypographyScale typo = tokens.typography.scale;

    return DSButtonThemeData(
      filledStyle: DSButtonStyle(
        backgroundColor: colors.primary,
        foregroundColor: colors.onPrimary,
        disabledBackgroundColor: colors.surfaceContainerHighest,
        disabledForegroundColor: colors.onSurfaceVariant,
        padding: EdgeInsets.symmetric(horizontal: spacing.md, vertical: spacing.xs),
        borderRadius: radius.mdRadius,
        minimumSize: Size(64, sizing.buttonHeightMd),
        textStyle: typo.labelLarge,
        iconSize: sizing.iconMd,
        spacing: spacing.xs,
      ),
      outlinedStyle: DSButtonStyle(
        backgroundColor: Colors.transparent,
        foregroundColor: colors.primary,
        disabledBackgroundColor: Colors.transparent,
        disabledForegroundColor: colors.onSurfaceVariant,
        borderSide: BorderSide(color: colors.outline),
        padding: EdgeInsets.symmetric(horizontal: spacing.md, vertical: spacing.xs),
        borderRadius: radius.mdRadius,
        minimumSize: Size(64, sizing.buttonHeightMd),
        textStyle: typo.labelLarge,
        iconSize: sizing.iconMd,
        spacing: spacing.xs,
      ),
      elevatedStyle: DSButtonStyle(
        backgroundColor: colors.surfaceContainerLow,
        foregroundColor: colors.primary,
        disabledBackgroundColor: colors.surfaceContainerHighest,
        disabledForegroundColor: colors.onSurfaceVariant,
        elevation: 1,
        shadowColor: colors.shadow,
        padding: EdgeInsets.symmetric(horizontal: spacing.md, vertical: spacing.xs),
        borderRadius: radius.mdRadius,
        minimumSize: Size(64, sizing.buttonHeightMd),
        textStyle: typo.labelLarge,
        iconSize: sizing.iconMd,
        spacing: spacing.xs,
      ),
      tonalStyle: DSButtonStyle(
        backgroundColor: colors.secondaryContainer,
        foregroundColor: colors.onSecondaryContainer,
        disabledBackgroundColor: colors.surfaceContainerHighest,
        disabledForegroundColor: colors.onSurfaceVariant,
        padding: EdgeInsets.symmetric(horizontal: spacing.md, vertical: spacing.xs),
        borderRadius: radius.mdRadius,
        minimumSize: Size(64, sizing.buttonHeightMd),
        textStyle: typo.labelLarge,
        iconSize: sizing.iconMd,
        spacing: spacing.xs,
      ),
      textStyle: DSButtonStyle(
        backgroundColor: Colors.transparent,
        foregroundColor: colors.primary,
        disabledBackgroundColor: Colors.transparent,
        disabledForegroundColor: colors.onSurfaceVariant,
        padding: EdgeInsets.symmetric(horizontal: spacing.sm, vertical: spacing.xs),
        borderRadius: radius.mdRadius,
        minimumSize: Size(48, sizing.buttonHeightSm),
        textStyle: typo.labelLarge,
        iconSize: sizing.iconMd,
        spacing: spacing.xs,
      ),
    );
  }

  final DSButtonStyle filledStyle;
  final DSButtonStyle outlinedStyle;
  final DSButtonStyle elevatedStyle;
  final DSButtonStyle tonalStyle;
  final DSButtonStyle textStyle;

  @override
  DSButtonThemeData copyWith({
    DSButtonStyle? filledStyle,
    DSButtonStyle? outlinedStyle,
    DSButtonStyle? elevatedStyle,
    DSButtonStyle? tonalStyle,
    DSButtonStyle? textStyle,
  }) {
    return DSButtonThemeData(
      filledStyle: filledStyle ?? this.filledStyle,
      outlinedStyle: outlinedStyle ?? this.outlinedStyle,
      elevatedStyle: elevatedStyle ?? this.elevatedStyle,
      tonalStyle: tonalStyle ?? this.tonalStyle,
      textStyle: textStyle ?? this.textStyle,
    );
  }

  @override
  DSButtonThemeData lerp(ThemeExtension<DSButtonThemeData>? other, double t) {
    if (other is! DSButtonThemeData) return this;
    return DSButtonThemeData(
      filledStyle: DSButtonStyle.lerp(filledStyle, other.filledStyle, t)!,
      outlinedStyle: DSButtonStyle.lerp(outlinedStyle, other.outlinedStyle, t)!,
      elevatedStyle: DSButtonStyle.lerp(elevatedStyle, other.elevatedStyle, t)!,
      tonalStyle: DSButtonStyle.lerp(tonalStyle, other.tonalStyle, t)!,
      textStyle: DSButtonStyle.lerp(textStyle, other.textStyle, t)!,
    );
  }
}
