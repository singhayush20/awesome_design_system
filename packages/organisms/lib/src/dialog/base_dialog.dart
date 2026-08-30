import 'package:awesome_design_system_atoms/atoms.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Low-level presentation engine for the design-system dialog.
class DSBaseDialog extends StatelessWidget {
  const DSBaseDialog({
    required this.title,
    super.key,
    this.content,
    this.actions,
  });

  final String title;
  final Widget? content;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) => AlertDialog(
    title: DSText(
      title,
      variant: TextVariant.titleLarge,
      fontWeight: FontWeight.w600,
    ),
    content: content,
    actions: actions,
  );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('title', title));
    properties.add(DiagnosticsProperty<Widget?>('content', content));
    properties.add(IterableProperty<Widget>('actions', actions));
  }
}
