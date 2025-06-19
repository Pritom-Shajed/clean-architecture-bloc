import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:template/src/core/base/network/connectivity_checker/bloc/connectivity_bloc.dart';
import 'package:template/src/core/base/network/enum/connectivity_status.dart';
import 'package:template/src/core/shared/asset_helper/asset_helper.dart';
import 'package:template/src/core/shared/asset_helper/assets.dart';
import 'package:template/src/core/utils/colors/app_colors.dart';
import 'package:template/src/core/utils/loader/app_loaders.dart';

class NetworkStatusIndicator extends StatelessWidget {
  const NetworkStatusIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<ConnectivityBloc>();
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: bloc.state.status == ConnectionStatus.connected
            ? AppColors.green
            : bloc.state.status == ConnectionStatus.disconnected
                ? AppColors.red
                : Colors.transparent,
        borderRadius: BorderRadius.circular(4),
      ),
      child: bloc.state.status == ConnectionStatus.loading
          ? AppLoaders.pulse(size: 12)
          : AssetHelper.createSvgAsset(
              assetPath: bloc.state.status == ConnectionStatus.connected ? SvgAssets.wifi : SvgAssets.wifiNo,
              color: AppColors.white,
              width: 12,
              height: 12,
            ),
    );
  }
}
