import 'package:awesome_design_system_atoms/atoms.dart';
import 'package:awesome_design_system_tokens/tokens.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'bottom_sheet_action.dart';

/// Low-level presentation engine for the design-system bottom sheet.
class DSBaseBottomSheet extends StatelessWidget {
  const DSBaseBottomSheet({
    required this.title,
    required this.spacing,
    required this.primaryButtonText,
    required this.secondaryButtonText,
    required this.tertiaryButtonText,
    super.key,
    this.description,
    this.actions,
    this.buttons,
    this.crossButton,
    this.onPrimaryButtonPressed,
    this.onSecondaryButtonPressed,
    this.onTertiaryButtonPressed,
    this.showDragHandle = false,
  });

  final String title;
  final String? description;
  final List<DSBottomSheetAction>? actions;
  final List<Widget>? buttons;
  final Widget? crossButton;
  final VoidCallback? onPrimaryButtonPressed;
  final VoidCallback? onSecondaryButtonPressed;
  final VoidCallback? onTertiaryButtonPressed;
  final String primaryButtonText;
  final String secondaryButtonText;
  final String tertiaryButtonText;
  final bool showDragHandle;
  final SpacingScale spacing;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Padding(
        padding: EdgeInsets.all(spacing.lg),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            if (showDragHandle)
              _DSDragHandle(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            _DSBottomSheetHeader(
              title: title,
              description: description,
              crossButton: crossButton,
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
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('title', title));
    properties.add(StringProperty('description', description));
    properties.add(IterableProperty<DSBottomSheetAction>('actions', actions));
    properties.add(IterableProperty<Widget>('buttons', buttons));
    properties.add(DiagnosticsProperty<Widget?>('crossButton', crossButton));
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
    properties.add(FlagProperty('showDragHandle', value: showDragHandle));
  }
}

class _DSDragHandle extends StatelessWidget {
  const _DSDragHandle({required this.color});
  final Color color;
  @override
  Widget build(BuildContext context) => Center(
    child: Container(
      margin: EdgeInsets.only(bottom: SpacingScale.defaultScale.sm),
      width: SizingScale.defaultScale.iconXl,
      height: SpacingScale.defaultScale.xxs,
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.4),
        borderRadius: BorderRadius.circular(SpacingScale.defaultScale.xxxs),
      ),
    ),
  );
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
  Widget build(BuildContext context) => Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Expanded(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            DSText(
              title,
              variant: TextVariant.titleLarge,
              fontWeight: FontWeight.w600,
            ),
            if (description != null) ...<Widget>[
              SizedBox(height: spacing.xxs),
              DSText(description!, colorRole: TextColorRole.secondary),
            ],
          ],
        ),
      ),
      if (crossButton != null) crossButton!,
    ],
  );
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
    final List<Widget> actionButtons =
        actions
            ?.map(
              (DSBottomSheetAction action) => DSButton(
                onPressed: action.onPressed,
                variant: action.variant,
                leadingIcon: action.leadingIcon,
                trailingIcon: action.trailingIcon,
                isLoading: action.isLoading,
                isDisabled: action.isDisabled,
                fullWidth: true,
                child: DSText(action.label),
              ),
            )
            .toList() ??
        buttons ??
        <Widget>[
          if (onPrimaryButtonPressed != null)
            DSButton(
              onPressed: onPrimaryButtonPressed,
              fullWidth: true,
              child: DSText(primaryButtonText),
            ),
          if (onSecondaryButtonPressed != null)
            DSButton(
              onPressed: onSecondaryButtonPressed,
              variant: ButtonVariant.outlined,
              fullWidth: true,
              child: DSText(secondaryButtonText),
            ),
          if (onTertiaryButtonPressed != null)
            DSButton(
              onPressed: onTertiaryButtonPressed,
              variant: ButtonVariant.text,
              fullWidth: true,
              child: DSText(tertiaryButtonText),
            ),
        ];
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: actionButtons
          .map(
            (Widget button) => Padding(
              padding: EdgeInsets.only(bottom: spacing),
              child: button,
            ),
          )
          .toList(),
    );
  }
}
