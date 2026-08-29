import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:awesome_design_system_tokens/tokens.dart';
import 'text_enums.dart';
import 'text_style.dart';
import 'text_theme.dart';

/// A text component with semantic variants, color roles, and tokenized styling.
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
    final DSTextThemeData? theme = Theme.of(context).extension<DSTextThemeData>();
    final DesignTokens? tokens = Theme.of(context).extension<DesignTokens>();
    final TypographyScale typography =
        theme?.typography ?? tokens?.typography.scale ?? TypographyScale.defaultScale();
    final ColorScheme colors = theme?.colors ?? Theme.of(context).colorScheme;
    final Brightness brightness = theme?.brightness ?? Theme.of(context).brightness;

    final TextStyle baseStyle = DSTextStyle.resolveBaseStyle(variant, typography);
    final Color textColor = DSTextStyle.resolveColor(colorRole, colors, brightness);

    final TextStyle resolvedStyle = baseStyle.copyWith(
      color: textColor,
      fontWeight: fontWeight ?? baseStyle.fontWeight,
      fontStyle: fontStyle ?? baseStyle.fontStyle,
    );

    final TextStyle effectiveStyle = style?.merge(resolvedStyle) ?? resolvedStyle;

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

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('data', data));
    properties.add(EnumProperty<TextVariant>('variant', variant));
    properties.add(EnumProperty<TextColorRole>('colorRole', colorRole));
    properties.add(DiagnosticsProperty<FontWeight?>('fontWeight', fontWeight));
    properties.add(EnumProperty<FontStyle?>('fontStyle', fontStyle));
    properties.add(EnumProperty<TextAlign?>('textAlign', textAlign));
    properties.add(EnumProperty<TextOverflow?>('overflow', overflow));
    properties.add(IntProperty('maxLines', maxLines));
    properties.add(DiagnosticsProperty<bool?>('softWrap', softWrap));
    properties.add(
      EnumProperty<TextDirection?>('textDirection', textDirection),
    );
    properties.add(DiagnosticsProperty<Locale?>('locale', locale));
    properties.add(StringProperty('semanticsLabel', semanticsLabel));
    properties.add(DiagnosticsProperty<TextScaler?>('textScaler', textScaler));
    properties.add(DiagnosticsProperty<TextStyle?>('style', style));
  }
}
