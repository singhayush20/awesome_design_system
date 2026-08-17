// Border radius tokens

import 'dart:ui';
import 'package:flutter/material.dart';

/// Border radius scale
@immutable
class RadiusScale {
  const RadiusScale({
    this.none = 0.0,
    this.xs = 4.0,
    this.sm = 8.0,
    this.md = 12.0,
    this.lg = 16.0,
    this.xl = 24.0,
    this.full = 9999.0,
  });

  final double none;
  final double xs;
  final double sm;
  final double md;
  final double lg;
  final double xl;
  final double full;

  BorderRadius get noneRadius => BorderRadius.circular(none);
  BorderRadius get xsRadius => BorderRadius.circular(xs);
  BorderRadius get smRadius => BorderRadius.circular(sm);
  BorderRadius get mdRadius => BorderRadius.circular(md);
  BorderRadius get lgRadius => BorderRadius.circular(lg);
  BorderRadius get xlRadius => BorderRadius.circular(xl);
  BorderRadius get fullRadius => BorderRadius.circular(full);

  RadiusScale copyWith({
    double? none,
    double? xs,
    double? sm,
    double? md,
    double? lg,
    double? xl,
    double? full,
  }) {
    return RadiusScale(
      none: none ?? this.none,
      xs: xs ?? this.xs,
      sm: sm ?? this.sm,
      md: md ?? this.md,
      lg: lg ?? this.lg,
      xl: xl ?? this.xl,
      full: full ?? this.full,
    );
  }

  RadiusScale lerp(RadiusScale other, double t) {
    return RadiusScale(
      none: lerpDouble(none, other.none, t)!,
      xs: lerpDouble(xs, other.xs, t)!,
      sm: lerpDouble(sm, other.sm, t)!,
      md: lerpDouble(md, other.md, t)!,
      lg: lerpDouble(lg, other.lg, t)!,
      xl: lerpDouble(xl, other.xl, t)!,
      full: lerpDouble(full, other.full, t)!,
    );
  }

  static const RadiusScale defaultScale = RadiusScale();
}

/// Unified radius tokens implementing ThemeExtension
@immutable
class RadiusTokens extends ThemeExtension<RadiusTokens> {
  final RadiusScale scale;

  const RadiusTokens({required this.scale});

  factory RadiusTokens.defaultTokens() {
    return const RadiusTokens(scale: RadiusScale.defaultScale);
  }

  RadiusTokens copyWith({RadiusScale? scale}) {
    return RadiusTokens(scale: scale ?? this.scale);
  }

  @override
  RadiusTokens lerp(ThemeExtension<RadiusTokens>? other, double t) {
    if (other is! RadiusTokens) return this;
    return RadiusTokens(scale: scale.lerp(other.scale, t));
  }
}