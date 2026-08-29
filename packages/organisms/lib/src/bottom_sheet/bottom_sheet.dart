import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:awesome_design_system_tokens/tokens.dart';
import 'package:awesome_design_system_atoms/atoms.dart';
import 'bottom_sheet_enums.dart';
import 'bottom_sheet_action.dart';

/// A production-grade bottom sheet following Material 3 guidelines.
class DSBottomSheet extends StatelessWidget {
  const DSBottomSheet({
    required this.title,
    super.key,
    this.description,
    this.type = BottomSheetType.standard,
    this.buttons,
    this.actions,
    this.crossButton,
    this.onCrossPressed,
    this.onPrimaryButtonPressed,
    this.onSecondaryButtonPressed,
    this.onTertiaryButtonPressed,
    this.primaryButtonText = 'Primary',
    this.secondaryButtonText = 'Secondary',
    this.tertiaryButtonText = 'Tertiary',
    this.backgroundColor,
    this.elevation,
    this.showDragHandle = true,
  });

  /// Bottom sheet title text.
  final String title;

  /// Optional description text.
  final String? description;

  /// Bottom sheet type: standard or cross.
  final BottomSheetType type;

  /// Optional custom button widgets.
  final List<Widget>? buttons;

  /// Optional typed action models.
  final List<DSBottomSheetAction>? actions;

  /// Optional cross button widget override.
  final Widget? crossButton;

  /// Called when cross button is pressed.
  final VoidCallback? onCrossPressed;

  /// Called when primary button is pressed.
  final VoidCallback? onPrimaryButtonPressed;

  /// Called when secondary button is pressed.
  final VoidCallback? onSecondaryButtonPressed;

  /// Called when tertiary button is pressed.
  final VoidCallback? onTertiaryButtonPressed;

  /// Configurable primary button label text.
  final String primaryButtonText;

  /// Configurable secondary button label text.
  final String secondaryButtonText;

  /// Configurable tertiary button label text.
  final String tertiaryButtonText;

  /// Background color override.
  final Color? backgroundColor;

  /// Elevation of the bottom sheet.
  final double? elevation;

  /// Whether to show top drag handle.
  final bool showDragHandle;

  @override
  Widget build(BuildContext context) {
    final DesignTokens? tokens = Theme.of(context).extension<DesignTokens>();
    final SpacingScale spacing =
        tokens?.spacing.scale ?? SpacingScale.defaultScale;
    final RadiusScale radius = tokens?.radius.scale ?? RadiusScale.defaultScale;
    final ColorScheme colors = Theme.of(context).colorScheme;

    final Color effectiveBackground = backgroundColor ?? colors.surface;
    final double effectiveElevation = elevation ?? 3.0;

    final Widget? effectiveCrossButton = crossButton ??
        (type == BottomSheetType.cross || onCrossPressed != null
            ? DSIconButton(
                icon: const Icon(Icons.close),
                onPressed: onCrossPressed ?? () => Navigator.of(context).maybePop(),
                size: ButtonSize.small,
              )
            : null);

    return Material(
      color: effectiveBackground,
      elevation: effectiveElevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(radius.xl)),
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: EdgeInsets.all(spacing.lg),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              if (showDragHandle) _DSDragHandle(color: colors.onSurfaceVariant),
              _DSBottomSheetHeader(
                title: title,
                description: description,
                crossButton: effectiveCrossButton,
                spacing: spacing,
              ),
              SizedBox(height: spacing.lg),
              _DSBottomSheetActions(
                actions: actions,
                buttons: buttons,
                onPrimaryButtonPressed: onPrimaryButtonPressed,
                onSecondaryButtonPressed: onSecondaryButtonPressed,
                onTertiaryButtonPressed: onTertiaryButtonPressed,
                primaryButtonText: primaryButtonText,
                secondaryButtonText: secondaryButtonText,
                tertiaryButtonText: tertiaryButtonText,
                spacing: spacing.sm,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('title', title));
    properties.add(StringProperty('description', description));
    properties.add(EnumProperty<BottomSheetType>('type', type));
    properties.add(IterableProperty<Widget>('buttons', buttons));
    properties.add(IterableProperty<DSBottomSheetAction>('actions', actions));
    properties.add(DiagnosticsProperty<Widget?>('crossButton', crossButton));
    properties.add(
      ObjectFlagProperty<VoidCallback?>.has('onCrossPressed', onCrossPressed),
    );
    properties.add(
      ObjectFlagProperty<VoidCallback?>.has(
        'onPrimaryButtonPressed',
        onPrimaryButtonPressed,
      ),
    );
    properties.add(
      ObjectFlagProperty<VoidCallback?>.has(
        'onSecondaryButtonPressed',
        onSecondaryButtonPressed,
      ),
    );
    properties.add(
      ObjectFlagProperty<VoidCallback?>.has(
        'onTertiaryButtonPressed',
        onTertiaryButtonPressed,
      ),
    );
    properties.add(StringProperty('primaryButtonText', primaryButtonText));
    properties.add(StringProperty('secondaryButtonText', secondaryButtonText));
    properties.add(StringProperty('tertiaryButtonText', tertiaryButtonText));
    properties.add(ColorProperty('backgroundColor', backgroundColor));
    properties.add(DoubleProperty('elevation', elevation));
    properties.add(DiagnosticsProperty<bool>('showDragHandle', showDragHandle));
  }
}

