import 'package:flutter/material.dart';

/// Wraps story content in scrollable, padded column with section labels.
class StoryScaffold extends StatelessWidget {
  const StoryScaffold({super.key, required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [for (final child in children) ..._withGap(child)],
      ),
    );
  }

  List<Widget> _withGap(Widget child) => [child, const SizedBox(height: 16)];
}

/// Section label for a group of widget variants.
class SectionLabel extends StatelessWidget {
  const SectionLabel(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text, style: Theme.of(context).textTheme.titleSmall);
  }
}
