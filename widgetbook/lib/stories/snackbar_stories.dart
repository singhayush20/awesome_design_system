import 'package:awesome_design_system_molecules/molecules.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Variants', type: DSSnackbar)
Widget snackbarVariants(BuildContext context) {
  return Scaffold(
    body: const Center(child: Text('Snackbars are shown by ScaffoldMessenger')),
    bottomNavigationBar: DSSnackbar(
      content: 'Connection lost',
      actionLabel: 'Retry',
      onActionPressed: () {},
    ),
  );
}
