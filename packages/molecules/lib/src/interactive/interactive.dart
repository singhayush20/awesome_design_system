// ignore_for_file: always_specify_types, diagnostic_describe_all_properties, unnecessary_import, curly_braces_in_flow_control_structures, avoid_redundant_argument_values
import 'package:flutter/material.dart';

class DSChoiceChips extends StatefulWidget {
  const DSChoiceChips({
    required this.choices,
    super.key,
    this.initialSelection = const <int>{},
    this.multiSelect = false,
    this.onChanged,
  });
  final List<String> choices;
  final Set<int> initialSelection;
  final bool multiSelect;
  final ValueChanged<Set<int>>? onChanged;
  @override
  State<DSChoiceChips> createState() => _DSChoiceChipsState();
}

class _DSChoiceChipsState extends State<DSChoiceChips> {
  late Set<int> selected = {...widget.initialSelection};
  void select(int index) {
    setState(() {
      if (widget.multiSelect) {
        selected.contains(index) ? selected.remove(index) : selected.add(index);
      } else {
        selected = {index};
      }
    });
    widget.onChanged?.call({...selected});
  }

  @override
  Widget build(BuildContext context) => Wrap(
    spacing: 8,
    children: [
      for (int i = 0; i < widget.choices.length; i++)
        FilterChip(
          label: Text(widget.choices[i]),
          selected: selected.contains(i),
          onSelected: (_) => select(i),
        ),
    ],
  );
  @override
  void didUpdateWidget(covariant DSChoiceChips oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialSelection != widget.initialSelection)
      selected = {...widget.initialSelection};
  }
}

class DSTabBar extends StatefulWidget {
  const DSTabBar({
    required this.tabs,
    super.key,
    this.onTap,
    this.labelColor,
    this.unselectedLabelColor,
    this.indicatorColor,
  });
  final List<String> tabs;
  final ValueChanged<int>? onTap;
  final Color? labelColor, unselectedLabelColor, indicatorColor;
  @override
  State<DSTabBar> createState() => _DSTabBarState();
}

class _DSTabBarState extends State<DSTabBar>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  @override
  void initState() {
    super.initState();
    controller = TabController(length: widget.tabs.length, vsync: this);
  }

  @override
  void didUpdateWidget(covariant DSTabBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.tabs.length != widget.tabs.length) {
      controller.dispose();
      controller = TabController(length: widget.tabs.length, vsync: this);
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => TabBar(
    controller: controller,
    onTap: widget.onTap,
    labelColor: widget.labelColor ?? Theme.of(context).colorScheme.primary,
    unselectedLabelColor: widget.unselectedLabelColor,
    indicatorColor: widget.indicatorColor,
    tabs: [for (final tab in widget.tabs) Tab(text: tab)],
  );
}

@immutable
class DSDropdownMenuItem<T> {
  const DSDropdownMenuItem({
    required this.label,
    required this.value,
    this.children = const [],
  });
  final String label;
  final T value;
  final List<DSDropdownMenuItem<T>> children;
}

class DSDropdownMenu<T> extends StatelessWidget {
  const DSDropdownMenu({
    required this.items,
    required this.onSelected,
    super.key,
    this.label,
  });
  final List<DSDropdownMenuItem<T>> items;
  final ValueChanged<T> onSelected;
  final String? label;
  @override
  Widget build(BuildContext context) => PopupMenuButton<T>(
    onSelected: onSelected,
    itemBuilder: (_) => [
      for (final item in items)
        PopupMenuItem<T>(
          value: item.value,
          child: Row(
            children: [
              Expanded(child: Text(item.label)),
              if (item.children.isNotEmpty) const Icon(Icons.chevron_right),
            ],
          ),
        ),
    ],
    child: InputChip(label: Text(label ?? 'Select'), onPressed: null),
  );
}
