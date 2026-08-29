import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:awesome_design_system_tokens/tokens.dart';
import 'text_enums.dart';
import 'text_style.dart';

/// A rich text component supporting multiple styles and spans.
class DSRichText extends StatelessWidget {
  const DSRichText({
    required this.spans,
    super.key,
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
    final DesignTokens? tokens = Theme.of(context).extension<DesignTokens>();
    final TypographyScale typography =
        tokens?.typography.scale ?? TypographyScale.defaultScale();
    final ColorScheme colors = Theme.of(context).colorScheme;
    final Brightness brightness = Theme.of(context).brightness;

    final TextStyle baseStyle = style ?? typography.bodyMedium;

    return RichText(
      textAlign: textAlign ?? TextAlign.start,
      overflow: overflow ?? TextOverflow.clip,
      maxLines: maxLines,
      softWrap: softWrap ?? true,
      textDirection: textDirection,
      textScaler: textScaler ?? const TextScaler.linear(1.0),
      text: TextSpan(
        style: baseStyle,
        children: spans
            .map(
              (DSTextSpan span) =>
                  span.toTextSpan(typography, colors, brightness),
            )
            .toList(),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IterableProperty<DSTextSpan>('spans', spans));
    properties.add(EnumProperty<TextAlign?>('textAlign', textAlign));
    properties.add(EnumProperty<TextOverflow?>('overflow', overflow));
    properties.add(IntProperty('maxLines', maxLines));
    properties.add(DiagnosticsProperty<bool?>('softWrap', softWrap));
    properties.add(
      EnumProperty<TextDirection?>('textDirection', textDirection),
    );
    properties.add(DiagnosticsProperty<TextScaler?>('textScaler', textScaler));
    properties.add(DiagnosticsProperty<TextStyle?>('style', style));
  }
}

/// A text span for [DSRichText].
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
    final TextVariant baseVariant = variant ?? TextVariant.bodyMedium;
    final TextColorRole baseColorRole = colorRole ?? TextColorRole.primary;

    final TextStyle baseStyle = DSTextStyle.resolveBaseStyle(baseVariant, typography);
    final Color textColor = DSTextStyle.resolveColor(baseColorRole, colors, brightness);

    final TextStyle effectiveStyle = baseStyle
        .copyWith(
          color: textColor,
          fontWeight: fontWeight ?? baseStyle.fontWeight,
          fontStyle: fontStyle ?? baseStyle.fontStyle,
          decoration: decoration,
          decorationColor: decorationColor,
          decorationStyle: decorationStyle,
          decorationThickness: decorationThickness,
        )
        .merge(style);

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
