import 'package:flutter/material.dart';

import 'base_colors.dart';

/// Comprehensive semantic color system for the design system.
///
/// Extends Material 3 ColorScheme with additional component-level colors
/// for buttons, text fields, text, borders, and status states.
///
/// This allows full customization of every color for both light and dark themes.
/// Use [DsColors.light()] or [DsColors.dark()] to create instances with all
/// colors configured, or use [copyWith()] to override specific colors.
///
/// Access via [DsColors.of(context)] in widgets.
@immutable
class DsColors extends ThemeExtension<DsColors> {
  const DsColors({
    required this.brightness,
    // Material 3 Base Colors
    required this.primary,
    required this.onPrimary,
    required this.primaryContainer,
    required this.onPrimaryContainer,
    required this.secondary,
    required this.onSecondary,
    required this.secondaryContainer,
    required this.onSecondaryContainer,
    required this.tertiary,
    required this.onTertiary,
    required this.tertiaryContainer,
    required this.onTertiaryContainer,
    required this.surface,
    required this.onSurface,
    required this.onSurfaceVariant,
    required this.surfaceContainerLowest,
    required this.surfaceContainerLow,
    required this.surfaceContainer,
    required this.surfaceContainerHigh,
    required this.surfaceContainerHighest,
    required this.outline,
    required this.outlineVariant,
    required this.inverseSurface,
    required this.onInverseSurface,
    required this.inversePrimary,
    required this.error,
    required this.onError,
    required this.errorContainer,
    required this.onErrorContainer,
    required this.shadow,
    required this.scrim,
    required this.surfaceTint,
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
    required this.chatBubbleErrorBackground,
    required this.userChatBubbleBackground,
    required this.assistantChatBubbleBackgroundPrimary,
    required this.assistantChatBubbleBackground,
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
    this.transparent = BaseColors.transparent,
  });

  /// Factory constructor for light theme
  factory DsColors.light({
    Color? primary,
    Color? secondary,
    Color? tertiary,
    Color? error,
    Color? success,
    Color? warning,
    Color? info,
  }) {
    // Use defaults if not provided
    final Color primaryColor = primary ?? BaseColors.purple600;
    final Color secondaryColor = secondary ?? BaseColors.teal600;
    final Color tertiaryColor = tertiary ?? BaseColors.blue600;
    final Color errorColor = error ?? BaseColors.red600;
    final Color successColor = success ?? BaseColors.green600;
    final Color warningColor = warning ?? BaseColors.orange600;
    final Color infoColor = info ?? BaseColors.purple600;

    return DsColors(
      brightness: Brightness.light,
      // Material 3 Base
      primary: primaryColor,
      onPrimary: BaseColors.white,
      primaryContainer: BaseColors.purple100,
      onPrimaryContainer: BaseColors.purple900,
      secondary: secondaryColor,
      onSecondary: BaseColors.white,
      secondaryContainer: BaseColors.teal100,
      onSecondaryContainer: BaseColors.teal900,
      tertiary: tertiaryColor,
      onTertiary: BaseColors.white,
      tertiaryContainer: BaseColors.blue100,
      onTertiaryContainer: BaseColors.blue900,
      surface: BaseColors.white,
      onSurface: BaseColors.neutral800,
      onSurfaceVariant: BaseColors.neutral600,
      surfaceContainerLowest: BaseColors.white,
      surfaceContainerLow: BaseColors.neutral50,
      surfaceContainer: BaseColors.neutral100,
      surfaceContainerHigh: BaseColors.neutral200,
      surfaceContainerHighest: BaseColors.neutral300,
      outline: BaseColors.neutral500,
      outlineVariant: BaseColors.neutral300,
      inverseSurface: BaseColors.neutral800,
      onInverseSurface: BaseColors.white,
      inversePrimary: BaseColors.purple400,
      error: errorColor,
      onError: BaseColors.white,
      errorContainer: BaseColors.red200,
      onErrorContainer: BaseColors.red900,
      shadow: const Color(0x00000000),
      scrim: const Color(0x00000000),
      surfaceTint: primaryColor,
      // Status Colors
      success: successColor,
      onSuccess: BaseColors.white,
      successContainer: BaseColors.green200,
      onSuccessContainer: BaseColors.green900,
      warning: warningColor,
      onWarning: BaseColors.white,
      warningContainer: BaseColors.orange200,
      onWarningContainer: BaseColors.orange900,
      info: infoColor,
      onInfo: BaseColors.white,
      infoContainer: BaseColors.blue200,
      onInfoContainer: BaseColors.blue900,
      // Text Colors
      textPrimary: BaseColors.black,
      textSecondary: BaseColors.neutral700,
      textTertiary: BaseColors.neutral500,
      textDisabled: BaseColors.neutral400,
      textOnDark: BaseColors.white,
      textLink: BaseColors.purple700,
      textSuccess: BaseColors.green800,
      textWarning: BaseColors.orange800,
      textError: BaseColors.red800,
      textAccent: BaseColors.purple600,
      // Background Colors
      backgroundPrimary: BaseColors.white,
      backgroundSurface: BaseColors.neutral100,
      backgroundSubtle: BaseColors.purple100,
      backgroundSuccess: successColor,
      backgroundEnabled: BaseColors.green200,
      backgroundWarning: BaseColors.orange700,
      backgroundError: BaseColors.red700,
      backgroundInfo: BaseColors.purple100,
      backgroundDisabled: BaseColors.neutral200,
      chatBubbleErrorBackground: BaseColors.red200,
      userChatBubbleBackground: BaseColors.neutral200,
      assistantChatBubbleBackgroundPrimary: BaseColors.white,
      assistantChatBubbleBackground: BaseColors.blue100,
      // Border Colors
      borderDefault: BaseColors.neutral700,
      borderDefaultSecondary: BaseColors.neutral400,
      borderSubtle: BaseColors.neutral200,
      borderDisabled: BaseColors.neutral500,
      borderPrimary: primaryColor,
      borderSuccess: successColor,
      borderWarning: warningColor,
      borderError: errorColor,
      borderInfo: infoColor,
      // Button Colors
      buttonPrimary: primaryColor,
      buttonPrimaryHover: BaseColors.purple800,
      buttonPrimaryDisabled: BaseColors.neutral300,
      buttonPrimaryText: BaseColors.white,
      buttonPrimaryTextDisabled: BaseColors.neutral500,
      buttonPrimaryPressed: BaseColors.purple300,
      buttonSecondary: BaseColors.white,
      buttonSecondaryBorder: primaryColor,
      buttonSecondaryText: primaryColor,
      buttonSecondaryHover: BaseColors.purple100,
      buttonSecondaryDisabled: BaseColors.neutral300,
      buttonSecondaryPressed: BaseColors.purple300,
      buttonSecondaryBorderDisabled: BaseColors.neutral500,
      buttonTertiaryText: primaryColor,
      buttonTertiaryHover: BaseColors.purple100,
      buttonDestructive: BaseColors.red600,
      buttonDestructiveHover: BaseColors.red700,
      buttonDestructiveDisabled: BaseColors.red200,
      buttonDestructiveText: BaseColors.white,
      // Text Field Colors
      textFieldBackground: BaseColors.white,
      textFieldText: BaseColors.neutral800,
      textFieldBorder: BaseColors.neutral400,
      textFieldBorderFocused: primaryColor,
      textFieldBorderHover: BaseColors.purple300,
      textFieldBorderDisabled: BaseColors.neutral200,
      textFieldBorderError: BaseColors.red600,
      textFieldBorderSuccess: successColor,
      textFieldBackgroundDisabled: BaseColors.neutral100,
      textFieldTextDisabled: BaseColors.neutral400,
      textFieldHint: BaseColors.neutral500,
      textFieldCursor: primaryColor,
      textFieldCursorError: BaseColors.red600,
      textFieldLabel: BaseColors.neutral700,
      textFieldLabelFocused: BaseColors.purple800,
      textFieldHelper: BaseColors.neutral600,
      textFieldErrorText: BaseColors.red700,
      textFieldSuccessText: BaseColors.green700,
      // Icon Colors
      iconPrimary: BaseColors.neutral800,
      iconSecondary: BaseColors.neutral600,
      iconDisabled: BaseColors.neutral400,
      iconOnPrimary: BaseColors.white,
      iconSuccess: successColor,
      iconWarning: warningColor,
      iconError: errorColor,
      iconInfo: BaseColors.blue500,
      // Utility Colors
      navigationBarShadow: const Color(0x52000000),
      overlayColor: const Color(0x95FFFFFF),
      dividerColor: BaseColors.neutral800,
      dividerColorSecondary: BaseColors.neutral600,
    );
  }

