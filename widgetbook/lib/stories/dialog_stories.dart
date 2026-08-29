import 'package:awesome_design_system_atoms/atoms.dart';
import 'package:awesome_design_system_organisms/organisms.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import 'common.dart';

@widgetbook.UseCase(name: 'Confirmation', type: DSDialog)
Widget dialogStory(BuildContext context) {
  return StoryScaffold(
    children: <Widget>[
      DSDialog(
        title: 'Delete project?',
        content: const DSText('This action cannot be undone.'),
        actions: <Widget>[
          TextButton(onPressed: () {}, child: const Text('Cancel')),
          FilledButton(onPressed: () {}, child: const Text('Delete')),
        ],
      ),
    ],
  );
}
