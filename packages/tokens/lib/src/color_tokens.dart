// Color tokens following Material 3 ColorScheme
// Supports light/dark themes with brand color customization
// Extended with comprehensive semantic colors for components

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Default brand color constant used as fallback
const Color defaultBrandPurple = Color(0xFF6750A4);

/// Common semantic + Material 3 color contract shared by
/// [LightColorTokens] and [DarkColorTokens].
@immutable
abstract class AppColorTokens extends ColorScheme {
  const AppColorTokens({
    required super.brightness,
    required super.primary,
    required super.onPrimary,
    required super.primaryContainer,
    required super.onPrimaryContainer,
    required super.secondary,
    required super.onSecondary,
    required super.secondaryContainer,
    required super.onSecondaryContainer,
    required super.tertiary,
    required super.onTertiary,
    required super.tertiaryContainer,
    required super.onTertiaryContainer,
    required super.error,
    required super.onError,
    required super.errorContainer,
    required super.onErrorContainer,
    required super.surface,
    required super.onSurface,
    required super.surfaceContainerHighest,
    required super.onSurfaceVariant,
    required super.outline,
    required super.outlineVariant,
    required super.shadow,
    required super.scrim,
    required super.inverseSurface,
    required super.inversePrimary,
    required super.surfaceTint,
    // Status Colors
    required this.success,
    required this.onSuccess,
    required this.successContainer,
    required this.onSuccessContainer,
    required this.warning,
    required this.onWarning,
    required this.warningContainer,
    required this.onWarningContainer,
    required this.info,
    required this.onInfo,
    required this.infoContainer,
    required this.onInfoContainer,
    // Text Colors
    required this.textPrimary,
    required this.textSecondary,
    required this.textTertiary,
    required this.textDisabled,
    required this.textOnDark,
    required this.textLink,
    required this.textSuccess,
    required this.textWarning,
    required this.textError,
    required this.textAccent,
    // Background Colors
    required this.backgroundPrimary,
    required this.backgroundSurface,
    required this.backgroundSubtle,
    required this.backgroundSuccess,
    required this.backgroundEnabled,
    required this.backgroundWarning,
    required this.backgroundError,
    required this.backgroundInfo,
    required this.backgroundDisabled,
    // Border Colors
    required this.borderDefault,
    required this.borderDefaultSecondary,
    required this.borderSubtle,
    required this.borderDisabled,
    required this.borderPrimary,
    required this.borderSuccess,
    required this.borderWarning,
    required this.borderError,
    required this.borderInfo,
    // Button Colors
    required this.buttonPrimary,
    required this.buttonPrimaryHover,
    required this.buttonPrimaryDisabled,
    required this.buttonPrimaryText,
    required this.buttonPrimaryTextDisabled,
    required this.buttonPrimaryPressed,
    required this.buttonSecondary,
    required this.buttonSecondaryBorder,
    required this.buttonSecondaryText,
    required this.buttonSecondaryHover,
    required this.buttonSecondaryDisabled,
    required this.buttonSecondaryPressed,
    required this.buttonSecondaryBorderDisabled,
    required this.buttonTertiaryText,
    required this.buttonTertiaryHover,
    required this.buttonDestructive,
    required this.buttonDestructiveHover,
    required this.buttonDestructiveDisabled,
    required this.buttonDestructiveText,
    // Text Field Colors
    required this.textFieldBackground,
    required this.textFieldText,
    required this.textFieldBorder,
    required this.textFieldBorderFocused,
    required this.textFieldBorderHover,
    required this.textFieldBorderDisabled,
    required this.textFieldBorderError,
    required this.textFieldBorderSuccess,
    required this.textFieldBackgroundDisabled,
    required this.textFieldTextDisabled,
    required this.textFieldHint,
    required this.textFieldCursor,
    required this.textFieldCursorError,
    required this.textFieldLabel,
    required this.textFieldLabelFocused,
    required this.textFieldHelper,
    required this.textFieldErrorText,
    required this.textFieldSuccessText,
    // Icon Colors
    required this.iconPrimary,
    required this.iconSecondary,
    required this.iconDisabled,
    required this.iconOnPrimary,
    required this.iconSuccess,
    required this.iconWarning,
    required this.iconError,
    required this.iconInfo,
    // Utility Colors
    required this.navigationBarShadow,
    required this.overlayColor,
    required this.dividerColor,
    required this.dividerColorSecondary,
    required this.transparent,
  }) : super();

  // Status Colors
  final Color success;
  final Color onSuccess;
  final Color successContainer;
  final Color onSuccessContainer;
  final Color warning;
  final Color onWarning;
  final Color warningContainer;
  final Color onWarningContainer;
  final Color info;
  final Color onInfo;
  final Color infoContainer;
  final Color onInfoContainer;

  // Text Colors
  final Color textPrimary;
  final Color textSecondary;
  final Color textTertiary;
  final Color textDisabled;
  final Color textOnDark;
  final Color textLink;
  final Color textSuccess;
  final Color textWarning;
  final Color textError;
  final Color textAccent;

  // Background Colors
  final Color backgroundPrimary;
  final Color backgroundSurface;
  final Color backgroundSubtle;
  final Color backgroundSuccess;
  final Color backgroundEnabled;
  final Color backgroundWarning;
  final Color backgroundError;
  final Color backgroundInfo;
  final Color backgroundDisabled;

  // Border Colors
  final Color borderDefault;
  final Color borderDefaultSecondary;
  final Color borderSubtle;
  final Color borderDisabled;
  final Color borderPrimary;
  final Color borderSuccess;
  final Color borderWarning;
  final Color borderError;
  final Color borderInfo;

  // Button Colors
  final Color buttonPrimary;
  final Color buttonPrimaryHover;
  final Color buttonPrimaryDisabled;
  final Color buttonPrimaryText;
  final Color buttonPrimaryTextDisabled;
  final Color buttonPrimaryPressed;
  final Color buttonSecondary;
  final Color buttonSecondaryBorder;
  final Color buttonSecondaryText;
  final Color buttonSecondaryHover;
  final Color buttonSecondaryDisabled;
  final Color buttonSecondaryPressed;
  final Color buttonSecondaryBorderDisabled;
  final Color buttonTertiaryText;
  final Color buttonTertiaryHover;
  final Color buttonDestructive;
  final Color buttonDestructiveHover;
  final Color buttonDestructiveDisabled;
  final Color buttonDestructiveText;

  // Text Field Colors
  final Color textFieldBackground;
  final Color textFieldText;
  final Color textFieldBorder;
  final Color textFieldBorderFocused;
  final Color textFieldBorderHover;
  final Color textFieldBorderDisabled;
  final Color textFieldBorderError;
  final Color textFieldBorderSuccess;
  final Color textFieldBackgroundDisabled;
  final Color textFieldTextDisabled;
  final Color textFieldHint;
  final Color textFieldCursor;
  final Color textFieldCursorError;
  final Color textFieldLabel;
  final Color textFieldLabelFocused;
  final Color textFieldHelper;
  final Color textFieldErrorText;
  final Color textFieldSuccessText;

  // Icon Colors
  final Color iconPrimary;
  final Color iconSecondary;
  final Color iconDisabled;
  final Color iconOnPrimary;
  final Color iconSuccess;
  final Color iconWarning;
  final Color iconError;
  final Color iconInfo;

