import 'package:awesome_design_system_atoms/atoms.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'common.dart';

@widgetbook.UseCase(name: 'Variants', type: DSDivider)
Widget dividerVariants(BuildContext context) {
  final colors = Theme.of(context).colorScheme;
  return StoryScaffold(
    children: [
      const SectionLabel('Default'),
      const DSDivider(),
      const SectionLabel('Custom'),
      DSDivider(color: colors.primary, thickness: 3),
    ],
  );
}
