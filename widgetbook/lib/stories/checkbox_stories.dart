import 'package:awesome_design_system_atoms/atoms.dart';
import 'package:awesome_design_system_molecules/molecules.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import 'common.dart';

@widgetbook.UseCase(name: 'States', type: DSCheckbox)
Widget checkboxStates(BuildContext context) {
  return StoryScaffold(
    children: <Widget>[
      DSCheckbox(
        value: true,
        groupValue: true,
        groupId: 'checked',
        onChanged: (_) {},
        semanticLabel: 'Checked',
      ),
      DSCheckbox(
        value: false,
        groupValue: false,
        groupId: 'unchecked',
        onChanged: (_) {},
        semanticLabel: 'Unchecked',
      ),
      DSCheckbox(
        value: true,
        groupValue: true,
        groupId: 'disabled',
        onChanged: (_) {},
        enabled: false,
        semanticLabel: 'Disabled',
      ),
    ],
  );
}

@widgetbook.UseCase(name: 'List tile', type: DSCheckboxListTile)
Widget checkboxTile(BuildContext context) {
  return StoryScaffold(
    children: <Widget>[
      DSCheckboxListTile(
        title: 'Email notifications',
        subtitle: 'Receive product updates by email',
        value: true,
        groupValue: true,
        groupId: 'notifications',
        onChanged: (_) {},
      ),
      DSCheckboxListTile(
        title: 'Push notifications',
        groupValue: false,
        groupId: 'notifications',
        onChanged: (_) {},
      ),
    ],
  );
}
