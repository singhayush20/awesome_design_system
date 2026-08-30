import 'package:awesome_design_system_atoms/atoms.dart';
import 'package:awesome_design_system_organisms/organisms.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Confirmation', type: DSDialog)
Widget dialogStory(BuildContext context) => Scaffold(
  body: Builder(
    builder: (BuildContext context) => Center(
      child: DSButton.label(
        label: 'Show dialog',
        onPressed: () => DSDialog.show<void>(
          context: context,
          title: 'Delete project?',
          content: const DSText('This action cannot be undone.'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            FilledButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Delete'),
            ),
          ],
        ),
      ),
    ),
  ),
);
