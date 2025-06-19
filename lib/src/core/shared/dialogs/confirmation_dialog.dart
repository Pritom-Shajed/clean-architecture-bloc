import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:solar_icon_pack/solar_linear_icons.dart';
import 'package:template/src/core/shared/button/basic_app_button.dart';
import 'package:template/src/core/utils/extensions/extensions.dart';
import 'package:template/src/localization/app_locale.dart';

void confirmationDialog(
  BuildContext context, {
  required String title,
  required String message,
  VoidCallback? onConfirm,
}) {
  showDialog(
      context: context,
      builder: (_) {
        return Dialog(
          backgroundColor: context.theme.scaffoldBackgroundColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            width: 300,
            height: MediaQuery.of(context).size.height / 5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 12,
                  children: [
                    Text(
                      textAlign: TextAlign.center,
                      title,
                      style: context.text.titleLarge,
                    ),
                    Text(
                      textAlign: TextAlign.center,
                      message,
                      style: context.text.bodyMedium,
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: BasicAppButton(
                        title: t.ok,
                        onPressed: onConfirm,
                      ),
                    )
                  ],
                ),
                12.sizedBox,
                Positioned(
                    top: 15,
                    right: 0,
                    child: InkWell(
                        borderRadius: BorderRadius.circular(8),
                        onTap: () => context.pop(),
                        child: const Icon(SolarLinearIcons.close)))
              ],
            ),
          ),
        );
      });
}
