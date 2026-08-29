import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:awesome_design_system_tokens/tokens.dart';
import '../text/index.dart';
import 'checkbox.dart';

/// A list tile with a leading [DSCheckbox], using tokenized typography.
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
    this.enabled,
  });

  final String title;
  final Object? groupValue;
  final String groupId;
  final ValueChanged<bool> onChanged;
  final String? subtitle;
  final Object? value;
  final IconData? secondaryIcon;
  final bool thisEnabled;
  final bool? enabled;

  bool get _effectiveEnabled => enabled ?? thisEnabled;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;
    final bool isSelected = groupValue is bool && groupValue == true;

    return ListTile(
      enabled: _effectiveEnabled,
      title: DSText(
        title,
        variant: TextVariant.bodyLarge,
      ),
      subtitle: subtitle != null
          ? DSText(
              subtitle!,
              variant: TextVariant.bodyMedium,
              colorRole: TextColorRole.secondary,
            )
          : null,
      leading: DSCheckbox(
        value: value ?? false,
        groupValue: groupValue,
        groupId: groupId,
        onChanged: onChanged,
        thisEnabled: _effectiveEnabled,
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
    properties.add(
      ObjectFlagProperty<ValueChanged<bool>>.has('onChanged', onChanged),
    );
    properties.add(
      DiagnosticsProperty<IconData?>('secondaryIcon', secondaryIcon),
    );
    properties.add(DiagnosticsProperty<bool>('thisEnabled', thisEnabled));
    properties.add(DiagnosticsProperty<bool?>('enabled', enabled));
  }
}
