import 'dart:io';

import 'package:flutter/material.dart';
import 'package:template/src/core/configs/constants.dart';
import 'package:template/src/core/configs/get_platform.dart';
import 'package:template/src/core/injector/injector.dart';
import 'package:template/src/core/shared/asset_helper/asset_helper.dart';
import 'package:template/src/core/shared/asset_helper/assets.dart';
import 'package:template/src/core/utils/colors/app_colors.dart';
import 'package:template/src/core/utils/extensions/extensions.dart';
import 'package:template/src/localization/app_locale.dart';

class KPageNotFound extends StatelessWidget {
  const KPageNotFound({super.key, required this.error});

  final Object error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: mainMin,
            mainAxisAlignment: mainCenter,
            children: [
              AssetHelper.createSvgAsset(
                assetPath: SvgAssets.error,
                height: context.width * 0.35,
                width: context.width * 0.35,
              ),
              Text(
                '${t.errorOccured}: $error',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class KServerNotRunning extends StatelessWidget {
  const KServerNotRunning({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: mainMin,
              mainAxisAlignment: mainCenter,
              children: [
                AssetHelper.createSvgAsset(
                  assetPath: SvgAssets.error,
                  height: context.width * 0.35,
                  width: context.width * 0.35,
                ),
                Text(
                  '${t.errorOccured} ${t.pageNotFound}',
                  textAlign: TextAlign.center,
                  style: context.text.labelLarge?.copyWith(
                    color: Colors.red,
                  ),
                ),
                const SizedBox(height: 20),
                OutlinedButton.icon(
                  style: ButtonStyle(
                    minimumSize: WidgetStateProperty.all(const Size(150, 42)),
                  ),
                  onPressed: () {
                    if (sl<PT>().isNotWeb) {
                      exit(0);
                    }
                  },
                  label: Text(t.exit),
                  icon: const Icon(Icons.exit_to_app),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class KDataNotFound extends StatelessWidget {
  const KDataNotFound({super.key, this.msg});

  final String? msg;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: mainMin,
            mainAxisAlignment: mainCenter,
            children: [
              AssetHelper.createSvgAsset(
                assetPath: SvgAssets.error,
                height: context.width * 0.15,
                width: context.width * 0.15,
              ),
              Text(
                msg ?? t.noDataFound,
                textAlign: TextAlign.center,
                style: context.text.labelLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AccesDeniedPage extends StatelessWidget {
  const AccesDeniedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: mainMin,
            mainAxisAlignment: mainCenter,
            children: [
              Center(
                child: AssetHelper.createSvgAsset(
                  assetPath: SvgAssets.error,
                  height: context.width * 0.15,
                  width: context.width * 0.15,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                t.accessDenied,
                textAlign: TextAlign.center,
                style: context.text.labelLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
