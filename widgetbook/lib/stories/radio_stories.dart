import 'package:awesome_design_system_atoms/atoms.dart';
import 'package:awesome_design_system_molecules/molecules.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import 'common.dart';

@widgetbook.UseCase(name: 'States', type: DSRadio)
Widget radioStates(BuildContext context) {
  return const StoryScaffold(
    children: <Widget>[
      DSRadio<String>(value: 'selected', groupId: 'state'),
      DSRadio<String>(
        value: 'disabled',
        groupId: 'state',
        enabled: false,
        semanticLabel: 'Disabled',
      ),
    ],
  );
}

@widgetbook.UseCase(name: 'List tile', type: DSRadioListTile)
Widget radioTile(BuildContext context) {
  return StoryScaffold(
    children: <Widget>[
      DSRadioListTile(
        title: 'Monthly plan',
        subtitle: 'Best for occasional use',
        value: 'monthly',
        groupValue: 'monthly',
        groupId: 'plan',
        onChanged: (_) {},
      ),
      DSRadioListTile(
        title: 'Annual plan',
        value: 'annual',
        groupValue: 'monthly',
        groupId: 'plan',
        onChanged: (_) {},
      ),
    ],
  );
}
