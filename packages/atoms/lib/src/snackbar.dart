// Snackbar atom with M3 conventions and auto-dismiss
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// A snackbar following M3 conventions with auto-dismiss
class DSnackbar extends StatelessWidget {
  const DSnackbar({
    required this.content, super.key,
    this.action,
    this.duration,
    this.backgroundColor,
    this.actionColor,
  });

  /// Snackbar content text
  final String content;

  /// Optional action button
  final Widget? action;

  /// Duration in milliseconds before auto-dismiss
  final Duration? duration;

  /// Background color override
  final Color? backgroundColor;

  /// Action text color override
  final Color? actionColor;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;

    return SnackBar(
      content: Row(
        children: <Widget>[
          Expanded(child: Text(content)),
          if (action != null) ...<Widget>[
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                foregroundColor: actionColor ?? colors.onSurface,
              ),
              child: action!,
            ),
          ],
        ],
      ),
      backgroundColor: backgroundColor ?? colors.surface,
      duration: duration ?? const Duration(milliseconds: 2000),
      behavior: SnackBarBehavior.floating,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('content', content));
    properties.add(DiagnosticsProperty<Duration?>('duration', duration));
    properties.add(ColorProperty('backgroundColor', backgroundColor));
    properties.add(ColorProperty('actionColor', actionColor));
  }
}
