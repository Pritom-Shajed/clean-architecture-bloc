import 'package:auth/src/core/shared/animations_widget/animated_widget_shower.dart';
import 'package:auth/src/core/shared/asset_helper/asset_helper.dart';
import 'package:auth/src/core/shared/asset_helper/assets.dart';
import 'package:auth/src/core/shared/list_tile/k_list_tile/k_list_tile.dart';
import 'package:auth/src/core/utils/extensions/extensions.dart';
import 'package:auth/src/features/settings/presentation/bloc/performance_overlay/bloc/performance_overlay_bloc.dart';
import 'package:auth/src/localization/app_locale.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PerformanceOverlayTile extends StatelessWidget {
  const PerformanceOverlayTile({super.key});

  @override
  Widget build(BuildContext context) {
    return KListTile(
      leading: AnimatedWidgetShower(
        size: 30.0,
        child: AssetHelper.createSvgAsset(assetPath: SvgAssets.performanceOverlay),
      ),
      title: Text(
        t.performanceOverlay,
        style: context.text.titleSmall,
      ),
      trailing: Transform.scale(
        scale: 0.7,
        child: BlocBuilder<PerformanceOverlayBloc, PerformanceOverlayState>(
          builder: (_, state) => CupertinoSwitch(
            value: state.isEnabled,
            onChanged: (v) {
              context.read<PerformanceOverlayBloc>().add(ChangePerformanceOverlay(v));
            },
          ),
        ),
      ),
    );
  }
}
