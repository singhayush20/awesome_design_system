import 'package:awesome_design_system_atoms/atoms.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Sources', type: DSImage)
Widget imageSources(BuildContext context) => const Wrap(
  spacing: 16,
  children: [
    DSImage(
      source: 'assets/logo.png',
      type: DSImageType.asset,
      width: 96,
      height: 96,
    ),
  ],
);
