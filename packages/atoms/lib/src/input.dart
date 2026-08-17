// Input atom with validation states

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:awesome_design_system_tokens/tokens.dart';

/// Input types
enum DSInputType { text, email, password, number, phone, url, multiline, search }

/// Input sizes
enum DSInputSize { small, medium, large }

/// A versatile text input component with validation states
class DSInput extends StatefulWidget {
  const DSInput({
    super.key,
    this.controller,
    this.initialValue,
    this.type = DSInputType.text,
    this.size = DSInputSize.medium,
    this.label,
    this.hint,
    this.helperText,
    this.errorText,
    this.counterText,
    this.prefixIcon,
    this.suffixIcon,
    this.prefixText,
    this.suffixText,
    this.isDisabled = false,
    this.isReadOnly = false,
    this.isRequired = false,
    this.autoFocus = false,
    this.textInputAction,
    this.keyboardType,
    this.textCapitalization = TextCapitalization.none,
    this.obscureText = false,
    this.obscuringCharacter = '•',
    this.maxLength,
    this.maxLines = 1,
    this.minLines,
    this.expands = false,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.validator,
    this.inputFormatters,
    this.textAlign = TextAlign.start,
    this.textAlignVertical,
    this.scrollPadding,
    this.scrollPhysics,
    this.scrollController,
    this.enableInteractiveSelection = true,
    this.selectionControls,
    this.style,
    this.semanticLabel,
    this.restorationId,
  });

  final TextEditingController? controller;
  final String? initialValue;
  final DSInputType type;
  final DSInputSize size;
  final String? label;
  final String? hint;
  final String? helperText;
  final String? errorText;
  final String? counterText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? prefixText;
  final String? suffixText;
  final bool isDisabled;
  final bool isReadOnly;
  final bool isRequired;
  final bool autoFocus;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final TextCapitalization textCapitalization;
  final bool obscureText;
  final String obscuringCharacter;
  final int? maxLength;
  final int? maxLines;
  final int? minLines;
  final bool expands;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onTap;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormatters;
  final TextAlign textAlign;
  final TextAlignVertical? textAlignVertical;
  final EdgeInsets? scrollPadding;
  final ScrollPhysics? scrollPhysics;
  final ScrollController? scrollController;
  final bool enableInteractiveSelection;
  final TextSelectionControls? selectionControls;
  final TextStyle? style;
  final String? semanticLabel;
  final String? restorationId;

  @override
  State<DSInput> createState() => _DSInputState();
}

