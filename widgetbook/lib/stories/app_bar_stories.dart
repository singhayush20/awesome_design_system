import 'package:awesome_design_system_organisms/organisms.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import 'common.dart';

@widgetbook.UseCase(name: 'Variants', type: DSAppBar)
Widget appBarVariants(BuildContext context) {
  return const StoryScaffold(
    children: <Widget>[
      SectionLabel('Solid: opaque surface'),
      SizedBox(
        height: kToolbarHeight,
        child: ColoredBox(
          color: Color(0xFFEADDFF),
          child: DSAppBar(title: 'Solid app bar'),
        ),
      ),
      SectionLabel('Lucid: translucent over content'),
      SizedBox(
        height: kToolbarHeight,
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[Color(0xFF6750A4), Color(0xFFD0BCFF)],
            ),
          ),
          child: DSAppBar(
            title: 'Lucid app bar',
            variant: AppBarVariant.lucid,
            actions: <Widget>[Icon(Icons.more_vert)],
          ),
        ),
      ),
    ],
  );
}
