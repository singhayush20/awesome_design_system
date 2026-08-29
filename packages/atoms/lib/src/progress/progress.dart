import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DSCircularLoadingIndicator extends StatelessWidget {
  const DSCircularLoadingIndicator({
    super.key,
    this.value,
    this.color,
    this.strokeWidth = 4,
  });
  final double? value, strokeWidth;
  final Color? color;
  @override
  Widget build(BuildContext context) => CircularProgressIndicator(
    value: value,
    color: color ?? Theme.of(context).colorScheme.primary,
    strokeWidth: strokeWidth,
  );
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder p) {
    super.debugFillProperties(p);
    p.add(DoubleProperty('value', value));
    p.add(ColorProperty('color', color));
    p.add(DoubleProperty('strokeWidth', strokeWidth));
  }
}

class DSLinearProgressIndicator extends StatelessWidget {
  const DSLinearProgressIndicator({
    super.key,
    this.value,
    this.color,
    this.backgroundColor,
    this.minHeight,
  });
  final double? value, minHeight;
  final Color? color, backgroundColor;
  @override
  Widget build(BuildContext context) => LinearProgressIndicator(
    value: value,
    color: color ?? Theme.of(context).colorScheme.primary,
    backgroundColor: backgroundColor,
    minHeight: minHeight,
  );
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder p) {
    super.debugFillProperties(p);
    p.add(DoubleProperty('value', value));
    p.add(ColorProperty('color', color));
    p.add(ColorProperty('backgroundColor', backgroundColor));
    p.add(DoubleProperty('minHeight', minHeight));
  }
}
