import 'package:auth/src/core/shared/asset_helper/assets.dart';
import 'package:auth/src/core/utils/shimmer/app_shimmer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageCacher extends StatelessWidget {
  final String? imageUrl;
  final double size;
  const ImageCacher({super.key, this.imageUrl, this.size = 20});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl ?? '',
      imageBuilder: (context, imageProvider) => Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
        ),
      ),
      placeholder: (context, url) => AppShimmer.shimmerCircle(context, radius: size),
      errorWidget: (context, url, error) => Container(
        width: size,
        height: size,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(image: AssetImage(PngAssets.avatar), fit: BoxFit.cover),
        ),
      ),
    );
  }
}
