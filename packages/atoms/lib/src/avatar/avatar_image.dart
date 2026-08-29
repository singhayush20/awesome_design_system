import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Presentation widget for rendering avatar image with placeholder and error fallback.
class DSAvatarImage extends StatelessWidget {
  const DSAvatarImage({
    required this.imageProvider,
    required this.dimension,
    required this.borderRadius,
    required this.fit,
    super.key,
    this.placeholder,
    this.errorWidget,
    this.loadingWidget,
  });

  final ImageProvider imageProvider;
  final double dimension;
  final BorderRadius borderRadius;
  final BoxFit fit;
  final Widget? placeholder;
  final Widget? errorWidget;
  final Widget? loadingWidget;

  @override
  Widget build(BuildContext context) {
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
                  placeholder ??
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

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<ImageProvider>('imageProvider', imageProvider));
    properties.add(DoubleProperty('dimension', dimension));
    properties.add(DiagnosticsProperty<BorderRadius>('borderRadius', borderRadius));
    properties.add(EnumProperty<BoxFit>('fit', fit));
    properties.add(DiagnosticsProperty<Widget?>('placeholder', placeholder));
    properties.add(DiagnosticsProperty<Widget?>('errorWidget', errorWidget));
    properties.add(DiagnosticsProperty<Widget?>('loadingWidget', loadingWidget));
  }
}
