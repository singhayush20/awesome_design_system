import 'package:awesome_design_system_atoms/atoms.dart';
import 'package:awesome_design_system_tokens/tokens.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'base_bottom_sheet.dart';
import 'bottom_sheet_action.dart';
import 'bottom_sheet_enums.dart';

/// Bottom-sheet facade. Use [show] to present it modally.
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
    this.showDragHandle = false,
  });

  final String title;
  final String? description;
  final BottomSheetType type;
  final List<Widget>? buttons;
  final List<DSBottomSheetAction>? actions;
  final Widget? crossButton;
  final VoidCallback? onCrossPressed;
  final VoidCallback? onPrimaryButtonPressed;
  final VoidCallback? onSecondaryButtonPressed;
  final VoidCallback? onTertiaryButtonPressed;
  final String primaryButtonText;
  final String secondaryButtonText;
  final String tertiaryButtonText;
  final bool showDragHandle;

  /// Presents a modal bottom sheet using Flutter's [showModalBottomSheet].
  static Future<T?> show<T>({
    required BuildContext context,
    required String title,
    String? description,
    BottomSheetType type = BottomSheetType.standard,
    List<Widget>? buttons,
    List<DSBottomSheetAction>? actions,
    List<DSBottomSheetAction> Function(BuildContext sheetContext)?
    actionsBuilder,
    Widget? crossButton,
    VoidCallback? onCrossPressed,
    VoidCallback? onPrimaryButtonPressed,
    VoidCallback? onSecondaryButtonPressed,
    VoidCallback? onTertiaryButtonPressed,
    String primaryButtonText = 'Primary',
    String secondaryButtonText = 'Secondary',
    String tertiaryButtonText = 'Tertiary',
    Color? backgroundColor,
    double? elevation,
    bool showDragHandle = true,
    bool isScrollControlled = false,
    bool isDismissible = true,
    bool enableDrag = true,
    bool useRootNavigator = false,
    bool useSafeArea = false,
  }) {
    assert(
      actions == null || actionsBuilder == null,
      'Provide either actions or actionsBuilder, not both.',
    );
    final DesignTokens? tokens = Theme.of(context).extension<DesignTokens>();
    final RadiusScale radius = tokens?.radius.scale ?? RadiusScale.defaultScale;
    final ColorScheme colors = Theme.of(context).colorScheme;

    return showModalBottomSheet<T>(
      context: context,
      backgroundColor: backgroundColor ?? colors.surface,
      elevation: elevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(radius.xl)),
      ),
      showDragHandle: showDragHandle,
      isScrollControlled: isScrollControlled,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      useRootNavigator: useRootNavigator,
      useSafeArea: useSafeArea,
      builder: (BuildContext sheetContext) => DSBottomSheet(
        title: title,
        description: description,
        type: type,
        buttons: buttons,
        actions: actionsBuilder?.call(sheetContext) ?? actions,
        crossButton: crossButton,
        onCrossPressed:
            onCrossPressed ?? () => Navigator.of(sheetContext).pop(),
        onPrimaryButtonPressed: onPrimaryButtonPressed,
        onSecondaryButtonPressed: onSecondaryButtonPressed,
        onTertiaryButtonPressed: onTertiaryButtonPressed,
        primaryButtonText: primaryButtonText,
        secondaryButtonText: secondaryButtonText,
        tertiaryButtonText: tertiaryButtonText,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final DesignTokens? tokens = Theme.of(context).extension<DesignTokens>();
    final SpacingScale spacing =
        tokens?.spacing.scale ?? SpacingScale.defaultScale;
    final Widget? effectiveCrossButton =
        crossButton ??
        (type == BottomSheetType.cross || onCrossPressed != null
            ? DSIconButton(
                icon: const Icon(Icons.close),
                onPressed: onCrossPressed,
                size: ButtonSize.small,
              )
            : null);

    return DSBaseBottomSheet(
      title: title,
      description: description,
      actions: actions,
      buttons: buttons,
      crossButton: effectiveCrossButton,
      onPrimaryButtonPressed: onPrimaryButtonPressed,
      onSecondaryButtonPressed: onSecondaryButtonPressed,
      onTertiaryButtonPressed: onTertiaryButtonPressed,
      primaryButtonText: primaryButtonText,
      secondaryButtonText: secondaryButtonText,
      tertiaryButtonText: tertiaryButtonText,
      showDragHandle: showDragHandle,
      spacing: spacing,
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
    properties.add(
      FlagProperty(
        'showDragHandle',
        value: showDragHandle,
        ifTrue: 'show drag handle',
      ),
    );
  }
}
