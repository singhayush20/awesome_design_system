import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:awesome_design_system_tokens/tokens.dart';
import 'button_enums.dart';
import 'base_button.dart';

/// A versatile button component supporting multiple variants and states.
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

  /// Convenience constructor for string label buttons
  factory DSButton.label({
    required String label,
    required VoidCallback? onPressed,
    Key? key,
    ButtonVariant variant = ButtonVariant.filled,
    ButtonSize size = ButtonSize.medium,
    Widget? leadingIcon,
    Widget? trailingIcon,
    bool isLoading = false,
    bool isDisabled = false,
    bool fullWidth = false,
    String? semanticLabel,
    String? tooltip,
    VoidCallback? onLongPress,
    ButtonStyle? style,
  }) {
    return DSButton(
      key: key,
      onPressed: onPressed,
      variant: variant,
      size: size,
      leadingIcon: leadingIcon,
      trailingIcon: trailingIcon,
      isLoading: isLoading,
      isDisabled: isDisabled,
      fullWidth: fullWidth,
      semanticLabel: semanticLabel,
      tooltip: tooltip,
      onLongPress: onLongPress,
      style: style,
      child: Text(label),
    );
  }

  /// Callback when button is pressed
  final VoidCallback? onPressed;

  /// Button content (typically a Text or DSText widget)
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

    final VoidCallback? effectiveOnPressed =
        (isDisabled || isLoading) ? null : onPressed;
    final VoidCallback? effectiveOnLongPress = isDisabled ? null : onLongPress;

    final bool isSmall = size == ButtonSize.small;
    final bool isLarge = size == ButtonSize.large;
    final double iconSize = isSmall
        ? sizing.iconXs
        : isLarge
        ? sizing.iconLg
        : sizing.iconMd;
    final double gap = isSmall ? spacing.xxs : spacing.xs;

    final ButtonStyle resolvedStyle = _resolveStyle(
      context,
      variant,
      size,
      sizing,
      spacing,
      radius,
      typography,
      colors,
    );

    final ButtonStyle finalStyle = style?.merge(resolvedStyle) ?? resolvedStyle;

    return DSBaseButton(
      onPressed: effectiveOnPressed,
      onLongPress: effectiveOnLongPress,
      variant: variant,
      buttonStyle: finalStyle,
      leadingIcon: leadingIcon,
      trailingIcon: trailingIcon,
      isLoading: isLoading,
      fullWidth: fullWidth,
      semanticLabel: semanticLabel,
      tooltip: tooltip,
      iconSize: iconSize,
      gap: gap,
      child: child,
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