  // Utility Colors
  final Color navigationBarShadow;
  final Color overlayColor;
  final Color dividerColor;
  final Color dividerColorSecondary;
  final Color transparent;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      // Status Colors
      ..add(ColorProperty('success', success))
      ..add(ColorProperty('onSuccess', onSuccess))
      ..add(ColorProperty('successContainer', successContainer))
      ..add(ColorProperty('onSuccessContainer', onSuccessContainer))
      ..add(ColorProperty('warning', warning))
      ..add(ColorProperty('onWarning', onWarning))
      ..add(ColorProperty('warningContainer', warningContainer))
      ..add(ColorProperty('onWarningContainer', onWarningContainer))
      ..add(ColorProperty('info', info))
      ..add(ColorProperty('onInfo', onInfo))
      ..add(ColorProperty('infoContainer', infoContainer))
      ..add(ColorProperty('onInfoContainer', onInfoContainer))
      // Text Colors
      ..add(ColorProperty('textPrimary', textPrimary))
      ..add(ColorProperty('textSecondary', textSecondary))
      ..add(ColorProperty('textTertiary', textTertiary))
      ..add(ColorProperty('textDisabled', textDisabled))
      ..add(ColorProperty('textOnDark', textOnDark))
      ..add(ColorProperty('textLink', textLink))
      ..add(ColorProperty('textSuccess', textSuccess))
      ..add(ColorProperty('textWarning', textWarning))
      ..add(ColorProperty('textError', textError))
      ..add(ColorProperty('textAccent', textAccent))
      // Background Colors
      ..add(ColorProperty('backgroundPrimary', backgroundPrimary))
      ..add(ColorProperty('backgroundSurface', backgroundSurface))
      ..add(ColorProperty('backgroundSubtle', backgroundSubtle))
      ..add(ColorProperty('backgroundSuccess', backgroundSuccess))
      ..add(ColorProperty('backgroundEnabled', backgroundEnabled))
      ..add(ColorProperty('backgroundWarning', backgroundWarning))
      ..add(ColorProperty('backgroundError', backgroundError))
      ..add(ColorProperty('backgroundInfo', backgroundInfo))
      ..add(ColorProperty('backgroundDisabled', backgroundDisabled))
      // Border Colors
      ..add(ColorProperty('borderDefault', borderDefault))
      ..add(ColorProperty('borderDefaultSecondary', borderDefaultSecondary))
      ..add(ColorProperty('borderSubtle', borderSubtle))
      ..add(ColorProperty('borderDisabled', borderDisabled))
      ..add(ColorProperty('borderPrimary', borderPrimary))
      ..add(ColorProperty('borderSuccess', borderSuccess))
      ..add(ColorProperty('borderWarning', borderWarning))
      ..add(ColorProperty('borderError', borderError))
      ..add(ColorProperty('borderInfo', borderInfo))
      // Button Colors
      ..add(ColorProperty('buttonPrimary', buttonPrimary))
      ..add(ColorProperty('buttonPrimaryHover', buttonPrimaryHover))
      ..add(ColorProperty('buttonPrimaryDisabled', buttonPrimaryDisabled))
      ..add(ColorProperty('buttonPrimaryText', buttonPrimaryText))
      ..add(ColorProperty('buttonPrimaryTextDisabled', buttonPrimaryTextDisabled))
      ..add(ColorProperty('buttonPrimaryPressed', buttonPrimaryPressed))
      ..add(ColorProperty('buttonSecondary', buttonSecondary))
      ..add(ColorProperty('buttonSecondaryBorder', buttonSecondaryBorder))
      ..add(ColorProperty('buttonSecondaryText', buttonSecondaryText))
      ..add(ColorProperty('buttonSecondaryHover', buttonSecondaryHover))
      ..add(ColorProperty('buttonSecondaryDisabled', buttonSecondaryDisabled))
      ..add(ColorProperty('buttonSecondaryPressed', buttonSecondaryPressed))
      ..add(ColorProperty('buttonSecondaryBorderDisabled', buttonSecondaryBorderDisabled))
      ..add(ColorProperty('buttonTertiaryText', buttonTertiaryText))
      ..add(ColorProperty('buttonTertiaryHover', buttonTertiaryHover))
      ..add(ColorProperty('buttonDestructive', buttonDestructive))
      ..add(ColorProperty('buttonDestructiveHover', buttonDestructiveHover))
      ..add(ColorProperty('buttonDestructiveDisabled', buttonDestructiveDisabled))
      ..add(ColorProperty('buttonDestructiveText', buttonDestructiveText))
      // Text Field Colors
      ..add(ColorProperty('textFieldBackground', textFieldBackground))
      ..add(ColorProperty('textFieldText', textFieldText))
      ..add(ColorProperty('textFieldBorder', textFieldBorder))
      ..add(ColorProperty('textFieldBorderFocused', textFieldBorderFocused))
      ..add(ColorProperty('textFieldBorderHover', textFieldBorderHover))
      ..add(ColorProperty('textFieldBorderDisabled', textFieldBorderDisabled))
      ..add(ColorProperty('textFieldBorderError', textFieldBorderError))
      ..add(ColorProperty('textFieldBorderSuccess', textFieldBorderSuccess))
      ..add(ColorProperty('textFieldBackgroundDisabled', textFieldBackgroundDisabled))
      ..add(ColorProperty('textFieldTextDisabled', textFieldTextDisabled))
      ..add(ColorProperty('textFieldHint', textFieldHint))
      ..add(ColorProperty('textFieldCursor', textFieldCursor))
      ..add(ColorProperty('textFieldCursorError', textFieldCursorError))
      ..add(ColorProperty('textFieldLabel', textFieldLabel))
      ..add(ColorProperty('textFieldLabelFocused', textFieldLabelFocused))
      ..add(ColorProperty('textFieldHelper', textFieldHelper))
      ..add(ColorProperty('textFieldErrorText', textFieldErrorText))
      ..add(ColorProperty('textFieldSuccessText', textFieldSuccessText))
      // Icon Colors
      ..add(ColorProperty('iconPrimary', iconPrimary))
      ..add(ColorProperty('iconSecondary', iconSecondary))
      ..add(ColorProperty('iconDisabled', iconDisabled))
      ..add(ColorProperty('iconOnPrimary', iconOnPrimary))
      ..add(ColorProperty('iconSuccess', iconSuccess))
      ..add(ColorProperty('iconWarning', iconWarning))
      ..add(ColorProperty('iconError', iconError))
      ..add(ColorProperty('iconInfo', iconInfo))
      // Utility Colors
      ..add(ColorProperty('navigationBarShadow', navigationBarShadow))
      ..add(ColorProperty('overlayColor', overlayColor))
      ..add(ColorProperty('dividerColor', dividerColor))
      ..add(ColorProperty('dividerColorSecondary', dividerColorSecondary))
      ..add(ColorProperty('transparent', transparent));
  }
}

/// Material 3 color roles for light theme - extended with semantic colors
@immutable
class LightColorTokens extends AppColorTokens {
  const LightColorTokens({
    required super.primary,
    required super.onPrimary,
    required super.primaryContainer,
    required super.onPrimaryContainer,
    required super.secondary,
    required super.onSecondary,
    required super.secondaryContainer,
    required super.onSecondaryContainer,
    required super.tertiary,
    required super.onTertiary,
    required super.tertiaryContainer,
    required super.onTertiaryContainer,
    required super.error,
    required super.onError,
    required super.errorContainer,
    required super.onErrorContainer,
    required super.surface,
    required super.onSurface,
    required super.surfaceContainerHighest,
    required super.onSurfaceVariant,
    required super.outline,
    required super.outlineVariant,
    required super.shadow,
    required super.scrim,
    required super.inverseSurface,
    required super.inversePrimary,
    required super.surfaceTint,
    // Status Colors
    required super.success,
    required super.onSuccess,
    required super.successContainer,
    required super.onSuccessContainer,
    required super.warning,
    required super.onWarning,
    required super.warningContainer,
    required super.onWarningContainer,
    required super.info,
    required super.onInfo,
    required super.infoContainer,
    required super.onInfoContainer,
    // Text Colors
    required super.textPrimary,
    required super.textSecondary,
    required super.textTertiary,
    required super.textDisabled,
    required super.textOnDark,
    required super.textLink,
    required super.textSuccess,
    required super.textWarning,
    required super.textError,
    required super.textAccent,
    // Background Colors
    required super.backgroundPrimary,
    required super.backgroundSurface,
    required super.backgroundSubtle,
    required super.backgroundSuccess,
    required super.backgroundEnabled,
    required super.backgroundWarning,
    required super.backgroundError,
    required super.backgroundInfo,
    required super.backgroundDisabled,
    // Border Colors
    required super.borderDefault,
    required super.borderDefaultSecondary,
    required super.borderSubtle,
    required super.borderDisabled,
    required super.borderPrimary,
    required super.borderSuccess,
    required super.borderWarning,
    required super.borderError,
    required super.borderInfo,
    // Button Colors
    required super.buttonPrimary,
    required super.buttonPrimaryHover,
    required super.buttonPrimaryDisabled,
    required super.buttonPrimaryText,
    required super.buttonPrimaryTextDisabled,
    required super.buttonPrimaryPressed,
    required super.buttonSecondary,
    required super.buttonSecondaryBorder,
    required super.buttonSecondaryText,
    required super.buttonSecondaryHover,
    required super.buttonSecondaryDisabled,
    required super.buttonSecondaryPressed,
    required super.buttonSecondaryBorderDisabled,
    required super.buttonTertiaryText,
    required super.buttonTertiaryHover,
    required super.buttonDestructive,
    required super.buttonDestructiveHover,
    required super.buttonDestructiveDisabled,
    required super.buttonDestructiveText,
    // Text Field Colors
    required super.textFieldBackground,
    required super.textFieldText,
    required super.textFieldBorder,
    required super.textFieldBorderFocused,
    required super.textFieldBorderHover,
    required super.textFieldBorderDisabled,
    required super.textFieldBorderError,
    required super.textFieldBorderSuccess,
    required super.textFieldBackgroundDisabled,
    required super.textFieldTextDisabled,
    required super.textFieldHint,
    required super.textFieldCursor,
    required super.textFieldCursorError,
    required super.textFieldLabel,
    required super.textFieldLabelFocused,
    required super.textFieldHelper,
    required super.textFieldErrorText,
    required super.textFieldSuccessText,
    // Icon Colors
    required super.iconPrimary,
    required super.iconSecondary,
    required super.iconDisabled,
    required super.iconOnPrimary,
    required super.iconSuccess,
    required super.iconWarning,
    required super.iconError,
    required super.iconInfo,
    // Utility Colors
    required super.navigationBarShadow,
    required super.overlayColor,
    required super.dividerColor,
    required super.dividerColorSecondary,
    required super.transparent,
  }) : super(brightness: Brightness.light);