  /// Factory constructor for dark theme
  factory DsColors.dark({
    Color? primary,
    Color? secondary,
    Color? tertiary,
    Color? error,
    Color? success,
    Color? warning,
    Color? info,
  }) {
    // Use defaults if not provided
    final Color primaryColor = primary ?? BaseColors.purple400;
    final Color secondaryColor = secondary ?? BaseColors.teal400;
    final Color tertiaryColor = tertiary ?? BaseColors.blue400;
    final Color errorColor = error ?? BaseColors.red500;
    final Color successColor = success ?? BaseColors.green400;
    final Color warningColor = warning ?? BaseColors.orange400;
    final Color infoColor = info ?? BaseColors.purple400;

    return DsColors(
      brightness: Brightness.dark,
      // Material 3 Base
      primary: primaryColor,
      onPrimary: BaseColors.purple900,
      primaryContainer: BaseColors.purple700,
      onPrimaryContainer: BaseColors.purple100,
      secondary: secondaryColor,
      onSecondary: BaseColors.teal900,
      secondaryContainer: BaseColors.teal700,
      onSecondaryContainer: BaseColors.teal100,
      tertiary: tertiaryColor,
      onTertiary: BaseColors.blue900,
      tertiaryContainer: BaseColors.blue700,
      onTertiaryContainer: BaseColors.blue100,
      surface: BaseColors.neutral900,
      onSurface: BaseColors.neutral100,
      onSurfaceVariant: BaseColors.neutral400,
      surfaceContainerLowest: BaseColors.neutral800,
      surfaceContainerLow: BaseColors.neutral900,
      surfaceContainer: BaseColors.neutral800,
      surfaceContainerHigh: BaseColors.neutral700,
      surfaceContainerHighest: BaseColors.neutral600,
      outline: BaseColors.neutral500,
      outlineVariant: BaseColors.neutral700,
      inverseSurface: BaseColors.neutral100,
      onInverseSurface: BaseColors.neutral900,
      inversePrimary: BaseColors.purple600,
      error: errorColor,
      onError: BaseColors.red900,
      errorContainer: BaseColors.red800,
      onErrorContainer: BaseColors.red200,
      shadow: const Color(0x00000000),
      scrim: const Color(0x00000000),
      surfaceTint: primaryColor,
      // Status Colors
      success: successColor,
      onSuccess: BaseColors.green900,
      successContainer: BaseColors.green800,
      onSuccessContainer: BaseColors.green200,
      warning: warningColor,
      onWarning: BaseColors.orange900,
      warningContainer: BaseColors.orange800,
      onWarningContainer: BaseColors.orange200,
      info: infoColor,
      onInfo: BaseColors.blue900,
      infoContainer: BaseColors.blue800,
      onInfoContainer: BaseColors.blue200,
      // Text Colors
      textPrimary: BaseColors.neutral100,
      textSecondary: BaseColors.neutral400,
      textTertiary: BaseColors.neutral500,
      textDisabled: BaseColors.neutral600,
      textOnDark: BaseColors.white,
      textLink: BaseColors.purple300,
      textSuccess: BaseColors.green400,
      textWarning: BaseColors.orange400,
      textError: BaseColors.red400,
      textAccent: BaseColors.purple400,
      // Background Colors
      backgroundPrimary: BaseColors.neutral900,
      backgroundSurface: BaseColors.neutral800,
      backgroundSubtle: BaseColors.purple800,
      backgroundSuccess: successColor,
      backgroundEnabled: BaseColors.green700,
      backgroundWarning: BaseColors.orange600,
      backgroundError: BaseColors.red600,
      backgroundInfo: BaseColors.purple800,
      backgroundDisabled: BaseColors.neutral700,
      chatBubbleErrorBackground: BaseColors.red800,
      userChatBubbleBackground: BaseColors.neutral700,
      assistantChatBubbleBackgroundPrimary: BaseColors.neutral800,
      assistantChatBubbleBackground: BaseColors.blue800,
      // Border Colors
      borderDefault: BaseColors.neutral400,
      borderDefaultSecondary: BaseColors.neutral600,
      borderSubtle: BaseColors.neutral700,
      borderDisabled: BaseColors.neutral600,
      borderPrimary: primaryColor,
      borderSuccess: successColor,
      borderWarning: warningColor,
      borderError: errorColor,
      borderInfo: infoColor,
      // Button Colors
      buttonPrimary: primaryColor,
      buttonPrimaryHover: BaseColors.purple500,
      buttonPrimaryDisabled: BaseColors.neutral700,
      buttonPrimaryText: BaseColors.purple900,
      buttonPrimaryTextDisabled: BaseColors.neutral600,
      buttonPrimaryPressed: BaseColors.purple600,
      buttonSecondary: BaseColors.neutral800,
      buttonSecondaryBorder: primaryColor,
      buttonSecondaryText: primaryColor,
      buttonSecondaryHover: BaseColors.purple800,
      buttonSecondaryDisabled: BaseColors.neutral700,
      buttonSecondaryPressed: BaseColors.purple700,
      buttonSecondaryBorderDisabled: BaseColors.neutral600,
      buttonTertiaryText: primaryColor,
      buttonTertiaryHover: BaseColors.purple800,
      buttonDestructive: BaseColors.red500,
      buttonDestructiveHover: BaseColors.red400,
      buttonDestructiveDisabled: BaseColors.red800,
      buttonDestructiveText: BaseColors.red900,
      // Text Field Colors
      textFieldBackground: BaseColors.neutral800,
      textFieldText: BaseColors.neutral100,
      textFieldBorder: BaseColors.neutral600,
      textFieldBorderFocused: primaryColor,
      textFieldBorderHover: BaseColors.purple500,
      textFieldBorderDisabled: BaseColors.neutral700,
      textFieldBorderError: BaseColors.red500,
      textFieldBorderSuccess: successColor,
      textFieldBackgroundDisabled: BaseColors.neutral900,
      textFieldTextDisabled: BaseColors.neutral600,
      textFieldHint: BaseColors.neutral500,
      textFieldCursor: primaryColor,
      textFieldCursorError: BaseColors.red500,
      textFieldLabel: BaseColors.neutral400,
      textFieldLabelFocused: BaseColors.purple300,
      textFieldHelper: BaseColors.neutral500,
      textFieldErrorText: BaseColors.red300,
      textFieldSuccessText: BaseColors.green300,
      // Icon Colors
      iconPrimary: BaseColors.neutral100,
      iconSecondary: BaseColors.neutral400,
      iconDisabled: BaseColors.neutral600,
      iconOnPrimary: BaseColors.purple900,
      iconSuccess: successColor,
      iconWarning: warningColor,
      iconError: errorColor,
      iconInfo: BaseColors.blue400,
      // Utility Colors
      navigationBarShadow: const Color(0x52000000),
      overlayColor: const Color(0x33000000),
      dividerColor: BaseColors.neutral400,
      dividerColorSecondary: BaseColors.neutral600,
    );
  }

