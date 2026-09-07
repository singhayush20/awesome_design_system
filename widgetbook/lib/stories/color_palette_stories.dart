import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:awesome_design_system_tokens/tokens.dart';

import 'common.dart';

@widgetbook.UseCase(name: 'Material ColorScheme roles', type: ColorScheme)
Widget colorPalette(BuildContext context) {
  final ColorScheme colors = Theme.of(context).colorScheme;
  final List<(String, Color, Color)> roles = <(String, Color, Color)>[
    ('Primary', colors.primary, colors.onPrimary),
    ('Secondary', colors.secondary, colors.onSecondary),
    ('Tertiary', colors.tertiary, colors.onTertiary),
    ('Error', colors.error, colors.onError),
    ('Surface', colors.surface, colors.onSurface),
    ('Surface container', colors.surfaceContainerHighest, colors.onSurface),
    ('Outline', colors.outline, colors.onSurface),
  ];

  return StoryScaffold(
    children: <Widget>[
      SectionLabel('${Theme.of(context).brightness.name} theme'),
      Wrap(
        spacing: 12,
        runSpacing: 12,
        children: roles
            .map(
              ((String, Color, Color) role) => SizedBox(
                width: 160,
                height: 88,
                child: ColoredBox(
                  color: role.$2,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(role.$1, style: TextStyle(color: role.$3)),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    ],
  );
}

@widgetbook.UseCase(name: 'ColorTokens semantic roles', type: ColorTokens)
Widget colorTokensPalette(BuildContext context) {
  final ColorTokens? tokens = Theme.of(context).extension<ColorTokens>();
  final LightColorTokens lightColors = tokens?.resolveLight() ?? LightColorTokens.fromBrand(brandPrimary: Colors.blue);
  final DarkColorTokens darkColors = tokens?.resolveDark() ?? DarkColorTokens.fromBrand(brandPrimary: Colors.blue);
  final bool isDark = Theme.of(context).brightness == Brightness.dark;
  final dynamic colors = isDark ? darkColors : lightColors;

  final List<(String, Color)> semanticRoles = <(String, Color)>[
    // Status
    ('Success', colors.success),
    ('On Success', colors.onSuccess),
    ('Success Container', colors.successContainer),
    ('On Success Container', colors.onSuccessContainer),
    ('Warning', colors.warning),
    ('On Warning', colors.onWarning),
    ('Warning Container', colors.warningContainer),
    ('On Warning Container', colors.onWarningContainer),
    ('Info', colors.info),
    ('On Info', colors.onInfo),
    ('Info Container', colors.infoContainer),
    ('On Info Container', colors.onInfoContainer),
    // Text
    ('Text Primary', colors.textPrimary),
    ('Text Secondary', colors.textSecondary),
    ('Text Tertiary', colors.textTertiary),
    ('Text Disabled', colors.textDisabled),
    ('Text Link', colors.textLink),
    ('Text Success', colors.textSuccess),
    ('Text Warning', colors.textWarning),
    ('Text Error', colors.textError),
    // Background
    ('Background Primary', colors.backgroundPrimary),
    ('Background Surface', colors.backgroundSurface),
    ('Background Subtle', colors.backgroundSubtle),
    ('Background Success', colors.backgroundSuccess),
    ('Background Warning', colors.backgroundWarning),
    ('Background Error', colors.backgroundError),
    // Border
    ('Border Default', colors.borderDefault),
    ('Border Subtle', colors.borderSubtle),
    ('Border Primary', colors.borderPrimary),
    // Button
    ('Button Primary', colors.buttonPrimary),
    ('Button Primary Hover', colors.buttonPrimaryHover),
    ('Button Primary Pressed', colors.buttonPrimaryPressed),
    ('Button Secondary', colors.buttonSecondary),
    ('Button Secondary Hover', colors.buttonSecondaryHover),
    ('Button Destructive', colors.buttonDestructive),
    // Text Field
    ('Text Field Background', colors.textFieldBackground),
    ('Text Field Border', colors.textFieldBorder),
    ('Text Field Border Focused', colors.textFieldBorderFocused),
    ('Text Field Border Error', colors.textFieldBorderError),
    // Icon
    ('Icon Primary', colors.iconPrimary),
    ('Icon Secondary', colors.iconSecondary),
    ('Icon Success', colors.iconSuccess),
    ('Icon Warning', colors.iconWarning),
    ('Icon Error', colors.iconError),
    // Utility
    ('Divider', colors.dividerColor),
    ('Overlay', colors.overlayColor),
    ('Navigation Bar Shadow', colors.navigationBarShadow),
  ];

  return StoryScaffold(
    children: <Widget>[
      SectionLabel('${isDark ? 'Dark' : 'Light'} theme - ColorTokens semantic roles'),
      Wrap(
        spacing: 12,
        runSpacing: 12,
        children: semanticRoles
            .map(
              ((String, Color) role) => SizedBox(
                width: 180,
                height: 60,
                child: ColoredBox(
                  color: role.$2,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      role.$1,
                      style: TextStyle(
                        color: _computeTextColor(role.$2),
                        fontSize: 11,
                      ),
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    ],
  );
}

Color _computeTextColor(Color background) {
  final double luminance = background.computeLuminance();
  return luminance > 0.5 ? Colors.black : Colors.white;
}
