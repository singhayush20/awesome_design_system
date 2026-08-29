import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'input_enums.dart';
import 'input.dart';

/// Text area variant for multiline input.
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

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      DiagnosticsProperty<TextEditingController?>('controller', controller),
    );
    properties.add(StringProperty('initialValue', initialValue));
    properties.add(EnumProperty<DSInputSize>('size', size));
    properties.add(StringProperty('label', label));
    properties.add(StringProperty('hint', hint));
    properties.add(StringProperty('helperText', helperText));
    properties.add(StringProperty('errorText', errorText));
    properties.add(StringProperty('counterText', counterText));
    properties.add(DiagnosticsProperty<bool>('isDisabled', isDisabled));
    properties.add(DiagnosticsProperty<bool>('isReadOnly', isReadOnly));
    properties.add(DiagnosticsProperty<bool>('isRequired', isRequired));
    properties.add(DiagnosticsProperty<bool>('autoFocus', autoFocus));
    properties.add(IntProperty('maxLength', maxLength));
    properties.add(IntProperty('maxLines', maxLines));
    properties.add(IntProperty('minLines', minLines));
    properties.add(
      ObjectFlagProperty<ValueChanged<String>?>.has('onChanged', onChanged),
    );
    properties.add(
      ObjectFlagProperty<ValueChanged<String>?>.has('onSubmitted', onSubmitted),
    );
    properties.add(
      ObjectFlagProperty<FormFieldValidator<String>?>.has(
        'validator',
        validator,
      ),
    );
    properties.add(EnumProperty<TextAlign>('textAlign', textAlign));
    properties.add(DiagnosticsProperty<TextStyle?>('style', style));
    properties.add(StringProperty('semanticLabel', semanticLabel));
  }
}