  factory LightColorTokens.fromBrand({
    required Color brandPrimary,
    Color? brandSecondary,
    Color? brandTertiary,
    Color? brandError,
    Color? brandSuccess,
    Color? brandWarning,
    Color? brandInfo,
  }) {
    final Map<int, Color> primaryPalette = _generateTonalPalette(brandPrimary);
    final Map<int, Color> secondaryPalette = _generateTonalPalette(
      brandSecondary ?? brandPrimary.withBlue(200),
    );
    final Map<int, Color> tertiaryPalette = _generateTonalPalette(
      brandTertiary ?? brandPrimary.withGreen(150),
    );
    final Map<int, Color> errorPalette = _generateTonalPalette(
      brandError ?? const Color(0xFFBA1A1A),
    );
    final Map<int, Color> successPalette = _generateTonalPalette(
      brandSuccess ?? const Color(0xFF4CAF50),
    );
    final Map<int, Color> warningPalette = _generateTonalPalette(
      brandWarning ?? const Color(0xFFFF9800),
    );
    final Map<int, Color> infoPalette = _generateTonalPalette(
      brandInfo ?? brandPrimary,
    );

    return LightColorTokens(
      // Material 3 Base
      primary: primaryPalette[40]!,
      onPrimary: primaryPalette[100]!,
      primaryContainer: primaryPalette[90]!,
      onPrimaryContainer: primaryPalette[10]!,
      secondary: secondaryPalette[40]!,
      onSecondary: secondaryPalette[100]!,
      secondaryContainer: secondaryPalette[90]!,
      onSecondaryContainer: secondaryPalette[10]!,
      tertiary: tertiaryPalette[40]!,
      onTertiary: tertiaryPalette[100]!,
      tertiaryContainer: tertiaryPalette[90]!,
      onTertiaryContainer: tertiaryPalette[10]!,
      error: errorPalette[40]!,
      onError: errorPalette[100]!,
      errorContainer: errorPalette[90]!,
      onErrorContainer: errorPalette[10]!,
      surface: const Color(0xFFFFFBFE),
      onSurface: const Color(0xFF1C1B1F),
      surfaceContainerHighest: const Color(0xFFE7E0EC),
      onSurfaceVariant: const Color(0xFF49454F),
      outline: const Color(0xFF79747E),
      outlineVariant: const Color(0xFFCAC4D0),
      shadow: const Color(0xFF000000),
      scrim: const Color(0xFF000000),
      inverseSurface: const Color(0xFF313033),
      inversePrimary: primaryPalette[80]!,
      surfaceTint: primaryPalette[40]!,
      // Status Colors
      success: successPalette[40]!,
      onSuccess: successPalette[100]!,
      successContainer: successPalette[90]!,
      onSuccessContainer: successPalette[10]!,
      warning: warningPalette[40]!,
      onWarning: warningPalette[100]!,
      warningContainer: warningPalette[90]!,
      onWarningContainer: warningPalette[10]!,
      info: infoPalette[40]!,
      onInfo: infoPalette[100]!,
      infoContainer: infoPalette[90]!,
      onInfoContainer: infoPalette[10]!,
      // Text Colors
      textPrimary: const Color(0xFF000000),
      textSecondary: const Color(0xFF616161),
      textTertiary: const Color(0xFF9E9E9E),
      textDisabled: const Color(0xFFBDBDBD),
      textOnDark: const Color(0xFFFFFFFF),
      textLink: primaryPalette[70]!,
      textSuccess: successPalette[80]!,
      textWarning: warningPalette[80]!,
      textError: errorPalette[80]!,
      textAccent: primaryPalette[60]!,
      // Background Colors
      backgroundPrimary: const Color(0xFFFFFFFF),
      backgroundSurface: const Color(0xFFF5F5F5),
      backgroundSubtle: primaryPalette[90]!,
      backgroundSuccess: successPalette[40]!,
      backgroundEnabled: successPalette[100]!,
      backgroundWarning: warningPalette[70]!,
      backgroundError: errorPalette[70]!,
      backgroundInfo: primaryPalette[90]!,
      backgroundDisabled: const Color(0xFFEEEEEE),
      // Border Colors
      borderDefault: const Color(0xFF616161),
      borderDefaultSecondary: const Color(0xFFBDBDBD),
      borderSubtle: const Color(0xFFEEEEEE),
      borderDisabled: const Color(0xFF9E9E9E),
      borderPrimary: primaryPalette[40]!,
      borderSuccess: successPalette[40]!,
      borderWarning: warningPalette[40]!,
      borderError: errorPalette[40]!,
      borderInfo: infoPalette[40]!,
      // Button Colors
      buttonPrimary: primaryPalette[40]!,
      buttonPrimaryHover: primaryPalette[80]!,
      buttonPrimaryDisabled: const Color(0xFFEEEEEE),
      buttonPrimaryText: const Color(0xFFFFFFFF),
      buttonPrimaryTextDisabled: const Color(0xFF9E9E9E),
      buttonPrimaryPressed: primaryPalette[30]!,
      buttonSecondary: const Color(0xFFFFFFFF),
      buttonSecondaryBorder: primaryPalette[40]!,
      buttonSecondaryText: primaryPalette[40]!,
      buttonSecondaryHover: primaryPalette[90]!,
      buttonSecondaryDisabled: const Color(0xFFEEEEEE),
      buttonSecondaryPressed: primaryPalette[30]!,
      buttonSecondaryBorderDisabled: const Color(0xFF9E9E9E),
      buttonTertiaryText: primaryPalette[40]!,
      buttonTertiaryHover: primaryPalette[90]!,
      buttonDestructive: errorPalette[60]!,
      buttonDestructiveHover: errorPalette[70]!,
      buttonDestructiveDisabled: errorPalette[100]!,
      buttonDestructiveText: const Color(0xFFFFFFFF),
      // Text Field Colors
      textFieldBackground: const Color(0xFFFFFFFF),
      textFieldText: const Color(0xFF424242),
      textFieldBorder: const Color(0xFFBDBDBD),
      textFieldBorderFocused: primaryPalette[40]!,
      textFieldBorderHover: primaryPalette[30]!,
      textFieldBorderDisabled: const Color(0xFFEEEEEE),
      textFieldBorderError: errorPalette[60]!,
      textFieldBorderSuccess: successPalette[40]!,
      textFieldBackgroundDisabled: const Color(0xFFF5F5F5),
      textFieldTextDisabled: const Color(0xFF9E9E9E),
      textFieldHint: const Color(0xFF9E9E9E),
      textFieldCursor: primaryPalette[40]!,
      textFieldCursorError: errorPalette[60]!,
      textFieldLabel: const Color(0xFF616161),
      textFieldLabelFocused: primaryPalette[80]!,
      textFieldHelper: const Color(0xFF757575),
      textFieldErrorText: errorPalette[70]!,
      textFieldSuccessText: successPalette[70]!,
      // Icon Colors
      iconPrimary: const Color(0xFF424242),
      iconSecondary: const Color(0xFF757575),
      iconDisabled: const Color(0xFFBDBDBD),
      iconOnPrimary: const Color(0xFFFFFFFF),
      iconSuccess: successPalette[40]!,
      iconWarning: warningPalette[40]!,
      iconError: errorPalette[40]!,
      iconInfo: primaryPalette[50]!,
      // Utility Colors
      navigationBarShadow: const Color(0x52000000),
      overlayColor: const Color(0x95FFFFFF),
      dividerColor: const Color(0xFF424242),
      dividerColorSecondary: const Color(0xFF757575),
      transparent: const Color(0x00000000),
    );
  }

