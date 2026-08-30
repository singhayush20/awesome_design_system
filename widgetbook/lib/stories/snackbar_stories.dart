import 'package:awesome_design_system_atoms/atoms.dart';
import 'package:awesome_design_system_molecules/molecules.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Variants', type: DSSnackbar)
Widget snackbarVariants(BuildContext context) => Scaffold(
  body: Builder(
    builder: (BuildContext context) => Center(
      child: DSButton.label(
        label: 'Show snackbar',
        onPressed: () => DSSnackbar.show(
          context: context,
          content: 'Connection lost',
          actionLabel: 'Retry',
          onActionPressed: () {},
        ),
      ),
    ),
  ),
);
