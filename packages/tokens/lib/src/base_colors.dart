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

  // ==========================================
  // CORE NEUTRALS
  // ==========================================
  static const Color transparent = Color(0x00000000);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color black87 = Color(0xDD000000);
  static const Color black54 = Color(0x8A000000);
  static const Color black38 = Color(0x61000000);
  static const Color black12 = Color(0x1F000000);

  // ==========================================
  // BLUE SHADES (100-800)
  // ==========================================
  static const Color blue50 = Color(0xFFE3F2FD);
  static const Color blue100 = Color(0xFFE3F2FD);
  static const Color blue200 = Color(0xFFBBDEFB);
  static const Color blue300 = Color(0xFF90CAF9);
  static const Color blue400 = Color(0xFF64B5F6);
  static const Color blue500 = Color(0xFF42A5F5);
  static const Color blue600 = Color(0xFF2196F3);
  static const Color blue700 = Color(0xFF1E88E5);
  static const Color blue800 = Color(0xFF1976D2);
  static const Color blue900 = Color(0xFF1565C0);

  // ==========================================
  // RED SHADES (100-800)
  // ==========================================
  static const Color red50 = Color(0xFFFFEBEE);
  static const Color red100 = Color(0xFFFFEBEE);
  static const Color red200 = Color(0xFFFFCDD2);
  static const Color red300 = Color(0xFFEF9A9A);
  static const Color red400 = Color(0xFFE57373);
  static const Color red500 = Color(0xFFEF5350);
  static const Color red600 = Color(0xFFE53935);
  static const Color red700 = Color(0xFFD32F2F);
  static const Color red800 = Color(0xFFC62828);
  static const Color red900 = Color(0xFFBA1A1A);

  // ==========================================
  // GREEN SHADES (100-800)
  // ==========================================
  static const Color green50 = Color(0xFFE8F5E9);
  static const Color green100 = Color(0xFFE8F5E9);
  static const Color green200 = Color(0xFFC8E6C9);
  static const Color green300 = Color(0xFFA5D6A7);
  static const Color green400 = Color(0xFF81C784);
  static const Color green500 = Color(0xFF66BB6A);
  static const Color green600 = Color(0xFF4CAF50);
  static const Color green700 = Color(0xFF43A047);
  static const Color green800 = Color(0xFF388E3C);
  static const Color green900 = Color(0xFF2E7D32);

  // ==========================================
  // YELLOW SHADES (100-800)
  // ==========================================
  static const Color yellow50 = Color(0xFFFFFDE7);
  static const Color yellow100 = Color(0xFFFFFDE7);
  static const Color yellow200 = Color(0xFFFFF9C4);
  static const Color yellow300 = Color(0xFFFFF59D);
  static const Color yellow400 = Color(0xFFFFF176);
  static const Color yellow500 = Color(0xFFFFEE58);
  static const Color yellow600 = Color(0xFFFFEB3B);
  static const Color yellow700 = Color(0xFFFDD835);
  static const Color yellow800 = Color(0xFFFBC02D);
  static const Color yellow900 = Color(0xFFF9A825);

  // ==========================================
  // ORANGE SHADES (100-800)
  // ==========================================
  static const Color orange50 = Color(0xFFFFF3E0);
  static const Color orange100 = Color(0xFFFFF3E0);
  static const Color orange200 = Color(0xFFFFE0B2);
  static const Color orange300 = Color(0xFFFFCC80);
  static const Color orange400 = Color(0xFFFFB74D);
  static const Color orange500 = Color(0xFFFFA726);
  static const Color orange600 = Color(0xFFFF9800);
  static const Color orange700 = Color(0xFFFB8C00);
  static const Color orange800 = Color(0xFFF57C00);
  static const Color orange900 = Color(0xFFE65100);

  // ==========================================
  // PURPLE SHADES (100-800)
  // ==========================================
  static const Color purple50 = Color(0xFFF3E5F5);
  static const Color purple100 = Color(0xFFF3E5F5);
  static const Color purple200 = Color(0xFFE1BEE7);
  static const Color purple300 = Color(0xFFCE93D8);
  static const Color purple400 = Color(0xFFBA68C8);
  static const Color purple500 = Color(0xFFAB47BC);
  static const Color purple600 = Color(0xFF9C27B0);
  static const Color purple700 = Color(0xFF8E24AA);
  static const Color purple800 = Color(0xFF7B1FA2);
  static const Color purple900 = Color(0xFF6750A4);

  // ==========================================
  // TEAL SHADES (100-800)
  // ==========================================
  static const Color teal50 = Color(0xFFE0F2F1);
  static const Color teal100 = Color(0xFFE0F2F1);
  static const Color teal200 = Color(0xFFB2DFDB);
  static const Color teal300 = Color(0xFF80CBC4);
  static const Color teal400 = Color(0xFF4DB6AC);
  static const Color teal500 = Color(0xFF26A69A);
  static const Color teal600 = Color(0xFF009688);
  static const Color teal700 = Color(0xFF00897B);
  static const Color teal800 = Color(0xFF00796B);
  static const Color teal900 = Color(0xFF004D40);

  // ==========================================
  // NEUTRAL/GREY SHADES (100-800)
  // ==========================================
  static const Color neutral50 = Color(0xFFFAFAFA);
  static const Color neutral100 = Color(0xFFF5F5F5);
  static const Color neutral200 = Color(0xFFEEEEEE);
  static const Color neutral300 = Color(0xFFE0E0E0);
  static const Color neutral400 = Color(0xFFBDBDBD);
  static const Color neutral500 = Color(0xFF9E9E9E);
  static const Color neutral600 = Color(0xFF757575);
  static const Color neutral700 = Color(0xFF616161);
  static const Color neutral800 = Color(0xFF424242);
  static const Color neutral900 = Color(0xFF212121);

  // ==========================================
  // SLATE / COOL GREY PALETTE
  // ==========================================
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

  // ==========================================
  // GREY SCALE (Material neutral palette)
  // ==========================================
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

  // ==========================================
  // BRAND SEED DEFAULTS (Deprecated - use specific shades above)
  // ==========================================
  static const Color brandPurple = purple600;
  static const Color brandPurpleLight = purple400;
  static const Color brandBlue = blue600;
  static const Color brandTeal = teal600;

  // ==========================================
  // STATUS COLORS - Success (Deprecated - use green shades above)
  // ==========================================
  static const Color success = green600;
  static const Color successLight = green500;
  static const Color onSuccess = white;
  static const Color successContainer = green200;
  static const Color onSuccessContainer = green900;

  // ==========================================
  // STATUS COLORS - Warning (Deprecated - use orange shades above)
  // ==========================================
  static const Color warning = orange600;
  static const Color warningLight = orange500;
  static const Color onWarning = white;
  static const Color warningContainer = orange200;
  static const Color onWarningContainer = orange900;

  // ==========================================
  // STATUS COLORS - Error (Deprecated - use red shades above)
  // ==========================================
  static const Color error = red600;
  static const Color errorLight = red500;
  static const Color onError = white;
  static const Color errorContainer = red200;
  static const Color onErrorContainer = red900;

  // ==========================================
  // STATUS COLORS - Info (Deprecated - use blue shades above)
  // ==========================================
  static const Color info = blue600;
  static const Color infoLight = blue500;
  static const Color onInfo = white;
  static const Color infoContainer = blue200;
  static const Color onInfoContainer = blue900;
}
