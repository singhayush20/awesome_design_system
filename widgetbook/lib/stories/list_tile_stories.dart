import 'package:awesome_design_system_molecules/molecules.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'common.dart';

@widgetbook.UseCase(name: 'Content', type: DSListTile)
Widget listTileContent(BuildContext context) => StoryScaffold(
  children: [
    DSListTile(
      title: 'Account',
      subtitle: 'Manage your profile',
      leading: const Icon(Icons.person),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {},
    ),
    DSListTile(
      title: 'Notifications',
      backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
      border: Border.all(color: Theme.of(context).colorScheme.outlineVariant),
    ),
  ],
);
