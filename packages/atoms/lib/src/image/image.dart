// ignore_for_file: always_specify_types, diagnostic_describe_all_properties
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DSImage extends StatelessWidget {
  const DSImage({
    required this.imagePath,
    super.key,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.errorBuilder,
  });

  final String imagePath;
  final double? width, height;
  final BoxFit fit;
  final Widget Function(BuildContext, Object, StackTrace?)? errorBuilder;

  bool get _isSvg => imagePath.toLowerCase().endsWith('.svg');
  bool get _isNetwork => imagePath.startsWith('http://') || imagePath.startsWith('https://');

  @override
  Widget build(BuildContext context) {
    if (_isSvg) {
      return _isNetwork
          ? SvgPicture.network(
              imagePath,
              width: width,
              height: height,
              fit: fit,
            )
          : SvgPicture.asset(imagePath, width: width, height: height, fit: fit);
    }

    return _isNetwork
        ? CachedNetworkImage(
            imageUrl: imagePath,
            width: width,
            height: height,
            fit: fit,
            errorWidget: errorBuilder == null
                ? null
                : (context, error, stack) => errorBuilder!(context, error, null),
          )
        : Image.asset(
            imagePath,
            width: width,
            height: height,
            fit: fit,
            errorBuilder: errorBuilder,
          );
  }
}

typedef DsImage = DSImage;