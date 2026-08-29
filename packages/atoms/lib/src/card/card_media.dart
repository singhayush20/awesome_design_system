import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Card media (image) component.
class DSCardMedia extends StatelessWidget {
  const DSCardMedia({
    required this.image,
    super.key,
    this.height,
    this.width,
    this.fit = BoxFit.cover,
    this.alignment = Alignment.center,
    this.borderRadius,
    this.placeholder,
    this.errorWidget,
  });

  final ImageProvider image;
  final double? height;
  final double? width;
  final BoxFit fit;
  final Alignment alignment;
  final BorderRadius? borderRadius;
  final Widget? placeholder;
  final Widget? errorWidget;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.zero,
      child: Image(
        image: image,
        height: height,
        width: width,
        fit: fit,
        alignment: alignment,
        frameBuilder:
            (
              BuildContext context,
              Widget child,
              int? frame,
              bool wasSynchronouslyLoaded,
            ) {
              if (wasSynchronouslyLoaded || frame != null) return child;
              return placeholder ??
                  Container(
                    height: height,
                    width: width,
                    color: Theme.of(
                      context,
                    ).colorScheme.surfaceContainerHighest,
                    child: const Center(child: CircularProgressIndicator()),
                  );
            },
        errorBuilder:
            (BuildContext context, Object error, StackTrace? stackTrace) =>
                errorWidget ??
                Container(
                  height: height,
                  width: width,
                  color: Theme.of(context).colorScheme.surfaceContainerHighest,
                  child: Icon(
                    Icons.broken_image,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<ImageProvider<Object>>('image', image));
    properties.add(DoubleProperty('height', height));
    properties.add(DoubleProperty('width', width));
    properties.add(EnumProperty<BoxFit>('fit', fit));
    properties.add(DiagnosticsProperty<Alignment>('alignment', alignment));
    properties.add(
      DiagnosticsProperty<BorderRadius?>('borderRadius', borderRadius),
    );
  }
}
