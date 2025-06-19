import 'package:auth/src/core/shared/animations_widget/animated_popup.dart';
import 'package:auth/src/core/shared/animations_widget/animated_widget_shower.dart';
import 'package:auth/src/core/shared/asset_helper/asset_helper.dart';
import 'package:auth/src/core/shared/asset_helper/assets.dart';
import 'package:auth/src/core/shared/list_tile/k_list_tile/k_list_tile.dart';
import 'package:auth/src/core/utils/colors/app_colors.dart';
import 'package:auth/src/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:auth/src/features/home/presentation/bloc/home_bloc.dart';
import 'package:auth/src/localization/app_locale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/extensions/extensions.dart';

class SignoutTile extends StatelessWidget {
  const SignoutTile({super.key});

  @override
  Widget build(BuildContext context) {
    return KListTile(
      leading: AnimatedWidgetShower(
        size: 30.0,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: AssetHelper.createSvgAsset(assetPath: SvgAssets.signout),
        ),
      ),
      title: BlocBuilder<HomeBloc, HomeState>(
        builder: (_, __) {
          return Text(
            t.signout,
            style: context.text.titleSmall,
          );
        },
      ),
      onTap: () async => await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => const SignoutPopup(),
      ),
    );
  }
}

class SignoutPopup extends StatelessWidget {
  const SignoutPopup({super.key});

  @override
  Widget build(
    BuildContext context,
  ) {
    return AnimatedPopup(
      child: AlertDialog(
        title: Text(t.signout),
        content: Text(t.areYourSure),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(
              t.cancel,
              style: context.text.bodySmall?.copyWith(
                color: context.text.bodySmall?.color?.withValues(alpha: 0.8),
              ),
            ),
          ),
          TextButton(
            onPressed: () => context.read<AuthBloc>().add(const AuthEvent.logout()),
            child: Text(
              t.confirm,
              style: context.text.bodySmall?.copyWith(
                color: AppColors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
