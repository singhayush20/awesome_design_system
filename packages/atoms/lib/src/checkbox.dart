// Checkbox atom with M3 conventions
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:awesome_design_system_tokens/tokens.dart';

/// A list tile with a leading [DSCheckbox].
///
/// The `groupValue` / `groupId` pair mirrors the pattern used in
/// `DSRadioListTile` so callers can manage a heterogeneous selection model
/// consistently across atom types.

class DSCheckboxListTile extends StatelessWidget {
  const DSCheckboxListTile({
    required this.title,
    required this.groupValue,
    required this.groupId,
    required this.onChanged,
    super.key,
    this.subtitle,
    this.value,
    this.secondaryIcon,
    this.thisEnabled = true,
  });

  final String title;
  final Object? groupValue;
  final String groupId;
  final ValueChanged<bool> onChanged;
  final String? subtitle;
  final Object? value;
  final IconData? secondaryIcon;
  final bool thisEnabled;

  @override
  Widget build(BuildContext context) {
    final DsColors colors = DsColors.of(context);
    final bool isSelected = groupValue is bool && groupValue == true;

    return ListTile(
      enabled: thisEnabled,
      title: Text(
        title,
        style: TextStyle(color: colors.onSurface),
      ),
      subtitle: subtitle != null
          ? Text(
              subtitle!,
              style: TextStyle(color: colors.onSurfaceVariant),
            )
          : null,
      leading: DSCheckbox(
        value: value ?? false,
        groupValue: groupValue,
        groupId: groupId,
        onChanged: onChanged,
        thisEnabled: thisEnabled,
      ),
      trailing: secondaryIcon != null
          ? Icon(secondaryIcon, color: colors.onSurfaceVariant)
          : null,
      selected: isSelected,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('title', title));
    properties.add(StringProperty('subtitle', subtitle));
    properties.add(DiagnosticsProperty<Object?>('value', value));
    properties.add(DiagnosticsProperty<Object?>('groupValue', groupValue));
    properties.add(StringProperty('groupId', groupId));
    properties.add(ObjectFlagProperty<ValueChanged<bool>>.has('onChanged', onChanged));
    properties.add(DiagnosticsProperty<IconData?>('secondaryIcon', secondaryIcon));
    properties.add(DiagnosticsProperty<bool>('thisEnabled', thisEnabled));
  }
}

/// A standalone checkbox following M3 conventions.
///
/// [value] is the item's own identity; [groupValue] is the currently selected
/// identity in the group. The checkbox appears checked when they are equal
/// (or when [groupValue] is the boolean `true` for simple boolean use-cases).
class DSCheckbox extends StatelessWidget {
  const DSCheckbox({
    required this.value,
    required this.groupValue,
    required this.groupId,
    required this.onChanged,
    super.key,
    this.thisEnabled = true,
  });

  final Object value;
  final Object? groupValue;
  final String groupId;
  final ValueChanged<bool> onChanged;
  final bool thisEnabled;

  @override
  Widget build(BuildContext context) {
    final DsColors colors = DsColors.of(context);
    // Support both boolean and identity-based group values.
    final bool isSelected = groupValue is bool
        ? groupValue == true
        : groupValue == value;

    return Checkbox(
      value: isSelected,
      onChanged: thisEnabled ? onChanged as ValueChanged<bool?> : null,
      fillColor: WidgetStateProperty.resolveWith<Color>(
        (Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled)) {
            // M3 spec: disabled checkbox fill uses on-surface at 12% opacity.
            // surfaceContainerHighest is the nearest available semantic token.
            return colors.surfaceContainerHighest;
          }
          return isSelected ? colors.primary : colors.surface;
        },
      ),
      checkColor: isSelected ? colors.onPrimary : null,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<Object>('value', value));
    properties.add(DiagnosticsProperty<Object?>('groupValue', groupValue));
    properties.add(StringProperty('groupId', groupId));
    properties.add(ObjectFlagProperty<ValueChanged<bool>>.has('onChanged', onChanged));
    properties.add(DiagnosticsProperty<bool>('thisEnabled', thisEnabled));
  }
}
