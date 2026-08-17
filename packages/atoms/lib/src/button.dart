// Button atom with multiple variants

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:awesome_design_system_tokens/tokens.dart';

/// Button variants available
enum ButtonVariant { elevated, filled, outlined, text, tonal }

/// Button sizes available
enum ButtonSize { small, medium, large }

/// A versatile button component supporting multiple variants and states
class DSButton extends StatelessWidget {
  const DSButton({
    required this.onPressed,
    required this.child,
    super.key,
    this.variant = ButtonVariant.filled,
    this.size = ButtonSize.medium,
    this.leadingIcon,
    this.trailingIcon,
    this.isLoading = false,
    this.isDisabled = false,
    this.fullWidth = false,
    this.semanticLabel,
    this.tooltip,
    this.onLongPress,
    this.style,
  });

  /// Callback when button is pressed
  final VoidCallback? onPressed;

  /// Button content (typically a Text widget)
  final Widget child;

  /// Visual variant of the button
  final ButtonVariant variant;

  /// Size of the button
  final ButtonSize size;

  /// Optional leading icon
  final Widget? leadingIcon;

  /// Optional trailing icon
  final Widget? trailingIcon;

  /// Whether button is in loading state
  final bool isLoading;

  /// Whether button is disabled
  final bool isDisabled;

  /// Whether button should take full width
  final bool fullWidth;

  /// Semantic label for accessibility
  final String? semanticLabel;

  /// Tooltip text
  final String? tooltip;

  /// Callback for long press
  final VoidCallback? onLongPress;

  /// Custom button style override
  final ButtonStyle? style;

  @override
  Widget build(BuildContext context) {
    final DesignTokens? tokens = Theme.of(context).extension<DesignTokens>();
    final SizingScale sizing = tokens?.sizing.scale ?? SizingScale.defaultScale;
    final SpacingScale spacing =
        tokens?.spacing.scale ?? SpacingScale.defaultScale;
    final RadiusScale radius = tokens?.radius.scale ?? RadiusScale.defaultScale;
    final TypographyScale typography =
        tokens?.typography.scale ?? TypographyScale.defaultScale();
    final ColorScheme colors = Theme.of(context).colorScheme;

    final VoidCallback? effectiveOnPressed = (isDisabled || isLoading)
        ? null
        : onPressed;
    final VoidCallback? effectiveOnLongPress = isDisabled ? null : onLongPress;

    // Build button content
    Widget buttonContent = _buildContent(context, typography, sizing, spacing);

    // Apply semantics
    if (semanticLabel != null) {
      buttonContent = Semantics(
        label: semanticLabel,
        button: true,
        enabled: effectiveOnPressed != null,
        child: buttonContent,
      );
    }

    // Apply tooltip
    if (tooltip != null) {
      buttonContent = Tooltip(message: tooltip!, child: buttonContent);
    }

    // Get button style based on variant
    final ButtonStyle buttonStyle = _resolveStyle(
      context,
      variant,
      size,
      sizing,
      spacing,
      radius,
      typography,
      colors,
    );

    // Apply custom style override
    final ButtonStyle finalStyle = style?.merge(buttonStyle) ?? buttonStyle;

    Widget button = switch (variant) {
      ButtonVariant.elevated => ElevatedButton(
        onPressed: effectiveOnPressed,
        onLongPress: effectiveOnLongPress,
        style: finalStyle,
        child: buttonContent,
      ),
      ButtonVariant.filled => FilledButton(
        onPressed: effectiveOnPressed,
        onLongPress: effectiveOnLongPress,
        style: finalStyle,
        child: buttonContent,
      ),
      ButtonVariant.tonal => FilledButton.tonal(
        onPressed: effectiveOnPressed,
        onLongPress: effectiveOnLongPress,
        style: finalStyle,
        child: buttonContent,
      ),
      ButtonVariant.outlined => OutlinedButton(
        onPressed: effectiveOnPressed,
        onLongPress: effectiveOnLongPress,
        style: finalStyle,
        child: buttonContent,
      ),
      ButtonVariant.text => TextButton(
        onPressed: effectiveOnPressed,
        onLongPress: effectiveOnLongPress,
        style: finalStyle,
        child: buttonContent,
      ),
    };

    if (fullWidth) {
      button = SizedBox(width: double.infinity, child: button);
    }

    return button;
  }

