import 'package:flutter/material.dart';
import 'package:awesome_design_system_tokens/tokens.dart';
import 'button_enums.dart';
import 'button_style.dart';

/// Low-level presentation engine that builds the button tree with Material 3 buttons.
class DSBaseButton extends StatelessWidget {
  const DSBaseButton({
    required this.onPressed,
    required this.variant,
    required this.buttonStyle,
    required this.child,
    super.key,
    this.onLongPress,
    this.leadingIcon,
    this.trailingIcon,
    this.isLoading = false,
    this.fullWidth = false,
    this.semanticLabel,
    this.tooltip,
    this.iconSize = 18.0,
    this.gap = 8.0,
  });

  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;
  final ButtonVariant variant;
  final ButtonStyle buttonStyle;
  final Widget child;
  final Widget? leadingIcon;
  final Widget? trailingIcon;
  final bool isLoading;
  final bool fullWidth;
  final String? semanticLabel;
  final String? tooltip;
  final double iconSize;
  final double gap;

  @override
  Widget build(BuildContext context) {
    Widget buttonContent = _DSButtonContent(
      leadingIcon: leadingIcon,
      trailingIcon: trailingIcon,
      isLoading: isLoading,
      iconSize: iconSize,
      gap: gap,
      variant: variant,
      child: child,
    );

    if (semanticLabel != null) {
      buttonContent = Semantics(
        label: semanticLabel,
        button: true,
        enabled: onPressed != null,
        child: buttonContent,
      );
    }

    if (tooltip != null) {
      buttonContent = Tooltip(message: tooltip!, child: buttonContent);
    }

    Widget button = switch (variant) {
      ButtonVariant.elevated => ElevatedButton(
        onPressed: onPressed,
        onLongPress: onLongPress,
        style: buttonStyle,
        child: buttonContent,
      ),
      ButtonVariant.filled => FilledButton(
        onPressed: onPressed,
        onLongPress: onLongPress,
        style: buttonStyle,
        child: buttonContent,
      ),
      ButtonVariant.tonal => FilledButton.tonal(
        onPressed: onPressed,
        onLongPress: onLongPress,
        style: buttonStyle,
        child: buttonContent,
      ),
      ButtonVariant.outlined => OutlinedButton(
        onPressed: onPressed,
        onLongPress: onLongPress,
        style: buttonStyle,
        child: buttonContent,
      ),
      ButtonVariant.text => TextButton(
        onPressed: onPressed,
        onLongPress: onLongPress,
        style: buttonStyle,
        child: buttonContent,
      ),
    };

    if (fullWidth) {
      button = SizedBox(width: double.infinity, child: button);
    }

    return button;
  }
}

class _DSButtonContent extends StatelessWidget {
  const _DSButtonContent({
    required this.child,
    required this.iconSize,
    required this.gap,
    required this.isLoading,
    required this.variant,
    this.leadingIcon,
    this.trailingIcon,
  });

  final Widget child;
  final double iconSize;
  final double gap;
  final bool isLoading;
  final ButtonVariant variant;
  final Widget? leadingIcon;
  final Widget? trailingIcon;

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return SizedBox(
        width: iconSize,
        height: iconSize,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(
            variant == ButtonVariant.text || variant == ButtonVariant.outlined
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.onPrimary,
          ),
        ),
      );
    }

    final List<Widget> children = <Widget>[];

    if (leadingIcon != null) {
      children.add(
        SizedBox(width: iconSize, height: iconSize, child: leadingIcon),
      );
      children.add(SizedBox(width: gap));
    }

    children.add(Flexible(child: child));

    if (trailingIcon != null) {
      children.add(SizedBox(width: gap));
      children.add(
        SizedBox(width: iconSize, height: iconSize, child: trailingIcon),
      );
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: children,
    );
  }
}
