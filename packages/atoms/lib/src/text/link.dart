import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:awesome_design_system_tokens/tokens.dart';
import 'text_enums.dart';
import 'text_style.dart';

/// Interactive link text component.
class DSLink extends StatelessWidget {
  const DSLink({
    required this.text,
    required this.onTap,
    super.key,
    this.variant = TextVariant.bodyMedium,
    this.colorRole = TextColorRole.primary,
    this.isDisabled = false,
    this.underline = true,
    this.style,
  });

  final String text;
  final VoidCallback onTap;
  final TextVariant variant;
  final TextColorRole colorRole;
  final bool isDisabled;
  final bool underline;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    final DesignTokens? tokens = Theme.of(context).extension<DesignTokens>();
    final TypographyScale typography =
        tokens?.typography.scale ?? TypographyScale.defaultScale();
    final ColorScheme colors = Theme.of(context).colorScheme;

    final TextStyle baseStyle = DSTextStyle.resolveBaseStyle(variant, typography);

    final Color textColor = colorRole == TextColorRole.primary
        ? colors.primary
        : colorRole == TextColorRole.error
        ? colors.error
        : colors.onSurface;

    final TextStyle effectiveStyle = baseStyle
        .copyWith(
          color: isDisabled ? colors.onSurfaceVariant : textColor,
          decoration: underline
              ? TextDecoration.underline
              : TextDecoration.none,
          decorationColor: isDisabled ? colors.onSurfaceVariant : textColor,
        )
        .merge(style);

    return InkWell(
      onTap: isDisabled ? null : onTap,
      borderRadius: BorderRadius.circular(4),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
        child: Text(text, style: effectiveStyle),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('text', text));
    properties.add(ObjectFlagProperty<VoidCallback>.has('onTap', onTap));
    properties.add(EnumProperty<TextVariant>('variant', variant));
    properties.add(EnumProperty<TextColorRole>('colorRole', colorRole));
    properties.add(DiagnosticsProperty<bool>('isDisabled', isDisabled));
    properties.add(DiagnosticsProperty<bool>('underline', underline));
    properties.add(DiagnosticsProperty<TextStyle?>('style', style));
  }
}