  Widget _buildContent(
    BuildContext context,
    TypographyScale typography,
    SizingScale sizing,
    SpacingScale spacing,
  ) {
    final bool isSmall = size == ButtonSize.small;
    final bool isLarge = size == ButtonSize.large;
    final double iconSize = isSmall
        ? sizing.iconXs
        : isLarge
        ? sizing.iconLg
        : sizing.iconMd;
    final double gap = isSmall ? spacing.xxs : spacing.xs;

    final List<Widget> children = <Widget>[];

    if (leadingIcon != null) {
      children.add(
        SizedBox(width: iconSize, height: iconSize, child: leadingIcon!),
      );
      children.add(SizedBox(width: gap));
    }

    children.add(Flexible(child: child));

    if (trailingIcon != null) {
      children.add(SizedBox(width: gap));
      children.add(
        SizedBox(width: iconSize, height: iconSize, child: trailingIcon!),
      );
    }

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

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: children,
    );
  }

  ButtonStyle _resolveStyle(
    BuildContext context,
    ButtonVariant variant,
    ButtonSize size,
    SizingScale sizing,
    SpacingScale spacing,
    RadiusScale radius,
    TypographyScale typography,
    ColorScheme colors,
  ) {
    final double height = switch (size) {
      ButtonSize.small => sizing.buttonHeightSm,
      ButtonSize.medium => sizing.buttonHeightMd,
      ButtonSize.large => sizing.buttonHeightLg,
    };

    final double horizontalPadding = switch (size) {
      ButtonSize.small => spacing.sm,
      ButtonSize.medium => spacing.md,
      ButtonSize.large => spacing.lg,
    };

    final TextStyle textStyle = switch (size) {
      ButtonSize.small => typography.labelSmall,
      ButtonSize.medium => typography.labelLarge,
      ButtonSize.large => typography.titleSmall,
    };

    final BorderRadius borderRadius = radius.mdRadius;

    switch (variant) {
      case ButtonVariant.elevated:
        return ElevatedButton.styleFrom(
          backgroundColor: colors.primary,
          foregroundColor: colors.onPrimary,
          elevation: 1,
          shadowColor: colors.shadow,
          surfaceTintColor: colors.surfaceTint,
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          minimumSize: Size(64, height),
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
          textStyle: textStyle,
        ).copyWith(
          backgroundColor: WidgetStateProperty.resolveWith((
            Set<WidgetState> states,
          ) {
            if (states.contains(WidgetState.disabled)) {
              return colors.surfaceContainerHighest;
            }
            return colors.primary;
          }),
          foregroundColor: WidgetStateProperty.resolveWith((
            Set<WidgetState> states,
          ) {
            if (states.contains(WidgetState.disabled)) {
              return colors.onSurfaceVariant;
            }
            return colors.onPrimary;
          }),
        );
      case ButtonVariant.filled:
        return FilledButton.styleFrom(
          backgroundColor: colors.primary,
          foregroundColor: colors.onPrimary,
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          minimumSize: Size(64, height),
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
          textStyle: textStyle,
        ).copyWith(
          backgroundColor: WidgetStateProperty.resolveWith((
            Set<WidgetState> states,
          ) {
            if (states.contains(WidgetState.disabled)) {
              return colors.surfaceContainerHighest;
            }
            return colors.primary;
          }),
          foregroundColor: WidgetStateProperty.resolveWith((
            Set<WidgetState> states,
          ) {
            if (states.contains(WidgetState.disabled)) {
              return colors.onSurfaceVariant;
            }
            return colors.onPrimary;
          }),
        );
      case ButtonVariant.tonal:
        return FilledButton.styleFrom(
          backgroundColor: colors.secondaryContainer,
          foregroundColor: colors.onSecondaryContainer,
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          minimumSize: Size(64, height),
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
          textStyle: textStyle,
        ).copyWith(
          backgroundColor: WidgetStateProperty.resolveWith((
            Set<WidgetState> states,
          ) {
            if (states.contains(WidgetState.disabled)) {
              return colors.surfaceContainerHighest;
            }
            return colors.secondaryContainer;
          }),
          foregroundColor: WidgetStateProperty.resolveWith((
            Set<WidgetState> states,
          ) {
            if (states.contains(WidgetState.disabled)) {
              return colors.onSurfaceVariant;
            }
            return colors.onSecondaryContainer;
          }),
        );
      case ButtonVariant.outlined:
        return OutlinedButton.styleFrom(
          foregroundColor: colors.primary,
          side: BorderSide(color: colors.outline),
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          minimumSize: Size(64, height),
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
          textStyle: textStyle,
        ).copyWith(
          foregroundColor: WidgetStateProperty.resolveWith((
            Set<WidgetState> states,
          ) {
            if (states.contains(WidgetState.disabled)) {
              return colors.onSurfaceVariant;
            }
            return colors.primary;
          }),
          side: WidgetStateProperty.resolveWith((Set<WidgetState> states) {
            if (states.contains(WidgetState.disabled)) {
              return BorderSide(color: colors.outlineVariant);
            }
            return BorderSide(color: colors.outline);
          }),
        );
      case ButtonVariant.text:
        return TextButton.styleFrom(
          foregroundColor: colors.primary,
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          minimumSize: Size(
            48,
            size == ButtonSize.small ? sizing.buttonHeightSm : height,
          ),
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
          textStyle: textStyle,
        ).copyWith(
          foregroundColor: WidgetStateProperty.resolveWith((
            Set<WidgetState> states,
          ) {
            if (states.contains(WidgetState.disabled)) {
              return colors.onSurfaceVariant;
            }
            return colors.primary;
          }),
        );
    }
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      ObjectFlagProperty<VoidCallback?>.has('onPressed', onPressed),
    );
    properties.add(EnumProperty<ButtonVariant>('variant', variant));
    properties.add(EnumProperty<ButtonSize>('size', size));
    properties.add(DiagnosticsProperty<bool>('isLoading', isLoading));
    properties.add(DiagnosticsProperty<bool>('isDisabled', isDisabled));
    properties.add(DiagnosticsProperty<bool>('fullWidth', fullWidth));
    properties.add(StringProperty('semanticLabel', semanticLabel));
    properties.add(StringProperty('tooltip', tooltip));
    properties.add(
      ObjectFlagProperty<VoidCallback?>.has('onLongPress', onLongPress),
    );
    properties.add(DiagnosticsProperty<ButtonStyle?>('style', style));
  }
}

/// Icon button variant
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
