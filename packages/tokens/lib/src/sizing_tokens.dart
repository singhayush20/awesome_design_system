// Sizing tokens for consistent component dimensions

import 'dart:ui';
import 'package:flutter/material.dart';

/// Component sizing tokens
@immutable
class SizingScale {
  const SizingScale({
    // Icon sizes
    this.iconXxs = 12.0,
    this.iconXs = 16.0,
    this.iconSm = 20.0,
    this.iconMd = 24.0,
    this.iconLg = 28.0,
    this.iconXl = 32.0,
    this.iconXxl = 40.0,

    // Avatar sizes
    this.avatarXxs = 24.0,
    this.avatarXs = 32.0,
    this.avatarSm = 40.0,
    this.avatarMd = 48.0,
    this.avatarLg = 56.0,
    this.avatarXl = 72.0,
    this.avatarXxl = 96.0,

    // Tap target minimum (48dp per Material guidelines)
    this.minTapTarget = 48.0,

    // Component heights
    this.heightXs = 24.0,
    this.heightSm = 32.0,
    this.heightMd = 40.0,
    this.heightLg = 48.0,
    this.heightXl = 56.0,

    // Button heights
    this.buttonHeightSm = 32.0,
    this.buttonHeightMd = 40.0,
    this.buttonHeightLg = 48.0,

    // Text field heights
    this.textFieldHeightSm = 40.0,
    this.textFieldHeightMd = 48.0,
    this.textFieldHeightLg = 56.0,
  });

  final double iconXxs;
  final double iconXs;
  final double iconSm;
  final double iconMd;
  final double iconLg;
  final double iconXl;
  final double iconXxl;

  final double avatarXxs;
  final double avatarXs;
  final double avatarSm;
  final double avatarMd;
  final double avatarLg;
  final double avatarXl;
  final double avatarXxl;

  final double minTapTarget;

  final double heightXs;
  final double heightSm;
  final double heightMd;
  final double heightLg;
  final double heightXl;

  final double buttonHeightSm;
  final double buttonHeightMd;
  final double buttonHeightLg;

  final double textFieldHeightSm;
  final double textFieldHeightMd;
  final double textFieldHeightLg;

  SizingScale copyWith({
    double? iconXxs,
    double? iconXs,
    double? iconSm,
    double? iconMd,
    double? iconLg,
    double? iconXl,
    double? iconXxl,
    double? avatarXxs,
    double? avatarXs,
    double? avatarSm,
    double? avatarMd,
    double? avatarLg,
    double? avatarXl,
    double? avatarXxl,
    double? minTapTarget,
    double? heightXs,
    double? heightSm,
    double? heightMd,
    double? heightLg,
    double? heightXl,
    double? buttonHeightSm,
    double? buttonHeightMd,
    double? buttonHeightLg,
    double? textFieldHeightSm,
    double? textFieldHeightMd,
    double? textFieldHeightLg,
  }) {
    return SizingScale(
      iconXxs: iconXxs ?? this.iconXxs,
      iconXs: iconXs ?? this.iconXs,
      iconSm: iconSm ?? this.iconSm,
      iconMd: iconMd ?? this.iconMd,
      iconLg: iconLg ?? this.iconLg,
      iconXl: iconXl ?? this.iconXl,
      iconXxl: iconXxl ?? this.iconXxl,
      avatarXxs: avatarXxs ?? this.avatarXxs,
      avatarXs: avatarXs ?? this.avatarXs,
      avatarSm: avatarSm ?? this.avatarSm,
      avatarMd: avatarMd ?? this.avatarMd,
      avatarLg: avatarLg ?? this.avatarLg,
      avatarXl: avatarXl ?? this.avatarXl,
      avatarXxl: avatarXxl ?? this.avatarXxl,
      minTapTarget: minTapTarget ?? this.minTapTarget,
      heightXs: heightXs ?? this.heightXs,
      heightSm: heightSm ?? this.heightSm,
      heightMd: heightMd ?? this.heightMd,
      heightLg: heightLg ?? this.heightLg,
      heightXl: heightXl ?? this.heightXl,
      buttonHeightSm: buttonHeightSm ?? this.buttonHeightSm,
      buttonHeightMd: buttonHeightMd ?? this.buttonHeightMd,
      buttonHeightLg: buttonHeightLg ?? this.buttonHeightLg,
      textFieldHeightSm: textFieldHeightSm ?? this.textFieldHeightSm,
      textFieldHeightMd: textFieldHeightMd ?? this.textFieldHeightMd,
      textFieldHeightLg: textFieldHeightLg ?? this.textFieldHeightLg,
    );
  }

