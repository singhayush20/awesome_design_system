import 'package:awesome_design_system_atoms/atoms.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import 'common.dart';

@widgetbook.UseCase(name: 'Variants', type: DSCard)
Widget cardVariants(BuildContext context) {
  Widget variant(CardVariant v, String label) => SizedBox(
        width: 300,
        child: DSCard(
          variant: v,
          child: DSText(label, variant: TextVariant.titleMedium),
        ),
      );

  return StoryScaffold(
    children: [
      const SectionLabel('Variants'),
      Wrap(
        spacing: 16,
        runSpacing: 16,
        children: [
          variant(CardVariant.elevated, 'Elevated'),
          variant(CardVariant.filled, 'Filled'),
          variant(CardVariant.outlined, 'Outlined'),
        ],
      ),
      const SectionLabel('Elevation levels'),
      Wrap(
        spacing: 16,
        runSpacing: 16,
        children: [
          for (final level in CardElevation.values)
            SizedBox(
              width: 160,
              child: DSCard(
                elevation: level,
                child: DSText(level.name, variant: TextVariant.bodyMedium),
              ),
            ),
        ],
      ),
    ],
  );
}

@widgetbook.UseCase(name: 'With Header & Actions', type: DSCard)
Widget cardWithHeader(BuildContext context) {
  return SizedBox(
    width: 360,
    child: DSCard(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const DSCardHeader(
            leading: DSAvatar(size: AvatarSize.small, initials: 'JD'),
            title: 'Jane Doe',
            subtitle: 'Product Designer',
            trailing: DSBadge(label: 'Active', variant: BadgeVariant.light),
          ),
          const SizedBox(height: 12),
          const DSText(
            'This card shows the header, a body paragraph and action buttons.',
            variant: TextVariant.bodyMedium,
          ),
          const SizedBox(height: 12),
          DSCardActions(
            actions: [
              DSButton(variant: ButtonVariant.text, onPressed: () {}, child: const Text('Share')),
              DSButton(onPressed: () {}, child: const Text('Open')),
            ],
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Tappable', type: DSCard)
Widget cardTappable(BuildContext context) {
  return SizedBox(
    width: 300,
    child: DSCard(
      onTap: () {},
      semanticLabel: 'Tappable example card',
      child: const DSText('Tap me', variant: TextVariant.titleMedium),
    ),
  );
}