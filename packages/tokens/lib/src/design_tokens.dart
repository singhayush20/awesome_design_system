// Main design tokens aggregate - combines all token types

import 'package:flutter/material.dart';
import 'color_tokens.dart';
import 'spacing_tokens.dart';
import 'radius_tokens.dart';
import 'typography_tokens.dart';
import 'elevation_tokens.dart';
import 'sizing_tokens.dart';
import 'border_tokens.dart';
import 'breakpoint_tokens.dart';

/// Aggregate design tokens implementing ThemeExtension
/// This is the main entry point for consumers
@immutable
class DesignTokens extends ThemeExtension<DesignTokens> {
  final ColorTokens colors;
  final SpacingTokens spacing;
  final RadiusTokens radius;
  final TypographyTokens typography;
  final ElevationTokens elevation;
  final SizingTokens sizing;
  final BorderTokens border;
  final BreakpointTokens breakpoints;

  const DesignTokens({
    required this.colors,
    required this.spacing,
    required this.radius,
    required this.typography,
    required this.elevation,
    required this.sizing,
    required this.border,
    required this.breakpoints,
  });

  /// Create light theme tokens with brand colors
  factory DesignTokens.light({
    required Color brandPrimary,
    Color? brandSecondary,
    Color? brandTertiary,
    Color? brandError,
    String fontFamily = 'Inter',
    SpacingScale? spacingScale,
    RadiusScale? radiusScale,
    SizingScale? sizingScale,
    BorderScale? borderScale,
    BreakpointScale? breakpointScale,
  }) {
    final colorTokens = ColorTokens.light(
      brandPrimary: brandPrimary,
      brandSecondary: brandSecondary,
      brandTertiary: brandTertiary,
      brandError: brandError,
    );

    return DesignTokens(
      colors: colorTokens,
      spacing: SpacingTokens(
        scale: spacingScale ?? SpacingScale.defaultScale,
        padding: PaddingTokens.fromScale(spacingScale ?? SpacingScale.defaultScale),
      ),
      radius: RadiusTokens(scale: radiusScale ?? RadiusScale.defaultScale),
      typography: TypographyTokens(scale: TypographyScale.defaultScale(fontFamily: fontFamily)),
      elevation: ElevationTokens.defaultTokens(),
      sizing: SizingTokens(scale: sizingScale ?? SizingScale.defaultScale),
      border: BorderTokens(scale: borderScale ?? BorderScale.defaultScale),
      breakpoints: BreakpointTokens(scale: breakpointScale ?? BreakpointScale.defaultScale),
    );
  }

  /// Create dark theme tokens (derived from light)
  factory DesignTokens.dark({
    required Color brandPrimary,
    Color? brandSecondary,
    Color? brandTertiary,
    Color? brandError,
    String fontFamily = 'Inter',
    SpacingScale? spacingScale,
    RadiusScale? radiusScale,
    SizingScale? sizingScale,
    BorderScale? borderScale,
    BreakpointScale? breakpointScale,
  }) {
    final colorTokens = ColorTokens.light(
      brandPrimary: brandPrimary,
      brandSecondary: brandSecondary,
      brandTertiary: brandTertiary,
      brandError: brandError,
    );

    return DesignTokens(
      colors: colorTokens,
      spacing: SpacingTokens(
        scale: spacingScale ?? SpacingScale.defaultScale,
        padding: PaddingTokens.fromScale(spacingScale ?? SpacingScale.defaultScale),
      ),
      radius: RadiusTokens(scale: radiusScale ?? RadiusScale.defaultScale),
      typography: TypographyTokens(scale: TypographyScale.defaultScale(fontFamily: fontFamily)),
      elevation: ElevationTokens.defaultTokens(),
      sizing: SizingTokens(scale: sizingScale ?? SizingScale.defaultScale),
      border: BorderTokens(scale: borderScale ?? BorderScale.defaultScale),
      breakpoints: BreakpointTokens(scale: breakpointScale ?? BreakpointScale.defaultScale),
    );
  }

