import 'package:auth/src/core/router/router.dart';
import 'package:auth/src/core/shared/app_bar.dart/k_app_bar.dart';
import 'package:auth/src/core/shared/page_wrapper/page_wrapper.dart';
import 'package:auth/src/features/home/presentation/view/components/parent/home_body.dart';
import 'package:auth/src/features/settings/presentation/view/settings_view.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static const name = 'home';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KAppBar(
        showNetworkIndicator: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.goPushNamed(SettingsPage.name);
        },
        child: const Icon(Icons.settings),
      ),
      body: const PageWrapper(
        child: HomeBody(),
      ),
    );
  }
}
