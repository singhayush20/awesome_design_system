import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DSSlider extends StatelessWidget {
  const DSSlider({
    required this.value,
    required this.onChanged,
    super.key,
    this.min = 0,
    this.max = 1,
    this.activeColor,
    this.inactiveColor,
    this.semanticLabel,
  });
  final double value, min, max;
  final ValueChanged<double>? onChanged;
  final Color? activeColor, inactiveColor;
  final String? semanticLabel;
  @override
  Widget build(BuildContext context) => Slider(
    min: min,
    max: max,
    value: value.clamp(min, max),
    onChanged: onChanged,
    activeColor: activeColor ?? Theme.of(context).colorScheme.primary,
    inactiveColor: inactiveColor,
    semanticFormatterCallback: semanticLabel == null
        ? null
        : (double value) => semanticLabel!,
  );
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder p) {
    super.debugFillProperties(p);
    p.add(DoubleProperty('value', value));
    p.add(DoubleProperty('min', min));
    p.add(DoubleProperty('max', max));
    p.add(ObjectFlagProperty<ValueChanged<double>>.has('onChanged', onChanged));
    p.add(ColorProperty('activeColor', activeColor));
    p.add(ColorProperty('inactiveColor', inactiveColor));
    p.add(StringProperty('semanticLabel', semanticLabel));
  }
}
