import 'package:flutter/material.dart';
import 'package:template/src/core/configs/constants.dart';
import 'package:template/src/core/shared/asset_helper/asset_helper.dart';
import 'package:template/src/core/shared/asset_helper/assets.dart';
import 'package:template/src/core/utils/extensions/extensions.dart';
import 'package:template/src/localization/app_locale.dart';
import 'package:url_launcher/url_launcher.dart';

class MaintenanceBreak extends StatelessWidget {
  const MaintenanceBreak({super.key});

  static const name = 'maintenance-break';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              AssetHelper.createSvgAsset(assetPath: SvgAssets.error, width: size.height * 0.22),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  t.underMaintenance,
                  style: context.text.labelLarge?.copyWith(
                    letterSpacing: 1.1,
                  ),
                  textScaler: const TextScaler.linear(1.4),
                ),
              ),
              Text(
                t.backSoon,
                textScaler: const TextScaler.linear(1.1),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: InkWell(
                  onTap: () async => await launchUrl(Uri.parse('http://pritomshajed.com')),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 20.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: context.theme.primaryColor,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(35.0),
                    ),
                    child: Row(
                      mainAxisSize: mainMin,
                      spacing: 10,
                      children: [
                        const Icon(Icons.engineering),
                        Text(
                          t.contactWithAdmin,
                          textScaler: const TextScaler.linear(0.8),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
