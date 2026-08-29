// BottomSheet atom with M3 conventions - supports 3 buttons in row and cross button
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:awesome_design_system_tokens/tokens.dart';

/// Bottom sheet design type.
enum BottomSheetType { standard, cross }

/// A bottom sheet following M3 conventions with optional cross button.
///
/// Use [BottomSheetType.standard] for a sheet with a title, optional
/// description, and a row of action buttons. Use [BottomSheetType.cross]
/// for a dismissible sheet with a close button in the top-right corner and
/// up to three stacked action buttons.
class DSBottomSheet extends StatelessWidget {
  const DSBottomSheet({
    required this.title,
    super.key,
    this.description,
    this.type = BottomSheetType.standard,
    this.buttons,
    this.crossButton,
    this.onCrossPressed,
    this.onPrimaryButtonPressed,
    this.onSecondaryButtonPressed,
    this.onTertiaryButtonPressed,
    this.backgroundColor,
    this.elevation,
  });

  /// Bottom sheet title text.
  final String title;

  /// Optional description text.
  final String? description;

  /// Bottom sheet type: standard or cross.
  final BottomSheetType type;

  /// Optional buttons for standard bottom sheet.
  final List<Widget>? buttons;

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

  /// Background color override. Defaults to [DsColors.surface].
  final Color? backgroundColor;

  /// Elevation of the bottom sheet.
  final double? elevation;

  @override
  Widget build(BuildContext context) {
    final DsColors colors = DsColors.of(context);
    final Color effectiveBackground = backgroundColor ?? colors.surface;
    final List<Widget> effectiveButtons = buttons ?? const <Widget>[];

    // Default cross button when type is cross and no override is supplied.
    final Widget? effectiveCrossButton = crossButton ??
        (type == BottomSheetType.cross
            ? IconButton(
                icon: const Icon(Icons.close),
                onPressed: onCrossPressed,
              )
            : null);

    return ColoredBox(
      color: effectiveBackground,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: type == BottomSheetType.standard
            ? _buildStandard(effectiveButtons)
            : _buildCrossType(effectiveCrossButton),
      ),
    );
  }

  Widget _buildStandard(List<Widget> effectiveButtons) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        if (description != null) ...<Widget>[
          const SizedBox(height: 8.0),
          Text(
            description!,
            style: const TextStyle(color: Colors.grey),
          ),
        ],
        const SizedBox(height: 24.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: effectiveButtons,
        ),
      ],
    );
  }

  Widget _buildCrossType(Widget? effectiveCrossButton) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        // Close button row at the top.
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            if (effectiveCrossButton != null) effectiveCrossButton,
          ],
        ),
        const SizedBox(height: 24.0),
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        if (description != null) ...<Widget>[
          const SizedBox(height: 8.0),
          Text(
            description!,
            style: const TextStyle(color: Colors.grey),
          ),
        ],
        const SizedBox(height: 24.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            if (onTertiaryButtonPressed != null)
              _buildButton('Tertiary', onTertiaryButtonPressed),
            if (onSecondaryButtonPressed != null)
              _buildButton('Secondary', onSecondaryButtonPressed),
            if (onPrimaryButtonPressed != null)
              _buildButton('Primary', onPrimaryButtonPressed),
          ],
        ),
      ],
    );
  }

  Widget _buildButton(String label, VoidCallback? onPressed) {
    return TextButton(
      onPressed: onPressed,
      child: Text(label),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('title', title));
    properties.add(StringProperty('description', description));
    properties.add(EnumProperty<BottomSheetType>('type', type));
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
    properties.add(ColorProperty('backgroundColor', backgroundColor));
    properties.add(DoubleProperty('elevation', elevation));
  }
}
