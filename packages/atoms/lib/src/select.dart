// Select atom with M3 conventions
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:awesome_design_system_tokens/tokens.dart';

/// A select/dropdown following M3 conventions.
///
/// Wraps [DropdownButtonFormField] to gain theme-aware borders, focus
/// handling, and error states without reimplementing them manually.
class DSSelect<T> extends StatefulWidget {
  const DSSelect({
    required this.items,
    required this.onChanged,
    super.key,
    this.value,
    this.borderRadius,
    this.contentPadding,
    this.icon,
    this.hint,
    this.isDisabled = false,
    this.isExpanded = true,
  });

  /// The list of items to select from.
  final List<T> items;

  /// The currently selected value.
  final T? value;

  /// Called when the selection changes.
  final ValueChanged<T?> onChanged;

  /// Border radius for the dropdown field.
  final BorderRadius? borderRadius;

  /// Padding for the content area.
  final EdgeInsetsGeometry? contentPadding;

  /// Optional leading icon shown inside the field.
  final Widget? icon;

  /// Hint text shown when nothing is selected.
  final String? hint;

  /// Whether the select is disabled.
  final bool isDisabled;

  /// Whether the dropdown expands to fill available width.
  final bool isExpanded;

  @override
  State<DSSelect<T>> createState() => _DSSelectState<T>();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IterableProperty<T>('items', items));
    properties.add(DiagnosticsProperty<T?>('value', value));
    properties.add(
      ObjectFlagProperty<ValueChanged<T?>>.has('onChanged', onChanged),
    );
    properties.add(
      DiagnosticsProperty<BorderRadius?>('borderRadius', borderRadius),
    );
    properties.add(
      DiagnosticsProperty<EdgeInsetsGeometry?>(
        'contentPadding',
        contentPadding,
      ),
    );
    properties.add(StringProperty('hint', hint));
    properties.add(DiagnosticsProperty<bool>('isDisabled', isDisabled));
    properties.add(DiagnosticsProperty<bool>('isExpanded', isExpanded));
  }
}

class _DSSelectState<T> extends State<DSSelect<T>> {
  late T? _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.value;
  }

  // Sync internal state when the parent changes `value` externally.
  @override
  void didUpdateWidget(DSSelect<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value) {
      _selectedValue = widget.value;
    }
  }

  @override
  Widget build(BuildContext context) {
    final DsColors colors = DsColors.of(context);

    final BorderRadius effectiveBorderRadius =
        widget.borderRadius ?? BorderRadius.circular(4.0);

    final EdgeInsetsGeometry effectivePadding = widget.contentPadding ??
        const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0);

    return DropdownButtonFormField<T>(
      initialValue: _selectedValue,
      isExpanded: widget.isExpanded,
      icon: widget.icon ?? const Icon(Icons.arrow_drop_down),
      hint: widget.hint != null
          ? Text(
              widget.hint!,
              style: TextStyle(color: colors.onSurfaceVariant),
            )
          : null,
      decoration: InputDecoration(
        contentPadding: effectivePadding,
        filled: true,
        fillColor: widget.isDisabled
            ? colors.surfaceContainerHighest
            : colors.surface,
        border: OutlineInputBorder(
          borderRadius: effectiveBorderRadius,
          borderSide: BorderSide(color: colors.outline),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: effectiveBorderRadius,
          borderSide: BorderSide(color: colors.outline),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: effectiveBorderRadius,
          borderSide: BorderSide(color: colors.primary, width: 2),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: effectiveBorderRadius,
          borderSide: BorderSide(color: colors.outlineVariant),
        ),
      ),
      onChanged: widget.isDisabled
          ? null
          : (T? newValue) {
              setState(() => _selectedValue = newValue);
              widget.onChanged(newValue);
            },
      items: widget.items.map((T item) {
        return DropdownMenuItem<T>(
          value: item,
          child: Text(
            item.toString(),
            style: TextStyle(color: colors.onSurface),
          ),
        );
      }).toList(),
    );
  }
}
