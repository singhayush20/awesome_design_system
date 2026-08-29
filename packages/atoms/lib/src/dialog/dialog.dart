import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../text/index.dart';

/// A dialog following Material 3 conventions with tokenized typography and styling.
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
    return AlertDialog(
      title: DSText(
        title,
        variant: TextVariant.titleLarge,
        fontWeight: FontWeight.w600,
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
