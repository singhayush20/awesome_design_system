// Spacing tokens for consistent spacing across the design system

import 'dart:ui';
import 'package:flutter/material.dart';

/// Base spacing scale (4px base unit)
@immutable
class SpacingScale {
  const SpacingScale({
    this.xxxs = 2.0,
    this.xxs = 4.0,
    this.xs = 8.0,
    this.sm = 12.0,
    this.md = 16.0,
    this.lg = 24.0,
    this.xl = 32.0,
    this.xxl = 40.0,
    this.xxxl = 48.0,
    this.xxxxl = 64.0,
  });

  final double xxxs;
  final double xxs;
  final double xs;
  final double sm;
  final double md;
  final double lg;
  final double xl;
  final double xxl;
  final double xxxl;
  final double xxxxl;

  SpacingScale copyWith({
    double? xxxs,
    double? xxs,
    double? xs,
    double? sm,
    double? md,
    double? lg,
    double? xl,
    double? xxl,
    double? xxxl,
    double? xxxxl,
  }) {
    return SpacingScale(
      xxxs: xxxs ?? this.xxxs,
      xxs: xxs ?? this.xxs,
      xs: xs ?? this.xs,
      sm: sm ?? this.sm,
      md: md ?? this.md,
      lg: lg ?? this.lg,
      xl: xl ?? this.xl,
      xxl: xxl ?? this.xxl,
      xxxl: xxxl ?? this.xxxl,
      xxxxl: xxxxl ?? this.xxxxl,
    );
  }

  SpacingScale lerp(SpacingScale other, double t) {
    return SpacingScale(
      xxxs: lerpDouble(xxxs, other.xxxs, t)!,
      xxs: lerpDouble(xxs, other.xxs, t)!,
      xs: lerpDouble(xs, other.xs, t)!,
      sm: lerpDouble(sm, other.sm, t)!,
      md: lerpDouble(md, other.md, t)!,
      lg: lerpDouble(lg, other.lg, t)!,
      xl: lerpDouble(xl, other.xl, t)!,
      xxl: lerpDouble(xxl, other.xxl, t)!,
      xxxl: lerpDouble(xxxl, other.xxxl, t)!,
      xxxxl: lerpDouble(xxxxl, other.xxxxl, t)!,
    );
  }

  static const SpacingScale defaultScale = SpacingScale();
}

/// Semantic padding tokens derived from spacing scale
@immutable
class PaddingTokens {
  const PaddingTokens({
    required this.compact,
    required this.comfortable,
    required this.spacious,
    required this.page,
    required this.component,
    required this.inline,
  });

  final EdgeInsetsGeometry compact;
  final EdgeInsetsGeometry comfortable;
  final EdgeInsetsGeometry spacious;
  final EdgeInsetsGeometry page;
  final EdgeInsetsGeometry component;
  final EdgeInsetsGeometry inline;

  factory PaddingTokens.fromScale(SpacingScale scale) {
    return PaddingTokens(
      compact: EdgeInsets.all(scale.xs),
      comfortable: EdgeInsets.all(scale.md),
      spacious: EdgeInsets.all(scale.lg),
      page: EdgeInsets.symmetric(horizontal: scale.lg, vertical: scale.md),
      component: EdgeInsets.symmetric(horizontal: scale.md, vertical: scale.sm),
      inline: EdgeInsets.symmetric(horizontal: scale.sm, vertical: scale.xs),
    );
  }

  PaddingTokens copyWith({
    EdgeInsetsGeometry? compact,
    EdgeInsetsGeometry? comfortable,
    EdgeInsetsGeometry? spacious,
    EdgeInsetsGeometry? page,
    EdgeInsetsGeometry? component,
    EdgeInsetsGeometry? inline,
  }) {
    return PaddingTokens(
      compact: compact ?? this.compact,
      comfortable: comfortable ?? this.comfortable,
      spacious: spacious ?? this.spacious,
      page: page ?? this.page,
      component: component ?? this.component,
      inline: inline ?? this.inline,
    );
  }

  PaddingTokens lerp(PaddingTokens other, double t) {
    return PaddingTokens(
      compact: EdgeInsetsGeometry.lerp(compact, other.compact, t)!,
      comfortable: EdgeInsetsGeometry.lerp(comfortable, other.comfortable, t)!,
      spacious: EdgeInsetsGeometry.lerp(spacious, other.spacious, t)!,
      page: EdgeInsetsGeometry.lerp(page, other.page, t)!,
      component: EdgeInsetsGeometry.lerp(component, other.component, t)!,
      inline: EdgeInsetsGeometry.lerp(inline, other.inline, t)!,
    );
  }
}

/// Unified spacing tokens implementing ThemeExtension
@immutable
class SpacingTokens extends ThemeExtension<SpacingTokens> {
  final SpacingScale scale;
  final PaddingTokens padding;

  const SpacingTokens({required this.scale, required this.padding});

  factory SpacingTokens.defaultTokens() {
    const scale = SpacingScale.defaultScale;
    return SpacingTokens(
      scale: scale,
      padding: PaddingTokens.fromScale(scale),
    );
  }

  SpacingTokens copyWith({
    SpacingScale? scale,
    PaddingTokens? padding,
  }) {
    return SpacingTokens(
      scale: scale ?? this.scale,
      padding: padding ?? this.padding,
    );
  }

  @override
  SpacingTokens lerp(ThemeExtension<SpacingTokens>? other, double t) {
    if (other is! SpacingTokens) return this;
    return SpacingTokens(
      scale: scale.lerp(other.scale, t),
      padding: padding.lerp(other.padding, t),
    );
  }
}