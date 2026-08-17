// Avatar atom with multiple sources and variants

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:awesome_design_system_tokens/tokens.dart';

/// Avatar shapes
enum AvatarShape { circle, square, rounded }

/// Avatar sizes
enum AvatarSize { xsmall, small, medium, large, xlarge }

/// Image source type for avatar
enum AvatarSourceType { network, asset, memory, file, none }

/// A versatile avatar component supporting images, initials, and icons
class DSAvatar extends StatelessWidget {
  const DSAvatar({
    super.key,
    this.image,
    this.imageProvider,
    this.sourceType = AvatarSourceType.network,
    this.initials,
    this.icon,
    this.shape = AvatarShape.circle,
    this.size = AvatarSize.medium,
    this.backgroundColor,
    this.foregroundColor,
    this.borderColor,
    this.borderWidth = 0,
    this.fit = BoxFit.cover,
    this.onTap,
    this.onLongPress,
    this.semanticLabel,
    this.placeholder,
    this.errorWidget,
    this.loadingWidget,
  });

  /// Image URL (for network source)
  final String? image;

  /// Image provider (alternative to image URL)
  final ImageProvider? imageProvider;

  /// Source type for image
  final AvatarSourceType sourceType;

  /// Initials to show when no image
  final String? initials;

  /// Icon to show when no image or initials
  final Widget? icon;

  /// Shape of the avatar
  final AvatarShape shape;

  /// Size of the avatar
  final AvatarSize size;

  /// Background color (for initials/icon fallback)
  final Color? backgroundColor;

  /// Foreground color (for initials/icon)
  final Color? foregroundColor;

  /// Border color
  final Color? borderColor;

  /// Border width
  final double borderWidth;

  /// Image fit
  final BoxFit fit;

  /// Tap callback
  final VoidCallback? onTap;

  /// Long press callback
  final VoidCallback? onLongPress;

  /// Semantic label
  final String? semanticLabel;

  /// Placeholder widget while loading
  final Widget? placeholder;

  /// Error widget when image fails
  final Widget? errorWidget;

  /// Loading widget
  final Widget? loadingWidget;

