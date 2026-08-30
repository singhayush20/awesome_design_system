import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'base_snackbar.dart';

/// Snackbar facade. Use [show] to present it through a [ScaffoldMessenger].
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

  final String content;
  final SnackBarAction? action;
  final String? actionLabel;
  final VoidCallback? onActionPressed;
  final Duration? duration;
  final Color? backgroundColor;
  final Color? actionColor;

  /// Shows a snackbar through Flutter's [ScaffoldMessengerState].
  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason> show({
    required BuildContext context,
    required String content,
    SnackBarAction? action,
    String? actionLabel,
    VoidCallback? onActionPressed,
    Duration? duration,
    Color? backgroundColor,
    Color? actionColor,
  }) => ScaffoldMessenger.of(context).showSnackBar(
    DSSnackbar(
      content: content,
      action: action,
      actionLabel: actionLabel,
      onActionPressed: onActionPressed,
      duration: duration,
      backgroundColor: backgroundColor,
      actionColor: actionColor,
    ).toSnackBar(context),
  );

  /// Resolves this configuration into Flutter's [SnackBar].
  SnackBar toSnackBar(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;
    return DSBaseSnackbar(
      content: content,
      action:
          action ??
          (actionLabel == null
              ? null
              : SnackBarAction(
                  label: actionLabel!,
                  onPressed: onActionPressed ?? () {},
                  textColor: actionColor ?? colors.inversePrimary,
                )),
      backgroundColor: backgroundColor ?? colors.inverseSurface,
      duration: duration ?? const Duration(milliseconds: 4000),
    ).toSnackBar();
  }

  @override
  Widget build(BuildContext context) => toSnackBar(context);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('content', content));
    properties.add(DiagnosticsProperty<SnackBarAction?>('action', action));
    properties.add(StringProperty('actionLabel', actionLabel));
    properties.add(
      ObjectFlagProperty<VoidCallback?>.has('onActionPressed', onActionPressed),
    );
    properties.add(DiagnosticsProperty<Duration?>('duration', duration));
    properties.add(ColorProperty('backgroundColor', backgroundColor));
    properties.add(ColorProperty('actionColor', actionColor));
  }
}

/// Backwards-compatibility alias for [DSSnackbar].
typedef DSnackbar = DSSnackbar;
