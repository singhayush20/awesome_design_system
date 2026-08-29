import 'package:awesome_design_system_atoms/atoms.dart';
import 'package:awesome_design_system_molecules/molecules.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import 'common.dart';

@widgetbook.UseCase(name: 'Content', type: DSAvatar)
Widget avatarContent(BuildContext context) {
  return StoryScaffold(
    children: [
      const SectionLabel('Initials'),
      Wrap(
        spacing: 12,
        runSpacing: 12,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          for (final s in AvatarSize.values) DSAvatar(size: s, initials: 'JD'),
        ],
      ),
      const SectionLabel('Icon'),
      DSAvatar(
        size: AvatarSize.large,
        icon: const Icon(Icons.person),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      const SectionLabel('Shapes'),
      Wrap(
        spacing: 12,
        runSpacing: 12,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          for (final shape in AvatarShape.values)
            DSAvatar(
              shape: shape,
              size: AvatarSize.large,
              initials: 'AB',
              backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
            ),
        ],
      ),
      const SectionLabel('With border'),
      DSAvatar(
        size: AvatarSize.large,
        initials: 'JD',
        borderWidth: 2,
        borderColor: Theme.of(context).colorScheme.primary,
      ),
    ],
  );
}

@widgetbook.UseCase(name: 'Group', type: DSAvatarGroup)
Widget avatarGroupUseCase(BuildContext context) {
  return StoryScaffold(
    children: [
      const SectionLabel('Overlapping group'),
      DSAvatarGroup(
        maxVisible: 4,
        avatars: [
          for (final name in ['Alice', 'Bob', 'Carol', 'Dan', 'Eve', 'Frank'])
            DSAvatar(initials: name),
        ],
      ),
      const SectionLabel('With presence'),
      const DSAvatarWithPresence(
        avatar: DSAvatar(initials: 'JD', size: AvatarSize.large),
        presence: UserPresence.online,
      ),
      const SectionLabel('All presence states'),
      Wrap(
        spacing: 12,
        runSpacing: 12,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          for (final p in UserPresence.values)
            DSAvatarWithPresence(
              avatar: const DSAvatar(initials: 'AB'),
              presence: p,
            ),
        ],
      ),
    ],
  );
}
