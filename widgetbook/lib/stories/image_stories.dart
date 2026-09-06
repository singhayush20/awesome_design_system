import 'package:awesome_design_system_atoms/atoms.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Asset Image', type: DSImage)
Widget imageAsset(BuildContext context) => const DSImage(
      imagePath: 'assets/logo.png',
      width: 96,
      height: 96,
    );

@widgetbook.UseCase(name: 'Network Image', type: DSImage)
Widget imageNetwork(BuildContext context) => const DSImage(
      imagePath: 'https://picsum.photos/200/200',
      width: 200,
      height: 200,
    );

@widgetbook.UseCase(name: 'Asset SVG', type: DSImage)
Widget imageSvgAsset(BuildContext context) => const DSImage(
      imagePath: 'assets/icon.svg',
      width: 96,
      height: 96,
    );

@widgetbook.UseCase(name: 'Network SVG', type: DSImage)
Widget imageSvgNetwork(BuildContext context) => const DSImage(
      imagePath: 'https://example.com/icon.svg',
      width: 96,
      height: 96,
    );