import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Required field indicator appending a red asterisk to the field label.
class DSRequiredIndicator extends StatelessWidget {
  const DSRequiredIndicator({
    required this.child,
    required this.label,
    super.key,
  });

  final Widget child;
  final String label;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        RichText(
          text: TextSpan(
            text: label,
            style: DefaultTextStyle.of(context).style,
            children: <InlineSpan>[
              TextSpan(
                text: ' *',
                style: TextStyle(color: colors.error),
              ),
            ],
          ),
        ),
        const SizedBox(height: 4),
        child,
      ],
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('label', label));
  }
}