  /// Build ThemeData for light theme
  ThemeData toLightThemeData() {
    final lightColors = colors.light;
    final typo = typography.scale;

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: lightColors,
      textTheme: typo.toTextTheme().apply(
        bodyColor: lightColors.onSurface,
        displayColor: lightColors.onSurface,
      ),
      scaffoldBackgroundColor: lightColors.surface,
      canvasColor: lightColors.surface,
      cardColor: lightColors.surface,
      dividerColor: lightColors.outlineVariant,
      focusColor: lightColors.primary.withValues(alpha: 0.12),
      hoverColor: lightColors.primary.withValues(alpha: 0.08),
      splashColor: lightColors.primary.withValues(alpha: 0.12),
      highlightColor: lightColors.primary.withValues(alpha: 0.12),
      extensions: [
        this,
        colors,
        spacing,
        radius,
        typography,
        elevation,
        sizing,
        border,
        breakpoints,
      ],
      // Component themes
      elevatedButtonTheme: _buildElevatedButtonTheme(lightColors, typo),
      filledButtonTheme: _buildFilledButtonTheme(lightColors, typo),
      outlinedButtonTheme: _buildOutlinedButtonTheme(lightColors, typo),
      textButtonTheme: _buildTextButtonTheme(lightColors, typo),
      inputDecorationTheme: _buildInputDecorationTheme(lightColors, typo),
      cardTheme: _buildCardTheme(lightColors),
      appBarTheme: _buildAppBarTheme(lightColors, typo),
      listTileTheme: _buildListTileTheme(lightColors, typo),
      chipTheme: _buildChipTheme(lightColors, typo),
      dialogTheme: _buildDialogTheme(lightColors, typo),
      bottomSheetTheme: _buildBottomSheetTheme(lightColors),
      navigationBarTheme: _buildNavigationBarTheme(lightColors),
      tabBarTheme: _buildTabBarTheme(lightColors, typo),
    );
  }

  /// Build ThemeData for dark theme
  ThemeData toDarkThemeData() {
    final darkColors = colors.dark;
    final typo = typography.scale;

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: darkColors,
      textTheme: typo.toTextTheme().apply(
        bodyColor: darkColors.onSurface,
        displayColor: darkColors.onSurface,
      ),
      scaffoldBackgroundColor: darkColors.surface,
      canvasColor: darkColors.surface,
      cardColor: darkColors.surface,
      dividerColor: darkColors.outlineVariant,
      focusColor: darkColors.primary.withValues(alpha: 0.12),
      hoverColor: darkColors.primary.withValues(alpha: 0.08),
      splashColor: darkColors.primary.withValues(alpha: 0.12),
      highlightColor: darkColors.primary.withValues(alpha: 0.12),
      extensions: [
        this,
        colors,
        spacing,
        radius,
        typography,
        elevation,
        sizing,
        border,
        breakpoints,
      ],
      // Component themes
      elevatedButtonTheme: _buildElevatedButtonTheme(darkColors, typo),
      filledButtonTheme: _buildFilledButtonTheme(darkColors, typo),
      outlinedButtonTheme: _buildOutlinedButtonTheme(darkColors, typo),
      textButtonTheme: _buildTextButtonTheme(darkColors, typo),
      inputDecorationTheme: _buildInputDecorationTheme(darkColors, typo),
      cardTheme: _buildCardTheme(darkColors),
      appBarTheme: _buildAppBarTheme(darkColors, typo),
      listTileTheme: _buildListTileTheme(darkColors, typo),
      chipTheme: _buildChipTheme(darkColors, typo),
      dialogTheme: _buildDialogTheme(darkColors, typo),
      bottomSheetTheme: _buildBottomSheetTheme(darkColors),
      navigationBarTheme: _buildNavigationBarTheme(darkColors),
      tabBarTheme: _buildTabBarTheme(darkColors, typo),
    );
  }

  // Component theme builders
  ElevatedButtonThemeData _buildElevatedButtonTheme(ColorScheme colors, TypographyScale typo) {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: colors.primary,
        foregroundColor: colors.onPrimary,
        elevation: 1,
        shadowColor: colors.shadow,
        surfaceTintColor: colors.surfaceTint,
        padding: spacing.padding.component,
        minimumSize: Size(64, sizing.scale.buttonHeightMd),
        shape: RoundedRectangleBorder(
          borderRadius: radius.scale.mdRadius,
        ),
        textStyle: typo.labelLarge,
        disabledBackgroundColor: colors.surfaceVariant,
        disabledForegroundColor: colors.onSurfaceVariant,
      ),
    );
  }

  FilledButtonThemeData _buildFilledButtonTheme(ColorScheme colors, TypographyScale typo) {
    return FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: colors.primary,
        foregroundColor: colors.onPrimary,
        padding: spacing.padding.component,
        minimumSize: Size(64, sizing.scale.buttonHeightMd),
        shape: RoundedRectangleBorder(
          borderRadius: radius.scale.mdRadius,
        ),
        textStyle: typo.labelLarge,
        disabledBackgroundColor: colors.surfaceVariant,
        disabledForegroundColor: colors.onSurfaceVariant,
      ),
    );
  }

  OutlinedButtonThemeData _buildOutlinedButtonTheme(ColorScheme colors, TypographyScale typo) {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: colors.primary,
        side: BorderSide(color: colors.outline, width: border.scale.thin),
        padding: spacing.padding.component,
        minimumSize: Size(64, sizing.scale.buttonHeightMd),
        shape: RoundedRectangleBorder(
          borderRadius: radius.scale.mdRadius,
        ),
        textStyle: typo.labelLarge,
        disabledForegroundColor: colors.onSurfaceVariant,
      ),
    );
  }

  TextButtonThemeData _buildTextButtonTheme(ColorScheme colors, TypographyScale typo) {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: colors.primary,
        padding: spacing.padding.inline,
        minimumSize: Size(48, sizing.scale.buttonHeightSm),
        shape: RoundedRectangleBorder(
          borderRadius: radius.scale.mdRadius,
        ),
        textStyle: typo.labelLarge,
        disabledForegroundColor: colors.onSurfaceVariant,
      ),
    );
  }

  InputDecorationTheme _buildInputDecorationTheme(ColorScheme colors, TypographyScale typo) {
    final borderRadius = radius.scale.mdRadius;
    final outlineBorder = OutlineInputBorder(
      borderRadius: borderRadius,
      borderSide: BorderSide(color: colors.outline, width: border.scale.thin),
    );

    return InputDecorationTheme(
      filled: true,
      fillColor: colors.surfaceContainerHighest.withValues(alpha: 0.5),
      contentPadding: spacing.padding.component,
      labelStyle: typo.bodyLarge.copyWith(color: colors.onSurfaceVariant),
      hintStyle: typo.bodyLarge.copyWith(color: colors.onSurfaceVariant.withValues(alpha: 0.6)),
      helperStyle: typo.bodySmall.copyWith(color: colors.onSurfaceVariant),
      errorStyle: typo.bodySmall.copyWith(color: colors.error),
      border: outlineBorder,
      enabledBorder: outlineBorder,
      focusedBorder: outlineBorder.copyWith(
        borderSide: BorderSide(color: colors.primary, width: border.scale.medium),
      ),
      errorBorder: outlineBorder.copyWith(
        borderSide: BorderSide(color: colors.error, width: border.scale.thin),
      ),
      focusedErrorBorder: outlineBorder.copyWith(
        borderSide: BorderSide(color: colors.error, width: border.scale.medium),
      ),
      disabledBorder: outlineBorder.copyWith(
        borderSide: BorderSide(color: colors.outlineVariant, width: border.scale.thin),
      ),
      floatingLabelBehavior: FloatingLabelBehavior.auto,
      alignLabelWithHint: true,
    );
  }

  CardThemeData _buildCardTheme(ColorScheme colors) {
    return CardThemeData(
      color: colors.surface,
      surfaceTintColor: colors.surfaceTint,
      shadowColor: colors.shadow,
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: radius.scale.lgRadius,
        side: BorderSide(color: colors.outlineVariant, width: border.scale.thin),
      ),
      margin: spacing.padding.compact,
      clipBehavior: Clip.antiAlias,
    );
  }

  AppBarThemeData _buildAppBarTheme(ColorScheme colors, TypographyScale typo) {
    return AppBarThemeData(
      backgroundColor: colors.surface,
      foregroundColor: colors.onSurface,
      surfaceTintColor: colors.surfaceTint,
      elevation: 0,
      scrolledUnderElevation: 1,
      shadowColor: colors.shadow,
      titleTextStyle: typo.titleLarge.copyWith(color: colors.onSurface),
      toolbarTextStyle: typo.bodyMedium.copyWith(color: colors.onSurface),
      iconTheme: IconThemeData(color: colors.onSurface, size: sizing.scale.iconMd),
      actionsIconTheme: IconThemeData(color: colors.onSurface, size: sizing.scale.iconMd),
    );
  }

  ListTileThemeData _buildListTileTheme(ColorScheme colors, TypographyScale typo) {
    return ListTileThemeData(
      contentPadding: spacing.padding.component,
      minLeadingWidth: 40,
      minVerticalPadding: spacing.scale.xs,
      horizontalTitleGap: spacing.scale.md,
      tileColor: Colors.transparent,
      selectedTileColor: colors.primaryContainer,
      selectedColor: colors.onPrimaryContainer,
      iconColor: colors.onSurfaceVariant,
      textColor: colors.onSurface,
      titleTextStyle: typo.titleMedium,
      subtitleTextStyle: typo.bodyMedium.copyWith(color: colors.onSurfaceVariant),
      leadingAndTrailingTextStyle: typo.bodyMedium.copyWith(color: colors.onSurfaceVariant),
      shape: RoundedRectangleBorder(borderRadius: radius.scale.mdRadius),
    );
  }

  ChipThemeData _buildChipTheme(ColorScheme colors, TypographyScale typo) {
    return ChipThemeData(
      backgroundColor: colors.surfaceContainerHighest,
      selectedColor: colors.primaryContainer,
      disabledColor: colors.surfaceContainerHighest.withValues(alpha: 0.5),
      labelStyle: typo.labelMedium,
      secondaryLabelStyle: typo.labelMedium.copyWith(color: colors.onSurfaceVariant),
      padding: spacing.padding.inline,
      labelPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: radius.scale.fullRadius,
        side: BorderSide(color: colors.outlineVariant, width: border.scale.thin),
      ),
      side: BorderSide(color: colors.outlineVariant, width: border.scale.thin),
      brightness: colors.brightness,
      elevation: 0,
      pressElevation: 1,
      shadowColor: colors.shadow,
      checkmarkColor: colors.onPrimary,
    );
  }

  DialogThemeData _buildDialogTheme(ColorScheme colors, TypographyScale typo) {
    return DialogThemeData(
      backgroundColor: colors.surface,
      surfaceTintColor: colors.surfaceTint,
      shadowColor: colors.shadow,
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: radius.scale.lgRadius),
      titleTextStyle: typo.titleLarge.copyWith(color: colors.onSurface),
      contentTextStyle: typo.bodyMedium.copyWith(color: colors.onSurface),
      alignment: Alignment.center,
    );
  }

  BottomSheetThemeData _buildBottomSheetTheme(ColorScheme colors) {
    return BottomSheetThemeData(
      backgroundColor: colors.surface,
      surfaceTintColor: colors.surfaceTint,
      shadowColor: colors.shadow,
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(radius.scale.xl)),
      ),
      clipBehavior: Clip.antiAlias,
      modalBackgroundColor: colors.surface,
      dragHandleColor: colors.onSurfaceVariant,
      showDragHandle: true,
    );
  }

  NavigationBarThemeData _buildNavigationBarTheme(ColorScheme colors) {
    return NavigationBarThemeData(
      backgroundColor: colors.surface,
      surfaceTintColor: colors.surfaceTint,
      shadowColor: colors.shadow,
      elevation: 3,
      height: sizing.scale.heightLg,
      indicatorColor: colors.primaryContainer,
      indicatorShape: RoundedRectangleBorder(borderRadius: radius.scale.mdRadius),
      labelTextStyle: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return typography.scale.labelSmall.copyWith(color: colors.onPrimaryContainer);
        }
        return typography.scale.labelSmall.copyWith(color: colors.onSurfaceVariant);
      }),
      iconTheme: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return IconThemeData(color: colors.onPrimaryContainer, size: sizing.scale.iconMd);
        }
        return IconThemeData(color: colors.onSurfaceVariant, size: sizing.scale.iconMd);
      }),
    );
  }

  TabBarThemeData _buildTabBarTheme(ColorScheme colors, TypographyScale typo) {
    return TabBarThemeData(
      labelColor: colors.primary,
      unselectedLabelColor: colors.onSurfaceVariant,
      indicatorColor: colors.primary,
      indicatorSize: TabBarIndicatorSize.label,
      labelStyle: typo.labelLarge,
      unselectedLabelStyle: typo.labelLarge,
      dividerColor: colors.outlineVariant,
      overlayColor: WidgetStateProperty.all(colors.primary.withValues(alpha: 0.12)),
      splashFactory: NoSplash.splashFactory,
    );
  }

  @override
  DesignTokens copyWith({
    ColorTokens? colors,
    SpacingTokens? spacing,
    RadiusTokens? radius,
    TypographyTokens? typography,
    ElevationTokens? elevation,
    SizingTokens? sizing,
    BorderTokens? border,
    BreakpointTokens? breakpoints,
  }) {
    return DesignTokens(
      colors: colors ?? this.colors,
      spacing: spacing ?? this.spacing,
      radius: radius ?? this.radius,
      typography: typography ?? this.typography,
      elevation: elevation ?? this.elevation,
      sizing: sizing ?? this.sizing,
      border: border ?? this.border,
      breakpoints: breakpoints ?? this.breakpoints,
    );
  }

  @override
  DesignTokens lerp(ThemeExtension<DesignTokens>? other, double t) {
    if (other is! DesignTokens) return this;
    return DesignTokens(
      colors: colors.lerp(other.colors, t) as ColorTokens,
      spacing: spacing.lerp(other.spacing, t) as SpacingTokens,
      radius: radius.lerp(other.radius, t) as RadiusTokens,
      typography: typography.lerp(other.typography, t) as TypographyTokens,
      elevation: elevation.lerp(other.elevation, t) as ElevationTokens,
      sizing: sizing.lerp(other.sizing, t) as SizingTokens,
      border: border.lerp(other.border, t) as BorderTokens,
      breakpoints: breakpoints.lerp(other.breakpoints, t) as BreakpointTokens,
    );
  }
}

/// Token provider for runtime access (alternative to ThemeExtension)
class TokenProvider extends InheritedWidget {
  const TokenProvider({
    super.key,
    required this.tokens,
    required super.child,
  });

  final DesignTokens tokens;

  static DesignTokens of(BuildContext context) {
    final provider = context.dependOnInheritedWidgetOfExactType<TokenProvider>();
    return provider?.tokens ?? DesignTokens.light(brandPrimary: Colors.blue);
  }

  @override
  bool updateShouldNotify(TokenProvider oldWidget) => tokens != oldWidget.tokens;
}