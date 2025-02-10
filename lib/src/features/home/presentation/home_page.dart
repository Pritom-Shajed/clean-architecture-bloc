import 'package:auth/src/core/router/router.dart';
import 'package:auth/src/core/shared/button/basic_app_button.dart';
import 'package:auth/src/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:auth/src/features/home/bloc/bloc/home_bloc.dart';
import 'package:auth/src/features/settings/presentation/view/settings_view.dart';
import 'package:auth/src/localization/app_locale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  static const name = 'home';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.goPushNamed(SettingsView.name);
        },
        child: const Icon(Icons.settings),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return SafeArea(
            minimum: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(t.dashboard),
                const SizedBox(
                  height: 16,
                ),
                BasicAppButton(
                    title: 'Logout',
                    onPressed: () {
                      context.read<AuthBloc>().add(Logout());
                    })
              ],
            ),
          );
        },
      ),
    );
  }
}
