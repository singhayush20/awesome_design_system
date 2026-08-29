import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'badge_enums.dart';
import 'badge.dart';

/// Status badge variant with semantic colors and icons.
class DSStatusBadge extends StatelessWidget {
  const DSStatusBadge({
    required this.status,
    super.key,
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
    final ColorScheme colors = Theme.of(context).colorScheme;

    final _StatusConfig config = _getStatusConfig(status, colors);
    final String effectiveLabel = label ?? config.defaultLabel;
    final Widget? icon = showIcon ? config.icon : null;

    return DSBadge(
      label: effectiveLabel,
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

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(EnumProperty<BadgeStatus>('status', status));
    properties.add(EnumProperty<BadgeSize>('size', size));
    properties.add(DiagnosticsProperty<bool>('showIcon', showIcon));
    properties.add(StringProperty('label', label));
    properties.add(ObjectFlagProperty<VoidCallback?>.has('onTap', onTap));
    properties.add(StringProperty('semanticLabel', semanticLabel));
  }
}

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
