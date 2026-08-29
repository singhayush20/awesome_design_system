import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:awesome_design_system_tokens/tokens.dart';

/// A standalone checkbox atom following Material 3 conventions.
class DSCheckbox extends StatelessWidget {
  const DSCheckbox({
    required this.value,
    required this.groupValue,
    required this.groupId,
    required this.onChanged,
    super.key,
    this.thisEnabled = true,
    this.enabled,
    this.semanticLabel,
  });

  final Object value;
  final Object? groupValue;
  final String groupId;
  final ValueChanged<bool> onChanged;
  final bool thisEnabled;
  final bool? enabled;
  final String? semanticLabel;

  bool get _effectiveEnabled => enabled ?? thisEnabled;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;
    final bool isSelected =
        groupValue is bool ? groupValue == true : groupValue == value;

    Widget checkbox = Checkbox(
      value: isSelected,
      onChanged: _effectiveEnabled
          ? (bool? val) {
              if (val != null) {
                onChanged(val);
              }
            }
          : null,
      fillColor: WidgetStateProperty.resolveWith<Color>(
        (Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled)) {
            return colors.surfaceContainerHighest;
          }
          return isSelected ? colors.primary : colors.surface;
        },
      ),
      checkColor: isSelected ? colors.onPrimary : null,
    );

    if (semanticLabel != null) {
      checkbox = Semantics(
        label: semanticLabel,
        checked: isSelected,
        enabled: _effectiveEnabled,
        child: checkbox,
      );
    }

    return checkbox;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<Object>('value', value));
    properties.add(DiagnosticsProperty<Object?>('groupValue', groupValue));
    properties.add(StringProperty('groupId', groupId));
    properties.add(
      ObjectFlagProperty<ValueChanged<bool>>.has('onChanged', onChanged),
    );
    properties.add(DiagnosticsProperty<bool>('thisEnabled', thisEnabled));
    properties.add(DiagnosticsProperty<bool?>('enabled', enabled));
    properties.add(StringProperty('semanticLabel', semanticLabel));
  }
}
