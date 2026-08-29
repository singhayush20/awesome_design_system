import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Immutable style parameters for DSCard.
@immutable
class DSCardStyle with Diagnosticable {
  const DSCardStyle({
    this.backgroundColor,
    this.surfaceTintColor,
    this.shadowColor,
    this.elevation,
    this.borderRadius,
    this.borderSide,
    this.padding,
    this.margin,
  });

  final Color? backgroundColor;
  final Color? surfaceTintColor;
  final Color? shadowColor;
  final double? elevation;
  final BorderRadius? borderRadius;
  final BorderSide? borderSide;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  DSCardStyle copyWith({
    Color? backgroundColor,
    Color? surfaceTintColor,
    Color? shadowColor,
    double? elevation,
    BorderRadius? borderRadius,
    BorderSide? borderSide,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
  }) {
    return DSCardStyle(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      surfaceTintColor: surfaceTintColor ?? this.surfaceTintColor,
      shadowColor: shadowColor ?? this.shadowColor,
      elevation: elevation ?? this.elevation,
      borderRadius: borderRadius ?? this.borderRadius,
      borderSide: borderSide ?? this.borderSide,
      padding: padding ?? this.padding,
      margin: margin ?? this.margin,
    );
  }

  DSCardStyle merge(DSCardStyle? other) {
    if (other == null) return this;
    return copyWith(
      backgroundColor: other.backgroundColor,
      surfaceTintColor: other.surfaceTintColor,
      shadowColor: other.shadowColor,
      elevation: other.elevation,
      borderRadius: other.borderRadius,
      borderSide: other.borderSide,
      padding: other.padding,
      margin: other.margin,
    );
  }

  static DSCardStyle? lerp(DSCardStyle? a, DSCardStyle? b, double t) {
    if (identical(a, b)) return a;
    return DSCardStyle(
      backgroundColor: Color.lerp(a?.backgroundColor, b?.backgroundColor, t),
      surfaceTintColor: Color.lerp(a?.surfaceTintColor, b?.surfaceTintColor, t),
      shadowColor: Color.lerp(a?.shadowColor, b?.shadowColor, t),
      elevation: lerpDouble(a?.elevation, b?.elevation, t),
      borderRadius: BorderRadius.lerp(a?.borderRadius, b?.borderRadius, t),
      borderSide: BorderSide.lerp(
        a?.borderSide ?? BorderSide.none,
        b?.borderSide ?? BorderSide.none,
        t,
      ),
      padding: EdgeInsetsGeometry.lerp(a?.padding, b?.padding, t),
      margin: EdgeInsetsGeometry.lerp(a?.margin, b?.margin, t),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(ColorProperty('backgroundColor', backgroundColor));
    properties.add(ColorProperty('surfaceTintColor', surfaceTintColor));
    properties.add(ColorProperty('shadowColor', shadowColor));
    properties.add(DoubleProperty('elevation', elevation));
    properties.add(
      DiagnosticsProperty<BorderRadius?>('borderRadius', borderRadius),
    );
    properties.add(DiagnosticsProperty<BorderSide?>('borderSide', borderSide));
    properties.add(DiagnosticsProperty<EdgeInsetsGeometry?>('padding', padding));
    properties.add(DiagnosticsProperty<EdgeInsetsGeometry?>('margin', margin));
  }
}
