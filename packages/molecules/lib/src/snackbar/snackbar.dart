import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:awesome_design_system_atoms/atoms.dart';

/// A snackbar following Material 3 conventions.
class DSSnackbar extends StatelessWidget {
  const DSSnackbar({
    required this.content,
    super.key,
    this.action,
    this.actionLabel,
    this.onActionPressed,
    this.duration,
    this.backgroundColor,
    this.actionColor,
  });

  /// Snackbar content text
  final String content;

  /// Optional action widget override
  final Widget? action;

  /// Optional action button label
  final String? actionLabel;

  /// Callback when action button is pressed
  final VoidCallback? onActionPressed;

  /// Duration before auto-dismiss
  final Duration? duration;

  /// Background color override
  final Color? backgroundColor;

  /// Action text color override
  final Color? actionColor;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;

    Widget? effectiveAction = action;
    if (effectiveAction == null && actionLabel != null) {
      effectiveAction = TextButton(
        onPressed: onActionPressed ?? () {},
        style: TextButton.styleFrom(
          foregroundColor: actionColor ?? colors.inversePrimary,
        ),
        child: DSText(actionLabel!),
      );
    }

    return SnackBar(
      content: Row(
        children: <Widget>[
          Expanded(
            child: DSText(
              content,
              colorRole: TextColorRole.inverse,
            ),
          ),
          if (effectiveAction != null) effectiveAction,
        ],
      ),
      backgroundColor: backgroundColor ?? colors.inverseSurface,
      duration: duration ?? const Duration(milliseconds: 4000),
      behavior: SnackBarBehavior.floating,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('content', content));
    properties.add(StringProperty('actionLabel', actionLabel));
    properties.add(
      ObjectFlagProperty<VoidCallback?>.has(
        'onActionPressed',
        onActionPressed,
      ),
    );
    properties.add(DiagnosticsProperty<Duration?>('duration', duration));
    properties.add(ColorProperty('backgroundColor', backgroundColor));
    properties.add(ColorProperty('actionColor', actionColor));
  }
}

/// Backwards-compatibility alias for [DSSnackbar].
typedef DSnackbar = DSSnackbar;
