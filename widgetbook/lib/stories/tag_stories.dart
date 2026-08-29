import 'package:awesome_design_system_atoms/atoms.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'common.dart';

@widgetbook.UseCase(name: 'Variants', type: DSTag)
Widget tagVariants(BuildContext context) => const StoryScaffold(
  children: [
    SectionLabel('Tag variants'),
    Wrap(
      spacing: 8,
      runSpacing: 8,
      children: <Widget>[
        DSTag(label: 'Filled'),
        DSTag(label: 'Outlined', variant: DSTagVariant.outlined),
        DSTag(label: 'Both', variant: DSTagVariant.filledOutlined),
      ],
    ),
  ],
);
