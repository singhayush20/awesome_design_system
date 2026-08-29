import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:awesome_design_system_tokens/tokens.dart';
import 'package:awesome_design_system_atoms/atoms.dart';

/// Avatar with presence indicator component.
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
