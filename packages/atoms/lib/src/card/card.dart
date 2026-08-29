import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:awesome_design_system_tokens/tokens.dart';
import 'card_enums.dart';
import 'card_style.dart';
import 'card_theme.dart';

/// A flexible card atom supporting multiple variants, elevation levels, and tap interactions.
class DSCard extends StatelessWidget {
  const DSCard({
    required this.child,
    super.key,
    this.variant = CardVariant.elevated,
    this.elevation = CardElevation.level1,
    this.padding,
    this.margin,
    this.shape,
    this.color,
    this.shadowColor,
    this.surfaceTintColor,
    this.border,
    this.onTap,
    this.onLongPress,
    this.semanticLabel,
    this.clipBehavior = Clip.antiAlias,
  });

  /// Card content
  final Widget child;

  /// Visual variant
  final CardVariant variant;

  /// Elevation level
  final CardElevation elevation;

  /// Internal padding
  final EdgeInsetsGeometry? padding;

  /// External margin
  final EdgeInsetsGeometry? margin;

  /// Custom shape
  final ShapeBorder? shape;

  /// Background color override
  final Color? color;

  /// Shadow color override
  final Color? shadowColor;

  /// Surface tint color override
  final Color? surfaceTintColor;

  /// Border override (for outlined variant)
  final BorderSide? border;

  /// Tap callback
  final VoidCallback? onTap;

  /// Long press callback
  final VoidCallback? onLongPress;

  /// Semantic label for accessibility
  final String? semanticLabel;

  /// Clip behavior
  final Clip clipBehavior;

  @override
  Widget build(BuildContext context) {
    final DSCardThemeData? theme = Theme.of(context).extension<DSCardThemeData>();
    final DesignTokens? tokens = Theme.of(context).extension<DesignTokens>();
    final RadiusScale radius = tokens?.radius.scale ?? RadiusScale.defaultScale;
    final SpacingScale spacing =
        tokens?.spacing.scale ?? SpacingScale.defaultScale;
    final ColorScheme colors = Theme.of(context).colorScheme;
    final ElevationTokens elevationTokens =
        tokens?.elevation ?? ElevationTokens.defaultTokens();

    final DSCardStyle baseStyle = switch (variant) {
      CardVariant.elevated => theme?.elevatedStyle ??
          DSCardStyle(
            backgroundColor: colors.surface,
            surfaceTintColor: colors.surfaceTint,
            shadowColor: colors.shadow,
            elevation: 1,
            borderRadius: radius.lgRadius,
            borderSide: BorderSide.none,
          ),
      CardVariant.filled => theme?.filledStyle ??
          DSCardStyle(
            backgroundColor: colors.surfaceContainerHighest,
            surfaceTintColor: colors.surfaceTint,
            shadowColor: colors.shadow,
            elevation: 0,
            borderRadius: radius.lgRadius,
            borderSide: BorderSide.none,
          ),
      CardVariant.outlined => theme?.outlinedStyle ??
          DSCardStyle(
            backgroundColor: colors.surface,
            surfaceTintColor: colors.surfaceTint,
            shadowColor: colors.shadow,
            elevation: 0,
            borderRadius: radius.lgRadius,
            borderSide: BorderSide(color: colors.outlineVariant),
          ),
    };

    final Color backgroundColor = color ?? baseStyle.backgroundColor ?? colors.surface;
    final BorderSide effectiveBorder = border ?? baseStyle.borderSide ?? BorderSide.none;
    final Color effectiveShadowColor = shadowColor ?? baseStyle.shadowColor ?? colors.shadow;
    final Color effectiveSurfaceTint = surfaceTintColor ?? baseStyle.surfaceTintColor ?? colors.surfaceTint;
    final ElevationLevel effectiveElevation = _resolveElevation(
      elevation,
      elevationTokens,
    );
    final ShapeBorder effectiveShape =
        shape ?? RoundedRectangleBorder(borderRadius: radius.lgRadius);

    final BorderRadius cardBorderRadius = (effectiveShape is RoundedRectangleBorder)
        ? effectiveShape.borderRadius as BorderRadius
        : radius.lgRadius;

    Widget card = Card(
      color: backgroundColor,
      surfaceTintColor: effectiveSurfaceTint,
      shadowColor: effectiveShadowColor,
      elevation: variant == CardVariant.elevated
          ? effectiveElevation.level.toDouble()
          : (baseStyle.elevation ?? 0.0),
      shape: RoundedRectangleBorder(
        borderRadius: cardBorderRadius,
        side: effectiveBorder,
      ),
      margin: margin ?? baseStyle.margin ?? EdgeInsets.all(spacing.md),
      clipBehavior: clipBehavior,
      child: Padding(
        padding: padding ?? baseStyle.padding ?? EdgeInsets.all(spacing.lg),
        child: child,
      ),
    );

    // Add inkwell for tap handling
    if (onTap != null || onLongPress != null) {
      card = InkWell(
        onTap: onTap,
        onLongPress: onLongPress,
        borderRadius: cardBorderRadius,
        child: card,
      );
    }

    // Add semantics
    if (semanticLabel != null) {
      card = Semantics(label: semanticLabel, container: true, child: card);
    }

    return card;
  }

  ElevationLevel _resolveElevation(
    CardElevation elevation,
    ElevationTokens elevationTokens,
  ) {
    final int level = switch (elevation) {
      CardElevation.none => 0,
      CardElevation.level1 => 1,
      CardElevation.level2 => 2,
      CardElevation.level3 => 3,
    };
    return elevationTokens.getLevel(level);
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(EnumProperty<CardVariant>('variant', variant));
    properties.add(EnumProperty<CardElevation>('elevation', elevation));
    properties.add(
      DiagnosticsProperty<EdgeInsetsGeometry?>('padding', padding),
    );
    properties.add(DiagnosticsProperty<EdgeInsetsGeometry?>('margin', margin));
    properties.add(DiagnosticsProperty<ShapeBorder?>('shape', shape));
    properties.add(ColorProperty('color', color));
    properties.add(ColorProperty('shadowColor', shadowColor));
    properties.add(ColorProperty('surfaceTintColor', surfaceTintColor));
    properties.add(DiagnosticsProperty<BorderSide?>('border', border));
    properties.add(ObjectFlagProperty<VoidCallback?>.has('onTap', onTap));
    properties.add(
      ObjectFlagProperty<VoidCallback?>.has('onLongPress', onLongPress),
    );
    properties.add(StringProperty('semanticLabel', semanticLabel));
    properties.add(EnumProperty<Clip>('clipBehavior', clipBehavior));
  }
}