  static Map<int, Color> _generateTonalPalette(Color color) {
    final HSLColor hsl = HSLColor.fromColor(color);
    final Map<int, Color> map = <int, Color>{};
    for (int i = 0; i <= 100; i += 10) {
      map[i] = hsl.withLightness(i / 100).toColor();
    }
    return map;
  }

  static LightColorTokens lerp(LightColorTokens? a, LightColorTokens? b, double t) {
    if (a == null && b == null) return LightColorTokens.fromBrand(brandPrimary: defaultBrandPurple);
    if (a == null) return b!;
    if (b == null) return a;
    return LightColorTokens(
      primary: Color.lerp(a.primary, b.primary, t)!,
      onPrimary: Color.lerp(a.onPrimary, b.onPrimary, t)!,
      primaryContainer: Color.lerp(a.primaryContainer, b.primaryContainer, t)!,
      onPrimaryContainer: Color.lerp(a.onPrimaryContainer, b.onPrimaryContainer, t)!,
      secondary: Color.lerp(a.secondary, b.secondary, t)!,
      onSecondary: Color.lerp(a.onSecondary, b.onSecondary, t)!,
      secondaryContainer: Color.lerp(a.secondaryContainer, b.secondaryContainer, t)!,
      onSecondaryContainer: Color.lerp(a.onSecondaryContainer, b.onSecondaryContainer, t)!,
      tertiary: Color.lerp(a.tertiary, b.tertiary, t)!,
      onTertiary: Color.lerp(a.onTertiary, b.onTertiary, t)!,
      tertiaryContainer: Color.lerp(a.tertiaryContainer, b.tertiaryContainer, t)!,
      onTertiaryContainer: Color.lerp(a.onTertiaryContainer, b.onTertiaryContainer, t)!,
      error: Color.lerp(a.error, b.error, t)!,
      onError: Color.lerp(a.onError, b.onError, t)!,
      errorContainer: Color.lerp(a.errorContainer, b.errorContainer, t)!,
      onErrorContainer: Color.lerp(a.onErrorContainer, b.onErrorContainer, t)!,
      surface: Color.lerp(a.surface, b.surface, t)!,
      onSurface: Color.lerp(a.onSurface, b.onSurface, t)!,
      surfaceContainerHighest: Color.lerp(a.surfaceContainerHighest, b.surfaceContainerHighest, t)!,
      onSurfaceVariant: Color.lerp(a.onSurfaceVariant, b.onSurfaceVariant, t)!,
      outline: Color.lerp(a.outline, b.outline, t)!,
      outlineVariant: Color.lerp(a.outlineVariant, b.outlineVariant, t)!,
      shadow: Color.lerp(a.shadow, b.shadow, t)!,
      scrim: Color.lerp(a.scrim, b.scrim, t)!,
      inverseSurface: Color.lerp(a.inverseSurface, b.inverseSurface, t)!,
      inversePrimary: Color.lerp(a.inversePrimary, b.inversePrimary, t)!,
      surfaceTint: Color.lerp(a.surfaceTint, b.surfaceTint, t)!,
      success: Color.lerp(a.success, b.success, t)!,
      onSuccess: Color.lerp(a.onSuccess, b.onSuccess, t)!,
      successContainer: Color.lerp(a.successContainer, b.successContainer, t)!,
      onSuccessContainer: Color.lerp(a.onSuccessContainer, b.onSuccessContainer, t)!,
      warning: Color.lerp(a.warning, b.warning, t)!,
      onWarning: Color.lerp(a.onWarning, b.onWarning, t)!,
      warningContainer: Color.lerp(a.warningContainer, b.warningContainer, t)!,
      onWarningContainer: Color.lerp(a.onWarningContainer, b.onWarningContainer, t)!,
      info: Color.lerp(a.info, b.info, t)!,
      onInfo: Color.lerp(a.onInfo, b.onInfo, t)!,
      infoContainer: Color.lerp(a.infoContainer, b.infoContainer, t)!,
      onInfoContainer: Color.lerp(a.onInfoContainer, b.onInfoContainer, t)!,
      textPrimary: Color.lerp(a.textPrimary, b.textPrimary, t)!,
      textSecondary: Color.lerp(a.textSecondary, b.textSecondary, t)!,
      textTertiary: Color.lerp(a.textTertiary, b.textTertiary, t)!,
      textDisabled: Color.lerp(a.textDisabled, b.textDisabled, t)!,
      textOnDark: Color.lerp(a.textOnDark, b.textOnDark, t)!,
      textLink: Color.lerp(a.textLink, b.textLink, t)!,
      textSuccess: Color.lerp(a.textSuccess, b.textSuccess, t)!,
      textWarning: Color.lerp(a.textWarning, b.textWarning, t)!,
      textError: Color.lerp(a.textError, b.textError, t)!,
      textAccent: Color.lerp(a.textAccent, b.textAccent, t)!,
      backgroundPrimary: Color.lerp(a.backgroundPrimary, b.backgroundPrimary, t)!,
      backgroundSurface: Color.lerp(a.backgroundSurface, b.backgroundSurface, t)!,
      backgroundSubtle: Color.lerp(a.backgroundSubtle, b.backgroundSubtle, t)!,
      backgroundSuccess: Color.lerp(a.backgroundSuccess, b.backgroundSuccess, t)!,
      backgroundEnabled: Color.lerp(a.backgroundEnabled, b.backgroundEnabled, t)!,
      backgroundWarning: Color.lerp(a.backgroundWarning, b.backgroundWarning, t)!,
      backgroundError: Color.lerp(a.backgroundError, b.backgroundError, t)!,
      backgroundInfo: Color.lerp(a.backgroundInfo, b.backgroundInfo, t)!,
      backgroundDisabled: Color.lerp(a.backgroundDisabled, b.backgroundDisabled, t)!,
      borderDefault: Color.lerp(a.borderDefault, b.borderDefault, t)!,
      borderDefaultSecondary: Color.lerp(a.borderDefaultSecondary, b.borderDefaultSecondary, t)!,
      borderSubtle: Color.lerp(a.borderSubtle, b.borderSubtle, t)!,
      borderDisabled: Color.lerp(a.borderDisabled, b.borderDisabled, t)!,
      borderPrimary: Color.lerp(a.borderPrimary, b.borderPrimary, t)!,
      borderSuccess: Color.lerp(a.borderSuccess, b.borderSuccess, t)!,
      borderWarning: Color.lerp(a.borderWarning, b.borderWarning, t)!,
      borderError: Color.lerp(a.borderError, b.borderError, t)!,
      borderInfo: Color.lerp(a.borderInfo, b.borderInfo, t)!,
      buttonPrimary: Color.lerp(a.buttonPrimary, b.buttonPrimary, t)!,
      buttonPrimaryHover: Color.lerp(a.buttonPrimaryHover, b.buttonPrimaryHover, t)!,
      buttonPrimaryDisabled: Color.lerp(a.buttonPrimaryDisabled, b.buttonPrimaryDisabled, t)!,
      buttonPrimaryText: Color.lerp(a.buttonPrimaryText, b.buttonPrimaryText, t)!,
      buttonPrimaryTextDisabled: Color.lerp(a.buttonPrimaryTextDisabled, b.buttonPrimaryTextDisabled, t)!,
      buttonPrimaryPressed: Color.lerp(a.buttonPrimaryPressed, b.buttonPrimaryPressed, t)!,
      buttonSecondary: Color.lerp(a.buttonSecondary, b.buttonSecondary, t)!,
      buttonSecondaryBorder: Color.lerp(a.buttonSecondaryBorder, b.buttonSecondaryBorder, t)!,
      buttonSecondaryText: Color.lerp(a.buttonSecondaryText, b.buttonSecondaryText, t)!,
      buttonSecondaryHover: Color.lerp(a.buttonSecondaryHover, b.buttonSecondaryHover, t)!,
      buttonSecondaryDisabled: Color.lerp(a.buttonSecondaryDisabled, b.buttonSecondaryDisabled, t)!,
      buttonSecondaryPressed: Color.lerp(a.buttonSecondaryPressed, b.buttonSecondaryPressed, t)!,
      buttonSecondaryBorderDisabled: Color.lerp(a.buttonSecondaryBorderDisabled, b.buttonSecondaryBorderDisabled, t)!,
      buttonTertiaryText: Color.lerp(a.buttonTertiaryText, b.buttonTertiaryText, t)!,
      buttonTertiaryHover: Color.lerp(a.buttonTertiaryHover, b.buttonTertiaryHover, t)!,
      buttonDestructive: Color.lerp(a.buttonDestructive, b.buttonDestructive, t)!,
      buttonDestructiveHover: Color.lerp(a.buttonDestructiveHover, b.buttonDestructiveHover, t)!,
      buttonDestructiveDisabled: Color.lerp(a.buttonDestructiveDisabled, b.buttonDestructiveDisabled, t)!,
      buttonDestructiveText: Color.lerp(a.buttonDestructiveText, b.buttonDestructiveText, t)!,
      textFieldBackground: Color.lerp(a.textFieldBackground, b.textFieldBackground, t)!,
      textFieldText: Color.lerp(a.textFieldText, b.textFieldText, t)!,
      textFieldBorder: Color.lerp(a.textFieldBorder, b.textFieldBorder, t)!,
      textFieldBorderFocused: Color.lerp(a.textFieldBorderFocused, b.textFieldBorderFocused, t)!,
      textFieldBorderHover: Color.lerp(a.textFieldBorderHover, b.textFieldBorderHover, t)!,
      textFieldBorderDisabled: Color.lerp(a.textFieldBorderDisabled, b.textFieldBorderDisabled, t)!,
      textFieldBorderError: Color.lerp(a.textFieldBorderError, b.textFieldBorderError, t)!,
      textFieldBorderSuccess: Color.lerp(a.textFieldBorderSuccess, b.textFieldBorderSuccess, t)!,
      textFieldBackgroundDisabled: Color.lerp(a.textFieldBackgroundDisabled, b.textFieldBackgroundDisabled, t)!,
      textFieldTextDisabled: Color.lerp(a.textFieldTextDisabled, b.textFieldTextDisabled, t)!,
      textFieldHint: Color.lerp(a.textFieldHint, b.textFieldHint, t)!,
      textFieldCursor: Color.lerp(a.textFieldCursor, b.textFieldCursor, t)!,
      textFieldCursorError: Color.lerp(a.textFieldCursorError, b.textFieldCursorError, t)!,
      textFieldLabel: Color.lerp(a.textFieldLabel, b.textFieldLabel, t)!,
      textFieldLabelFocused: Color.lerp(a.textFieldLabelFocused, b.textFieldLabelFocused, t)!,
      textFieldHelper: Color.lerp(a.textFieldHelper, b.textFieldHelper, t)!,
      textFieldErrorText: Color.lerp(a.textFieldErrorText, b.textFieldErrorText, t)!,
      textFieldSuccessText: Color.lerp(a.textFieldSuccessText, b.textFieldSuccessText, t)!,
      iconPrimary: Color.lerp(a.iconPrimary, b.iconPrimary, t)!,
      iconSecondary: Color.lerp(a.iconSecondary, b.iconSecondary, t)!,
      iconDisabled: Color.lerp(a.iconDisabled, b.iconDisabled, t)!,
      iconOnPrimary: Color.lerp(a.iconOnPrimary, b.iconOnPrimary, t)!,
      iconSuccess: Color.lerp(a.iconSuccess, b.iconSuccess, t)!,
      iconWarning: Color.lerp(a.iconWarning, b.iconWarning, t)!,
      iconError: Color.lerp(a.iconError, b.iconError, t)!,
      iconInfo: Color.lerp(a.iconInfo, b.iconInfo, t)!,
      navigationBarShadow: Color.lerp(a.navigationBarShadow, b.navigationBarShadow, t)!,
      overlayColor: Color.lerp(a.overlayColor, b.overlayColor, t)!,
      dividerColor: Color.lerp(a.dividerColor, b.dividerColor, t)!,
      dividerColorSecondary: Color.lerp(a.dividerColorSecondary, b.dividerColorSecondary, t)!,
      transparent: Color.lerp(a.transparent, b.transparent, t)!,
    );
  }
}

