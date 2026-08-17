// Text atom with semantic variants

import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:awesome_design_system_tokens/tokens.dart';

/// Semantic text variants following Material 3
enum TextVariant {
  displayLarge,
  displayMedium,
  displaySmall,
  headlineLarge,
  headlineMedium,
  headlineSmall,
  titleLarge,
  titleMedium,
  titleSmall,
  bodyLarge,
  bodyMedium,
  bodySmall,
  labelLarge,
  labelMedium,
  labelSmall,
}

/// Text color roles
enum TextColorRole { primary, secondary, tertiary, inverse, error, outline }

/// A text component with semantic variants and consistent styling
class DSText extends StatelessWidget {
  const DSText(
    this.data, {
    super.key,
    this.variant = TextVariant.bodyMedium,
    this.colorRole = TextColorRole.primary,
    this.fontWeight,
    this.fontStyle,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.softWrap,
    this.textDirection,
    this.locale,
    this.semanticsLabel,
    this.textScaler,
    this.style,
  });

  final String data;
  final TextVariant variant;
  final TextColorRole colorRole;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final bool? softWrap;
  final TextDirection? textDirection;
  final Locale? locale;
  final String? semanticsLabel;
  final TextScaler? textScaler;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<DesignTokens>();
    final typography = tokens?.typography.scale ?? TypographyScale.defaultScale();
    final colors = Theme.of(context).colorScheme;
    final brightness = Theme.of(context).brightness;

    final textStyle = _resolveStyle(typography, colors, brightness);
    final effectiveStyle = style?.merge(textStyle) ?? textStyle;

    Widget text = Text(
      data,
      style: effectiveStyle,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      softWrap: softWrap,
      textDirection: textDirection,
      locale: locale,
      textScaler: textScaler,
    );

    if (semanticsLabel != null) {
      text = Semantics(label: semanticsLabel, child: text);
    }

    return text;
  }

  TextStyle _resolveStyle(
    TypographyScale typography,
    ColorScheme colors,
    Brightness brightness,
  ) {
    // Get base style from variant
    TextStyle baseStyle = switch (variant) {
      TextVariant.displayLarge => typography.displayLarge,
      TextVariant.displayMedium => typography.displayMedium,
      TextVariant.displaySmall => typography.displaySmall,
      TextVariant.headlineLarge => typography.headlineLarge,
      TextVariant.headlineMedium => typography.headlineMedium,
      TextVariant.headlineSmall => typography.headlineSmall,
      TextVariant.titleLarge => typography.titleLarge,
      TextVariant.titleMedium => typography.titleMedium,
      TextVariant.titleSmall => typography.titleSmall,
      TextVariant.bodyLarge => typography.bodyLarge,
      TextVariant.bodyMedium => typography.bodyMedium,
      TextVariant.bodySmall => typography.bodySmall,
      TextVariant.labelLarge => typography.labelLarge,
      TextVariant.labelMedium => typography.labelMedium,
      TextVariant.labelSmall => typography.labelSmall,
    };

    // Apply color role
    Color textColor = switch (colorRole) {
      TextColorRole.primary => colors.onSurface,
      TextColorRole.secondary => colors.onSurfaceVariant,
      TextColorRole.tertiary => colors.onSurfaceVariant.withValues(alpha: 0.6),
      TextColorRole.inverse => brightness == Brightness.light ? colors.onInverseSurface : colors.onSurface,
      TextColorRole.error => colors.error,
      TextColorRole.outline => colors.outline,
    };

    // Apply overrides
    return baseStyle.copyWith(
      color: textColor,
      fontWeight: fontWeight ?? baseStyle.fontWeight,
      fontStyle: fontStyle ?? baseStyle.fontStyle,
    );
  }
}

/// A rich text component supporting multiple styles
class DSRichText extends StatelessWidget {
  const DSRichText({
    super.key,
    required this.spans,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.softWrap,
    this.textDirection,
    this.textScaler,
    this.style,
  });

  final List<DSTextSpan> spans;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final bool? softWrap;
  final TextDirection? textDirection;
  final TextScaler? textScaler;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<DesignTokens>();
    final typography = tokens?.typography.scale ?? TypographyScale.defaultScale();
    final colors = Theme.of(context).colorScheme;
    final brightness = Theme.of(context).brightness;

    final baseStyle = style ?? typography.bodyMedium;

    return RichText(
      textAlign: textAlign ?? TextAlign.start,
      overflow: overflow ?? TextOverflow.clip,
      maxLines: maxLines,
      softWrap: softWrap ?? true,
      textDirection: textDirection,
      textScaler: textScaler ?? TextScaler.linear(1.0),
      text: TextSpan(
        style: baseStyle,
        children: spans.map((span) => span.toTextSpan(typography, colors, brightness)).toList(),
      ),
    );
  }
}

/// A text span for DSRichText
class DSTextSpan {
  const DSTextSpan({
    required this.text,
    this.variant,
    this.colorRole,
    this.fontWeight,
    this.fontStyle,
    this.decoration,
    this.decorationColor,
    this.decorationStyle,
    this.decorationThickness,
    this.url,
    this.onTap,
    this.recognizer,
    this.semanticsLabel,
    this.style,
  });

