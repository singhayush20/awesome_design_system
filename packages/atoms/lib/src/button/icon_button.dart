import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:awesome_design_system_tokens/tokens.dart';
import 'button_enums.dart';

/// Icon button atom variant
class DSIconButton extends StatelessWidget {
  const DSIconButton({
    required this.onPressed,
    required this.icon,
    super.key,
    this.size = ButtonSize.medium,
    this.variant = ButtonVariant.text,
    this.isDisabled = false,
    this.semanticLabel,
    this.tooltip,
    this.padding,
  });

  final VoidCallback? onPressed;
  final Widget icon;
  final ButtonSize size;
  final ButtonVariant variant;
  final bool isDisabled;
  final String? semanticLabel;
  final String? tooltip;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final DesignTokens? tokens = Theme.of(context).extension<DesignTokens>();
    final SizingScale sizing = tokens?.sizing.scale ?? SizingScale.defaultScale;
    final ColorScheme colors = Theme.of(context).colorScheme;

    final VoidCallback? effectiveOnPressed = isDisabled ? null : onPressed;
    final double iconSize = switch (size) {
      ButtonSize.small => sizing.iconXs,
      ButtonSize.medium => sizing.iconMd,
      ButtonSize.large => sizing.iconLg,
    };
    final double buttonSize = switch (size) {
      ButtonSize.small => sizing.buttonHeightSm,
      ButtonSize.medium => sizing.buttonHeightMd,
      ButtonSize.large => sizing.buttonHeightLg,
    };

    Widget button = IconButton(
      onPressed: effectiveOnPressed,
      icon: SizedBox(width: iconSize, height: iconSize, child: icon),
      style: IconButton.styleFrom(
        backgroundColor: variant == ButtonVariant.filled
            ? colors.primaryContainer
            : null,
        foregroundColor: variant == ButtonVariant.filled
            ? colors.onPrimaryContainer
            : colors.primary,
        disabledBackgroundColor: colors.surfaceContainerHighest,
        disabledForegroundColor: colors.onSurfaceVariant,
        padding: padding ?? EdgeInsets.all((buttonSize - iconSize) / 2),
        minimumSize: Size(buttonSize, buttonSize),
      ),
      tooltip: tooltip,
    );

    if (semanticLabel != null) {
      button = Semantics(
        label: semanticLabel,
        button: true,
        enabled: effectiveOnPressed != null,
        child: button,
      );
    }

    return button;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      ObjectFlagProperty<VoidCallback?>.has('onPressed', onPressed),
    );
    properties.add(EnumProperty<ButtonSize>('size', size));
    properties.add(EnumProperty<ButtonVariant>('variant', variant));
    properties.add(DiagnosticsProperty<bool>('isDisabled', isDisabled));
    properties.add(StringProperty('semanticLabel', semanticLabel));
    properties.add(StringProperty('tooltip', tooltip));
    properties.add(
      DiagnosticsProperty<EdgeInsetsGeometry?>('padding', padding),
    );
  }
}