/// Material 3 color roles for dark theme - extended with semantic colors
@immutable
class DarkColorTokens extends AppColorTokens {
  const DarkColorTokens({
    required super.primary,
    required super.onPrimary,
    required super.primaryContainer,
    required super.onPrimaryContainer,
    required super.secondary,
    required super.onSecondary,
    required super.secondaryContainer,
    required super.onSecondaryContainer,
    required super.tertiary,
    required super.onTertiary,
    required super.tertiaryContainer,
    required super.onTertiaryContainer,
    required super.error,
    required super.onError,
    required super.errorContainer,
    required super.onErrorContainer,
    required super.surface,
    required super.onSurface,
    required super.surfaceContainerHighest,
    required super.onSurfaceVariant,
    required super.outline,
    required super.outlineVariant,
    required super.shadow,
    required super.scrim,
    required super.inverseSurface,
    required super.inversePrimary,
    required super.surfaceTint,
    // Status Colors
    required super.success,
    required super.onSuccess,
    required super.successContainer,
    required super.onSuccessContainer,
    required super.warning,
    required super.onWarning,
    required super.warningContainer,
    required super.onWarningContainer,
    required super.info,
    required super.onInfo,
    required super.infoContainer,
    required super.onInfoContainer,
    // Text Colors
    required super.textPrimary,
    required super.textSecondary,
    required super.textTertiary,
    required super.textDisabled,
    required super.textOnDark,
    required super.textLink,
    required super.textSuccess,
    required super.textWarning,
    required super.textError,
    required super.textAccent,
    // Background Colors
    required super.backgroundPrimary,
    required super.backgroundSurface,
    required super.backgroundSubtle,
    required super.backgroundSuccess,
    required super.backgroundEnabled,
    required super.backgroundWarning,
    required super.backgroundError,
    required super.backgroundInfo,
    required super.backgroundDisabled,
    // Border Colors
    required super.borderDefault,
    required super.borderDefaultSecondary,
    required super.borderSubtle,
    required super.borderDisabled,
    required super.borderPrimary,
    required super.borderSuccess,
    required super.borderWarning,
    required super.borderError,
    required super.borderInfo,
    // Button Colors
    required super.buttonPrimary,
    required super.buttonPrimaryHover,
    required super.buttonPrimaryDisabled,
    required super.buttonPrimaryText,
    required super.buttonPrimaryTextDisabled,
    required super.buttonPrimaryPressed,
    required super.buttonSecondary,
    required super.buttonSecondaryBorder,
    required super.buttonSecondaryText,
    required super.buttonSecondaryHover,
    required super.buttonSecondaryDisabled,
    required super.buttonSecondaryPressed,
    required super.buttonSecondaryBorderDisabled,
    required super.buttonTertiaryText,
    required super.buttonTertiaryHover,
    required super.buttonDestructive,
    required super.buttonDestructiveHover,
    required super.buttonDestructiveDisabled,
    required super.buttonDestructiveText,
    // Text Field Colors
    required super.textFieldBackground,
    required super.textFieldText,
    required super.textFieldBorder,
    required super.textFieldBorderFocused,
    required super.textFieldBorderHover,
    required super.textFieldBorderDisabled,
    required super.textFieldBorderError,
    required super.textFieldBorderSuccess,
    required super.textFieldBackgroundDisabled,
    required super.textFieldTextDisabled,
    required super.textFieldHint,
    required super.textFieldCursor,
    required super.textFieldCursorError,
    required super.textFieldLabel,
    required super.textFieldLabelFocused,
    required super.textFieldHelper,
    required super.textFieldErrorText,
    required super.textFieldSuccessText,
    // Icon Colors
    required super.iconPrimary,
    required super.iconSecondary,
    required super.iconDisabled,
    required super.iconOnPrimary,
    required super.iconSuccess,
    required super.iconWarning,
    required super.iconError,
    required super.iconInfo,
    // Utility Colors
    required super.navigationBarShadow,
    required super.overlayColor,
    required super.dividerColor,
    required super.dividerColorSecondary,
    required super.transparent,
  }) : super(brightness: Brightness.dark);

