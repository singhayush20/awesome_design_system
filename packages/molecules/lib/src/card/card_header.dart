import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:awesome_design_system_tokens/tokens.dart';
import 'package:awesome_design_system_atoms/atoms.dart';

/// Card header sub-component combining title, subtitle, leading and trailing widgets.
class DSCardHeader extends StatelessWidget {
  const DSCardHeader({
    super.key,
    this.title,
    this.subtitle,
    this.leading,
    this.trailing,
    this.titleVariant = TextVariant.titleMedium,
    this.subtitleVariant = TextVariant.bodyMedium,
    this.spacing = 4.0,
  });

  final String? title;
  final String? subtitle;
  final Widget? leading;
  final Widget? trailing;
  final TextVariant titleVariant;
  final TextVariant subtitleVariant;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    final DesignTokens? tokens = Theme.of(context).extension<DesignTokens>();
    final SpacingScale spacingScale =
        tokens?.spacing.scale ?? SpacingScale.defaultScale;

    final List<Widget> children = <Widget>[];

    if (leading != null) {
      children.add(leading!);
      children.add(SizedBox(width: spacingScale.md));
    }

    if (title != null || subtitle != null) {
      children.add(
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              if (title != null) DSText(title!, variant: titleVariant),
              if (subtitle != null) ...<Widget>[
                SizedBox(height: spacing),
                DSText(
                  subtitle!,
                  variant: subtitleVariant,
                  colorRole: TextColorRole.secondary,
                ),
              ],
            ],
          ),
        ),
      );
    }

    if (trailing != null) {
      children.add(SizedBox(width: spacingScale.md));
      children.add(trailing!);
    }

    return Row(children: children);
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('title', title));
    properties.add(StringProperty('subtitle', subtitle));
    properties.add(EnumProperty<TextVariant>('titleVariant', titleVariant));
    properties.add(
      EnumProperty<TextVariant>('subtitleVariant', subtitleVariant),
    );
    properties.add(DoubleProperty('spacing', spacing));
  }
}
