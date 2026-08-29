import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:awesome_design_system_tokens/tokens.dart';
import 'avatar_enums.dart';
import 'avatar.dart';

/// Avatar group component for overlapping avatars with overflow counter.
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
        Positioned(
          left: i * offset,
          child: SizedBox(width: dimension, height: dimension, child: avatar),
        ),
      );
    }

    // Add remaining count badge
    if (remainingCount > 0) {
      children.add(
        Positioned(
          left: visibleAvatars.length * offset,
          child: _DSRemainingBadge(
            count: remainingCount,
            dimension: dimension,
            colors: colors,
          ),
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

class _DSRemainingBadge extends StatelessWidget {
  const _DSRemainingBadge({
    required this.count,
    required this.dimension,
    required this.colors,
  });

  final int count;
  final double dimension;
  final ColorScheme colors;

  @override
  Widget build(BuildContext context) {
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
}
