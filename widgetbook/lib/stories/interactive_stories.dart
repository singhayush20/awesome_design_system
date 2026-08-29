import 'package:awesome_design_system_molecules/molecules.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'common.dart';

@widgetbook.UseCase(name: 'Selections', type: DSChoiceChips)
Widget choiceChips(BuildContext context) => const StoryScaffold(
  children: [
    DSChoiceChips(choices: ['One', 'Two', 'Three'], multiSelect: true),
  ],
);
@widgetbook.UseCase(name: 'Tabs', type: DSTabBar)
Widget tabBar(BuildContext context) =>
    const DSTabBar(tabs: ['Overview', 'Details', 'Activity']);
@widgetbook.UseCase(name: 'Menu', type: DSDropdownMenu)
Widget dropdownMenu(BuildContext context) => DSDropdownMenu<String>(
  items: [
    DSDropdownMenuItem(label: 'Edit', value: 'edit'),
    DSDropdownMenuItem(
      label: 'More',
      value: 'more',
      children: [DSDropdownMenuItem(label: 'Archive', value: 'archive')],
    ),
  ],
  onSelected: (_) {},
);
