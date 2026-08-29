import 'package:flutter/material.dart';
import 'package:awesome_design_system_tokens/tokens.dart';
import 'card_style.dart';

/// ThemeExtension for [DSCard] variant styling across the design system.
@immutable
class DSCardThemeData extends ThemeExtension<DSCardThemeData> {
  const DSCardThemeData({
    required this.elevatedStyle,
    required this.filledStyle,
    required this.outlinedStyle,
  });

  factory DSCardThemeData.fromTokens(DesignTokens tokens, ColorScheme colors) {
    final RadiusScale radius = tokens.radius.scale;
    final SpacingScale spacing = tokens.spacing.scale;

    return DSCardThemeData(
      elevatedStyle: DSCardStyle(
        backgroundColor: colors.surface,
        surfaceTintColor: colors.surfaceTint,
        shadowColor: colors.shadow,
        elevation: 1,
        borderRadius: radius.lgRadius,
        borderSide: BorderSide.none,
        padding: EdgeInsets.all(spacing.lg),
        margin: EdgeInsets.all(spacing.md),
      ),
      filledStyle: DSCardStyle(
        backgroundColor: colors.surfaceContainerHighest,
        surfaceTintColor: colors.surfaceTint,
        shadowColor: colors.shadow,
        elevation: 0,
        borderRadius: radius.lgRadius,
        borderSide: BorderSide.none,
        padding: EdgeInsets.all(spacing.lg),
        margin: EdgeInsets.all(spacing.md),
      ),
      outlinedStyle: DSCardStyle(
        backgroundColor: colors.surface,
        surfaceTintColor: colors.surfaceTint,
        shadowColor: colors.shadow,
        elevation: 0,
        borderRadius: radius.lgRadius,
        borderSide: BorderSide(color: colors.outlineVariant),
        padding: EdgeInsets.all(spacing.lg),
        margin: EdgeInsets.all(spacing.md),
      ),
    );
  }

  final DSCardStyle elevatedStyle;
  final DSCardStyle filledStyle;
  final DSCardStyle outlinedStyle;

  @override
  DSCardThemeData copyWith({
    DSCardStyle? elevatedStyle,
    DSCardStyle? filledStyle,
    DSCardStyle? outlinedStyle,
  }) {
    return DSCardThemeData(
      elevatedStyle: elevatedStyle ?? this.elevatedStyle,
      filledStyle: filledStyle ?? this.filledStyle,
      outlinedStyle: outlinedStyle ?? this.outlinedStyle,
    );
  }

  @override
  DSCardThemeData lerp(ThemeExtension<DSCardThemeData>? other, double t) {
    if (other is! DSCardThemeData) return this;
    return DSCardThemeData(
      elevatedStyle: DSCardStyle.lerp(elevatedStyle, other.elevatedStyle, t)!,
      filledStyle: DSCardStyle.lerp(filledStyle, other.filledStyle, t)!,
      outlinedStyle: DSCardStyle.lerp(outlinedStyle, other.outlinedStyle, t)!,
    );
  }
}