  /// Resolves semantic colors from the ambient [ThemeData].
  factory DsColors.of(BuildContext context) {
    final DsColors? ext = Theme.of(context).extension<DsColors>();
    if (ext != null) {
      return ext;
    }
    // Fallback: create default based on brightness
    final Brightness platformBrightness = MediaQuery.of(context).platformBrightness;
    return platformBrightness == Brightness.dark ? DsColors.dark() : DsColors.light();
  }

  // ==========================================
  // PROPERTIES
  // ==========================================

  final Brightness brightness;

  // Material 3 Base Colors
  final Color primary;
  final Color onPrimary;
  final Color primaryContainer;
  final Color onPrimaryContainer;
  final Color secondary;
  final Color onSecondary;
  final Color secondaryContainer;
  final Color onSecondaryContainer;
  final Color tertiary;
  final Color onTertiary;
  final Color tertiaryContainer;
  final Color onTertiaryContainer;
  final Color surface;
  final Color onSurface;
  final Color onSurfaceVariant;
  final Color surfaceContainerLowest;
  final Color surfaceContainerLow;
  final Color surfaceContainer;
  final Color surfaceContainerHigh;
  final Color surfaceContainerHighest;
  final Color outline;
  final Color outlineVariant;
  final Color inverseSurface;
  final Color onInverseSurface;
  final Color inversePrimary;
  final Color error;
  final Color onError;
  final Color errorContainer;
  final Color onErrorContainer;
  final Color shadow;
  final Color scrim;
  final Color surfaceTint;

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
  final Color chatBubbleErrorBackground;
  final Color userChatBubbleBackground;
  final Color assistantChatBubbleBackgroundPrimary;
  final Color assistantChatBubbleBackground;

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

