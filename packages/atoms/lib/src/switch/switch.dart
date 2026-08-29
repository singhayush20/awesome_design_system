import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DSSwitch extends StatelessWidget {
  const DSSwitch({
    required this.value,
    required this.onChanged,
    super.key,
    this.semanticLabel,
  });
  final bool value;
  final ValueChanged<bool>? onChanged;
  final String? semanticLabel;
  @override
  Widget build(BuildContext context) {
    Widget result = Switch(value: value, onChanged: onChanged);
    if (semanticLabel != null) {
      result = Semantics(label: semanticLabel, toggled: value, child: result);
    }
    return result;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder p) {
    super.debugFillProperties(p);
    p.add(FlagProperty('value', value: value, ifTrue: 'on', ifFalse: 'off'));
    p.add(ObjectFlagProperty<ValueChanged<bool>>.has('onChanged', onChanged));
    p.add(StringProperty('semanticLabel', semanticLabel));
  }
}