class _DSInputState extends State<DSInput> {
  late TextEditingController _controller;
  bool _obscureText = false;
  String? _errorText;
  int? _counter;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController(text: widget.initialValue);
    _obscureText = widget.type == DSInputType.password && widget.obscureText;
    _updateCounter();
    _controller.addListener(_onControllerChanged);
  }

  @override
  void dispose() {
    _controller.removeListener(_onControllerChanged);
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  void _onControllerChanged() {
    _updateCounter();
    if (widget.onChanged != null) {
      widget.onChanged!(_controller.text);
    }
  }

  void _updateCounter() {
    if (widget.maxLength != null) {
      setState(() {
        _counter = _controller.text.length;
      });
    }
  }

  void _toggleObscure() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<DesignTokens>();
    final spacing = tokens?.spacing.scale ?? SpacingScale.defaultScale;
    final sizing = tokens?.sizing.scale ?? SizingScale.defaultScale;
    final radius = tokens?.radius.scale ?? RadiusScale.defaultScale;
    final typography = tokens?.typography.scale ?? TypographyScale.defaultScale();
    final colors = Theme.of(context).colorScheme;

    final hasError = widget.errorText != null || _errorText != null;
    final effectiveErrorText = widget.errorText ?? _errorText;
    final showCounter = widget.maxLength != null;
    final counterText = widget.counterText ?? (_counter != null ? '$_counter/${widget.maxLength}' : null);

    // Determine keyboard type
    final keyboardType = widget.keyboardType ?? _resolveKeyboardType(widget.type);
    final textInputAction = widget.textInputAction ?? _resolveTextInputAction(widget.type);
    final obscureText = widget.type == DSInputType.password ? _obscureText : widget.obscureText;

    // Build input decoration
    final decoration = InputDecoration(
      labelText: widget.label,
      hintText: widget.hint,
      helperText: !hasError ? widget.helperText : null,
      errorText: hasError ? effectiveErrorText : null,
      counterText: showCounter ? counterText : null,
      prefixIcon: widget.prefixIcon != null
          ? Padding(
              padding: EdgeInsets.all(spacing.sm),
              child: widget.prefixIcon,
            )
          : null,
      suffixIcon: _buildSuffixIcon(context, spacing),
      prefixText: widget.prefixText,
      suffixText: widget.suffixText,
      filled: true,
      fillColor: _resolveFillColor(widget.isDisabled, hasError, colors),
      contentPadding: _resolveContentPadding(widget.size, spacing),
      labelStyle: typography.bodyLarge.copyWith(color: colors.onSurfaceVariant),
      hintStyle: typography.bodyLarge.copyWith(color: colors.onSurfaceVariant.withValues(alpha: 0.6)),
      helperStyle: typography.bodySmall.copyWith(color: colors.onSurfaceVariant),
      errorStyle: typography.bodySmall.copyWith(color: colors.error),
      counterStyle: typography.bodySmall.copyWith(color: colors.onSurfaceVariant),
      border: _buildBorder(radius, colors, hasError),
      enabledBorder: _buildBorder(radius, colors, hasError),
      focusedBorder: _buildFocusedBorder(radius, colors, hasError),
      errorBorder: _buildErrorBorder(radius, colors),
      focusedErrorBorder: _buildFocusedErrorBorder(radius, colors),
      disabledBorder: _buildDisabledBorder(radius, colors),
      floatingLabelBehavior: FloatingLabelBehavior.auto,
      alignLabelWithHint: widget.maxLines != null && widget.maxLines! > 1,
      isDense: widget.size == DSInputSize.small,
      constraints: BoxConstraints(
        minHeight: _resolveMinHeight(widget.size, sizing),
      ),
    );

    // Build text field
    Widget textField = TextFormField(
      controller: _controller,
      decoration: decoration,
      style: widget.style ?? typography.bodyLarge,
      textAlign: widget.textAlign,
      textAlignVertical: widget.textAlignVertical,
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      textCapitalization: widget.textCapitalization,
      obscureText: obscureText,
      obscuringCharacter: widget.obscuringCharacter,
      maxLength: widget.maxLength,
      maxLines: widget.maxLines,
      minLines: widget.minLines,
      expands: widget.expands,
      onChanged: widget.onChanged,
      onFieldSubmitted: widget.onSubmitted,
      onTap: widget.onTap,
      validator: widget.validator,
      inputFormatters: widget.inputFormatters,
      enabled: !widget.isDisabled && !widget.isReadOnly,
      readOnly: widget.isReadOnly,
      autofocus: widget.autoFocus,
      scrollPadding: widget.scrollPadding ?? EdgeInsets.all(20.0),
      scrollPhysics: widget.scrollPhysics,
      scrollController: widget.scrollController,
      enableInteractiveSelection: widget.enableInteractiveSelection,
      selectionControls: widget.selectionControls,
      restorationId: widget.restorationId,
    );

    // Add required indicator
    if (widget.isRequired && widget.label != null) {
      textField = _RequiredIndicator(child: textField, label: widget.label!);
    }

    // Semantics
    if (widget.semanticLabel != null) {
      textField = Semantics(
        label: widget.semanticLabel,
        textField: true,
        enabled: !widget.isDisabled,
        readOnly: widget.isReadOnly,
        child: textField,
      );
    }

    return textField;
  }

  Widget? _buildSuffixIcon(BuildContext context, SpacingScale spacing) {
    final icons = <Widget>[];

    // Password toggle
    if (widget.type == DSInputType.password && widget.obscureText) {
      icons.add(
        IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility_off : Icons.visibility,
            size: 20,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
          onPressed: _toggleObscure,
          padding: EdgeInsets.all(spacing.xs),
          constraints: const BoxConstraints(),
          splashRadius: 20,
        ),
      );
    }

    // Custom suffix icon
    if (widget.suffixIcon != null) {
      icons.add(
        Padding(
          padding: EdgeInsets.all(spacing.sm),
          child: widget.suffixIcon!,
        ),
      );
    }

    if (icons.isEmpty) return null;
    if (icons.length == 1) return icons.first;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: icons,
    );
  }

  TextInputType _resolveKeyboardType(DSInputType type) {
    return switch (type) {
      DSInputType.text => TextInputType.text,
      DSInputType.email => TextInputType.emailAddress,
      DSInputType.password => TextInputType.visiblePassword,
      DSInputType.number => TextInputType.number,
      DSInputType.phone => TextInputType.phone,
      DSInputType.url => TextInputType.url,
      DSInputType.multiline => TextInputType.multiline,
      DSInputType.search => TextInputType.text,
    };
  }

  TextInputAction _resolveTextInputAction(DSInputType type) {
    return switch (type) {
      DSInputType.text => TextInputAction.next,
      DSInputType.email => TextInputAction.next,
      DSInputType.password => TextInputAction.done,
      DSInputType.number => TextInputAction.next,
      DSInputType.phone => TextInputAction.next,
      DSInputType.url => TextInputAction.go,
      DSInputType.multiline => TextInputAction.newline,
      DSInputType.search => TextInputAction.search,
    };
  }

  Color _resolveFillColor(bool isDisabled, bool hasError, ColorScheme colors) {
    if (isDisabled) return colors.surfaceContainerHighest.withValues(alpha: 0.5);
    if (hasError) return colors.errorContainer.withValues(alpha: 0.1);
    return colors.surfaceContainerHighest.withValues(alpha: 0.5);
  }

  EdgeInsets _resolveContentPadding(DSInputSize size, SpacingScale spacing) {
    return switch (size) {
      DSInputSize.small => EdgeInsets.symmetric(horizontal: spacing.sm, vertical: spacing.xxs),
      DSInputSize.medium => EdgeInsets.symmetric(horizontal: spacing.md, vertical: spacing.xs),
      DSInputSize.large => EdgeInsets.symmetric(horizontal: spacing.md, vertical: spacing.sm),
    };
  }

  double _resolveMinHeight(DSInputSize size, SizingScale sizing) {
    return switch (size) {
      DSInputSize.small => sizing.textFieldHeightSm,
      DSInputSize.medium => sizing.textFieldHeightMd,
      DSInputSize.large => sizing.textFieldHeightLg,
    };
  }

  InputBorder _buildBorder(RadiusScale radius, ColorScheme colors, bool hasError) {
    return OutlineInputBorder(
      borderRadius: radius.mdRadius,
      borderSide: BorderSide(
        color: hasError ? colors.error : colors.outline,
        width: 1,
      ),
    );
  }

  InputBorder _buildFocusedBorder(RadiusScale radius, ColorScheme colors, bool hasError) {
    return OutlineInputBorder(
      borderRadius: radius.mdRadius,
      borderSide: BorderSide(
        color: hasError ? colors.error : colors.primary,
        width: 2,
      ),
    );
  }

  InputBorder _buildErrorBorder(RadiusScale radius, ColorScheme colors) {
    return OutlineInputBorder(
      borderRadius: radius.mdRadius,
      borderSide: BorderSide(color: colors.error, width: 1),
    );
  }

  InputBorder _buildFocusedErrorBorder(RadiusScale radius, ColorScheme colors) {
    return OutlineInputBorder(
      borderRadius: radius.mdRadius,
      borderSide: BorderSide(color: colors.error, width: 2),
    );
  }

  InputBorder _buildDisabledBorder(RadiusScale radius, ColorScheme colors) {
    return OutlineInputBorder(
      borderRadius: radius.mdRadius,
      borderSide: BorderSide(color: colors.outlineVariant, width: 1),
    );
  }
}

