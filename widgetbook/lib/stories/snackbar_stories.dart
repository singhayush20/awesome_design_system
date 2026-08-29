import 'package:awesome_design_system_molecules/molecules.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import 'common.dart';

@widgetbook.UseCase(name: 'Variants', type: DSSnackbar)
Widget snackbarVariants(BuildContext context) {
  return StoryScaffold(
    children: <Widget>[
      const DSSnackbar(content: 'Changes saved successfully'),
      DSSnackbar(
        content: 'Connection lost',
        actionLabel: 'Retry',
        onActionPressed: () {},
      ),
    ],
  );
}
