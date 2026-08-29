import 'package:awesome_design_system_atoms/atoms.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'common.dart';

@widgetbook.UseCase(name: 'States', type: DSSwitch)
Widget switchStates(BuildContext context) => StatefulBuilder(
  builder: (context, setState) {
    return DSSwitch(value: false, onChanged: (_) => setState(() {}));
  },
);

@widgetbook.UseCase(name: 'Configuration', type: DSSlider)
Widget sliderConfiguration(BuildContext context) => StatefulBuilder(
  builder: (context, setState) {
    double value = 40;
    return Column(
      children: [
        DSSlider(
          value: value,
          max: 100,
          onChanged: (next) => setState(() => value = next),
        ),
        DSText('${value.round()}'),
      ],
    );
  },
);

@widgetbook.UseCase(name: 'Indicators', type: DSCircularLoadingIndicator)
Widget progressIndicators(BuildContext context) => const StoryScaffold(
  children: [
    SectionLabel('Circular'),
    DSCircularLoadingIndicator(),
    SectionLabel('Linear'),
    DSLinearProgressIndicator(value: .6),
  ],
);
