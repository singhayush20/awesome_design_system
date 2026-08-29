import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import 'common.dart';

@widgetbook.UseCase(name: 'Semantic roles', type: ColorScheme)
Widget colorPalette(BuildContext context) {
  final ColorScheme colors = Theme.of(context).colorScheme;
  final List<(String, Color, Color)> roles = <(String, Color, Color)>[
    ('Primary', colors.primary, colors.onPrimary),
    ('Secondary', colors.secondary, colors.onSecondary),
    ('Tertiary', colors.tertiary, colors.onTertiary),
    ('Error', colors.error, colors.onError),
    ('Surface', colors.surface, colors.onSurface),
    ('Surface container', colors.surfaceContainerHighest, colors.onSurface),
    ('Outline', colors.outline, colors.onSurface),
  ];

  return StoryScaffold(
    children: <Widget>[
      SectionLabel('${Theme.of(context).brightness.name} theme'),
      Wrap(
        spacing: 12,
        runSpacing: 12,
        children: roles
            .map(
              ((String, Color, Color) role) => SizedBox(
                width: 160,
                height: 88,
                child: ColoredBox(
                  color: role.$2,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(role.$1, style: TextStyle(color: role.$3)),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    ],
  );
}
