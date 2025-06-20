import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:template/src/core/shared/animations_widget/animated_widget_shower.dart';
import 'package:template/src/core/shared/asset_helper/asset_helper.dart';
import 'package:template/src/core/shared/asset_helper/assets.dart';
import 'package:template/src/core/shared/list_tile/k_list_tile/k_list_tile.dart';
import 'package:template/src/features/settings/presentation/bloc/theme/bloc/theme_bloc.dart';
import 'package:template/src/localization/app_locale.dart';

import '../../../../../core/utils/extensions/extensions.dart';
import '../../../data/models/theme/theme_model.dart';

class ThemeTile extends StatelessWidget {
  const ThemeTile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return KListTile(
          leading: AnimatedWidgetShower(
            size: 30.0,
            child: AssetHelper.createSvgAsset(assetPath: SvgAssets.theme),
          ),
          title: Text(
            t.theme,
            style: context.text.titleSmall,
          ),
          trailing: ToggleButtons(
            borderRadius: BorderRadius.circular(25.0),
            constraints: const BoxConstraints(minWidth: 48.0, minHeight: 36.0),
            isSelected: List.generate(
              ThemeProfile.values.length,
              (i) => ThemeProfile.values[i] == state.theme,
            ),
            selectedColor: context.theme.primaryColor,
            onPressed: (i) => context.read<ThemeBloc>().add(ChangeTheme(ThemeProfile.values[i])),
            children: List.generate(
              ThemeProfile.values.length,
              (i) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6.0),
                child: SvgPicture.asset(
                  ThemeProfile.values[i].icon,
                  colorFilter: context.theme.primaryColor.toColorFilter,
                  semanticsLabel: ThemeProfile.values[i].label,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
