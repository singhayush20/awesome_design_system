// Badge atom with variants

import 'package:flutter/material.dart';
import 'package:awesome_design_system_tokens/tokens.dart';

/// Badge variants
enum BadgeVariant { filled, outlined, tonal, light }

/// Badge sizes
enum BadgeSize { small, medium, large }

/// A versatile badge/component label
class DSBadge extends StatelessWidget {
  const DSBadge({
    super.key,
    required this.label,
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

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<DesignTokens>();
    final spacing = tokens?.spacing.scale ?? SpacingScale.defaultScale;
    final sizing = tokens?.sizing.scale ?? SizingScale.defaultScale;
    final radius = tokens?.radius.scale ?? RadiusScale.defaultScale;
    final typography = tokens?.typography.scale ?? TypographyScale.defaultScale();
    final colors = Theme.of(context).colorScheme;

    final effectiveOnTap = isDisabled ? null : onTap;
    final effectiveOnDeleted = isDisabled ? null : onDeleted;

    final backgroundColor = _resolveBackgroundColor(variant, color, colors);
    final foregroundColor = textColor ?? _resolveForegroundColor(variant, backgroundColor, colors);
    final borderColor = _resolveBorderColor(variant, color, colors);
    final effectiveBorderRadius = borderRadius ?? _resolveBorderRadius(size, radius);
    final effectivePadding = padding ?? _resolvePadding(size, spacing);
    final textStyle = _resolveTextStyle(size, typography, foregroundColor);
    final iconSize = _resolveIconSize(size, sizing);
    final gap = _resolveGap(size, spacing);

    final children = <Widget>[];

    if (leadingIcon != null) {
      children.add(SizedBox(width: iconSize, height: iconSize, child: leadingIcon!));
      children.add(SizedBox(width: gap));
    }

    children.add(Text(label, style: textStyle));

    if (onDeleted != null) {
      children.add(SizedBox(width: gap));
      children.add(
        GestureDetector(
          onTap: effectiveOnDeleted,
          child: SizedBox(
            width: iconSize,
            height: iconSize,
            child: Icon(
              Icons.close,
              size: iconSize,
              color: foregroundColor.withValues(alpha: 0.7),
            ),
          ),
        ),
      );
    } else if (trailingIcon != null) {
      children.add(SizedBox(width: gap));
      children.add(SizedBox(width: iconSize, height: iconSize, child: trailingIcon!));
    }

    Widget badge = Container(
      padding: effectivePadding,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: effectiveBorderRadius,
        border: Border.all(color: borderColor, width: variant == BadgeVariant.outlined ? 1 : 0),
      ),
      child: Row(mainAxisSize: MainAxisSize.min, children: children),
    );

    if (effectiveOnTap != null) {
      badge = InkWell(
        onTap: effectiveOnTap,
        borderRadius: effectiveBorderRadius,
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

  Color _resolveBackgroundColor(BadgeVariant variant, Color? override, ColorScheme colors) {
    if (override != null) return override;
    return switch (variant) {
      BadgeVariant.filled => colors.primaryContainer,
      BadgeVariant.outlined => Colors.transparent,
      BadgeVariant.tonal => colors.secondaryContainer,
      BadgeVariant.light => colors.primaryContainer.withValues(alpha: 0.5),
    };
  }

  Color _resolveForegroundColor(BadgeVariant variant, Color backgroundColor, ColorScheme colors) {
    if (variant == BadgeVariant.outlined) return colors.primary;
    // Calculate contrast
    return ThemeData.estimateBrightnessForColor(backgroundColor) == Brightness.light
        ? colors.onPrimaryContainer
        : colors.onPrimaryContainer;
  }

  Color _resolveBorderColor(BadgeVariant variant, Color? override, ColorScheme colors) {
    if (override != null) return override;
    return switch (variant) {
      BadgeVariant.filled => Colors.transparent,
      BadgeVariant.outlined => colors.outline,
      BadgeVariant.tonal => Colors.transparent,
      BadgeVariant.light => Colors.transparent,
    };
  }

  BorderRadius _resolveBorderRadius(BadgeSize size, RadiusScale radius) {
    return switch (size) {
      BadgeSize.small => radius.smRadius,
      BadgeSize.medium => radius.mdRadius,
      BadgeSize.large => radius.fullRadius,
    };
  }

  EdgeInsetsGeometry _resolvePadding(BadgeSize size, SpacingScale spacing) {
    return switch (size) {
      BadgeSize.small => EdgeInsets.symmetric(horizontal: spacing.xs, vertical: spacing.xxs),
      BadgeSize.medium => EdgeInsets.symmetric(horizontal: spacing.sm, vertical: spacing.xxs),
      BadgeSize.large => EdgeInsets.symmetric(horizontal: spacing.md, vertical: spacing.xs),
    };
  }

  TextStyle _resolveTextStyle(BadgeSize size, TypographyScale typography, Color color) {
    return switch (size) {
      BadgeSize.small => typography.labelSmall.copyWith(color: color),
      BadgeSize.medium => typography.labelMedium.copyWith(color: color),
      BadgeSize.large => typography.labelLarge.copyWith(color: color),
    };
  }

  double _resolveIconSize(BadgeSize size, SizingScale sizing) {
    return switch (size) {
      BadgeSize.small => sizing.iconXxs,
      BadgeSize.medium => sizing.iconXs,
      BadgeSize.large => sizing.iconSm,
    };
  }

  double _resolveGap(BadgeSize size, SpacingScale spacing) {
    return switch (size) {
      BadgeSize.small => spacing.xxxs,
      BadgeSize.medium => spacing.xxs,
      BadgeSize.large => spacing.xs,
    };
  }
}

/// Status badge variant with semantic colors
class DSStatusBadge extends StatelessWidget {
  const DSStatusBadge({
    super.key,
    required this.status,
    this.size = BadgeSize.medium,
    this.showIcon = true,
    this.label,
    this.onTap,
    this.semanticLabel,
  });

  final BadgeStatus status;
  final BadgeSize size;
  final bool showIcon;
  final String? label;
  final VoidCallback? onTap;
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<DesignTokens>();
    final spacing = tokens?.spacing.scale ?? SpacingScale.defaultScale;
    final sizing = tokens?.sizing.scale ?? SizingScale.defaultScale;
    final colors = Theme.of(context).colorScheme;

    final config = _getStatusConfig(status, colors);
    final effectiveLabel = label ?? config.defaultLabel;
    final icon = showIcon ? config.icon : null;

    return DSBadge(
      label: effectiveLabel,
      variant: BadgeVariant.filled,
      size: size,
      leadingIcon: icon,
      color: config.backgroundColor,
      textColor: config.foregroundColor,
      onTap: onTap,
      semanticLabel: semanticLabel ?? 'Status: $effectiveLabel',
    );
  }

  _StatusConfig _getStatusConfig(BadgeStatus status, ColorScheme colors) {
    return switch (status) {
      BadgeStatus.success => _StatusConfig(
          backgroundColor: colors.tertiaryContainer,
          foregroundColor: colors.onTertiaryContainer,
          icon: const Icon(Icons.check_circle, size: 16),
          defaultLabel: 'Success',
        ),
      BadgeStatus.warning => _StatusConfig(
          backgroundColor: colors.errorContainer,
          foregroundColor: colors.onErrorContainer,
          icon: const Icon(Icons.warning, size: 16),
          defaultLabel: 'Warning',
        ),
      BadgeStatus.error => _StatusConfig(
          backgroundColor: colors.errorContainer,
          foregroundColor: colors.onErrorContainer,
          icon: const Icon(Icons.error, size: 16),
          defaultLabel: 'Error',
        ),
      BadgeStatus.info => _StatusConfig(
          backgroundColor: colors.primaryContainer,
          foregroundColor: colors.onPrimaryContainer,
          icon: const Icon(Icons.info, size: 16),
          defaultLabel: 'Info',
        ),
      BadgeStatus.pending => _StatusConfig(
          backgroundColor: colors.secondaryContainer,
          foregroundColor: colors.onSecondaryContainer,
          icon: const Icon(Icons.hourglass_empty, size: 16),
          defaultLabel: 'Pending',
        ),
      BadgeStatus.neutral => _StatusConfig(
          backgroundColor: colors.surfaceContainerHighest,
          foregroundColor: colors.onSurfaceVariant,
          icon: const Icon(Icons.remove, size: 16),
          defaultLabel: 'Neutral',
        ),
    };
  }
}

enum BadgeStatus { success, warning, error, info, pending, neutral }

class _StatusConfig {
  const _StatusConfig({
    required this.backgroundColor,
    required this.foregroundColor,
    required this.icon,
    required this.defaultLabel,
  });

  final Color backgroundColor;
  final Color foregroundColor;
  final Widget icon;
  final String defaultLabel;
}