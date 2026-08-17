import 'package:awesome_design_system_atoms/atoms.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import 'common.dart';

@widgetbook.UseCase(name: 'Basic', type: DSInput)
Widget inputBasic(BuildContext context) {
  return const StoryScaffold(
    children: [
      SectionLabel('Text input'),
      DSInput(
        label: 'Full name',
        hint: 'Enter your full name',
        helperText: 'As shown on your ID',
      ),
      SectionLabel('With error'),
      DSInput(
        label: 'Email',
        errorText: 'Please enter a valid email',
        type: DSInputType.email,
      ),
      SectionLabel('Required'),
      DSInput(label: 'Username', isRequired: true),
      SectionLabel('Disabled & readonly'),
      DSInput(label: 'Disabled field', initialValue: 'Jane Doe', isDisabled: true),
      DSInput(label: 'Read only', initialValue: 'readonly value', isReadOnly: true),
    ],
  );
}

@widgetbook.UseCase(name: 'With Icons', type: DSInput)
Widget inputWithIcons(BuildContext context) {
  return const StoryScaffold(
    children: [
      SectionLabel('Prefix icon'),
      DSInput(
        label: 'Search',
        type: DSInputType.search,
        prefixIcon: Icon(Icons.search),
      ),
      SectionLabel('Suffix icon'),
      DSInput(
        label: 'Amount',
        type: DSInputType.number,
        prefixText: r'$',
        suffixIcon: Icon(Icons.attach_money),
      ),
      SectionLabel('Password with toggle'),
      DSInput(label: 'Password', type: DSInputType.password, obscureText: true),
      SectionLabel('With counter'),
      DSInput(
        label: 'Bio',
        initialValue: 'Hi',
        maxLength: 20,
        helperText: 'Short bio',
      ),
    ],
  );
}

@widgetbook.UseCase(name: 'Text Area', type: DSTextArea)
Widget textAreaUseCase(BuildContext context) {
  return const StoryScaffold(
    children: [
      SectionLabel('Multiline'),
      DSTextArea(
        label: 'Message',
        hint: 'Write something...',
        minLines: 3,
        maxLines: 5,
        maxLength: 500,
      ),
    ],
  );
}