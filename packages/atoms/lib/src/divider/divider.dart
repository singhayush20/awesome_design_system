import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DSDivider extends StatelessWidget {
  const DSDivider({super.key, this.color, this.thickness});

  final Color? color;
  final double? thickness;

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: color ?? Theme.of(context).colorScheme.outlineVariant,
      thickness: thickness,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(ColorProperty('color', color));
    properties.add(DoubleProperty('thickness', thickness));
  }
}
