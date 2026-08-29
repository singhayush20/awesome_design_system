import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Immutable style parameters for DSButton.
@immutable
class DSButtonStyle with Diagnosticable {
  const DSButtonStyle({
    this.backgroundColor,
    this.foregroundColor,
    this.disabledBackgroundColor,
    this.disabledForegroundColor,
    this.overlayColor,
    this.shadowColor,
    this.elevation,
    this.padding,
    this.minimumSize,
    this.borderRadius,
    this.borderSide,
    this.textStyle,
    this.iconSize,
    this.spacing,
  });

  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? disabledBackgroundColor;
  final Color? disabledForegroundColor;
  final Color? overlayColor;
  final Color? shadowColor;
  final double? elevation;
  final EdgeInsetsGeometry? padding;
  final Size? minimumSize;
  final BorderRadius? borderRadius;
  final BorderSide? borderSide;
  final TextStyle? textStyle;
  final double? iconSize;
  final double? spacing;

  DSButtonStyle copyWith({
    Color? backgroundColor,
    Color? foregroundColor,
    Color? disabledBackgroundColor,
    Color? disabledForegroundColor,
    Color? overlayColor,
    Color? shadowColor,
    double? elevation,
    EdgeInsetsGeometry? padding,
    Size? minimumSize,
    BorderRadius? borderRadius,
    BorderSide? borderSide,
    TextStyle? textStyle,
    double? iconSize,
    double? spacing,
  }) {
    return DSButtonStyle(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      foregroundColor: foregroundColor ?? this.foregroundColor,
      disabledBackgroundColor:
          disabledBackgroundColor ?? this.disabledBackgroundColor,
      disabledForegroundColor:
          disabledForegroundColor ?? this.disabledForegroundColor,
      overlayColor: overlayColor ?? this.overlayColor,
      shadowColor: shadowColor ?? this.shadowColor,
      elevation: elevation ?? this.elevation,
      padding: padding ?? this.padding,
      minimumSize: minimumSize ?? this.minimumSize,
      borderRadius: borderRadius ?? this.borderRadius,
      borderSide: borderSide ?? this.borderSide,
      textStyle: textStyle ?? this.textStyle,
      iconSize: iconSize ?? this.iconSize,
      spacing: spacing ?? this.spacing,
    );
  }

  DSButtonStyle merge(DSButtonStyle? other) {
    if (other == null) return this;
    return copyWith(
      backgroundColor: other.backgroundColor,
      foregroundColor: other.foregroundColor,
      disabledBackgroundColor: other.disabledBackgroundColor,
      disabledForegroundColor: other.disabledForegroundColor,
      overlayColor: other.overlayColor,
      shadowColor: other.shadowColor,
      elevation: other.elevation,
      padding: other.padding,
      minimumSize: other.minimumSize,
      borderRadius: other.borderRadius,
      borderSide: other.borderSide,
      textStyle: other.textStyle,
      iconSize: other.iconSize,
      spacing: other.spacing,
    );
  }

  static DSButtonStyle? lerp(DSButtonStyle? a, DSButtonStyle? b, double t) {
    if (identical(a, b)) return a;
    return DSButtonStyle(
      backgroundColor: Color.lerp(a?.backgroundColor, b?.backgroundColor, t),
      foregroundColor: Color.lerp(a?.foregroundColor, b?.foregroundColor, t),
      disabledBackgroundColor: Color.lerp(
        a?.disabledBackgroundColor,
        b?.disabledBackgroundColor,
        t,
      ),
      disabledForegroundColor: Color.lerp(
        a?.disabledForegroundColor,
        b?.disabledForegroundColor,
        t,
      ),
      overlayColor: Color.lerp(a?.overlayColor, b?.overlayColor, t),
      shadowColor: Color.lerp(a?.shadowColor, b?.shadowColor, t),
      elevation: lerpDouble(a?.elevation, b?.elevation, t),
      padding: EdgeInsetsGeometry.lerp(a?.padding, b?.padding, t),
      borderRadius: BorderRadius.lerp(a?.borderRadius, b?.borderRadius, t),
      borderSide: BorderSide.lerp(
        a?.borderSide ?? BorderSide.none,
        b?.borderSide ?? BorderSide.none,
        t,
      ),
      textStyle: TextStyle.lerp(a?.textStyle, b?.textStyle, t),
      iconSize: lerpDouble(a?.iconSize, b?.iconSize, t),
      spacing: lerpDouble(a?.spacing, b?.spacing, t),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(ColorProperty('backgroundColor', backgroundColor));
    properties.add(ColorProperty('foregroundColor', foregroundColor));
    properties.add(ColorProperty('overlayColor', overlayColor));
    properties.add(ColorProperty('shadowColor', shadowColor));
    properties.add(
      ColorProperty('disabledBackgroundColor', disabledBackgroundColor),
    );
    properties.add(
      ColorProperty('disabledForegroundColor', disabledForegroundColor),
    );
    properties.add(DoubleProperty('elevation', elevation));
    properties.add(
      DiagnosticsProperty<EdgeInsetsGeometry?>('padding', padding),
    );
    properties.add(DiagnosticsProperty<Size?>('minimumSize', minimumSize));
    properties.add(
      DiagnosticsProperty<BorderRadius?>('borderRadius', borderRadius),
    );
    properties.add(DiagnosticsProperty<BorderSide?>('borderSide', borderSide));
    properties.add(DiagnosticsProperty<TextStyle?>('textStyle', textStyle));
    properties.add(DoubleProperty('iconSize', iconSize));
    properties.add(DoubleProperty('spacing', spacing));
  }
}
