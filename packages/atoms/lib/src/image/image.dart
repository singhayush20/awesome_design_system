// ignore_for_file: always_specify_types, diagnostic_describe_all_properties
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum DSImageType { asset, network, svgAsset, svgNetwork }

class DSImage extends StatelessWidget {
  const DSImage({
    required this.source,
    required this.type,
    super.key,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.errorBuilder,
  });
  final String source;
  final DSImageType type;
  final double? width, height;
  final BoxFit fit;
  final Widget Function(BuildContext, Object, StackTrace?)? errorBuilder;
  @override
  Widget build(BuildContext context) {
    switch (type) {
      case DSImageType.asset:
        return Image.asset(
          source,
          width: width,
          height: height,
          fit: fit,
          errorBuilder: errorBuilder,
        );
      case DSImageType.network:
        return CachedNetworkImage(
          imageUrl: source,
          width: width,
          height: height,
          fit: fit,
          errorWidget: errorBuilder == null
              ? null
              : (context, error, stack) => errorBuilder!(context, error, null),
        );
      case DSImageType.svgAsset:
        return SvgPicture.asset(source, width: width, height: height, fit: fit);
      case DSImageType.svgNetwork:
        return SvgPicture.network(
          source,
          width: width,
          height: height,
          fit: fit,
        );
    }
  }
}

typedef DsImage = DSImage;
