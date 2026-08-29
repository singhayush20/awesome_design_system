import 'package:awesome_design_system_organisms/organisms.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import 'common.dart';

@widgetbook.UseCase(name: 'Variants', type: DSAppBar)
Widget appBarVariants(BuildContext context) {
  return const StoryScaffold(
    children: <Widget>[
      DSAppBar(title: 'Solid app bar', automaticallyImplyLeading: false),
      DSAppBar(
        title: 'Lucid app bar',
        variant: AppBarVariant.lucid,
        automaticallyImplyLeading: false,
        actions: <Widget>[Icon(Icons.more_vert)],
      ),
    ],
  );
}
