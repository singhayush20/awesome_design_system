import 'package:awesome_design_system_atoms/atoms.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Low-level presentation engine for the design-system snackbar.
class DSBaseSnackbar extends StatelessWidget {
  const DSBaseSnackbar({
    required this.content,
    required this.backgroundColor,
    required this.duration,
    super.key,
    this.action,
  });

  final String content;
  final SnackBarAction? action;
  final Color backgroundColor;
  final Duration duration;

  SnackBar toSnackBar() => SnackBar(
    content: DSText(content, colorRole: TextColorRole.inverse),
    action: action,
    backgroundColor: backgroundColor,
    duration: duration,
    behavior: SnackBarBehavior.floating,
  );

  @override
  Widget build(BuildContext context) => toSnackBar();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('content', content));
    properties.add(DiagnosticsProperty<SnackBarAction?>('action', action));
    properties.add(ColorProperty('backgroundColor', backgroundColor));
    properties.add(DiagnosticsProperty<Duration>('duration', duration));
  }
}
