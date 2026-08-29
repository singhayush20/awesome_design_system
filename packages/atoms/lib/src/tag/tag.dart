import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:awesome_design_system_tokens/tokens.dart';
import '../text/text.dart';
import '../text/text_enums.dart';

enum DSTagVariant { filled, outlined, filledOutlined }

class DSTag extends StatelessWidget {
  const DSTag({
    required this.label,
    super.key,
    this.variant = DSTagVariant.filled,
    this.color,
  });

  final String label;
  final DSTagVariant variant;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;
    final SpacingScale spacing =
        Theme.of(context).extension<DesignTokens>()?.spacing.scale ??
        const SpacingScale();
    final Color base = color ?? colors.primary;
    final bool filled = variant != DSTagVariant.outlined;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: spacing.sm,
        vertical: spacing.xxs,
      ),
      decoration: BoxDecoration(
        color: filled ? base : Colors.transparent,
        border: variant != DSTagVariant.filled ? Border.all(color: base) : null,
        borderRadius: BorderRadius.circular(spacing.xs),
      ),
      child: DSText(label, colorRole: TextColorRole.inverse),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder p) {
    super.debugFillProperties(p);
    p.add(StringProperty('label', label));
    p.add(EnumProperty<DSTagVariant>('variant', variant));
    p.add(ColorProperty('color', color));
  }
}

typedef DsTag = DSTag;
