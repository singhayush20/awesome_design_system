// Card atom with elevation variants

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:awesome_design_system_tokens/tokens.dart';
import 'text.dart';

/// Card elevation levels
enum CardElevation { none, level1, level2, level3 }

/// Card variants
enum CardVariant { elevated, filled, outlined }

/// A flexible card component with multiple variants and elevations
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
    final DesignTokens? tokens = Theme.of(context).extension<DesignTokens>();
    final RadiusScale radius = tokens?.radius.scale ?? RadiusScale.defaultScale;
    final SpacingScale spacing =
        tokens?.spacing.scale ?? SpacingScale.defaultScale;
    final ColorScheme colors = Theme.of(context).colorScheme;
    final ElevationTokens elevationTokens =
        tokens?.elevation ?? ElevationTokens.defaultTokens();

    // Resolve colors based on variant
    final Color backgroundColor = _resolveBackgroundColor(
      variant,
      color,
      colors,
    );
    final BorderSide effectiveBorder = _resolveBorder(variant, border, colors);
    final Color effectiveShadowColor = shadowColor ?? colors.shadow;
    final Color effectiveSurfaceTint = surfaceTintColor ?? colors.surfaceTint;
    final ElevationLevel effectiveElevation = _resolveElevation(
      elevation,
      elevationTokens,
      context,
    );
    final ShapeBorder effectiveShape =
        shape ?? RoundedRectangleBorder(borderRadius: radius.lgRadius);

    Widget card = Card(
      color: backgroundColor,
      surfaceTintColor: effectiveSurfaceTint,
      shadowColor: effectiveShadowColor,
      elevation: effectiveElevation.level.toDouble(),
      shape: RoundedRectangleBorder(
        borderRadius: (effectiveShape as RoundedRectangleBorder).borderRadius,
        side: effectiveBorder,
      ),
      margin: margin ?? EdgeInsets.all(spacing.md),
      clipBehavior: clipBehavior,
      child: Padding(
        padding: padding ?? EdgeInsets.all(spacing.lg),
        child: child,
      ),
    );

    // Add inkwell for tap handling
    if (onTap != null || onLongPress != null) {
      card = InkWell(
        onTap: onTap,
        onLongPress: onLongPress,
        borderRadius:
            ((effectiveShape as RoundedRectangleBorder?)?.borderRadius
                as BorderRadius?) ??
            BorderRadius.zero,
        child: card,
      );
    }

    // Add semantics
    if (semanticLabel != null) {
      card = Semantics(label: semanticLabel, container: true, child: card);
    }

    return card;
  }

  Color _resolveBackgroundColor(
    CardVariant variant,
    Color? override,
    ColorScheme colors,
  ) {
    if (override != null) return override;
    return switch (variant) {
      CardVariant.elevated => colors.surface,
      CardVariant.filled => colors.surfaceContainerHighest,
      CardVariant.outlined => colors.surface,
    };
  }

  BorderSide _resolveBorder(
    CardVariant variant,
    BorderSide? override,
    ColorScheme colors,
  ) {
    if (override != null) return override;
    return switch (variant) {
      CardVariant.elevated => BorderSide.none,
      CardVariant.filled => BorderSide.none,
      CardVariant.outlined => BorderSide(color: colors.outlineVariant),
    };
  }

  ElevationLevel _resolveElevation(
    CardElevation elevation,
    ElevationTokens elevationTokens,
    BuildContext context,
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

/// Card header sub-component
class DSCardHeader extends StatelessWidget {
  const DSCardHeader({
    super.key,
    this.title,
    this.subtitle,
    this.leading,
    this.trailing,
    this.titleVariant = TextVariant.titleMedium,
    this.subtitleVariant = TextVariant.bodyMedium,
    this.spacing = 4.0,
  });

  final String? title;
  final String? subtitle;
  final Widget? leading;
  final Widget? trailing;
  final TextVariant titleVariant;
  final TextVariant subtitleVariant;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    final DesignTokens? tokens = Theme.of(context).extension<DesignTokens>();
    final SpacingScale spacingScale =
        tokens?.spacing.scale ?? SpacingScale.defaultScale;

    final List<Widget> children = <Widget>[];

    if (leading != null) {
      children.add(leading!);
      children.add(SizedBox(width: spacingScale.md));
    }

    if (title != null || subtitle != null) {
      children.add(
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              if (title != null) DSText(title!, variant: titleVariant),
              if (subtitle != null) ...<Widget>[
                SizedBox(height: spacing),
                DSText(
                  subtitle!,
                  variant: subtitleVariant,
                  colorRole: TextColorRole.secondary,
                ),
              ],
            ],
          ),
        ),
      );
    }

    if (trailing != null) {
      children.add(SizedBox(width: spacingScale.md));
      children.add(trailing!);
    }

    return Row(children: children);
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('title', title));
    properties.add(StringProperty('subtitle', subtitle));
    properties.add(EnumProperty<TextVariant>('titleVariant', titleVariant));
    properties.add(
      EnumProperty<TextVariant>('subtitleVariant', subtitleVariant),
    );
    properties.add(DoubleProperty('spacing', spacing));
  }
}

