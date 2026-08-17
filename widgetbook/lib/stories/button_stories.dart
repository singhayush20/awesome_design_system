import 'package:awesome_design_system_atoms/atoms.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import 'common.dart';

@widgetbook.UseCase(name: 'Variants', type: DSButton)
Widget buttonVariants(BuildContext context) {
  Widget variant(ButtonVariant v, String label) => DSButton(
        onPressed: () {},
        variant: v,
        child: Text(label),
      );

  return StoryScaffold(
    children: [
      const SectionLabel('Variants'),
      Wrap(
        spacing: 8,
        runSpacing: 8,
        children: [
          variant(ButtonVariant.elevated, 'Elevated'),
          variant(ButtonVariant.filled, 'Filled'),
          variant(ButtonVariant.tonal, 'Tonal'),
          variant(ButtonVariant.outlined, 'Outlined'),
          variant(ButtonVariant.text, 'Text'),
        ],
      ),
    ],
  );
}

@widgetbook.UseCase(name: 'Sizes', type: DSButton)
Widget buttonSizes(BuildContext context) {
  Widget sized(ButtonSize s) => DSButton(
        onPressed: () {},
        size: s,
        child: Text(s.name.toUpperCase()),
      );

  return StoryScaffold(
    children: [
      const SectionLabel('Sizes'),
      Wrap(
        spacing: 8,
        runSpacing: 8,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [sized(ButtonSize.small), sized(ButtonSize.medium), sized(ButtonSize.large)],
      ),
    ],
  );
}

@widgetbook.UseCase(name: 'States', type: DSButton)
Widget buttonStates(BuildContext context) {
  return StoryScaffold(
    children: [
      const SectionLabel('Enable / Disabled / Loading'),
      Wrap(
        spacing: 8,
        runSpacing: 8,
        children: [
          DSButton(onPressed: () {}, child: const Text('Enabled')),
          DSButton(onPressed: () {}, isDisabled: true, child: const Text('Disabled')),
          DSButton(onPressed: () {}, isLoading: true, child: const Text('Loading')),
        ],
      ),
    ],
  );
}

@widgetbook.UseCase(name: 'With Icons', type: DSButton)
Widget buttonWithIcons(BuildContext context) {
  return StoryScaffold(
    children: [
      const SectionLabel('Leading & Trailing icons'),
      DSButton(
        onPressed: () {},
        leadingIcon: const Icon(Icons.add),
        trailingIcon: const Icon(Icons.arrow_forward),
        child: const Text('Add to cart'),
      ),
      const SectionLabel('Full width'),
      DSButton(
        onPressed: () {},
        fullWidth: true,
        child: const Text('Continue'),
      ),
    ],
  );
}

@widgetbook.UseCase(name: 'Icon Button', type: DSIconButton)
Widget iconButtonUseCase(BuildContext context) {
  return StoryScaffold(
    children: [
      const SectionLabel('Icon buttons'),
      Wrap(
        spacing: 8,
        runSpacing: 8,
        children: [
          DSIconButton(onPressed: () {}, icon: const Icon(Icons.favorite)),
          DSIconButton(
            onPressed: () {},
            icon: const Icon(Icons.edit),
            variant: ButtonVariant.filled,
          ),
          DSIconButton(
            onPressed: () {},
            icon: const Icon(Icons.delete),
            size: ButtonSize.large,
          ),
          DSIconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings),
            isDisabled: true,
          ),
        ],
      ),
    ],
  );
}