  @override
  Widget build(BuildContext context) {
    final DesignTokens? tokens = Theme.of(context).extension<DesignTokens>();
    final SizingScale sizing = tokens?.sizing.scale ?? SizingScale.defaultScale;
    final RadiusScale radius = tokens?.radius.scale ?? RadiusScale.defaultScale;
    final TypographyScale typography =
        tokens?.typography.scale ?? TypographyScale.defaultScale();
    final ColorScheme colors = Theme.of(context).colorScheme;

    final double dimension = _resolveDimension(size, sizing);
    final BorderRadius borderRadius = _resolveBorderRadius(shape, radius);
    final Color effectiveBorderColor = borderColor ?? colors.outlineVariant;
    final Color effectiveBackgroundColor =
        backgroundColor ?? _generateBackgroundColor(initials, colors);
    final Color effectiveForegroundColor =
        foregroundColor ??
        _resolveForegroundColor(effectiveBackgroundColor, colors);
    final TextStyle textStyle = _resolveTextStyle(
      size,
      typography,
      effectiveForegroundColor,
    );
    final double iconSize = _resolveIconSize(size, sizing);

    Widget avatarContent;

    // Priority: image > initials > icon > default
    if (image != null || imageProvider != null) {
      avatarContent = _buildImage(context, dimension, borderRadius, fit);
    } else if (initials != null && initials!.isNotEmpty) {
      avatarContent = Center(
        child: Text(
          _formatInitials(initials!),
          style: textStyle,
          textAlign: TextAlign.center,
        ),
      );
    } else if (icon != null) {
      avatarContent = Center(
        child: SizedBox(width: iconSize, height: iconSize, child: icon),
      );
    } else {
      avatarContent = Center(
        child: Icon(
          Icons.person,
          size: iconSize,
          color: effectiveForegroundColor.withValues(alpha: 0.6),
        ),
      );
    }

    Widget avatar = Container(
      width: dimension,
      height: dimension,
      decoration: BoxDecoration(
        color: effectiveBackgroundColor,
        borderRadius: borderRadius,
        border: borderWidth > 0
            ? Border.all(color: effectiveBorderColor, width: borderWidth)
            : null,
        boxShadow: borderWidth > 0
            ? <BoxShadow>[
                BoxShadow(
                  color: colors.shadow.withValues(alpha: 0.1),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ]
            : null,
      ),
      clipBehavior: Clip.antiAlias,
      child: avatarContent,
    );

    // Add interaction
    if (onTap != null || onLongPress != null) {
      avatar = InkWell(
        onTap: onTap,
        onLongPress: onLongPress,
        borderRadius: borderRadius,
        child: avatar,
      );
    }

    // Add semantics
    if (semanticLabel != null) {
      avatar = Semantics(
        label: semanticLabel,
        image: image != null || imageProvider != null,
        button: onTap != null,
        child: avatar,
      );
    }

    return avatar;
  }

  Widget _buildImage(
    BuildContext context,
    double dimension,
    BorderRadius borderRadius,
    BoxFit fit,
  ) {
    final ImageProvider<Object>? imageProvider =
        this.imageProvider ?? (image != null ? NetworkImage(image!) : null);

    if (imageProvider == null) {
      return const SizedBox.shrink();
    }

    return ClipRRect(
      borderRadius: borderRadius,
      child: Image(
        image: imageProvider,
        width: dimension,
        height: dimension,
        fit: fit,
        frameBuilder:
            (
              BuildContext context,
              Widget child,
              int? frame,
              bool wasSynchronouslyLoaded,
            ) {
              if (wasSynchronouslyLoaded || frame != null) return child;
              return loadingWidget ??
                  Container(
                    width: dimension,
                    height: dimension,
                    color: Theme.of(
                      context,
                    ).colorScheme.surfaceContainerHighest,
                    child: const Center(
                      child: SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                    ),
                  );
            },
        errorBuilder:
            (BuildContext context, Object error, StackTrace? stackTrace) =>
                errorWidget ??
                Container(
                  width: dimension,
                  height: dimension,
                  color: Theme.of(context).colorScheme.surfaceContainerHighest,
                  child: const Icon(Icons.person, color: Colors.grey),
                ),
      ),
    );
  }

  double _resolveDimension(AvatarSize size, SizingScale sizing) {
    return switch (size) {
      AvatarSize.xsmall => sizing.avatarXs,
      AvatarSize.small => sizing.avatarSm,
      AvatarSize.medium => sizing.avatarMd,
      AvatarSize.large => sizing.avatarLg,
      AvatarSize.xlarge => sizing.avatarXl,
    };
  }

  BorderRadius _resolveBorderRadius(AvatarShape shape, RadiusScale radius) {
    return switch (shape) {
      AvatarShape.circle => BorderRadius.circular(9999),
      AvatarShape.square => BorderRadius.zero,
      AvatarShape.rounded => radius.lgRadius,
    };
  }

  Color _generateBackgroundColor(String? initials, ColorScheme colors) {
    if (initials == null || initials.isEmpty) {
      return colors.primaryContainer;
    }

    // Generate consistent color from initials
    final int hash = initials.codeUnits.fold(0, (int a, int b) => a + b);
    final double hue =
        (hash * 137.5) % 360; // Golden angle for good distribution
    return HSVColor.fromAHSV(1, hue, 0.4, 0.9).toColor();
  }

  Color _resolveForegroundColor(Color backgroundColor, ColorScheme colors) {
    final Brightness brightness = ThemeData.estimateBrightnessForColor(
      backgroundColor,
    );
    return brightness == Brightness.light ? Colors.black87 : Colors.white;
  }

  TextStyle _resolveTextStyle(
    AvatarSize size,
    TypographyScale typography,
    Color color,
  ) {
    return switch (size) {
      AvatarSize.xsmall => typography.labelSmall.copyWith(
        color: color,
        fontWeight: FontWeight.w600,
      ),
      AvatarSize.small => typography.labelMedium.copyWith(
        color: color,
        fontWeight: FontWeight.w600,
      ),
      AvatarSize.medium => typography.titleSmall.copyWith(
        color: color,
        fontWeight: FontWeight.w600,
      ),
      AvatarSize.large => typography.titleMedium.copyWith(
        color: color,
        fontWeight: FontWeight.w600,
      ),
      AvatarSize.xlarge => typography.titleLarge.copyWith(
        color: color,
        fontWeight: FontWeight.w600,
      ),
    };
  }

  double _resolveIconSize(AvatarSize size, SizingScale sizing) {
    return switch (size) {
      AvatarSize.xsmall => sizing.iconXxs,
      AvatarSize.small => sizing.iconXs,
      AvatarSize.medium => sizing.iconSm,
      AvatarSize.large => sizing.iconMd,
      AvatarSize.xlarge => sizing.iconLg,
    };
  }

  String _formatInitials(String initials) {
    final List<String> parts = initials.trim().split(RegExp(r'\s+'));
    if (parts.length >= 2) {
      return '${parts.first[0]}${parts.last[0]}'.toUpperCase();
    }
    return initials.substring(0, initials.length.clamp(0, 2)).toUpperCase();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('image', image));
    properties.add(
      DiagnosticsProperty<ImageProvider<Object>?>(
        'imageProvider',
        imageProvider,
      ),
    );
    properties.add(EnumProperty<AvatarSourceType>('sourceType', sourceType));
    properties.add(StringProperty('initials', initials));
    properties.add(EnumProperty<AvatarShape>('shape', shape));
    properties.add(EnumProperty<AvatarSize>('size', size));
    properties.add(ColorProperty('backgroundColor', backgroundColor));
    properties.add(ColorProperty('foregroundColor', foregroundColor));
    properties.add(ColorProperty('borderColor', borderColor));
    properties.add(DoubleProperty('borderWidth', borderWidth));
    properties.add(EnumProperty<BoxFit>('fit', fit));
    properties.add(ObjectFlagProperty<VoidCallback?>.has('onTap', onTap));
    properties.add(
      ObjectFlagProperty<VoidCallback?>.has('onLongPress', onLongPress),
    );
    properties.add(StringProperty('semanticLabel', semanticLabel));
  }
}

