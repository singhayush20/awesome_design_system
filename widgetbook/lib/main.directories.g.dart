// dart format width=80
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:awesome_design_system_widgetbook/stories/avatar_stories.dart'
    as _awesome_design_system_widgetbook_stories_avatar_stories;
import 'package:awesome_design_system_widgetbook/stories/badge_stories.dart'
    as _awesome_design_system_widgetbook_stories_badge_stories;
import 'package:awesome_design_system_widgetbook/stories/button_stories.dart'
    as _awesome_design_system_widgetbook_stories_button_stories;
import 'package:awesome_design_system_widgetbook/stories/card_stories.dart'
    as _awesome_design_system_widgetbook_stories_card_stories;
import 'package:awesome_design_system_widgetbook/stories/app_bar_stories.dart'
    as _awesome_design_system_widgetbook_stories_app_bar_stories;
import 'package:awesome_design_system_widgetbook/stories/bottom_sheet_stories.dart'
    as _awesome_design_system_widgetbook_stories_bottom_sheet_stories;
import 'package:awesome_design_system_widgetbook/stories/checkbox_stories.dart'
    as _awesome_design_system_widgetbook_stories_checkbox_stories;
import 'package:awesome_design_system_widgetbook/stories/color_palette_stories.dart'
    as _awesome_design_system_widgetbook_stories_color_palette_stories;
import 'package:awesome_design_system_widgetbook/stories/dialog_stories.dart'
    as _awesome_design_system_widgetbook_stories_dialog_stories;
import 'package:awesome_design_system_widgetbook/stories/divider_stories.dart'
    as _awesome_design_system_widgetbook_stories_divider_stories;
import 'package:awesome_design_system_widgetbook/stories/input_stories.dart'
    as _awesome_design_system_widgetbook_stories_input_stories;
import 'package:awesome_design_system_widgetbook/stories/radio_stories.dart'
    as _awesome_design_system_widgetbook_stories_radio_stories;
import 'package:awesome_design_system_widgetbook/stories/snackbar_stories.dart'
    as _awesome_design_system_widgetbook_stories_snackbar_stories;
import 'package:awesome_design_system_widgetbook/stories/text_stories.dart'
    as _awesome_design_system_widgetbook_stories_text_stories;
import 'package:widgetbook/widgetbook.dart' as _widgetbook;