/// Card action area
class DSCardActions extends StatelessWidget {
  const DSCardActions({
    required this.actions,
    super.key,
    this.alignment = MainAxisAlignment.end,
    this.spacing = 8.0,
    this.overflowDirection = VerticalDirection.down,
  });

  final List<Widget> actions;
  final MainAxisAlignment alignment;
  final double spacing;
  final VerticalDirection overflowDirection;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: alignment,
      mainAxisSize: MainAxisSize.min,
      children: actions
          .expand((Widget widget) => <Widget>[widget, SizedBox(width: spacing)])
          .take(actions.length * 2 - 1)
          .toList(),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(EnumProperty<MainAxisAlignment>('alignment', alignment));
    properties.add(DoubleProperty('spacing', spacing));
    properties.add(
      EnumProperty<VerticalDirection>('overflowDirection', overflowDirection),
    );
  }
}

/// Card media (image) component
class DSCardMedia extends StatelessWidget {
  const DSCardMedia({
    required this.image,
    super.key,
    this.height,
    this.width,
    this.fit = BoxFit.cover,
    this.alignment = Alignment.center,
    this.borderRadius,
    this.placeholder,
    this.errorWidget,
  });

  final ImageProvider image;
  final double? height;
  final double? width;
  final BoxFit fit;
  final Alignment alignment;
  final BorderRadius? borderRadius;
  final Widget? placeholder;
  final Widget? errorWidget;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.zero,
      child: Image(
        image: image,
        height: height,
        width: width,
        fit: fit,
        alignment: alignment,
        frameBuilder:
            (
              BuildContext context,
              Widget child,
              int? frame,
              bool wasSynchronouslyLoaded,
            ) {
              if (wasSynchronouslyLoaded || frame != null) return child;
              return placeholder ??
                  Container(
                    height: height,
                    width: width,
                    color: Theme.of(
                      context,
                    ).colorScheme.surfaceContainerHighest,
                    child: const Center(child: CircularProgressIndicator()),
                  );
            },
        errorBuilder:
            (BuildContext context, Object error, StackTrace? stackTrace) =>
                errorWidget ??
                Container(
                  height: height,
                  width: width,
                  color: Theme.of(context).colorScheme.surfaceContainerHighest,
                  child: Icon(
                    Icons.broken_image,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<ImageProvider<Object>>('image', image));
    properties.add(DoubleProperty('height', height));
    properties.add(DoubleProperty('width', width));
    properties.add(EnumProperty<BoxFit>('fit', fit));
    properties.add(DiagnosticsProperty<Alignment>('alignment', alignment));
    properties.add(
      DiagnosticsProperty<BorderRadius?>('borderRadius', borderRadius),
    );
  }
}
