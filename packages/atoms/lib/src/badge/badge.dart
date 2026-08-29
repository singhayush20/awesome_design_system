import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:awesome_design_system_tokens/tokens.dart';
import 'badge_enums.dart';
import 'badge_style.dart';
import 'badge_theme.dart';

/// A versatile badge component with variants, sizes, and interaction support.
class DSBadge extends StatelessWidget {
  const DSBadge({
    required this.label,
    super.key,
    this.variant = BadgeVariant.filled,
    this.size = BadgeSize.medium,
    this.leadingIcon,
    this.trailingIcon,
    this.onTap,
    this.onDeleted,
    this.isDisabled = false,
    this.color,
    this.textColor,
    this.borderRadius,
    this.padding,
    this.semanticLabel,
    this.style,
  });

  final String label;
  final BadgeVariant variant;
  final BadgeSize size;
  final Widget? leadingIcon;
  final Widget? trailingIcon;
  final VoidCallback? onTap;
  final VoidCallback? onDeleted;
  final bool isDisabled;
  final Color? color;
  final Color? textColor;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? padding;
  final String? semanticLabel;
  final DSBadgeStyle? style;

  @override
  Widget build(BuildContext context) {
    final DSBadgeThemeData? theme =
        Theme.of(context).extension<DSBadgeThemeData>();
    final DesignTokens? tokens = Theme.of(context).extension<DesignTokens>();
    final SpacingScale spacing =
        tokens?.spacing.scale ?? SpacingScale.defaultScale;
    final SizingScale sizing = tokens?.sizing.scale ?? SizingScale.defaultScale;
    final RadiusScale radius = tokens?.radius.scale ?? RadiusScale.defaultScale;
    final TypographyScale typography =
        tokens?.typography.scale ?? TypographyScale.defaultScale();
    final ColorScheme colors = Theme.of(context).colorScheme;

    final VoidCallback? effectiveOnTap = isDisabled ? null : onTap;
    final VoidCallback? effectiveOnDeleted = isDisabled ? null : onDeleted;

    final DSBadgeThemeData effectiveTheme = theme ??
        (tokens != null
            ? DSBadgeThemeData.fromTokens(tokens, colors)
            : DSBadgeThemeData.fromTokens(
                DesignTokens.light(brandPrimary: colors.primary),
                colors,
              ));

    final DSBadgeStyle baseStyle = switch (variant) {
      BadgeVariant.filled => effectiveTheme.filledStyle,
      BadgeVariant.outlined => effectiveTheme.outlinedStyle,
      BadgeVariant.tonal => effectiveTheme.tonalStyle,
      BadgeVariant.light => effectiveTheme.lightStyle,
    };

    final BorderRadius effectiveBorderRadius = borderRadius ??
        switch (size) {
          BadgeSize.small => radius.smRadius,
          BadgeSize.medium => radius.mdRadius,
          BadgeSize.large => radius.fullRadius,
        };

    final EdgeInsetsGeometry effectivePadding = padding ??
        switch (size) {
          BadgeSize.small => EdgeInsets.symmetric(
              horizontal: spacing.xs,
              vertical: spacing.xxs,
            ),
          BadgeSize.medium => EdgeInsets.symmetric(
              horizontal: spacing.sm,
              vertical: spacing.xxs,
            ),
          BadgeSize.large => EdgeInsets.symmetric(
              horizontal: spacing.md,
              vertical: spacing.xs,
            ),
        };

    final double iconSize = switch (size) {
      BadgeSize.small => sizing.iconXxs,
      BadgeSize.medium => sizing.iconXs,
      BadgeSize.large => sizing.iconSm,
    };

    final double gap = switch (size) {
      BadgeSize.small => spacing.xxxs,
      BadgeSize.medium => spacing.xxs,
      BadgeSize.large => spacing.xs,
    };

    final Color backgroundColor = color ??
        (variant == BadgeVariant.outlined
            ? Colors.transparent
            : baseStyle.backgroundColor ?? colors.primaryContainer);

    final Color foregroundColor = textColor ??
        (variant == BadgeVariant.outlined
            ? colors.primary
            : baseStyle.foregroundColor ?? colors.onPrimaryContainer);

    final Color borderColor = variant == BadgeVariant.outlined
        ? (color ?? colors.outline)
        : Colors.transparent;

    final TextStyle textStyle = switch (size) {
      BadgeSize.small => typography.labelSmall.copyWith(color: foregroundColor),
      BadgeSize.medium => typography.labelMedium.copyWith(color: foregroundColor),
      BadgeSize.large => typography.labelLarge.copyWith(color: foregroundColor),
    };

    final DSBadgeStyle resolvedStyle = baseStyle
        .copyWith(
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          borderColor: borderColor,
          borderWidth: variant == BadgeVariant.outlined ? 1 : 0,
          borderRadius: effectiveBorderRadius,
          padding: effectivePadding,
          textStyle: textStyle,
          iconSize: iconSize,
          gap: gap,
        )
        .merge(style);

    final List<Widget> children = <Widget>[];

    if (leadingIcon != null) {
      children.add(
        SizedBox(
          width: resolvedStyle.iconSize,
          height: resolvedStyle.iconSize,
          child: leadingIcon!,
        ),
      );
      children.add(SizedBox(width: resolvedStyle.gap));
    }

    children.add(Text(label, style: resolvedStyle.textStyle));

    if (effectiveOnDeleted != null || onDeleted != null) {
      children.add(SizedBox(width: resolvedStyle.gap));
      children.add(
        GestureDetector(
          onTap: effectiveOnDeleted,
          child: SizedBox(
            width: resolvedStyle.iconSize,
            height: resolvedStyle.iconSize,
            child: Icon(
              Icons.close,
              size: resolvedStyle.iconSize,
              color: resolvedStyle.foregroundColor?.withValues(alpha: 0.7),
            ),
          ),
        ),
      );
    } else if (trailingIcon != null) {
      children.add(SizedBox(width: resolvedStyle.gap));
      children.add(
        SizedBox(
          width: resolvedStyle.iconSize,
          height: resolvedStyle.iconSize,
          child: trailingIcon!,
        ),
      );
    }

    Widget badge = Container(
      padding: resolvedStyle.padding,
      decoration: BoxDecoration(
        color: resolvedStyle.backgroundColor,
        borderRadius: resolvedStyle.borderRadius,
        border: Border.all(
          color: resolvedStyle.borderColor ?? Colors.transparent,
          width: resolvedStyle.borderWidth ?? 0,
        ),
      ),
      child: Row(mainAxisSize: MainAxisSize.min, children: children),
    );

    if (effectiveOnTap != null) {
      badge = InkWell(
        onTap: effectiveOnTap,
        borderRadius: resolvedStyle.borderRadius,
        child: badge,
      );
    }

    if (semanticLabel != null) {
      badge = Semantics(
        label: semanticLabel,
        button: effectiveOnTap != null,
        enabled: !isDisabled,
        child: badge,
      );
    }

    if (isDisabled) {
      badge = Opacity(opacity: 0.5, child: badge);
    }

    return badge;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('label', label));
    properties.add(EnumProperty<BadgeVariant>('variant', variant));
    properties.add(EnumProperty<BadgeSize>('size', size));
    properties.add(ObjectFlagProperty<VoidCallback?>.has('onTap', onTap));
    properties.add(
      ObjectFlagProperty<VoidCallback?>.has('onDeleted', onDeleted),
    );
    properties.add(DiagnosticsProperty<bool>('isDisabled', isDisabled));
    properties.add(ColorProperty('color', color));
    properties.add(ColorProperty('textColor', textColor));
    properties.add(
      DiagnosticsProperty<BorderRadius?>('borderRadius', borderRadius),
    );
    properties.add(
      DiagnosticsProperty<EdgeInsetsGeometry?>('padding', padding),
    );
    properties.add(StringProperty('semanticLabel', semanticLabel));
    properties.add(DiagnosticsProperty<DSBadgeStyle?>('style', style));
  }
}
