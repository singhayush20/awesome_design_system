// Dialog atom with M3 conventions
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// A dialog following M3 conventions
class DSDialog extends StatelessWidget {
  const DSDialog({
    required this.title,
    super.key,
    this.content,
    this.actions,
    this.onDismiss,
  });

  /// Dialog title text
  final String title;

  /// Optional dialog content
  final Widget? content;

  /// Optional action buttons
  final List<Widget>? actions;

  /// Called when dialog is dismissed
  final VoidCallback? onDismiss;

  @override
  Widget build(BuildContext context) {
    final Color onSurface = Theme.of(context).colorScheme.onSurface;

    return AlertDialog(
      title: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: onSurface,
        ),
      ),
      content: content,
      actions: actions,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('title', title));
    properties.add(
      ObjectFlagProperty<VoidCallback?>.has('onDismiss', onDismiss),
    );
  }
}
