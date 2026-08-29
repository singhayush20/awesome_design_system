import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Card action area for grouping action buttons.
class DSCardActions extends StatelessWidget {
  const DSCardActions({
    required this.actions,
    super.key,
    this.alignment = MainAxisAlignment.end,
    this.spacing = 8.0,
    this.overflowDirection = VerticalDirection.down,
  });

  final List<Widget> actions;
  final MainAxisAlignment alignment;
  final double spacing;
  final VerticalDirection overflowDirection;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: alignment,
      mainAxisSize: MainAxisSize.min,
      children: actions
          .expand((Widget widget) => <Widget>[widget, SizedBox(width: spacing)])
          .take(actions.length * 2 - 1)
          .toList(),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(EnumProperty<MainAxisAlignment>('alignment', alignment));
    properties.add(DoubleProperty('spacing', spacing));
    properties.add(
      EnumProperty<VerticalDirection>('overflowDirection', overflowDirection),
    );
  }
}