class _RequiredIndicator extends StatelessWidget {
  const _RequiredIndicator({required this.child, required this.label});

  final Widget child;
  final String label;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        RichText(
          text: TextSpan(
            text: label,
            style: DefaultTextStyle.of(context).style,
            children: [
              TextSpan(
                text: ' *',
                style: TextStyle(color: colors.error),
              ),
            ],
          ),
        ),
        const SizedBox(height: 4),
        child,
      ],
    );
  }
}

/// Text area variant for multiline input
class DSTextArea extends StatelessWidget {
  const DSTextArea({
    super.key,
    this.controller,
    this.initialValue,
    this.size = DSInputSize.medium,
    this.label,
    this.hint,
    this.helperText,
    this.errorText,
    this.counterText,
    this.prefixIcon,
    this.suffixIcon,
    this.isDisabled = false,
    this.isReadOnly = false,
    this.isRequired = false,
    this.autoFocus = false,
    this.maxLength,
    this.maxLines = 4,
    this.minLines = 3,
    this.onChanged,
    this.onSubmitted,
    this.validator,
    this.textAlign = TextAlign.start,
    this.style,
    this.semanticLabel,
  });

  final TextEditingController? controller;
  final String? initialValue;
  final DSInputSize size;
  final String? label;
  final String? hint;
  final String? helperText;
  final String? errorText;
  final String? counterText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool isDisabled;
  final bool isReadOnly;
  final bool isRequired;
  final bool autoFocus;
  final int? maxLength;
  final int? maxLines;
  final int? minLines;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final FormFieldValidator<String>? validator;
  final TextAlign textAlign;
  final TextStyle? style;
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    return DSInput(
      controller: controller,
      initialValue: initialValue,
      type: DSInputType.multiline,
      size: size,
      label: label,
      hint: hint,
      helperText: helperText,
      errorText: errorText,
      counterText: counterText,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      isDisabled: isDisabled,
      isReadOnly: isReadOnly,
      isRequired: isRequired,
      autoFocus: autoFocus,
      maxLength: maxLength,
      maxLines: maxLines,
      minLines: minLines,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      validator: validator,
      textAlign: textAlign,
      style: style,
      semanticLabel: semanticLabel,
    );
  }
}