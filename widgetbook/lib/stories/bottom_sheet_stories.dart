import 'package:awesome_design_system_atoms/atoms.dart';
import 'package:awesome_design_system_organisms/organisms.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Content and actions', type: DSBottomSheet)
Widget bottomSheetStory(BuildContext context) => Scaffold(
  body: Builder(
    builder: (BuildContext context) => Center(
      child: DSButton.label(
        label: 'Show bottom sheet',
        onPressed: () => DSBottomSheet.show<void>(
          context: context,
          title: 'Choose an action',
          description:
              'Actions are stacked to remain usable on narrow screens.',
          actions: <DSBottomSheetAction>[
            DSBottomSheetAction(label: 'Continue', onPressed: () {}),
            DSBottomSheetAction(
              label: 'Cancel',
              onPressed: () => Navigator.of(context).pop(),
              variant: ButtonVariant.outlined,
            ),
          ],
        ),
      ),
    ),
  ),
);