  final String text;
  final TextVariant? variant;
  final TextColorRole? colorRole;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final TextDecoration? decoration;
  final Color? decorationColor;
  final TextDecorationStyle? decorationStyle;
  final double? decorationThickness;
  final String? url;
  final VoidCallback? onTap;
  final TapGestureRecognizer? recognizer;
  final String? semanticsLabel;
  final TextStyle? style;

  TextSpan toTextSpan(
    TypographyScale typography,
    ColorScheme colors,
    Brightness brightness,
  ) {
    final baseVariant = variant ?? TextVariant.bodyMedium;
    final baseColorRole = colorRole ?? TextColorRole.primary;

    TextStyle baseStyle = switch (baseVariant) {
      TextVariant.displayLarge => typography.displayLarge,
      TextVariant.displayMedium => typography.displayMedium,
      TextVariant.displaySmall => typography.displaySmall,
      TextVariant.headlineLarge => typography.headlineLarge,
      TextVariant.headlineMedium => typography.headlineMedium,
      TextVariant.headlineSmall => typography.headlineSmall,
      TextVariant.titleLarge => typography.titleLarge,
      TextVariant.titleMedium => typography.titleMedium,
      TextVariant.titleSmall => typography.titleSmall,
      TextVariant.bodyLarge => typography.bodyLarge,
      TextVariant.bodyMedium => typography.bodyMedium,
      TextVariant.bodySmall => typography.bodySmall,
      TextVariant.labelLarge => typography.labelLarge,
      TextVariant.labelMedium => typography.labelMedium,
      TextVariant.labelSmall => typography.labelSmall,
    };

    Color textColor = switch (baseColorRole) {
      TextColorRole.primary => colors.onSurface,
      TextColorRole.secondary => colors.onSurfaceVariant,
      TextColorRole.tertiary => colors.onSurfaceVariant.withValues(alpha: 0.6),
      TextColorRole.inverse => brightness == Brightness.light ? colors.onInverseSurface : colors.onSurface,
      TextColorRole.error => colors.error,
      TextColorRole.outline => colors.outline,
    };

    final effectiveStyle = baseStyle.copyWith(
      color: textColor,
      fontWeight: fontWeight ?? baseStyle.fontWeight,
      fontStyle: fontStyle ?? baseStyle.fontStyle,
      decoration: decoration,
      decorationColor: decorationColor,
      decorationStyle: decorationStyle,
      decorationThickness: decorationThickness,
    ).merge(style);

    return TextSpan(
      text: text,
      style: effectiveStyle,
      recognizer: recognizer,
      onEnter: url != null
          ? (_) {
              // Handle URL navigation
            }
          : null,
      semanticsLabel: semanticsLabel,
    );
  }
}

/// Link text variant
class DSLink extends StatelessWidget {
  const DSLink({
    super.key,
    required this.text,
    required this.onTap,
    this.variant = TextVariant.bodyMedium,
    this.colorRole = TextColorRole.primary,
    this.isDisabled = false,
    this.underline = true,
    this.style,
  });

  final String text;
  final VoidCallback onTap;
  final TextVariant variant;
  final TextColorRole colorRole;
  final bool isDisabled;
  final bool underline;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<DesignTokens>();
    final typography = tokens?.typography.scale ?? TypographyScale.defaultScale();
    final colors = Theme.of(context).colorScheme;

    final baseStyle = switch (variant) {
      TextVariant.displayLarge => typography.displayLarge,
      TextVariant.displayMedium => typography.displayMedium,
      TextVariant.displaySmall => typography.displaySmall,
      TextVariant.headlineLarge => typography.headlineLarge,
      TextVariant.headlineMedium => typography.headlineMedium,
      TextVariant.headlineSmall => typography.headlineSmall,
      TextVariant.titleLarge => typography.titleLarge,
      TextVariant.titleMedium => typography.titleMedium,
      TextVariant.titleSmall => typography.titleSmall,
      TextVariant.bodyLarge => typography.bodyLarge,
      TextVariant.bodyMedium => typography.bodyMedium,
      TextVariant.bodySmall => typography.bodySmall,
      TextVariant.labelLarge => typography.labelLarge,
      TextVariant.labelMedium => typography.labelMedium,
      TextVariant.labelSmall => typography.labelSmall,
    };

    final textColor = colorRole == TextColorRole.primary
        ? colors.primary
        : colorRole == TextColorRole.error
            ? colors.error
            : colors.onSurface;

    final effectiveStyle = baseStyle.copyWith(
      color: isDisabled ? colors.onSurfaceVariant : textColor,
      decoration: underline ? TextDecoration.underline : TextDecoration.none,
      decorationColor: isDisabled ? colors.onSurfaceVariant : textColor,
    ).merge(style);

    return InkWell(
      onTap: isDisabled ? null : onTap,
      borderRadius: BorderRadius.circular(4),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
        child: Text(text, style: effectiveStyle),
      ),
    );
  }
}