  factory DarkColorTokens.fromBrand({
    required Color brandPrimary,
    Color? brandSecondary,
    Color? brandTertiary,
    Color? brandError,
    Color? brandSuccess,
    Color? brandWarning,
    Color? brandInfo,
  }) {
    final Map<int, Color> primaryPalette = LightColorTokens._generateTonalPalette(brandPrimary);
    final Map<int, Color> secondaryPalette = LightColorTokens._generateTonalPalette(
      brandSecondary ?? brandPrimary.withBlue(200),
    );
    final Map<int, Color> tertiaryPalette = LightColorTokens._generateTonalPalette(
      brandTertiary ?? brandPrimary.withGreen(150),
    );
    final Map<int, Color> errorPalette = LightColorTokens._generateTonalPalette(
      brandError ?? const Color(0xFFBA1A1A),
    );
    final Map<int, Color> successPalette = LightColorTokens._generateTonalPalette(
      brandSuccess ?? const Color(0xFF4CAF50),
    );
    final Map<int, Color> warningPalette = LightColorTokens._generateTonalPalette(
      brandWarning ?? const Color(0xFFFF9800),
    );
    final Map<int, Color> infoPalette = LightColorTokens._generateTonalPalette(
      brandInfo ?? brandPrimary,
    );

    return DarkColorTokens(
      // Material 3 Base
      primary: primaryPalette[80]!,
      onPrimary: primaryPalette[20]!,
      primaryContainer: primaryPalette[30]!,
      onPrimaryContainer: primaryPalette[90]!,
      secondary: secondaryPalette[80]!,
      onSecondary: secondaryPalette[20]!,
      secondaryContainer: secondaryPalette[30]!,
      onSecondaryContainer: secondaryPalette[90]!,
      tertiary: tertiaryPalette[80]!,
      onTertiary: tertiaryPalette[20]!,
      tertiaryContainer: tertiaryPalette[30]!,
      onTertiaryContainer: tertiaryPalette[90]!,
      error: errorPalette[80]!,
      onError: errorPalette[20]!,
      errorContainer: errorPalette[30]!,
      onErrorContainer: errorPalette[90]!,
      surface: const Color(0xFF1C1B1F),
      onSurface: const Color(0xFFE6E1E5),
      surfaceContainerHighest: const Color(0xFF49454F),
      onSurfaceVariant: const Color(0xFFCAC4D0),
      outline: const Color(0xFF938F99),
      outlineVariant: const Color(0xFF49454F),
      shadow: const Color(0xFF000000),
      scrim: const Color(0xFF000000),
      inverseSurface: const Color(0xFFE6E1E5),
      inversePrimary: primaryPalette[40]!,
      surfaceTint: primaryPalette[80]!,
      // Status Colors
      success: successPalette[40]!,
      onSuccess: successPalette[90]!,
      successContainer: successPalette[80]!,
      onSuccessContainer: successPalette[20]!,
      warning: warningPalette[40]!,
      onWarning: warningPalette[90]!,
      warningContainer: warningPalette[80]!,
      onWarningContainer: warningPalette[20]!,
      info: infoPalette[40]!,
      onInfo: infoPalette[90]!,
      infoContainer: infoPalette[80]!,
      onInfoContainer: infoPalette[20]!,
      // Text Colors
      textPrimary: const Color(0xFFF5F5F5),
      textSecondary: const Color(0xFFBDBDBD),
      textTertiary: const Color(0xFF9E9E9E),
      textDisabled: const Color(0xFF757575),
      textOnDark: const Color(0xFFFFFFFF),
      textLink: primaryPalette[30]!,
      textSuccess: successPalette[40]!,
      textWarning: warningPalette[40]!,
      textError: errorPalette[40]!,
      textAccent: primaryPalette[40]!,
      // Background Colors
      backgroundPrimary: const Color(0xFF212121),
      backgroundSurface: const Color(0xFF424242),
      backgroundSubtle: primaryPalette[80]!,
      backgroundSuccess: successPalette[40]!,
      backgroundEnabled: successPalette[70]!,
      backgroundWarning: warningPalette[60]!,
      backgroundError: errorPalette[60]!,
      backgroundInfo: primaryPalette[80]!,
      backgroundDisabled: const Color(0xFF616161),
      // Border Colors
      borderDefault: const Color(0xFFBDBDBD),
      borderDefaultSecondary: const Color(0xFF757575),
      borderSubtle: const Color(0xFF616161),
      borderDisabled: const Color(0xFF757575),
      borderPrimary: primaryPalette[40]!,
      borderSuccess: successPalette[40]!,
      borderWarning: warningPalette[40]!,
      borderError: errorPalette[40]!,
      borderInfo: infoPalette[40]!,
      // Button Colors
      buttonPrimary: primaryPalette[40]!,
      buttonPrimaryHover: primaryPalette[50]!,
      buttonPrimaryDisabled: const Color(0xFF616161),
      buttonPrimaryText: primaryPalette[90]!,
      buttonPrimaryTextDisabled: const Color(0xFF757575),
      buttonPrimaryPressed: primaryPalette[60]!,
      buttonSecondary: const Color(0xFF424242),
      buttonSecondaryBorder: primaryPalette[40]!,
      buttonSecondaryText: primaryPalette[40]!,
      buttonSecondaryHover: primaryPalette[80]!,
      buttonSecondaryDisabled: const Color(0xFF616161),
      buttonSecondaryPressed: primaryPalette[70]!,
      buttonSecondaryBorderDisabled: const Color(0xFF757575),
      buttonTertiaryText: primaryPalette[40]!,
      buttonTertiaryHover: primaryPalette[80]!,
      buttonDestructive: errorPalette[50]!,
      buttonDestructiveHover: errorPalette[40]!,
      buttonDestructiveDisabled: errorPalette[80]!,
      buttonDestructiveText: errorPalette[90]!,
      // Text Field Colors
      textFieldBackground: const Color(0xFF424242),
      textFieldText: const Color(0xFFF5F5F5),
      textFieldBorder: const Color(0xFF757575),
      textFieldBorderFocused: primaryPalette[40]!,
      textFieldBorderHover: primaryPalette[50]!,
      textFieldBorderDisabled: const Color(0xFF616161),
      textFieldBorderError: errorPalette[50]!,
      textFieldBorderSuccess: successPalette[40]!,
      textFieldBackgroundDisabled: const Color(0xFF212121),
      textFieldTextDisabled: const Color(0xFF757575),
      textFieldHint: const Color(0xFF9E9E9E),
      textFieldCursor: primaryPalette[40]!,
      textFieldCursorError: errorPalette[50]!,
      textFieldLabel: const Color(0xFFBDBDBD),
      textFieldLabelFocused: primaryPalette[30]!,
      textFieldHelper: const Color(0xFF9E9E9E),
      textFieldErrorText: errorPalette[30]!,
      textFieldSuccessText: successPalette[30]!,
      // Icon Colors
      iconPrimary: const Color(0xFFF5F5F5),
      iconSecondary: const Color(0xFFBDBDBD),
      iconDisabled: const Color(0xFF757575),
      iconOnPrimary: primaryPalette[90]!,
      iconSuccess: successPalette[40]!,
      iconWarning: warningPalette[40]!,
      iconError: errorPalette[40]!,
      iconInfo: primaryPalette[40]!,
      // Utility Colors
      navigationBarShadow: const Color(0x52000000),
      overlayColor: const Color(0x33000000),
      dividerColor: const Color(0xFFBDBDBD),
      dividerColorSecondary: const Color(0xFF757575),
      transparent: const Color(0x00000000),
    );
  }