  // ==========================================
  // HELPERS
  // ==========================================

  bool get isLight => brightness == Brightness.light;
  bool get isDark => brightness == Brightness.dark;

  @override
  DsColors copyWith({
    Brightness? brightness,
    Color? primary,
    Color? onPrimary,
    Color? primaryContainer,
    Color? onPrimaryContainer,
    Color? secondary,
    Color? onSecondary,
    Color? secondaryContainer,
    Color? onSecondaryContainer,
    Color? tertiary,
    Color? onTertiary,
    Color? tertiaryContainer,
    Color? onTertiaryContainer,
    Color? surface,
    Color? onSurface,
    Color? onSurfaceVariant,
    Color? surfaceContainerLowest,
    Color? surfaceContainerLow,
    Color? surfaceContainer,
    Color? surfaceContainerHigh,
    Color? surfaceContainerHighest,
    Color? outline,
    Color? outlineVariant,
    Color? inverseSurface,
    Color? onInverseSurface,
    Color? inversePrimary,
    Color? error,
    Color? onError,
    Color? errorContainer,
    Color? onErrorContainer,
    Color? shadow,
    Color? scrim,
    Color? surfaceTint,
    Color? success,
    Color? onSuccess,
    Color? successContainer,
    Color? onSuccessContainer,
    Color? warning,
    Color? onWarning,
    Color? warningContainer,
    Color? onWarningContainer,
    Color? info,
    Color? onInfo,
    Color? infoContainer,
    Color? onInfoContainer,
    Color? textPrimary,
    Color? textSecondary,
    Color? textTertiary,
    Color? textDisabled,
    Color? textOnDark,
    Color? textLink,
    Color? textSuccess,
    Color? textWarning,
    Color? textError,
    Color? textAccent,
    Color? backgroundPrimary,
    Color? backgroundSurface,
    Color? backgroundSubtle,
    Color? backgroundSuccess,
    Color? backgroundEnabled,
    Color? backgroundWarning,
    Color? backgroundError,
    Color? backgroundInfo,
    Color? backgroundDisabled,
    Color? chatBubbleErrorBackground,
    Color? userChatBubbleBackground,
    Color? assistantChatBubbleBackgroundPrimary,
    Color? assistantChatBubbleBackground,
    Color? borderDefault,
    Color? borderDefaultSecondary,
    Color? borderSubtle,
    Color? borderDisabled,
    Color? borderPrimary,
    Color? borderSuccess,
    Color? borderWarning,
    Color? borderError,
    Color? borderInfo,
    Color? buttonPrimary,
    Color? buttonPrimaryHover,
    Color? buttonPrimaryDisabled,
    Color? buttonPrimaryText,
    Color? buttonPrimaryTextDisabled,
    Color? buttonPrimaryPressed,
    Color? buttonSecondary,
    Color? buttonSecondaryBorder,
    Color? buttonSecondaryText,
    Color? buttonSecondaryHover,
    Color? buttonSecondaryDisabled,
    Color? buttonSecondaryPressed,
    Color? buttonSecondaryBorderDisabled,
    Color? buttonTertiaryText,
    Color? buttonTertiaryHover,
    Color? buttonDestructive,
    Color? buttonDestructiveHover,
    Color? buttonDestructiveDisabled,
    Color? buttonDestructiveText,
    Color? textFieldBackground,
    Color? textFieldText,
    Color? textFieldBorder,
    Color? textFieldBorderFocused,
    Color? textFieldBorderHover,
    Color? textFieldBorderDisabled,
    Color? textFieldBorderError,
    Color? textFieldBorderSuccess,
    Color? textFieldBackgroundDisabled,
    Color? textFieldTextDisabled,
    Color? textFieldHint,
    Color? textFieldCursor,
    Color? textFieldCursorError,
    Color? textFieldLabel,
    Color? textFieldLabelFocused,
    Color? textFieldHelper,
    Color? textFieldErrorText,
    Color? textFieldSuccessText,
    Color? iconPrimary,
    Color? iconSecondary,
    Color? iconDisabled,
    Color? iconOnPrimary,
    Color? iconSuccess,
    Color? iconWarning,
    Color? iconError,
    Color? iconInfo,
    Color? navigationBarShadow,
    Color? overlayColor,
    Color? dividerColor,
    Color? dividerColorSecondary,
    Color? transparent,
  }) {
    return DsColors(
      brightness: brightness ?? this.brightness,
      primary: primary ?? this.primary,
      onPrimary: onPrimary ?? this.onPrimary,
      primaryContainer: primaryContainer ?? this.primaryContainer,
      onPrimaryContainer: onPrimaryContainer ?? this.onPrimaryContainer,
      secondary: secondary ?? this.secondary,
      onSecondary: onSecondary ?? this.onSecondary,
      secondaryContainer: secondaryContainer ?? this.secondaryContainer,
      onSecondaryContainer: onSecondaryContainer ?? this.onSecondaryContainer,
      tertiary: tertiary ?? this.tertiary,
      onTertiary: onTertiary ?? this.onTertiary,
      tertiaryContainer: tertiaryContainer ?? this.tertiaryContainer,
      onTertiaryContainer: onTertiaryContainer ?? this.onTertiaryContainer,
      surface: surface ?? this.surface,
      onSurface: onSurface ?? this.onSurface,
      onSurfaceVariant: onSurfaceVariant ?? this.onSurfaceVariant,
      surfaceContainerLowest: surfaceContainerLowest ?? this.surfaceContainerLowest,
      surfaceContainerLow: surfaceContainerLow ?? this.surfaceContainerLow,
      surfaceContainer: surfaceContainer ?? this.surfaceContainer,
      surfaceContainerHigh: surfaceContainerHigh ?? this.surfaceContainerHigh,
      surfaceContainerHighest: surfaceContainerHighest ?? this.surfaceContainerHighest,
      outline: outline ?? this.outline,
      outlineVariant: outlineVariant ?? this.outlineVariant,
      inverseSurface: inverseSurface ?? this.inverseSurface,
      onInverseSurface: onInverseSurface ?? this.onInverseSurface,
      inversePrimary: inversePrimary ?? this.inversePrimary,
      error: error ?? this.error,
      onError: onError ?? this.onError,
      errorContainer: errorContainer ?? this.errorContainer,
      onErrorContainer: onErrorContainer ?? this.onErrorContainer,
      shadow: shadow ?? this.shadow,
      scrim: scrim ?? this.scrim,
      surfaceTint: surfaceTint ?? this.surfaceTint,
      success: success ?? this.success,
      onSuccess: onSuccess ?? this.onSuccess,
      successContainer: successContainer ?? this.successContainer,
      onSuccessContainer: onSuccessContainer ?? this.onSuccessContainer,
      warning: warning ?? this.warning,
      onWarning: onWarning ?? this.onWarning,
      warningContainer: warningContainer ?? this.warningContainer,
      onWarningContainer: onWarningContainer ?? this.onWarningContainer,
      info: info ?? this.info,
      onInfo: onInfo ?? this.onInfo,
      infoContainer: infoContainer ?? this.infoContainer,
      onInfoContainer: onInfoContainer ?? this.onInfoContainer,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      textTertiary: textTertiary ?? this.textTertiary,
      textDisabled: textDisabled ?? this.textDisabled,
      textOnDark: textOnDark ?? this.textOnDark,
      textLink: textLink ?? this.textLink,
      textSuccess: textSuccess ?? this.textSuccess,
      textWarning: textWarning ?? this.textWarning,
      textError: textError ?? this.textError,
      textAccent: textAccent ?? this.textAccent,
      backgroundPrimary: backgroundPrimary ?? this.backgroundPrimary,
      backgroundSurface: backgroundSurface ?? this.backgroundSurface,
      backgroundSubtle: backgroundSubtle ?? this.backgroundSubtle,
      backgroundSuccess: backgroundSuccess ?? this.backgroundSuccess,
      backgroundEnabled: backgroundEnabled ?? this.backgroundEnabled,
      backgroundWarning: backgroundWarning ?? this.backgroundWarning,
      backgroundError: backgroundError ?? this.backgroundError,
      backgroundInfo: backgroundInfo ?? this.backgroundInfo,
      backgroundDisabled: backgroundDisabled ?? this.backgroundDisabled,
      chatBubbleErrorBackground: chatBubbleErrorBackground ?? this.chatBubbleErrorBackground,
      userChatBubbleBackground: userChatBubbleBackground ?? this.userChatBubbleBackground,
      assistantChatBubbleBackgroundPrimary: assistantChatBubbleBackgroundPrimary ?? this.assistantChatBubbleBackgroundPrimary,
      assistantChatBubbleBackground: assistantChatBubbleBackground ?? this.assistantChatBubbleBackground,
      borderDefault: borderDefault ?? this.borderDefault,
      borderDefaultSecondary: borderDefaultSecondary ?? this.borderDefaultSecondary,
      borderSubtle: borderSubtle ?? this.borderSubtle,
      borderDisabled: borderDisabled ?? this.borderDisabled,
      borderPrimary: borderPrimary ?? this.borderPrimary,
      borderSuccess: borderSuccess ?? this.borderSuccess,
      borderWarning: borderWarning ?? this.borderWarning,
      borderError: borderError ?? this.borderError,
      borderInfo: borderInfo ?? this.borderInfo,
      buttonPrimary: buttonPrimary ?? this.buttonPrimary,
      buttonPrimaryHover: buttonPrimaryHover ?? this.buttonPrimaryHover,
      buttonPrimaryDisabled: buttonPrimaryDisabled ?? this.buttonPrimaryDisabled,
      buttonPrimaryText: buttonPrimaryText ?? this.buttonPrimaryText,
      buttonPrimaryTextDisabled: buttonPrimaryTextDisabled ?? this.buttonPrimaryTextDisabled,
      buttonPrimaryPressed: buttonPrimaryPressed ?? this.buttonPrimaryPressed,
      buttonSecondary: buttonSecondary ?? this.buttonSecondary,
      buttonSecondaryBorder: buttonSecondaryBorder ?? this.buttonSecondaryBorder,
      buttonSecondaryText: buttonSecondaryText ?? this.buttonSecondaryText,
      buttonSecondaryHover: buttonSecondaryHover ?? this.buttonSecondaryHover,
      buttonSecondaryDisabled: buttonSecondaryDisabled ?? this.buttonSecondaryDisabled,
      buttonSecondaryPressed: buttonSecondaryPressed ?? this.buttonSecondaryPressed,
      buttonSecondaryBorderDisabled: buttonSecondaryBorderDisabled ?? this.buttonSecondaryBorderDisabled,
      buttonTertiaryText: buttonTertiaryText ?? this.buttonTertiaryText,
      buttonTertiaryHover: buttonTertiaryHover ?? this.buttonTertiaryHover,
      buttonDestructive: buttonDestructive ?? this.buttonDestructive,
      buttonDestructiveHover: buttonDestructiveHover ?? this.buttonDestructiveHover,
      buttonDestructiveDisabled: buttonDestructiveDisabled ?? this.buttonDestructiveDisabled,
      buttonDestructiveText: buttonDestructiveText ?? this.buttonDestructiveText,
      textFieldBackground: textFieldBackground ?? this.textFieldBackground,
      textFieldText: textFieldText ?? this.textFieldText,
      textFieldBorder: textFieldBorder ?? this.textFieldBorder,
      textFieldBorderFocused: textFieldBorderFocused ?? this.textFieldBorderFocused,
      textFieldBorderHover: textFieldBorderHover ?? this.textFieldBorderHover,
      textFieldBorderDisabled: textFieldBorderDisabled ?? this.textFieldBorderDisabled,
      textFieldBorderError: textFieldBorderError ?? this.textFieldBorderError,
      textFieldBorderSuccess: textFieldBorderSuccess ?? this.textFieldBorderSuccess,
      textFieldBackgroundDisabled: textFieldBackgroundDisabled ?? this.textFieldBackgroundDisabled,
      textFieldTextDisabled: textFieldTextDisabled ?? this.textFieldTextDisabled,
      textFieldHint: textFieldHint ?? this.textFieldHint,
      textFieldCursor: textFieldCursor ?? this.textFieldCursor,
      textFieldCursorError: textFieldCursorError ?? this.textFieldCursorError,
      textFieldLabel: textFieldLabel ?? this.textFieldLabel,
      textFieldLabelFocused: textFieldLabelFocused ?? this.textFieldLabelFocused,
      textFieldHelper: textFieldHelper ?? this.textFieldHelper,
      textFieldErrorText: textFieldErrorText ?? this.textFieldErrorText,
      textFieldSuccessText: textFieldSuccessText ?? this.textFieldSuccessText,
      iconPrimary: iconPrimary ?? this.iconPrimary,
      iconSecondary: iconSecondary ?? this.iconSecondary,
      iconDisabled: iconDisabled ?? this.iconDisabled,
      iconOnPrimary: iconOnPrimary ?? this.iconOnPrimary,
      iconSuccess: iconSuccess ?? this.iconSuccess,
      iconWarning: iconWarning ?? this.iconWarning,
      iconError: iconError ?? this.iconError,
      iconInfo: iconInfo ?? this.iconInfo,
      navigationBarShadow: navigationBarShadow ?? this.navigationBarShadow,
      overlayColor: overlayColor ?? this.overlayColor,
      dividerColor: dividerColor ?? this.dividerColor,
      dividerColorSecondary: dividerColorSecondary ?? this.dividerColorSecondary,
      transparent: transparent ?? this.transparent,
    );
  }