class _DSDragHandle extends StatelessWidget {
  const _DSDragHandle({required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(bottom: 12.0),
        width: 32,
        height: 4,
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.4),
          borderRadius: BorderRadius.circular(2),
        ),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(ColorProperty('color', color));
  }
}

class _DSBottomSheetHeader extends StatelessWidget {
  const _DSBottomSheetHeader({
    required this.title,
    required this.spacing,
    this.description,
    this.crossButton,
  });

  final String title;
  final String? description;
  final Widget? crossButton;
  final SpacingScale spacing;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              DSText(
                title,
                variant: TextVariant.titleLarge,
                fontWeight: FontWeight.w600,
              ),
              if (description != null) ...<Widget>[
                SizedBox(height: spacing.xxs),
                DSText(
                  description!,
                  colorRole: TextColorRole.secondary,
                ),
              ],
            ],
          ),
        ),
        if (crossButton != null) crossButton!,
      ],
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('title', title));
    properties.add(StringProperty('description', description));
    properties.add(DiagnosticsProperty<Widget?>('crossButton', crossButton));
    properties.add(DiagnosticsProperty<SpacingScale>('spacing', spacing));
  }
}

class _DSBottomSheetActions extends StatelessWidget {
  const _DSBottomSheetActions({
    required this.spacing,
    required this.primaryButtonText,
    required this.secondaryButtonText,
    required this.tertiaryButtonText,
    this.actions,
    this.buttons,
    this.onPrimaryButtonPressed,
    this.onSecondaryButtonPressed,
    this.onTertiaryButtonPressed,
  });

  final List<DSBottomSheetAction>? actions;
  final List<Widget>? buttons;
  final VoidCallback? onPrimaryButtonPressed;
  final VoidCallback? onSecondaryButtonPressed;
  final VoidCallback? onTertiaryButtonPressed;
  final String primaryButtonText;
  final String secondaryButtonText;
  final String tertiaryButtonText;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    if (actions != null && actions!.isNotEmpty) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: actions!.map((DSBottomSheetAction action) {
          return Padding(
            padding: EdgeInsets.only(bottom: spacing),
            child: DSButton(
              onPressed: action.onPressed,
              variant: action.variant,
              leadingIcon: action.leadingIcon,
              trailingIcon: action.trailingIcon,
              isLoading: action.isLoading,
              isDisabled: action.isDisabled,
              fullWidth: true,
              child: DSText(action.label),
            ),
          );
        }).toList(),
      );
    }

    if (buttons != null && buttons!.isNotEmpty) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: buttons!.map((Widget btn) {
          return Padding(
            padding: EdgeInsets.only(bottom: spacing),
            child: btn,
          );
        }).toList(),
      );
    }

    final List<Widget> actionButtons = <Widget>[];

    if (onPrimaryButtonPressed != null) {
      actionButtons.add(
        DSButton(
          onPressed: onPrimaryButtonPressed,
          fullWidth: true,
          child: DSText(primaryButtonText),
        ),
      );
    }

    if (onSecondaryButtonPressed != null) {
      actionButtons.add(
        DSButton(
          onPressed: onSecondaryButtonPressed,
          variant: ButtonVariant.outlined,
          fullWidth: true,
          child: DSText(secondaryButtonText),
        ),
      );
    }

    if (onTertiaryButtonPressed != null) {
      actionButtons.add(
        DSButton(
          onPressed: onTertiaryButtonPressed,
          variant: ButtonVariant.text,
          fullWidth: true,
          child: DSText(tertiaryButtonText),
        ),
      );
    }

    if (actionButtons.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: actionButtons.map((Widget btn) {
        return Padding(
          padding: EdgeInsets.only(bottom: spacing),
          child: btn,
        );
      }).toList(),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IterableProperty<DSBottomSheetAction>('actions', actions));
    properties.add(IterableProperty<Widget>('buttons', buttons));
    properties.add(ObjectFlagProperty<VoidCallback?>.has('onPrimaryButtonPressed', onPrimaryButtonPressed));
    properties.add(ObjectFlagProperty<VoidCallback?>.has('onSecondaryButtonPressed', onSecondaryButtonPressed));
    properties.add(ObjectFlagProperty<VoidCallback?>.has('onTertiaryButtonPressed', onTertiaryButtonPressed));
    properties.add(StringProperty('primaryButtonText', primaryButtonText));
    properties.add(StringProperty('secondaryButtonText', secondaryButtonText));
    properties.add(StringProperty('tertiaryButtonText', tertiaryButtonText));
    properties.add(DoubleProperty('spacing', spacing));
  }
}
