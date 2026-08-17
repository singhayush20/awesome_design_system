// Responsive breakpoint tokens

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Breakpoint definitions for responsive design
@immutable
class Breakpoint {
  const Breakpoint({
    required this.name,
    required this.minWidth,
    required this.maxWidth,
    this.columns = 4,
    this.gutter = 16.0,
    this.margin = 16.0,
  });

  final String name;
  final double minWidth;
  final double maxWidth;
  final int columns;
  final double gutter;
  final double margin;

  bool matches(double width) =>
      width >= minWidth && (maxWidth == double.infinity || width < maxWidth);
}

/// Standard breakpoints following Material 3 responsive guidelines
@immutable
class BreakpointScale {
  const BreakpointScale({
    required this.xs,
    required this.sm,
    required this.md,
    required this.lg,
    required this.xl,
    required this.xxl,
  });

  final Breakpoint xs; // < 600px - mobile
  final Breakpoint sm; // 600-840px - large mobile / small tablet
  final Breakpoint md; // 840-1200px - tablet
  final Breakpoint lg; // 1200-1600px - desktop
  final Breakpoint xl; // 1600-2000px - large desktop
  final Breakpoint xxl; // > 2000px - extra large

  List<Breakpoint> get all => <Breakpoint>[xs, sm, md, lg, xl, xxl];

  Breakpoint resolve(double width) {
    for (final Breakpoint bp in all) {
      if (bp.matches(width)) return bp;
    }
    return xs;
  }

  static const BreakpointScale defaultScale = BreakpointScale(
    xs: Breakpoint(name: 'xs', minWidth: 0, maxWidth: 600),
    sm: Breakpoint(
      name: 'sm',
      minWidth: 600,
      maxWidth: 840,
      columns: 8,
      gutter: 24,
      margin: 24,
    ),
    md: Breakpoint(
      name: 'md',
      minWidth: 840,
      maxWidth: 1200,
      columns: 12,
      gutter: 24,
      margin: 32,
    ),
    lg: Breakpoint(
      name: 'lg',
      minWidth: 1200,
      maxWidth: 1600,
      columns: 12,
      gutter: 24,
      margin: 40,
    ),
    xl: Breakpoint(
      name: 'xl',
      minWidth: 1600,
      maxWidth: 2000,
      columns: 12,
      gutter: 24,
      margin: 48,
    ),
    xxl: Breakpoint(
      name: 'xxl',
      minWidth: 2000,
      maxWidth: double.infinity,
      columns: 12,
      gutter: 24,
      margin: 56,
    ),
  );
}

/// Unified breakpoint tokens implementing ThemeExtension
@immutable
class BreakpointTokens extends ThemeExtension<BreakpointTokens> {
  const BreakpointTokens({required this.scale});

  factory BreakpointTokens.defaultTokens() {
    return const BreakpointTokens(scale: BreakpointScale.defaultScale);
  }
  final BreakpointScale scale;

  Breakpoint resolve(double width) => scale.resolve(width);

  BreakpointTokens copyWith({BreakpointScale? scale}) {
    return BreakpointTokens(scale: scale ?? this.scale);
  }

  @override
  BreakpointTokens lerp(ThemeExtension<BreakpointTokens>? other, double t) {
    // Breakpoints don't interpolate
    return this;
  }
}

/// Helper widget for responsive building
class ResponsiveBuilder extends StatelessWidget {
  const ResponsiveBuilder({required this.builder, super.key});

  final Widget Function(BuildContext context, Breakpoint breakpoint) builder;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final BreakpointTokens? tokens = Theme.of(
          context,
        ).extension<BreakpointTokens>();
        final Breakpoint breakpoint =
            tokens?.resolve(constraints.maxWidth) ??
            BreakpointScale.defaultScale.xs;
        return builder(context, breakpoint);
      },
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      ObjectFlagProperty<
        Widget Function(BuildContext context, Breakpoint breakpoint)
      >.has('builder', builder),
    );
  }
}
