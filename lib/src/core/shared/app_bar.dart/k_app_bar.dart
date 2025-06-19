import 'package:flutter/material.dart';
import 'package:template/src/core/shared/network/network_status_indicator.dart';
import 'package:template/src/core/utils/extensions/extensions.dart';

class KAppBar extends StatelessWidget implements PreferredSizeWidget {
  const KAppBar(
      {super.key,
      this.titleText,
      this.centerTitle = false,
      this.showNetworkIndicator = false,
      this.actions,
      this.leading});

  final String? titleText;
  final bool showNetworkIndicator, centerTitle;
  final List<Widget>? actions;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading,
      centerTitle: centerTitle,
      title: titleText != null ? Text(titleText!, style: context.text.titleMedium) : null,
      actions: [
        if (showNetworkIndicator)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: const NetworkStatusIndicator(),
          ),
        ...actions ?? const [],
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
