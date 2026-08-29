// Raw color palette for the design system.

import 'package:flutter/material.dart';

/// Raw base color palette.
///
/// These are the raw, non-semantic colors that semantic roles derive from.
/// Components should consume semantic colors via `DsColors` or `DesignTokens`
/// rather than referencing these directly so they adapt to light/dark themes.
@immutable
abstract final class BaseColors {
  const BaseColors._();

  // Neutrals
  static const Color transparent = Color(0x00000000);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color black87 = Color(0xDD000000);
  static const Color black54 = Color(0x8A000000);
  static const Color black38 = Color(0x61000000);
  static const Color black12 = Color(0x1F000000);

  // Grey scale (Material neutral palette)
  static const Color grey50 = Color(0xFFFAFAFA);
  static const Color grey100 = Color(0xFFF5F5F5);
  static const Color grey200 = Color(0xFFEEEEEE);
  static const Color grey300 = Color(0xFFE0E0E0);
  static const Color grey400 = Color(0xFFBDBDBD);
  static const Color grey500 = Color(0xFF9E9E9E);
  static const Color grey600 = Color(0xFF757575);
  static const Color grey700 = Color(0xFF616161);
  static const Color grey800 = Color(0xFF424242);
  static const Color grey900 = Color(0xFF212121);
  static const Color grey950 = Color(0xFF121212);

  // Slate / Cool grey palette
  static const Color slate50 = Color(0xFFF8FAFC);
  static const Color slate100 = Color(0xFFF1F5F9);
  static const Color slate200 = Color(0xFFE2E8F0);
  static const Color slate300 = Color(0xFFCBD5E1);
  static const Color slate400 = Color(0xFF94A3B8);
  static const Color slate500 = Color(0xFF64748B);
  static const Color slate600 = Color(0xFF475569);
  static const Color slate700 = Color(0xFF334155);
  static const Color slate800 = Color(0xFF1E293B);
  static const Color slate900 = Color(0xFF0F172A);

  // Brand seed defaults
  static const Color brandPurple = Color(0xFF6750A4);
  static const Color brandPurpleLight = Color(0xFFD0BCFF);
  static const Color brandBlue = Color(0xFF2196F3);
  static const Color brandTeal = Color(0xFF009688);

  // Status colors - Success
  static const Color success = Color(0xFF2E7D32);
  static const Color successLight = Color(0xFF4CAF50);
  static const Color onSuccess = Color(0xFFFFFFFF);
  static const Color successContainer = Color(0xFFC8E6C9);
  static const Color onSuccessContainer = Color(0xFF1B5E20);

  // Status colors - Warning
  static const Color warning = Color(0xFFE65100);
  static const Color warningLight = Color(0xFFFF9800);
  static const Color onWarning = Color(0xFFFFFFFF);
  static const Color warningContainer = Color(0xFFFFE0B2);
  static const Color onWarningContainer = Color(0xFFE65100);

  // Status colors - Error
  static const Color error = Color(0xFFBA1A1A);
  static const Color errorLight = Color(0xFFFF5449);
  static const Color onError = Color(0xFFFFFFFF);
  static const Color errorContainer = Color(0xFFFFDAD6);
  static const Color onErrorContainer = Color(0xFF410002);

  // Status colors - Info
  static const Color info = Color(0xFF1565C0);
  static const Color infoLight = Color(0xFF2196F3);
  static const Color onInfo = Color(0xFFFFFFFF);
  static const Color infoContainer = Color(0xFFBBDEFB);
  static const Color onInfoContainer = Color(0xFF0D47A1);
}