final directories = <_widgetbook.WidgetbookNode>[
  _widgetbook.WidgetbookFolder(
    name: 'divider',
    children: [
      _widgetbook.WidgetbookComponent(
        name: 'DSDivider',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'Variants',
            builder: _awesome_design_system_widgetbook_stories_divider_stories
                .dividerVariants,
          ),
        ],
      ),
    ],
  ),
  _widgetbook.WidgetbookFolder(
    name: 'avatar',
    children: [
      _widgetbook.WidgetbookComponent(
        name: 'DSAvatar',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'Content',
            builder: _awesome_design_system_widgetbook_stories_avatar_stories
                .avatarContent,
          ),
        ],
      ),
      _widgetbook.WidgetbookComponent(
        name: 'DSAvatarGroup',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'Group',
            builder: _awesome_design_system_widgetbook_stories_avatar_stories
                .avatarGroupUseCase,
          ),
        ],
      ),
    ],
  ),
  _widgetbook.WidgetbookFolder(
    name: 'badge',
    children: [
      _widgetbook.WidgetbookComponent(
        name: 'DSBadge',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'Variants',
            builder: _awesome_design_system_widgetbook_stories_badge_stories
                .badgeVariants,
          ),
        ],
      ),
      _widgetbook.WidgetbookComponent(
        name: 'DSStatusBadge',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'Status',
            builder: _awesome_design_system_widgetbook_stories_badge_stories
                .badgeStatusUseCase,
          ),
        ],
      ),
    ],
  ),
  _widgetbook.WidgetbookFolder(
    name: 'button',
    children: [
      _widgetbook.WidgetbookComponent(
        name: 'DSButton',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'Sizes',
            builder: _awesome_design_system_widgetbook_stories_button_stories
                .buttonSizes,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'States',
            builder: _awesome_design_system_widgetbook_stories_button_stories
                .buttonStates,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Variants',
            builder: _awesome_design_system_widgetbook_stories_button_stories
                .buttonVariants,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'With Icons',
            builder: _awesome_design_system_widgetbook_stories_button_stories
                .buttonWithIcons,
          ),
        ],
      ),
      _widgetbook.WidgetbookComponent(
        name: 'DSIconButton',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'Icon Button',
            builder: _awesome_design_system_widgetbook_stories_button_stories
                .iconButtonUseCase,
          ),
        ],
      ),
    ],
  ),
  _widgetbook.WidgetbookFolder(
    name: 'card',
    children: [
      _widgetbook.WidgetbookComponent(
        name: 'DSCard',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'Tappable',
            builder: _awesome_design_system_widgetbook_stories_card_stories
                .cardTappable,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Variants',
            builder: _awesome_design_system_widgetbook_stories_card_stories
                .cardVariants,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'With Header & Actions',
            builder: _awesome_design_system_widgetbook_stories_card_stories
                .cardWithHeader,
          ),
        ],
      ),
    ],
  ),
  _widgetbook.WidgetbookFolder(
    name: 'input',
    children: [
      _widgetbook.WidgetbookComponent(
        name: 'DSInput',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'Basic',
            builder: _awesome_design_system_widgetbook_stories_input_stories
                .inputBasic,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'With Icons',
            builder: _awesome_design_system_widgetbook_stories_input_stories
                .inputWithIcons,
          ),
        ],
      ),
      _widgetbook.WidgetbookComponent(
        name: 'DSTextArea',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'Text Area',
            builder: _awesome_design_system_widgetbook_stories_input_stories
                .textAreaUseCase,
          ),
        ],
      ),
    ],
  ),
  _widgetbook.WidgetbookFolder(
    name: 'checkbox',
    children: [
      _widgetbook.WidgetbookComponent(
        name: 'DSCheckbox',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'States',
            builder: _awesome_design_system_widgetbook_stories_checkbox_stories
                .checkboxStates,
          ),
        ],
      ),
      _widgetbook.WidgetbookComponent(
        name: 'DSCheckboxListTile',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'List tile',
            builder: _awesome_design_system_widgetbook_stories_checkbox_stories
                .checkboxTile,
          ),
        ],
      ),
    ],
  ),
  _widgetbook.WidgetbookFolder(
    name: 'radio',
    children: [
      _widgetbook.WidgetbookComponent(
        name: 'DSRadio',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'States',
            builder: _awesome_design_system_widgetbook_stories_radio_stories
                .radioStates,
          ),
        ],
      ),
      _widgetbook.WidgetbookComponent(
        name: 'DSRadioListTile',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'List tile',
            builder: _awesome_design_system_widgetbook_stories_radio_stories
                .radioTile,
          ),
        ],
      ),
    ],
  ),
  _widgetbook.WidgetbookFolder(
    name: 'feedback',
    children: [
      _widgetbook.WidgetbookComponent(
        name: 'DSSnackbar',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'Variants',
            builder: _awesome_design_system_widgetbook_stories_snackbar_stories
                .snackbarVariants,
          ),
        ],
      ),
      _widgetbook.WidgetbookComponent(
        name: 'DSDialog',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'Confirmation',
            builder: _awesome_design_system_widgetbook_stories_dialog_stories
                .dialogStory,
          ),
        ],
      ),
      _widgetbook.WidgetbookComponent(
        name: 'DSBottomSheet',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'Content and actions',
            builder:
                _awesome_design_system_widgetbook_stories_bottom_sheet_stories
                    .bottomSheetStory,
          ),
        ],
      ),
    ],
  ),
  _widgetbook.WidgetbookFolder(
    name: 'app bar',
    children: [
      _widgetbook.WidgetbookComponent(
        name: 'DSAppBar',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'Variants',
            builder: _awesome_design_system_widgetbook_stories_app_bar_stories
                .appBarVariants,
          ),
        ],
      ),
    ],
  ),
  _widgetbook.WidgetbookFolder(
    name: 'tokens',
    children: [
      _widgetbook.WidgetbookComponent(
        name: 'ColorScheme',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'Semantic roles',
            builder:
                _awesome_design_system_widgetbook_stories_color_palette_stories
                    .colorPalette,
          ),
        ],
      ),
    ],
  ),
  _widgetbook.WidgetbookFolder(
    name: 'text',
    children: [
      _widgetbook.WidgetbookComponent(
        name: 'DSLink',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'Link',
            builder: _awesome_design_system_widgetbook_stories_text_stories
                .linkUseCase,
          ),
        ],
      ),
      _widgetbook.WidgetbookComponent(
        name: 'DSRichText',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'Rich Text',
            builder: _awesome_design_system_widgetbook_stories_text_stories
                .richTextUseCase,
          ),
        ],
      ),
      _widgetbook.WidgetbookComponent(
        name: 'DSText',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'Colors',
            builder: _awesome_design_system_widgetbook_stories_text_stories
                .textColors,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Overrides',
            builder: _awesome_design_system_widgetbook_stories_text_stories
                .textOverrides,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Variants',
            builder: _awesome_design_system_widgetbook_stories_text_stories
                .textVariants,
          ),
        ],
      ),
    ],
  ),
];
