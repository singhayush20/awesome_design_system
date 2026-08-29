import 'package:flutter/material.dart';
import 'package:awesome_design_system_atoms/atoms.dart';

/// Typed action button model for [DSBottomSheet].
class DSBottomSheetAction {
  const DSBottomSheetAction({
    required this.label,
    required this.onPressed,
    this.variant = ButtonVariant.filled,
    this.leadingIcon,
    this.trailingIcon,
    this.isLoading = false,
    this.isDisabled = false,
  });

  /// Action button label text
  final String label;

  /// Callback when pressed
  final VoidCallback? onPressed;

  /// Visual button variant
  final ButtonVariant variant;

  /// Optional leading icon
  final Widget? leadingIcon;

  /// Optional trailing icon
  final Widget? trailingIcon;

  /// Whether the button is loading
  final bool isLoading;

  /// Whether the button is disabled
  final bool isDisabled;
}
