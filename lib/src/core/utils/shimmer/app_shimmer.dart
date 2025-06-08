import 'package:auth/src/core/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class AppShimmer {
  AppShimmer._();
  static Widget shimmerCircle(BuildContext context, {Color? baseColor, Color? highlightColor, double? radius}) =>
      Shimmer.fromColors(
        baseColor: baseColor ?? context.theme.highlightColor.withValues(alpha: 0.2),
        highlightColor: highlightColor ?? context.theme.highlightColor.withValues(alpha: 0.4),
        child: CircleAvatar(radius: radius),
      );

  static Widget shimmerContainer(
    BuildContext context, {
    double? height,
    double? width,
    EdgeInsets? margin,
    Color? baseColor,
    Color? highlightColor,
    double? radius,
  }) =>
      Shimmer.fromColors(
        baseColor: baseColor ?? context.theme.highlightColor.withValues(alpha: 0.2),
        highlightColor: highlightColor ?? context.theme.highlightColor.withValues(alpha: 0.4),
        child: Container(
          height: height,
          width: width,
          margin: margin,
          decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.circular(10)),
        ),
      );
}
