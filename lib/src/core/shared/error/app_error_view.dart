import 'package:auth/src/core/utils/extensions/extensions.dart';
import 'package:auth/src/localization/app_locale.dart';
import 'package:flutter/material.dart';

class AppErrorView extends StatelessWidget {
  final String message;

  const AppErrorView({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            '${t.errorOccured}: $message',
            overflow: TextOverflow.visible,
            textAlign: TextAlign.center,
            style: context.text.labelLarge,
          ),
        ),
      ),
    );
  }
}
