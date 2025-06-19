import 'package:flutter/material.dart';
import 'package:template/src/core/shared/asset_helper/asset_helper.dart';
import 'package:template/src/core/shared/asset_helper/assets.dart';
import 'package:template/src/core/utils/extensions/extensions.dart';
import 'package:template/src/localization/app_locale.dart';

class EmptyView extends StatelessWidget {
  const EmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 20,
        children: [
          AssetHelper.createLottieJson(assetPath: LottieAssets.empty, width: 200, height: 200),
          Text(t.noDataFound, style: context.text.bodySmall),
        ],
      ),
    );
  }
}
