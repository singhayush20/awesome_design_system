import 'package:awesome_design_system_atoms/atoms.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import 'common.dart';

@widgetbook.UseCase(name: 'Variants', type: DSText)
Widget textVariants(BuildContext context) {
  Widget variant(TextVariant v, String label) => DSText(label, variant: v);

  return StoryScaffold(
    children: [
      const SectionLabel('Typography scale'),
      variant(TextVariant.displayLarge, 'Display Large'),
      variant(TextVariant.displayMedium, 'Display Medium'),
      variant(TextVariant.displaySmall, 'Display Small'),
      variant(TextVariant.headlineLarge, 'Headline Large'),
      variant(TextVariant.headlineMedium, 'Headline Medium'),
      variant(TextVariant.headlineSmall, 'Headline Small'),
      variant(TextVariant.titleLarge, 'Title Large'),
      variant(TextVariant.titleMedium, 'Title Medium'),
      variant(TextVariant.titleSmall, 'Title Small'),
      variant(TextVariant.bodyLarge, 'Body Large'),
      variant(TextVariant.bodyMedium, 'Body Medium'),
      variant(TextVariant.bodySmall, 'Body Small'),
      variant(TextVariant.labelLarge, 'Label Large'),
      variant(TextVariant.labelMedium, 'Label Medium'),
      variant(TextVariant.labelSmall, 'Label Small'),
    ],
  );
}

@widgetbook.UseCase(name: 'Colors', type: DSText)
Widget textColors(BuildContext context) {
  Widget colored(TextColorRole role, String label) =>
      DSText(label, colorRole: role);

  return StoryScaffold(
    children: [
      const SectionLabel('Color roles'),
      colored(TextColorRole.primary, 'Primary'),
      colored(TextColorRole.secondary, 'Secondary'),
      colored(TextColorRole.tertiary, 'Tertiary'),
      colored(TextColorRole.inverse, 'Inverse'),
      colored(TextColorRole.error, 'Error'),
      colored(TextColorRole.outline, 'Outline'),
    ],
  );
}

@widgetbook.UseCase(name: 'Overrides', type: DSText)
Widget textOverrides(BuildContext context) {
  return const StoryScaffold(
    children: [
      SectionLabel('Weight / Align / MaxLines'),
      DSText(
        'Bold body',
        variant: TextVariant.bodyLarge,
        fontWeight: FontWeight.w800,
      ),
      DSText(
        'Centered title',
        variant: TextVariant.titleMedium,
        textAlign: TextAlign.center,
      ),
      DSText(
        'This text is truncated to a single line with an ellipsis because it is quite long.',
        variant: TextVariant.bodySmall,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    ],
  );
}

@widgetbook.UseCase(name: 'Link', type: DSLink)
Widget linkUseCase(BuildContext context) {
  return StoryScaffold(
    children: [
      const SectionLabel('Inline links'),
      DSLink(text: 'Primary link', onTap: () {}),
      DSLink(
        text: 'Error link',
        onTap: () {},
        colorRole: TextColorRole.error,
        variant: TextVariant.bodyMedium,
      ),
      DSLink(text: 'Disabled link', onTap: () {}, isDisabled: true),
    ],
  );
}

@widgetbook.UseCase(name: 'Rich Text', type: DSRichText)
Widget richTextUseCase(BuildContext context) {
  return StoryScaffold(
    children: [
      const SectionLabel('Rich text spans'),
      const DSRichText(
        spans: [
          DSTextSpan(text: 'Lorem ', variant: TextVariant.bodyLarge),
          DSTextSpan(
            text: 'ipsum',
            variant: TextVariant.bodyLarge,
            fontWeight: FontWeight.w700,
          ),
          DSTextSpan(text: ' dolor sit amet, ', variant: TextVariant.bodyLarge),
          DSTextSpan(
            text: 'consectetur',
            variant: TextVariant.bodyLarge,
            colorRole: TextColorRole.error,
          ),
        ],
      ),
      const SectionLabel('Tappable span'),
      DSRichText(
        spans: [
          const DSTextSpan(text: 'Tap ', variant: TextVariant.bodyMedium),
          DSTextSpan(
            text: 'this link',
            variant: TextVariant.bodyMedium,
            colorRole: TextColorRole.primary,
            decoration: TextDecoration.underline,
            recognizer: TapGestureRecognizer()..onTap = () {},
          ),
        ],
      ),
    ],
  );
}