  SizingScale lerp(SizingScale other, double t) {
    return SizingScale(
      iconXxs: lerpDouble(iconXxs, other.iconXxs, t)!,
      iconXs: lerpDouble(iconXs, other.iconXs, t)!,
      iconSm: lerpDouble(iconSm, other.iconSm, t)!,
      iconMd: lerpDouble(iconMd, other.iconMd, t)!,
      iconLg: lerpDouble(iconLg, other.iconLg, t)!,
      iconXl: lerpDouble(iconXl, other.iconXl, t)!,
      iconXxl: lerpDouble(iconXxl, other.iconXxl, t)!,
      avatarXxs: lerpDouble(avatarXxs, other.avatarXxs, t)!,
      avatarXs: lerpDouble(avatarXs, other.avatarXs, t)!,
      avatarSm: lerpDouble(avatarSm, other.avatarSm, t)!,
      avatarMd: lerpDouble(avatarMd, other.avatarMd, t)!,
      avatarLg: lerpDouble(avatarLg, other.avatarLg, t)!,
      avatarXl: lerpDouble(avatarXl, other.avatarXl, t)!,
      avatarXxl: lerpDouble(avatarXxl, other.avatarXxl, t)!,
      minTapTarget: lerpDouble(minTapTarget, other.minTapTarget, t)!,
      heightXs: lerpDouble(heightXs, other.heightXs, t)!,
      heightSm: lerpDouble(heightSm, other.heightSm, t)!,
      heightMd: lerpDouble(heightMd, other.heightMd, t)!,
      heightLg: lerpDouble(heightLg, other.heightLg, t)!,
      heightXl: lerpDouble(heightXl, other.heightXl, t)!,
      buttonHeightSm: lerpDouble(buttonHeightSm, other.buttonHeightSm, t)!,
      buttonHeightMd: lerpDouble(buttonHeightMd, other.buttonHeightMd, t)!,
      buttonHeightLg: lerpDouble(buttonHeightLg, other.buttonHeightLg, t)!,
      textFieldHeightSm: lerpDouble(
        textFieldHeightSm,
        other.textFieldHeightSm,
        t,
      )!,
      textFieldHeightMd: lerpDouble(
        textFieldHeightMd,
        other.textFieldHeightMd,
        t,
      )!,
      textFieldHeightLg: lerpDouble(
        textFieldHeightLg,
        other.textFieldHeightLg,
        t,
      )!,
    );
  }

  static const SizingScale defaultScale = SizingScale();
}

/// Unified sizing tokens implementing ThemeExtension
@immutable
class SizingTokens extends ThemeExtension<SizingTokens> {
  const SizingTokens({required this.scale});

  factory SizingTokens.defaultTokens() {
    return const SizingTokens(scale: SizingScale.defaultScale);
  }
  final SizingScale scale;

  SizingTokens copyWith({SizingScale? scale}) {
    return SizingTokens(scale: scale ?? this.scale);
  }

  @override
  SizingTokens lerp(ThemeExtension<SizingTokens>? other, double t) {
    if (other is! SizingTokens) return this;
    return SizingTokens(scale: scale.lerp(other.scale, t));
  }
}
