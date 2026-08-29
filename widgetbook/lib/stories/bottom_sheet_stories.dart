import 'package:awesome_design_system_atoms/atoms.dart';
import 'package:awesome_design_system_organisms/organisms.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import 'common.dart';

@widgetbook.UseCase(name: 'Content and actions', type: DSBottomSheet)
Widget bottomSheetStory(BuildContext context) {
  return const StoryScaffold(
    children: <Widget>[
      DSBottomSheet(
        title: 'Choose an action',
        description: 'Actions are stacked to remain usable on narrow screens.',
        actions: <DSBottomSheetAction>[
          DSBottomSheetAction(label: 'Continue', onPressed: null),
          DSBottomSheetAction(
            label: 'Cancel',
            onPressed: null,
            variant: ButtonVariant.outlined,
          ),
        ],
      ),
    ],
  );
}
