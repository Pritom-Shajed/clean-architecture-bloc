import 'package:auth/src/core/base/network/connectivity_checker/bloc/connectivity_bloc.dart';
import 'package:auth/src/core/base/network/enum/connectivity_status.dart';
import 'package:auth/src/core/shared/asset_helper/asset_helper.dart';
import 'package:auth/src/core/shared/asset_helper/assets.dart';
import 'package:auth/src/core/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NetworkStatusIndicator extends StatelessWidget {
  const NetworkStatusIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    final connectivityBloc = context.watch<ConnectivityBloc>();
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: connectivityBloc.state.status == ConnectionStatus.connected ? AppColors.green : AppColors.red,
        borderRadius: BorderRadius.circular(4),
      ),
      child: AssetHelper.createSvgAsset(
        assetPath: connectivityBloc.state.status == ConnectionStatus.connected ? SvgAssets.wifi : SvgAssets.wifiNo,
        color: AppColors.white,
        width: 12,
        height: 12,
      ),
    );
  }
}
