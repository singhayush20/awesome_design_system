import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Immutable style parameters for [DSInput].
@immutable
class DSInputStyle with Diagnosticable {
  const DSInputStyle({
    this.fillColor,
    this.labelStyle,
    this.hintStyle,
    this.helperStyle,
    this.errorStyle,
    this.counterStyle,
    this.contentPadding,
    this.borderRadius,
    this.borderSide,
  });

  final Color? fillColor;
  final TextStyle? labelStyle;
  final TextStyle? hintStyle;
  final TextStyle? helperStyle;
  final TextStyle? errorStyle;
  final TextStyle? counterStyle;
  final EdgeInsetsGeometry? contentPadding;
  final BorderRadius? borderRadius;
  final BorderSide? borderSide;

  DSInputStyle copyWith({
    Color? fillColor,
    TextStyle? labelStyle,
    TextStyle? hintStyle,
    TextStyle? helperStyle,
    TextStyle? errorStyle,
    TextStyle? counterStyle,
    EdgeInsetsGeometry? contentPadding,
    BorderRadius? borderRadius,
    BorderSide? borderSide,
  }) {
    return DSInputStyle(
      fillColor: fillColor ?? this.fillColor,
      labelStyle: labelStyle ?? this.labelStyle,
      hintStyle: hintStyle ?? this.hintStyle,
      helperStyle: helperStyle ?? this.helperStyle,
      errorStyle: errorStyle ?? this.errorStyle,
      counterStyle: counterStyle ?? this.counterStyle,
      contentPadding: contentPadding ?? this.contentPadding,
      borderRadius: borderRadius ?? this.borderRadius,
      borderSide: borderSide ?? this.borderSide,
    );
  }

  DSInputStyle merge(DSInputStyle? other) {
    if (other == null) return this;
    return copyWith(
      fillColor: other.fillColor,
      labelStyle: other.labelStyle,
      hintStyle: other.hintStyle,
      helperStyle: other.helperStyle,
      errorStyle: other.errorStyle,
      counterStyle: other.counterStyle,
      contentPadding: other.contentPadding,
      borderRadius: other.borderRadius,
      borderSide: other.borderSide,
    );
  }

  static DSInputStyle? lerp(DSInputStyle? a, DSInputStyle? b, double t) {
    if (identical(a, b)) return a;
    return DSInputStyle(
      fillColor: Color.lerp(a?.fillColor, b?.fillColor, t),
      labelStyle: TextStyle.lerp(a?.labelStyle, b?.labelStyle, t),
      hintStyle: TextStyle.lerp(a?.hintStyle, b?.hintStyle, t),
      helperStyle: TextStyle.lerp(a?.helperStyle, b?.helperStyle, t),
      errorStyle: TextStyle.lerp(a?.errorStyle, b?.errorStyle, t),
      counterStyle: TextStyle.lerp(a?.counterStyle, b?.counterStyle, t),
      contentPadding: EdgeInsetsGeometry.lerp(
        a?.contentPadding,
        b?.contentPadding,
        t,
      ),
      borderRadius: BorderRadius.lerp(a?.borderRadius, b?.borderRadius, t),
      borderSide: BorderSide.lerp(
        a?.borderSide ?? BorderSide.none,
        b?.borderSide ?? BorderSide.none,
        t,
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(ColorProperty('fillColor', fillColor));
    properties.add(DiagnosticsProperty<TextStyle?>('labelStyle', labelStyle));
    properties.add(DiagnosticsProperty<TextStyle?>('hintStyle', hintStyle));
    properties.add(DiagnosticsProperty<TextStyle?>('helperStyle', helperStyle));
    properties.add(DiagnosticsProperty<TextStyle?>('errorStyle', errorStyle));
    properties.add(
      DiagnosticsProperty<TextStyle?>('counterStyle', counterStyle),
    );
    properties.add(
      DiagnosticsProperty<EdgeInsetsGeometry?>(
        'contentPadding',
        contentPadding,
      ),
    );
    properties.add(
      DiagnosticsProperty<BorderRadius?>('borderRadius', borderRadius),
    );
    properties.add(DiagnosticsProperty<BorderSide?>('borderSide', borderSide));
  }
}
