import 'package:auth/src/core/utils/colors/app_colors.dart';
import 'package:auth/src/core/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';

class AssetHelper {
  static Widget createLottieJson({required String assetPath, double? width, double? height}) {
    return Lottie.asset(
      assetPath,
      width: width,
      height: height,
    );
  }

  static Widget createSvgAsset({required String assetPath, Color? color, double? width, double? height}) {
    return SvgPicture.asset(
      assetPath,
      colorFilter: (color ?? AppColors.primaryColor).toColorFilter,
      width: width,
      height: height,
    );
  }

  static Widget createSvgNetworkAsset({required String assetUrl, Color? color, double? width, double? height}) {
    return SvgPicture.network(
      assetUrl,
      colorFilter: (color ?? AppColors.primaryColor).toColorFilter,
      width: width,
      height: height,
      placeholderBuilder: (_) => Container(
        padding: const EdgeInsets.all(30.0),
        child: const CircularProgressIndicator(),
      ),
    );
  }
}
