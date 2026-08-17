// Border width tokens

import 'dart:ui';
import 'package:flutter/material.dart';

/// Border width scale
@immutable
class BorderScale {
  const BorderScale({
    this.none = 0.0,
    this.thin = 1.0,
    this.medium = 2.0,
    this.thick = 3.0,
    this.thicker = 4.0,
  });

  final double none;
  final double thin;
  final double medium;
  final double thick;
  final double thicker;

  BorderScale copyWith({
    double? none,
    double? thin,
    double? medium,
    double? thick,
    double? thicker,
  }) {
    return BorderScale(
      none: none ?? this.none,
      thin: thin ?? this.thin,
      medium: medium ?? this.medium,
      thick: thick ?? this.thick,
      thicker: thicker ?? this.thicker,
    );
  }

  BorderScale lerp(BorderScale other, double t) {
    return BorderScale(
      none: lerpDouble(none, other.none, t)!,
      thin: lerpDouble(thin, other.thin, t)!,
      medium: lerpDouble(medium, other.medium, t)!,
      thick: lerpDouble(thick, other.thick, t)!,
      thicker: lerpDouble(thicker, other.thicker, t)!,
    );
  }

  static const BorderScale defaultScale = BorderScale();
}

/// Unified border tokens implementing ThemeExtension
@immutable
class BorderTokens extends ThemeExtension<BorderTokens> {
  final BorderScale scale;

  const BorderTokens({required this.scale});

  factory BorderTokens.defaultTokens() {
    return const BorderTokens(scale: BorderScale.defaultScale);
  }

  BorderTokens copyWith({BorderScale? scale}) {
    return BorderTokens(scale: scale ?? this.scale);
  }

  @override
  BorderTokens lerp(ThemeExtension<BorderTokens>? other, double t) {
    if (other is! BorderTokens) return this;
    return BorderTokens(scale: scale.lerp(other.scale, t));
  }
}