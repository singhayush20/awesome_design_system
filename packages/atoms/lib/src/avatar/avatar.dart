import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:awesome_design_system_tokens/tokens.dart';
import 'avatar_enums.dart';
import 'avatar_image.dart';

/// A versatile avatar component supporting images, initials, and fallback icons.
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

    final ImageProvider<Object>? effectiveImageProvider =
        imageProvider ?? (image != null ? NetworkImage(image!) : null);

    if (effectiveImageProvider != null) {
      avatarContent = DSAvatarImage(
        imageProvider: effectiveImageProvider,
        dimension: dimension,
        borderRadius: borderRadius,
        fit: fit,
        placeholder: placeholder,
        errorWidget: errorWidget,
        loadingWidget: loadingWidget,
      );
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
        image: effectiveImageProvider != null,
        button: onTap != null,
        child: avatar,
      );
    }

    return avatar;
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
    final double hue = (hash * 137.5) % 360;
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
