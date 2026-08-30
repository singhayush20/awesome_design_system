import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'base_dialog.dart';

/// Dialog facade. Use [show] to present it in Flutter's dialog route.
class DSDialog extends StatelessWidget {
  const DSDialog({required this.title, super.key, this.content, this.actions});

  final String title;
  final Widget? content;
  final List<Widget>? actions;

  /// Presents a Material dialog using Flutter's [showDialog].
  static Future<T?> show<T>({
    required BuildContext context,
    required String title,
    Widget? content,
    List<Widget>? actions,
    bool barrierDismissible = true,
    bool useRootNavigator = true,
    bool useSafeArea = true,
    VoidCallback? onDismiss,
  }) {
    final Future<T?> result = showDialog<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      useRootNavigator: useRootNavigator,
      useSafeArea: useSafeArea,
      builder: (BuildContext context) =>
          DSDialog(title: title, content: content, actions: actions),
    );
    return onDismiss == null ? result : result.whenComplete(onDismiss);
  }

  @override
  Widget build(BuildContext context) =>
      DSBaseDialog(title: title, content: content, actions: actions);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('title', title));
    properties.add(IterableProperty<Widget>('actions', actions));
  }
}
