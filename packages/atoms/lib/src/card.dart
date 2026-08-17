// Card atom with elevation variants

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
    super.key,
    required this.child,
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
    final tokens = Theme.of(context).extension<DesignTokens>();
    final radius = tokens?.radius.scale ?? RadiusScale.defaultScale;
    final spacing = tokens?.spacing.scale ?? SpacingScale.defaultScale;
    final colors = Theme.of(context).colorScheme;
    final elevationTokens = tokens?.elevation ?? ElevationTokens.defaultTokens();

    // Resolve colors based on variant
    final backgroundColor = _resolveBackgroundColor(variant, color, colors);
    final effectiveBorder = _resolveBorder(variant, border, colors);
    final effectiveShadowColor = shadowColor ?? colors.shadow;
    final effectiveSurfaceTint = surfaceTintColor ?? colors.surfaceTint;
    final effectiveElevation = _resolveElevation(elevation, elevationTokens, context);
    final effectiveShape = shape ?? RoundedRectangleBorder(borderRadius: radius.lgRadius);

    Widget card = Card(
      color: backgroundColor,
      surfaceTintColor: effectiveSurfaceTint,
      shadowColor: effectiveShadowColor,
      elevation: effectiveElevation.level.toDouble(),
      shape: effectiveBorder != null
          ? RoundedRectangleBorder(
              borderRadius: (effectiveShape as RoundedRectangleBorder).borderRadius ?? BorderRadius.zero,
              side: effectiveBorder,
            )
          : effectiveShape,
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
        borderRadius: ((effectiveShape as RoundedRectangleBorder?)?.borderRadius as BorderRadius?) ?? BorderRadius.zero,
        child: card,
      );
    }

    // Add semantics
    if (semanticLabel != null) {
      card = Semantics(
        label: semanticLabel,
        container: true,
        child: card,
      );
    }

    return card;
  }

  Color _resolveBackgroundColor(CardVariant variant, Color? override, ColorScheme colors) {
    if (override != null) return override;
    return switch (variant) {
      CardVariant.elevated => colors.surface,
      CardVariant.filled => colors.surfaceContainerHighest,
      CardVariant.outlined => colors.surface,
    };
  }

  BorderSide _resolveBorder(CardVariant variant, BorderSide? override, ColorScheme colors) {
    if (override != null) return override;
    return switch (variant) {
      CardVariant.elevated => BorderSide.none,
      CardVariant.filled => BorderSide.none,
      CardVariant.outlined => BorderSide(color: colors.outlineVariant, width: 1),
    };
  }

  ElevationLevel _resolveElevation(
    CardElevation elevation,
    ElevationTokens elevationTokens,
    BuildContext context,
  ) {
    final level = switch (elevation) {
      CardElevation.none => 0,
      CardElevation.level1 => 1,
      CardElevation.level2 => 2,
      CardElevation.level3 => 3,
    };
    return elevationTokens.getLevel(level);
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
    final tokens = Theme.of(context).extension<DesignTokens>();
    final spacingScale = tokens?.spacing.scale ?? SpacingScale.defaultScale;

    final children = <Widget>[];

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
            children: [
              if (title != null)
                DSText(title!, variant: titleVariant, colorRole: TextColorRole.primary),
              if (subtitle != null) ...[
                SizedBox(height: spacing),
                DSText(subtitle!, variant: subtitleVariant, colorRole: TextColorRole.secondary),
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

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }
}

/// Card action area
class DSCardActions extends StatelessWidget {
  const DSCardActions({
    super.key,
    required this.actions,
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
    final tokens = Theme.of(context).extension<DesignTokens>();
    final scale = tokens?.spacing.scale ?? SpacingScale.defaultScale;

    return Row(
      mainAxisAlignment: alignment,
      mainAxisSize: MainAxisSize.min,
      children: actions
          .expand((widget) => [widget, SizedBox(width: spacing)])
          .take(actions.length * 2 - 1)
          .toList(),
    );
  }
}

/// Card media (image) component
class DSCardMedia extends StatelessWidget {
  const DSCardMedia({
    super.key,
    required this.image,
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
    final tokens = Theme.of(context).extension<DesignTokens>();
    final radius = tokens?.radius.scale ?? RadiusScale.defaultScale;

    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.zero,
      child: Image(
        image: image,
        height: height,
        width: width,
        fit: fit,
        alignment: alignment,
        frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
          if (wasSynchronouslyLoaded || frame != null) return child;
          return placeholder ??
              Container(
                height: height,
                width: width,
                color: Theme.of(context).colorScheme.surfaceContainerHighest,
                child: const Center(child: CircularProgressIndicator()),
              );
        },
        errorBuilder: (context, error, stackTrace) => errorWidget ??
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
}