  static DarkColorTokens lerp(DarkColorTokens? a, DarkColorTokens? b, double t) {
    if (a == null && b == null) return DarkColorTokens.fromBrand(brandPrimary: defaultBrandPurple);
    if (a == null) return b!;
    if (b == null) return a;
    return DarkColorTokens(
      primary: Color.lerp(a.primary, b.primary, t)!,
      onPrimary: Color.lerp(a.onPrimary, b.onPrimary, t)!,
      primaryContainer: Color.lerp(a.primaryContainer, b.primaryContainer, t)!,
      onPrimaryContainer: Color.lerp(a.onPrimaryContainer, b.onPrimaryContainer, t)!,
      secondary: Color.lerp(a.secondary, b.secondary, t)!,
      onSecondary: Color.lerp(a.onSecondary, b.onSecondary, t)!,
      secondaryContainer: Color.lerp(a.secondaryContainer, b.secondaryContainer, t)!,
      onSecondaryContainer: Color.lerp(a.onSecondaryContainer, b.onSecondaryContainer, t)!,
      tertiary: Color.lerp(a.tertiary, b.tertiary, t)!,
      onTertiary: Color.lerp(a.onTertiary, b.onTertiary, t)!,
      tertiaryContainer: Color.lerp(a.tertiaryContainer, b.tertiaryContainer, t)!,
      onTertiaryContainer: Color.lerp(a.onTertiaryContainer, b.onTertiaryContainer, t)!,
      error: Color.lerp(a.error, b.error, t)!,
      onError: Color.lerp(a.onError, b.onError, t)!,
      errorContainer: Color.lerp(a.errorContainer, b.errorContainer, t)!,
      onErrorContainer: Color.lerp(a.onErrorContainer, b.onErrorContainer, t)!,
      surface: Color.lerp(a.surface, b.surface, t)!,
      onSurface: Color.lerp(a.onSurface, b.onSurface, t)!,
      surfaceContainerHighest: Color.lerp(a.surfaceContainerHighest, b.surfaceContainerHighest, t)!,
      onSurfaceVariant: Color.lerp(a.onSurfaceVariant, b.onSurfaceVariant, t)!,
      outline: Color.lerp(a.outline, b.outline, t)!,
      outlineVariant: Color.lerp(a.outlineVariant, b.outlineVariant, t)!,
      shadow: Color.lerp(a.shadow, b.shadow, t)!,
      scrim: Color.lerp(a.scrim, b.scrim, t)!,
      inverseSurface: Color.lerp(a.inverseSurface, b.inverseSurface, t)!,
      inversePrimary: Color.lerp(a.inversePrimary, b.inversePrimary, t)!,
      surfaceTint: Color.lerp(a.surfaceTint, b.surfaceTint, t)!,
      success: Color.lerp(a.success, b.success, t)!,
      onSuccess: Color.lerp(a.onSuccess, b.onSuccess, t)!,
      successContainer: Color.lerp(a.successContainer, b.successContainer, t)!,
      onSuccessContainer: Color.lerp(a.onSuccessContainer, b.onSuccessContainer, t)!,
      warning: Color.lerp(a.warning, b.warning, t)!,
      onWarning: Color.lerp(a.onWarning, b.onWarning, t)!,
      warningContainer: Color.lerp(a.warningContainer, b.warningContainer, t)!,
      onWarningContainer: Color.lerp(a.onWarningContainer, b.onWarningContainer, t)!,
      info: Color.lerp(a.info, b.info, t)!,
      onInfo: Color.lerp(a.onInfo, b.onInfo, t)!,
      infoContainer: Color.lerp(a.infoContainer, b.infoContainer, t)!,
      onInfoContainer: Color.lerp(a.onInfoContainer, b.onInfoContainer, t)!,
      textPrimary: Color.lerp(a.textPrimary, b.textPrimary, t)!,
      textSecondary: Color.lerp(a.textSecondary, b.textSecondary, t)!,
      textTertiary: Color.lerp(a.textTertiary, b.textTertiary, t)!,
      textDisabled: Color.lerp(a.textDisabled, b.textDisabled, t)!,
      textOnDark: Color.lerp(a.textOnDark, b.textOnDark, t)!,
      textLink: Color.lerp(a.textLink, b.textLink, t)!,
      textSuccess: Color.lerp(a.textSuccess, b.textSuccess, t)!,
      textWarning: Color.lerp(a.textWarning, b.textWarning, t)!,
      textError: Color.lerp(a.textError, b.textError, t)!,
      textAccent: Color.lerp(a.textAccent, b.textAccent, t)!,
      backgroundPrimary: Color.lerp(a.backgroundPrimary, b.backgroundPrimary, t)!,
      backgroundSurface: Color.lerp(a.backgroundSurface, b.backgroundSurface, t)!,
      backgroundSubtle: Color.lerp(a.backgroundSubtle, b.backgroundSubtle, t)!,
      backgroundSuccess: Color.lerp(a.backgroundSuccess, b.backgroundSuccess, t)!,
      backgroundEnabled: Color.lerp(a.backgroundEnabled, b.backgroundEnabled, t)!,
      backgroundWarning: Color.lerp(a.backgroundWarning, b.backgroundWarning, t)!,
      backgroundError: Color.lerp(a.backgroundError, b.backgroundError, t)!,
      backgroundInfo: Color.lerp(a.backgroundInfo, b.backgroundInfo, t)!,
      backgroundDisabled: Color.lerp(a.backgroundDisabled, b.backgroundDisabled, t)!,
      borderDefault: Color.lerp(a.borderDefault, b.borderDefault, t)!,
      borderDefaultSecondary: Color.lerp(a.borderDefaultSecondary, b.borderDefaultSecondary, t)!,
      borderSubtle: Color.lerp(a.borderSubtle, b.borderSubtle, t)!,
      borderDisabled: Color.lerp(a.borderDisabled, b.borderDisabled, t)!,
      borderPrimary: Color.lerp(a.borderPrimary, b.borderPrimary, t)!,
      borderSuccess: Color.lerp(a.borderSuccess, b.borderSuccess, t)!,
      borderWarning: Color.lerp(a.borderWarning, b.borderWarning, t)!,
      borderError: Color.lerp(a.borderError, b.borderError, t)!,
      borderInfo: Color.lerp(a.borderInfo, b.borderInfo, t)!,
      buttonPrimary: Color.lerp(a.buttonPrimary, b.buttonPrimary, t)!,
      buttonPrimaryHover: Color.lerp(a.buttonPrimaryHover, b.buttonPrimaryHover, t)!,
      buttonPrimaryDisabled: Color.lerp(a.buttonPrimaryDisabled, b.buttonPrimaryDisabled, t)!,
      buttonPrimaryText: Color.lerp(a.buttonPrimaryText, b.buttonPrimaryText, t)!,
      buttonPrimaryTextDisabled: Color.lerp(a.buttonPrimaryTextDisabled, b.buttonPrimaryTextDisabled, t)!,
      buttonPrimaryPressed: Color.lerp(a.buttonPrimaryPressed, b.buttonPrimaryPressed, t)!,
      buttonSecondary: Color.lerp(a.buttonSecondary, b.buttonSecondary, t)!,
      buttonSecondaryBorder: Color.lerp(a.buttonSecondaryBorder, b.buttonSecondaryBorder, t)!,
      buttonSecondaryText: Color.lerp(a.buttonSecondaryText, b.buttonSecondaryText, t)!,
      buttonSecondaryHover: Color.lerp(a.buttonSecondaryHover, b.buttonSecondaryHover, t)!,
      buttonSecondaryDisabled: Color.lerp(a.buttonSecondaryDisabled, b.buttonSecondaryDisabled, t)!,
      buttonSecondaryPressed: Color.lerp(a.buttonSecondaryPressed, b.buttonSecondaryPressed, t)!,
      buttonSecondaryBorderDisabled: Color.lerp(a.buttonSecondaryBorderDisabled, b.buttonSecondaryBorderDisabled, t)!,
      buttonTertiaryText: Color.lerp(a.buttonTertiaryText, b.buttonTertiaryText, t)!,
      buttonTertiaryHover: Color.lerp(a.buttonTertiaryHover, b.buttonTertiaryHover, t)!,
      buttonDestructive: Color.lerp(a.buttonDestructive, b.buttonDestructive, t)!,
      buttonDestructiveHover: Color.lerp(a.buttonDestructiveHover, b.buttonDestructiveHover, t)!,
      buttonDestructiveDisabled: Color.lerp(a.buttonDestructiveDisabled, b.buttonDestructiveDisabled, t)!,
      buttonDestructiveText: Color.lerp(a.buttonDestructiveText, b.buttonDestructiveText, t)!,
      textFieldBackground: Color.lerp(a.textFieldBackground, b.textFieldBackground, t)!,
      textFieldText: Color.lerp(a.textFieldText, b.textFieldText, t)!,
      textFieldBorder: Color.lerp(a.textFieldBorder, b.textFieldBorder, t)!,
      textFieldBorderFocused: Color.lerp(a.textFieldBorderFocused, b.textFieldBorderFocused, t)!,
      textFieldBorderHover: Color.lerp(a.textFieldBorderHover, b.textFieldBorderHover, t)!,
      textFieldBorderDisabled: Color.lerp(a.textFieldBorderDisabled, b.textFieldBorderDisabled, t)!,
      textFieldBorderError: Color.lerp(a.textFieldBorderError, b.textFieldBorderError, t)!,
      textFieldBorderSuccess: Color.lerp(a.textFieldBorderSuccess, b.textFieldBorderSuccess, t)!,
      textFieldBackgroundDisabled: Color.lerp(a.textFieldBackgroundDisabled, b.textFieldBackgroundDisabled, t)!,
      textFieldTextDisabled: Color.lerp(a.textFieldTextDisabled, b.textFieldTextDisabled, t)!,
      textFieldHint: Color.lerp(a.textFieldHint, b.textFieldHint, t)!,
      textFieldCursor: Color.lerp(a.textFieldCursor, b.textFieldCursor, t)!,
      textFieldCursorError: Color.lerp(a.textFieldCursorError, b.textFieldCursorError, t)!,
      textFieldLabel: Color.lerp(a.textFieldLabel, b.textFieldLabel, t)!,
      textFieldLabelFocused: Color.lerp(a.textFieldLabelFocused, b.textFieldLabelFocused, t)!,
      textFieldHelper: Color.lerp(a.textFieldHelper, b.textFieldHelper, t)!,
      textFieldErrorText: Color.lerp(a.textFieldErrorText, b.textFieldErrorText, t)!,
      textFieldSuccessText: Color.lerp(a.textFieldSuccessText, b.textFieldSuccessText, t)!,
      iconPrimary: Color.lerp(a.iconPrimary, b.iconPrimary, t)!,
      iconSecondary: Color.lerp(a.iconSecondary, b.iconSecondary, t)!,
      iconDisabled: Color.lerp(a.iconDisabled, b.iconDisabled, t)!,
      iconOnPrimary: Color.lerp(a.iconOnPrimary, b.iconOnPrimary, t)!,
      iconSuccess: Color.lerp(a.iconSuccess, b.iconSuccess, t)!,
      iconWarning: Color.lerp(a.iconWarning, b.iconWarning, t)!,
      iconError: Color.lerp(a.iconError, b.iconError, t)!,
      iconInfo: Color.lerp(a.iconInfo, b.iconInfo, t)!,
      navigationBarShadow: Color.lerp(a.navigationBarShadow, b.navigationBarShadow, t)!,
      overlayColor: Color.lerp(a.overlayColor, b.overlayColor, t)!,
      dividerColor: Color.lerp(a.dividerColor, b.dividerColor, t)!,
      dividerColorSecondary: Color.lerp(a.dividerColorSecondary, b.dividerColorSecondary, t)!,
      transparent: Color.lerp(a.transparent, b.transparent, t)!,
    );
  }
}

