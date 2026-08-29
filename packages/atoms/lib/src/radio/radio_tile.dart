import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:awesome_design_system_tokens/tokens.dart';
import '../text/index.dart';

/// A radio list tile following Material 3 conventions using DSText and tokens.
class DSRadioListTile extends StatelessWidget {
  const DSRadioListTile({
    required this.title,
    required this.groupId,
    required this.groupValue,
    super.key,
    this.subtitle,
    this.value,
    this.onChanged,
    this.secondaryIcon,
    this.thisEnabled = true,
    this.enabled,
  });

  final String title;
  final String? subtitle;
  final Object? value;
  final Object? groupValue;
  final String groupId;
  final ValueChanged<Object?>? onChanged;
  final Widget? secondaryIcon;
  final bool thisEnabled;
  final bool? enabled;

  bool get _effectiveEnabled => enabled ?? thisEnabled;

  @override
  Widget build(BuildContext context) {
    final DesignTokens? tokens = Theme.of(context).extension<DesignTokens>();
    final SpacingScale spacing =
        tokens?.spacing.scale ?? SpacingScale.defaultScale;
    final ColorScheme colors = Theme.of(context).colorScheme;
    final bool isSelected = groupValue == value;

    final Color toggleBorderColor =
        isSelected ? colors.primary : colors.outline;

    final Color toggleFillColor =
        isSelected ? colors.primary : Colors.transparent;

    const double toggleSize = 20.0;

    return InkWell(
      onTap: _effectiveEnabled && onChanged != null
          ? () => onChanged!(value)
          : null,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: spacing.xs,
          horizontal: spacing.md,
        ),
        child: Row(
          children: <Widget>[
            AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              width: toggleSize,
              height: toggleSize,
              decoration: BoxDecoration(
                color: toggleFillColor,
                border: Border.all(
                  color: toggleBorderColor,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(toggleSize / 2),
              ),
              child: isSelected
                  ? Icon(
                      Icons.check,
                      size: 12,
                      color: colors.onPrimary,
                    )
                  : const SizedBox.shrink(),
            ),
            SizedBox(width: spacing.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  DSText(
                    title,
                    variant: TextVariant.bodyLarge,
                    fontWeight: FontWeight.w500,
                  ),
                  if (subtitle != null) ...<Widget>[
                    SizedBox(height: spacing.xxs),
                    DSText(
                      subtitle!,
                      variant: TextVariant.bodyMedium,
                      colorRole: TextColorRole.secondary,
                    ),
                  ],
                ],
              ),
            ),
            if (secondaryIcon != null) secondaryIcon!,
          ],
        ),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('title', title));
    properties.add(StringProperty('subtitle', subtitle));
    properties.add(DiagnosticsProperty<Object?>('value', value));
    properties.add(DiagnosticsProperty<Object?>('groupValue', groupValue));
    properties.add(StringProperty('groupId', groupId));
    properties.add(
      ObjectFlagProperty<ValueChanged<Object?>?>.has('onChanged', onChanged),
    );
    properties.add(DiagnosticsProperty<bool>('thisEnabled', thisEnabled));
    properties.add(DiagnosticsProperty<bool?>('enabled', enabled));
  }
}
