// Elevation/shadow tokens for Material 3

import 'package:flutter/material.dart';

/// Elevation levels with shadows for light and dark themes
@immutable
class ElevationLevel {
  const ElevationLevel({
    required this.level,
    required this.lightShadow,
    required this.darkShadow,
    required this.surfaceTint,
  });

  final int level;
  final List<BoxShadow> lightShadow;
  final List<BoxShadow> darkShadow;
  final Color surfaceTint;

  List<BoxShadow> resolve(Brightness brightness) {
    return brightness == Brightness.light ? lightShadow : darkShadow;
  }

  static const ElevationLevel level0 = ElevationLevel(
    level: 0,
    lightShadow: <BoxShadow>[],
    darkShadow: <BoxShadow>[],
    surfaceTint: Colors.transparent,
  );

  static const ElevationLevel level1 = ElevationLevel(
    level: 1,
    lightShadow: <BoxShadow>[
      BoxShadow(color: Color(0x33000000), blurRadius: 1, offset: Offset(0, 1)),
      BoxShadow(color: Color(0x1F000000), blurRadius: 2, offset: Offset(0, 1)),
    ],
    darkShadow: <BoxShadow>[
      BoxShadow(color: Color(0x4D000000), blurRadius: 1, offset: Offset(0, 1)),
      BoxShadow(color: Color(0x33000000), blurRadius: 2, offset: Offset(0, 1)),
    ],
    surfaceTint: Color(0x0D000000),
  );

  static const ElevationLevel level2 = ElevationLevel(
    level: 2,
    lightShadow: <BoxShadow>[
      BoxShadow(color: Color(0x33000000), blurRadius: 3, offset: Offset(0, 1)),
      BoxShadow(color: Color(0x1F000000), blurRadius: 4, offset: Offset(0, 2)),
    ],
    darkShadow: <BoxShadow>[
      BoxShadow(color: Color(0x4D000000), blurRadius: 3, offset: Offset(0, 1)),
      BoxShadow(color: Color(0x33000000), blurRadius: 4, offset: Offset(0, 2)),
    ],
    surfaceTint: Color(0x14000000),
  );

  static const ElevationLevel level3 = ElevationLevel(
    level: 3,
    lightShadow: <BoxShadow>[
      BoxShadow(color: Color(0x33000000), blurRadius: 6, offset: Offset(0, 1)),
      BoxShadow(color: Color(0x1F000000), blurRadius: 8, offset: Offset(0, 3)),
    ],
    darkShadow: <BoxShadow>[
      BoxShadow(color: Color(0x4D000000), blurRadius: 6, offset: Offset(0, 1)),
      BoxShadow(color: Color(0x33000000), blurRadius: 8, offset: Offset(0, 3)),
    ],
    surfaceTint: Color(0x1A000000),
  );

  static const ElevationLevel level4 = ElevationLevel(
    level: 4,
    lightShadow: <BoxShadow>[
      BoxShadow(color: Color(0x33000000), blurRadius: 10, offset: Offset(0, 2)),
      BoxShadow(color: Color(0x1F000000), blurRadius: 12, offset: Offset(0, 4)),
    ],
    darkShadow: <BoxShadow>[
      BoxShadow(color: Color(0x4D000000), blurRadius: 10, offset: Offset(0, 2)),
      BoxShadow(color: Color(0x33000000), blurRadius: 12, offset: Offset(0, 4)),
    ],
    surfaceTint: Color(0x1F000000),
  );

  static const ElevationLevel level5 = ElevationLevel(
    level: 5,
    lightShadow: <BoxShadow>[
      BoxShadow(color: Color(0x33000000), blurRadius: 14, offset: Offset(0, 4)),
      BoxShadow(color: Color(0x1F000000), blurRadius: 16, offset: Offset(0, 6)),
    ],
    darkShadow: <BoxShadow>[
      BoxShadow(color: Color(0x4D000000), blurRadius: 14, offset: Offset(0, 4)),
      BoxShadow(color: Color(0x33000000), blurRadius: 16, offset: Offset(0, 6)),
    ],
    surfaceTint: Color(0x26000000),
  );
}

/// Unified elevation tokens implementing ThemeExtension
@immutable
class ElevationTokens extends ThemeExtension<ElevationTokens> {
  const ElevationTokens({required this.levels});

  factory ElevationTokens.defaultTokens() {
    return const ElevationTokens(
      levels: <int, ElevationLevel>{
        0: ElevationLevel.level0,
        1: ElevationLevel.level1,
        2: ElevationLevel.level2,
        3: ElevationLevel.level3,
        4: ElevationLevel.level4,
        5: ElevationLevel.level5,
      },
    );
  }
  final Map<int, ElevationLevel> levels;

  ElevationLevel getLevel(int level) => levels[level] ?? ElevationLevel.level0;

  ElevationTokens copyWith({Map<int, ElevationLevel>? levels}) {
    return ElevationTokens(levels: levels ?? this.levels);
  }

  @override
  ElevationTokens lerp(ThemeExtension<ElevationTokens>? other, double t) {
    // Elevation doesn't interpolate well, return self
    return this;
  }
}
