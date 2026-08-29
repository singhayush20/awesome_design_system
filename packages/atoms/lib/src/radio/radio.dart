import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// A single radio button atom following Material 3 conventions.
class DSRadio<T> extends StatelessWidget {
  const DSRadio({
    required this.value,
    required this.groupId,
    super.key,
    this.thisEnabled = true,
    this.enabled,
    this.semanticLabel,
  });

  final T value;
  final String groupId;
  final bool thisEnabled;
  final bool? enabled;
  final String? semanticLabel;

  bool get _effectiveEnabled => enabled ?? thisEnabled;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;

    Widget radio = Radio<T>(
      value: value,
      fillColor: WidgetStateProperty.resolveWith<Color>(
        (Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled)) {
            return colors.surfaceContainerHighest;
          }
          if (states.contains(WidgetState.selected)) {
            return colors.primary;
          }
          return colors.outline;
        },
      ),
    );

    if (semanticLabel != null) {
      radio = Semantics(
        label: semanticLabel,
        enabled: _effectiveEnabled,
        child: radio,
      );
    }

    return radio;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<T>('value', value));
    properties.add(StringProperty('groupId', groupId));
    properties.add(DiagnosticsProperty<bool>('thisEnabled', thisEnabled));
    properties.add(DiagnosticsProperty<bool?>('enabled', enabled));
    properties.add(StringProperty('semanticLabel', semanticLabel));
  }
}