/// Avatar group for overlapping avatars
class DSAvatarGroup extends StatelessWidget {
  const DSAvatarGroup({
    required this.avatars,
    super.key,
    this.maxVisible = 5,
    this.size = AvatarSize.medium,
    this.shape = AvatarShape.circle,
    this.overlap = 0.3,
    this.onTap,
    this.semanticLabel,
  });

  final List<DSAvatar> avatars;
  final int maxVisible;
  final AvatarSize size;
  final AvatarShape shape;
  final double overlap;
  final VoidCallback? onTap;
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    final DesignTokens? tokens = Theme.of(context).extension<DesignTokens>();
    final SizingScale sizing = tokens?.sizing.scale ?? SizingScale.defaultScale;
    final ColorScheme colors = Theme.of(context).colorScheme;

    final double dimension = _resolveDimension(size, sizing);
    final double offset = dimension * (1 - overlap);

    final List<DSAvatar> visibleAvatars = avatars.take(maxVisible).toList();
    final int remainingCount = avatars.length - maxVisible;

    final List<Widget> children = <Widget>[];

    for (int i = 0; i < visibleAvatars.length; i++) {
      final DSAvatar avatar = visibleAvatars[i];
      children.add(
        Positioned(left: i * offset, child: _wrapAvatar(avatar, dimension)),
      );
    }

    // Add remaining count badge
    if (remainingCount > 0) {
      children.add(
        Positioned(
          left: visibleAvatars.length * offset,
          child: _buildRemainingBadge(remainingCount, dimension, colors),
        ),
      );
    }

    Widget group = SizedBox(
      width:
          visibleAvatars.length * offset + (remainingCount > 0 ? dimension : 0),
      height: dimension,
      child: Stack(children: children),
    );

    if (onTap != null) {
      group = InkWell(onTap: onTap, child: group);
    }

    if (semanticLabel != null) {
      group = Semantics(label: semanticLabel, child: group);
    }

