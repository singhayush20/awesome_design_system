import 'package:awesome_design_system_atoms/atoms.dart';
import 'package:awesome_design_system_molecules/molecules.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import 'common.dart';

@widgetbook.UseCase(name: 'Variants', type: DSBadge)
Widget badgeVariants(BuildContext context) {
  Widget variant(BadgeVariant v, String label) =>
      DSBadge(label: label, variant: v);

  return StoryScaffold(
    children: [
      const SectionLabel('Variants'),
      Wrap(
        spacing: 8,
        runSpacing: 8,
        children: [
          variant(BadgeVariant.filled, 'Filled'),
          variant(BadgeVariant.outlined, 'Outlined'),
          variant(BadgeVariant.tonal, 'Tonal'),
          variant(BadgeVariant.light, 'Light'),
        ],
      ),
      const SectionLabel('Sizes'),
      Wrap(
        spacing: 8,
        runSpacing: 8,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          for (final s in BadgeSize.values) DSBadge(label: s.name, size: s),
        ],
      ),
      const SectionLabel('With icons & delete'),
      const DSBadge(
        label: 'Tag',
        leadingIcon: Icon(Icons.tag),
        trailingIcon: Icon(Icons.arrow_drop_down),
      ),
      DSBadge(label: 'Remove', onDeleted: () {}),
      DSBadge(label: 'Disabled', onDeleted: () {}, isDisabled: true),
    ],
  );
}

@widgetbook.UseCase(name: 'Status', type: DSStatusBadge)
Widget badgeStatusUseCase(BuildContext context) {
  return StoryScaffold(
    children: [
      const SectionLabel('Status badges'),
      Wrap(
        spacing: 8,
        runSpacing: 8,
        children: [
          for (final s in BadgeStatus.values) DSStatusBadge(status: s),
        ],
      ),
      const SectionLabel('Custom labels'),
      const DSStatusBadge(status: BadgeStatus.success, label: 'Completed'),
      const DSStatusBadge(status: BadgeStatus.error, label: 'Failed'),
    ],
  );
}
