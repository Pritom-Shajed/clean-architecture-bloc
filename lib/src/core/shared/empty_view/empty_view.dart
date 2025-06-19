import 'package:auth/src/core/shared/asset_helper/asset_helper.dart';
import 'package:auth/src/core/shared/asset_helper/assets.dart';
import 'package:auth/src/core/utils/extensions/extensions.dart';
import 'package:auth/src/localization/app_locale.dart';
import 'package:flutter/material.dart';

class EmptyView extends StatelessWidget {
  const EmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AssetHelper.createLottieJson(assetPath: LottieAssets.empty, width: 200, height: 200),
          const SizedBox(height: 20),
          Text(t.noDataFound, style: context.text.bodySmall),
        ],
      ),
    );
  }
}
