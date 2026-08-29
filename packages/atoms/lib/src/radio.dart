// Radio atom with M3 conventions
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:awesome_design_system_tokens/tokens.dart';

/// Radio status — reserved for future tri-state use.
enum RadioStatus { unchecked, checked, indeterminate }

/// A radio list tile following M3 conventions.
///
/// Renders a custom animated toggle alongside title and optional subtitle.
/// State (which item is selected) is managed externally; pass [groupValue]
/// equal to [value] to mark this tile as selected.
///
/// Wrap a group of [DSRadioListTile]s in a [RadioGroup] (or manage state in
/// the parent) and supply matching [value] / [groupValue] pairs.
class DSRadioListTile extends StatelessWidget {
  const DSRadioListTile({
    required this.title,
    required this.groupId,
    required this.groupValue,
    super.key,
    this.subtitle,
    this.value,
    this.onChanged,
    this.secondaryIcon,
    this.thisEnabled = true,
  });

  final String title;
  final String? subtitle;
  final Object? value;
  final Object? groupValue;
  final String groupId;
  final ValueChanged<Object?>? onChanged;
  final Widget? secondaryIcon;
  final bool thisEnabled;

  @override
  Widget build(BuildContext context) {
    final DsColors colors = DsColors.of(context);
    final bool isSelected = groupValue == value;

    // Active color: primary when selected, outline when unselected.
    final Color toggleBorderColor =
        isSelected ? colors.primary : colors.outline;

    // Fill: primary when selected, transparent when not.
    final Color toggleFillColor =
        isSelected ? colors.primary : Colors.transparent;

    const double toggleSize = 20.0;

    return InkWell(
      onTap: thisEnabled && onChanged != null
          ? () => onChanged!(value)
          : null,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 16.0,
        ),
        child: Row(
          children: <Widget>[
            AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              width: toggleSize,
              height: toggleSize,
              decoration: BoxDecoration(
                color: toggleFillColor,
                border: Border.all(
                  color: toggleBorderColor,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(toggleSize / 2),
              ),
              child: isSelected
                  ? Icon(
                      Icons.check,
                      size: 12,
                      color: colors.onPrimary,
                    )
                  : const SizedBox.shrink(),
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: colors.onSurface,
                    ),
                  ),
                  if (subtitle != null) ...<Widget>[
                    const SizedBox(height: 4.0),
                    Text(
                      subtitle!,
                      style: TextStyle(
                        color: colors.onSurfaceVariant,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            if (secondaryIcon != null) secondaryIcon!,
          ],
        ),
      ),
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
    properties.add(ObjectFlagProperty<ValueChanged<Object?>?>.has('onChanged', onChanged));
    properties.add(DiagnosticsProperty<bool>('thisEnabled', thisEnabled));
  }
}

/// A single radio button following M3 conventions.
///
/// **Must** be a descendant of `RadioGroup` (Flutter ≥ 3.32). The group
/// manages `groupValue` and the selection callback centrally, so individual
/// buttons only declare their own [value].
///
/// Example:
/// ```dart
/// RadioGroup<String>(
///   groupValue: _selected,
///   onChanged: (v) => setState(() => _selected = v),
///   child: Column(
///     children: [
///       DSRadio<String>(value: 'a', groupId: 'my_group'),
///       DSRadio<String>(value: 'b', groupId: 'my_group'),
///     ],
///   ),
/// )
/// ```
class DSRadio<T> extends StatelessWidget {
  const DSRadio({
    required this.value,
    required this.groupId,
    super.key,
    this.thisEnabled = true,
  });

  final T value;
  final String groupId;
  final bool thisEnabled;

  @override
  Widget build(BuildContext context) {
    final DsColors colors = DsColors.of(context);

    return Radio<T>(
      value: value,
      fillColor: WidgetStateProperty.resolveWith<Color>(
        (Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled)) {
            // M3 spec: disabled radio uses on-surface at 38% opacity.
            // surfaceContainerHighest is the nearest available semantic token.
            return colors.surfaceContainerHighest;
          }
          if (states.contains(WidgetState.selected)) {
            return colors.primary;
          }
          return colors.outline;
        },
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<T>('value', value));
    properties.add(StringProperty('groupId', groupId));
    properties.add(DiagnosticsProperty<bool>('thisEnabled', thisEnabled));
  }
}