    return group;
  }

  Widget _wrapAvatar(DSAvatar avatar, double dimension) {
    return SizedBox(width: dimension, height: dimension, child: avatar);
  }

  Widget _buildRemainingBadge(int count, double dimension, ColorScheme colors) {
    return Container(
      width: dimension,
      height: dimension,
      decoration: BoxDecoration(
        color: colors.surfaceContainerHighest,
        shape: BoxShape.circle,
        border: Border.all(color: colors.surface, width: 2),
      ),
      alignment: Alignment.center,
      child: Text(
        '+$count',
        style: TextStyle(
          color: colors.onSurfaceVariant,
          fontSize: dimension * 0.35,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  double _resolveDimension(AvatarSize size, SizingScale sizing) {
    return switch (size) {
      AvatarSize.xsmall => sizing.avatarXs,
      AvatarSize.small => sizing.avatarSm,
      AvatarSize.medium => sizing.avatarMd,
      AvatarSize.large => sizing.avatarLg,
      AvatarSize.xlarge => sizing.avatarXl,
    };
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IntProperty('maxVisible', maxVisible));
    properties.add(EnumProperty<AvatarSize>('size', size));
    properties.add(EnumProperty<AvatarShape>('shape', shape));
    properties.add(DoubleProperty('overlap', overlap));
    properties.add(ObjectFlagProperty<VoidCallback?>.has('onTap', onTap));
    properties.add(StringProperty('semanticLabel', semanticLabel));
  }
}

/// Avatar with presence indicator
class DSAvatarWithPresence extends StatelessWidget {
  const DSAvatarWithPresence({
    required this.avatar,
    super.key,
    this.presence = UserPresence.offline,
    this.presenceSize,
    this.presencePosition = PresencePosition.bottomRight,
    this.showBorder = true,
    this.borderColor,
    this.borderWidth = 2,
  });

  final DSAvatar avatar;
  final UserPresence presence;
  final double? presenceSize;
  final PresencePosition presencePosition;
  final bool showBorder;
  final Color? borderColor;
  final double borderWidth;

  @override
  Widget build(BuildContext context) {
    final DesignTokens? tokens = Theme.of(context).extension<DesignTokens>();
    final SizingScale sizing = tokens?.sizing.scale ?? SizingScale.defaultScale;
    final ColorScheme colors = Theme.of(context).colorScheme;

    final AvatarSize avatarSize = avatar.size;
    final double dimension = _resolveDimension(avatarSize, sizing);
    final double indicatorSize = presenceSize ?? dimension * 0.3;

    final Color presenceColor = switch (presence) {
      UserPresence.online => colors.tertiary,
      UserPresence.busy => colors.error,
      UserPresence.away => colors.tertiaryContainer,
      UserPresence.offline => colors.outline,
    };

    final Container indicator = Container(
      width: indicatorSize,
      height: indicatorSize,
      decoration: BoxDecoration(
        color: presenceColor,
        shape: BoxShape.circle,
        border: showBorder
            ? Border.all(
                color: borderColor ?? colors.surface,
                width: borderWidth,
              )
            : null,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: colors.shadow.withValues(alpha: 0.2),
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
    );

    final List<Widget> positions = <Widget>[Positioned.fill(child: avatar)];

    // Calculate indicator position
    final double? right =
        presencePosition == PresencePosition.bottomRight ||
            presencePosition == PresencePosition.topRight
        ? -indicatorSize * 0.3
        : null;
    final double? left =
        presencePosition == PresencePosition.bottomLeft ||
            presencePosition == PresencePosition.topLeft
        ? -indicatorSize * 0.3
        : null;
    final double? bottom =
        presencePosition == PresencePosition.bottomRight ||
            presencePosition == PresencePosition.bottomLeft
        ? -indicatorSize * 0.3
        : null;
    final double? top =
        presencePosition == PresencePosition.topRight ||
            presencePosition == PresencePosition.topLeft
        ? -indicatorSize * 0.3
        : null;

    positions.add(
      Positioned(
        right: right,
        left: left,
        bottom: bottom,
        top: top,
        child: indicator,
      ),
    );

    return SizedBox(
      width: dimension + indicatorSize * 0.3,
      height: dimension + indicatorSize * 0.3,
      child: Stack(children: positions),
    );
  }

  double _resolveDimension(AvatarSize size, SizingScale sizing) {
    return switch (size) {
      AvatarSize.xsmall => sizing.avatarXs,
      AvatarSize.small => sizing.avatarSm,
      AvatarSize.medium => sizing.avatarMd,
      AvatarSize.large => sizing.avatarLg,
      AvatarSize.xlarge => sizing.avatarXl,
    };
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(EnumProperty<UserPresence>('presence', presence));
    properties.add(DoubleProperty('presenceSize', presenceSize));
    properties.add(
      EnumProperty<PresencePosition>('presencePosition', presencePosition),
    );
    properties.add(DiagnosticsProperty<bool>('showBorder', showBorder));
    properties.add(ColorProperty('borderColor', borderColor));
    properties.add(DoubleProperty('borderWidth', borderWidth));
  }
}

enum UserPresence { online, busy, away, offline }

enum PresencePosition { bottomRight, bottomLeft, topRight, topLeft }