  @override
  DsColors lerp(ThemeExtension<DsColors>? other, double t) {
    if (other is! DsColors) return this;
    return DsColors(
      brightness: t < 0.5 ? brightness : other.brightness,
      primary: Color.lerp(primary, other.primary, t)!,
      onPrimary: Color.lerp(onPrimary, other.onPrimary, t)!,
      primaryContainer: Color.lerp(primaryContainer, other.primaryContainer, t)!,
      onPrimaryContainer: Color.lerp(onPrimaryContainer, other.onPrimaryContainer, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      onSecondary: Color.lerp(onSecondary, other.onSecondary, t)!,
      secondaryContainer: Color.lerp(secondaryContainer, other.secondaryContainer, t)!,
      onSecondaryContainer: Color.lerp(onSecondaryContainer, other.onSecondaryContainer, t)!,
      tertiary: Color.lerp(tertiary, other.tertiary, t)!,
      onTertiary: Color.lerp(onTertiary, other.onTertiary, t)!,
      tertiaryContainer: Color.lerp(tertiaryContainer, other.tertiaryContainer, t)!,
      onTertiaryContainer: Color.lerp(onTertiaryContainer, other.onTertiaryContainer, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      onSurface: Color.lerp(onSurface, other.onSurface, t)!,
      onSurfaceVariant: Color.lerp(onSurfaceVariant, other.onSurfaceVariant, t)!,
      surfaceContainerLowest: Color.lerp(surfaceContainerLowest, other.surfaceContainerLowest, t)!,
      surfaceContainerLow: Color.lerp(surfaceContainerLow, other.surfaceContainerLow, t)!,
      surfaceContainer: Color.lerp(surfaceContainer, other.surfaceContainer, t)!,
      surfaceContainerHigh: Color.lerp(surfaceContainerHigh, other.surfaceContainerHigh, t)!,
      surfaceContainerHighest: Color.lerp(surfaceContainerHighest, other.surfaceContainerHighest, t)!,
      outline: Color.lerp(outline, other.outline, t)!,
      outlineVariant: Color.lerp(outlineVariant, other.outlineVariant, t)!,
      inverseSurface: Color.lerp(inverseSurface, other.inverseSurface, t)!,
      onInverseSurface: Color.lerp(onInverseSurface, other.onInverseSurface, t)!,
      inversePrimary: Color.lerp(inversePrimary, other.inversePrimary, t)!,
      error: Color.lerp(error, other.error, t)!,
      onError: Color.lerp(onError, other.onError, t)!,
      errorContainer: Color.lerp(errorContainer, other.errorContainer, t)!,
      onErrorContainer: Color.lerp(onErrorContainer, other.onErrorContainer, t)!,
      shadow: Color.lerp(shadow, other.shadow, t)!,
      scrim: Color.lerp(scrim, other.scrim, t)!,
      surfaceTint: Color.lerp(surfaceTint, other.surfaceTint, t)!,
      success: Color.lerp(success, other.success, t)!,
      onSuccess: Color.lerp(onSuccess, other.onSuccess, t)!,
      successContainer: Color.lerp(successContainer, other.successContainer, t)!,
      onSuccessContainer: Color.lerp(onSuccessContainer, other.onSuccessContainer, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      onWarning: Color.lerp(onWarning, other.onWarning, t)!,
      warningContainer: Color.lerp(warningContainer, other.warningContainer, t)!,
      onWarningContainer: Color.lerp(onWarningContainer, other.onWarningContainer, t)!,
      info: Color.lerp(info, other.info, t)!,
      onInfo: Color.lerp(onInfo, other.onInfo, t)!,
      infoContainer: Color.lerp(infoContainer, other.infoContainer, t)!,
      onInfoContainer: Color.lerp(onInfoContainer, other.onInfoContainer, t)!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      textTertiary: Color.lerp(textTertiary, other.textTertiary, t)!,
      textDisabled: Color.lerp(textDisabled, other.textDisabled, t)!,
      textOnDark: Color.lerp(textOnDark, other.textOnDark, t)!,
      textLink: Color.lerp(textLink, other.textLink, t)!,
      textSuccess: Color.lerp(textSuccess, other.textSuccess, t)!,
      textWarning: Color.lerp(textWarning, other.textWarning, t)!,
      textError: Color.lerp(textError, other.textError, t)!,
      textAccent: Color.lerp(textAccent, other.textAccent, t)!,
      backgroundPrimary: Color.lerp(backgroundPrimary, other.backgroundPrimary, t)!,
      backgroundSurface: Color.lerp(backgroundSurface, other.backgroundSurface, t)!,
      backgroundSubtle: Color.lerp(backgroundSubtle, other.backgroundSubtle, t)!,
      backgroundSuccess: Color.lerp(backgroundSuccess, other.backgroundSuccess, t)!,
      backgroundEnabled: Color.lerp(backgroundEnabled, other.backgroundEnabled, t)!,
      backgroundWarning: Color.lerp(backgroundWarning, other.backgroundWarning, t)!,
      backgroundError: Color.lerp(backgroundError, other.backgroundError, t)!,
      backgroundInfo: Color.lerp(backgroundInfo, other.backgroundInfo, t)!,
      backgroundDisabled: Color.lerp(backgroundDisabled, other.backgroundDisabled, t)!,
      chatBubbleErrorBackground: Color.lerp(chatBubbleErrorBackground, other.chatBubbleErrorBackground, t)!,
      userChatBubbleBackground: Color.lerp(userChatBubbleBackground, other.userChatBubbleBackground, t)!,
      assistantChatBubbleBackgroundPrimary: Color.lerp(assistantChatBubbleBackgroundPrimary, other.assistantChatBubbleBackgroundPrimary, t)!,
      assistantChatBubbleBackground: Color.lerp(assistantChatBubbleBackground, other.assistantChatBubbleBackground, t)!,
      borderDefault: Color.lerp(borderDefault, other.borderDefault, t)!,
      borderDefaultSecondary: Color.lerp(borderDefaultSecondary, other.borderDefaultSecondary, t)!,
      borderSubtle: Color.lerp(borderSubtle, other.borderSubtle, t)!,
      borderDisabled: Color.lerp(borderDisabled, other.borderDisabled, t)!,
      borderPrimary: Color.lerp(borderPrimary, other.borderPrimary, t)!,
      borderSuccess: Color.lerp(borderSuccess, other.borderSuccess, t)!,
      borderWarning: Color.lerp(borderWarning, other.borderWarning, t)!,
      borderError: Color.lerp(borderError, other.borderError, t)!,
      borderInfo: Color.lerp(borderInfo, other.borderInfo, t)!,
      buttonPrimary: Color.lerp(buttonPrimary, other.buttonPrimary, t)!,
      buttonPrimaryHover: Color.lerp(buttonPrimaryHover, other.buttonPrimaryHover, t)!,
      buttonPrimaryDisabled: Color.lerp(buttonPrimaryDisabled, other.buttonPrimaryDisabled, t)!,
      buttonPrimaryText: Color.lerp(buttonPrimaryText, other.buttonPrimaryText, t)!,
      buttonPrimaryTextDisabled: Color.lerp(buttonPrimaryTextDisabled, other.buttonPrimaryTextDisabled, t)!,
      buttonPrimaryPressed: Color.lerp(buttonPrimaryPressed, other.buttonPrimaryPressed, t)!,
      buttonSecondary: Color.lerp(buttonSecondary, other.buttonSecondary, t)!,
      buttonSecondaryBorder: Color.lerp(buttonSecondaryBorder, other.buttonSecondaryBorder, t)!,
      buttonSecondaryText: Color.lerp(buttonSecondaryText, other.buttonSecondaryText, t)!,
      buttonSecondaryHover: Color.lerp(buttonSecondaryHover, other.buttonSecondaryHover, t)!,
      buttonSecondaryDisabled: Color.lerp(buttonSecondaryDisabled, other.buttonSecondaryDisabled, t)!,
      buttonSecondaryPressed: Color.lerp(buttonSecondaryPressed, other.buttonSecondaryPressed, t)!,
      buttonSecondaryBorderDisabled: Color.lerp(buttonSecondaryBorderDisabled, other.buttonSecondaryBorderDisabled, t)!,
      buttonTertiaryText: Color.lerp(buttonTertiaryText, other.buttonTertiaryText, t)!,
      buttonTertiaryHover: Color.lerp(buttonTertiaryHover, other.buttonTertiaryHover, t)!,
      buttonDestructive: Color.lerp(buttonDestructive, other.buttonDestructive, t)!,
      buttonDestructiveHover: Color.lerp(buttonDestructiveHover, other.buttonDestructiveHover, t)!,
      buttonDestructiveDisabled: Color.lerp(buttonDestructiveDisabled, other.buttonDestructiveDisabled, t)!,
      buttonDestructiveText: Color.lerp(buttonDestructiveText, other.buttonDestructiveText, t)!,
      textFieldBackground: Color.lerp(textFieldBackground, other.textFieldBackground, t)!,
      textFieldText: Color.lerp(textFieldText, other.textFieldText, t)!,
      textFieldBorder: Color.lerp(textFieldBorder, other.textFieldBorder, t)!,
      textFieldBorderFocused: Color.lerp(textFieldBorderFocused, other.textFieldBorderFocused, t)!,
      textFieldBorderHover: Color.lerp(textFieldBorderHover, other.textFieldBorderHover, t)!,
      textFieldBorderDisabled: Color.lerp(textFieldBorderDisabled, other.textFieldBorderDisabled, t)!,
      textFieldBorderError: Color.lerp(textFieldBorderError, other.textFieldBorderError, t)!,
      textFieldBorderSuccess: Color.lerp(textFieldBorderSuccess, other.textFieldBorderSuccess, t)!,
      textFieldBackgroundDisabled: Color.lerp(textFieldBackgroundDisabled, other.textFieldBackgroundDisabled, t)!,
      textFieldTextDisabled: Color.lerp(textFieldTextDisabled, other.textFieldTextDisabled, t)!,
      textFieldHint: Color.lerp(textFieldHint, other.textFieldHint, t)!,
      textFieldCursor: Color.lerp(textFieldCursor, other.textFieldCursor, t)!,
      textFieldCursorError: Color.lerp(textFieldCursorError, other.textFieldCursorError, t)!,
      textFieldLabel: Color.lerp(textFieldLabel, other.textFieldLabel, t)!,
      textFieldLabelFocused: Color.lerp(textFieldLabelFocused, other.textFieldLabelFocused, t)!,
      textFieldHelper: Color.lerp(textFieldHelper, other.textFieldHelper, t)!,
      textFieldErrorText: Color.lerp(textFieldErrorText, other.textFieldErrorText, t)!,
      textFieldSuccessText: Color.lerp(textFieldSuccessText, other.textFieldSuccessText, t)!,
      iconPrimary: Color.lerp(iconPrimary, other.iconPrimary, t)!,
      iconSecondary: Color.lerp(iconSecondary, other.iconSecondary, t)!,
      iconDisabled: Color.lerp(iconDisabled, other.iconDisabled, t)!,
      iconOnPrimary: Color.lerp(iconOnPrimary, other.iconOnPrimary, t)!,
      iconSuccess: Color.lerp(iconSuccess, other.iconSuccess, t)!,
      iconWarning: Color.lerp(iconWarning, other.iconWarning, t)!,
      iconError: Color.lerp(iconError, other.iconError, t)!,
      iconInfo: Color.lerp(iconInfo, other.iconInfo, t)!,
      navigationBarShadow: Color.lerp(navigationBarShadow, other.navigationBarShadow, t)!,
      overlayColor: Color.lerp(overlayColor, other.overlayColor, t)!,
      dividerColor: Color.lerp(dividerColor, other.dividerColor, t)!,
      dividerColorSecondary: Color.lerp(dividerColorSecondary, other.dividerColorSecondary, t)!,
      transparent: Color.lerp(transparent, other.transparent, t)!,
    );
  }

  @override
  String toString() {
    return 'DsColors('
        'brightness: $brightness, '
        'primary: $primary, '
        'secondary: $secondary, '
        'tertiary: $tertiary, '
        'error: $error, '
        'success: $success, '
        'warning: $warning, '
        'info: $info'
        ')';
  }
}