/// Unified color tokens that implements ThemeExtension
@immutable
class ColorTokens extends ThemeExtension<ColorTokens> {
  const ColorTokens({required this.light, required this.dark});

  factory ColorTokens.light({
    required Color brandPrimary,
    Color? brandSecondary,
    Color? brandTertiary,
    Color? brandError,
    Color? brandSuccess,
    Color? brandWarning,
    Color? brandInfo,
  }) {
    return ColorTokens(
      light: LightColorTokens.fromBrand(
        brandPrimary: brandPrimary,
        brandSecondary: brandSecondary,
        brandTertiary: brandTertiary,
        brandError: brandError,
        brandSuccess: brandSuccess,
        brandWarning: brandWarning,
        brandInfo: brandInfo,
      ),
      dark: DarkColorTokens.fromBrand(
        brandPrimary: brandPrimary,
        brandSecondary: brandSecondary,
        brandTertiary: brandTertiary,
        brandError: brandError,
        brandSuccess: brandSuccess,
        brandWarning: brandWarning,
        brandInfo: brandInfo,
      ),
    );
  }
  final LightColorTokens light;
  final DarkColorTokens dark;

  /// Resolve the full LightColorTokens with all semantic fields
  LightColorTokens resolveLight() => light;
  
  /// Resolve the full DarkColorTokens with all semantic fields
  DarkColorTokens resolveDark() => dark;
   
  /// Resolve based on brightness - returns typed AppColorTokens with all semantic fields
  AppColorTokens resolveTokens(Brightness brightness) =>
      brightness == Brightness.light ? light : dark;

  @override
  ColorTokens copyWith({LightColorTokens? light, DarkColorTokens? dark}) {
    return ColorTokens(light: light ?? this.light, dark: dark ?? this.dark);
  }

  @override
  ColorTokens lerp(ThemeExtension<ColorTokens>? other, double t) {
    if (other is! ColorTokens) return this;
    return ColorTokens(
      light: LightColorTokens.lerp(light, other.light, t),
      dark: DarkColorTokens.lerp(dark, other.dark, t),
    );
  }

  /// Resolve based on brightness - returns ColorScheme for backward compatibility
  ///
  /// Use resolveTokens() for typed access to semantic fields.
  @Deprecated('Use resolveTokens() for typed access to semantic fields')
  ColorScheme resolve(Brightness brightness) =>
      brightness == Brightness.light ? light : dark;
}

/// Extension on BuildContext for safe, typed access to color tokens.
///
/// Usage:
/// ```dart
/// final colors = context.colors; // AppColorTokens - fully typed
/// Container(color: colors.backgroundSurface, child: Text('Hi', style: TextStyle(color: colors.textPrimary)));
/// ```
extension ColorTokensX on BuildContext {
  ColorTokens get _tokens {
    final ColorTokens? ext = Theme.of(this).extension<ColorTokens>();
    assert(
      ext != null,
      'ColorTokens not found. Add it via '
      'ThemeData(extensions: [ColorTokens.light(brandPrimary: ...)]).',
    );
    // Safe fallback avoids crashing release builds if misconfigured.
    return ext ?? ColorTokens.light(brandPrimary: defaultBrandPurple);
  }

  /// Single entry point for consuming semantic + M3 colors.
  AppColorTokens get colors => _tokens.resolveTokens(Theme.of(this).brightness);
}
