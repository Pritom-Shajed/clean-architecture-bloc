import 'package:auth/src/core/shared/button/basic_app_button.dart';
import 'package:auth/src/core/router/app_routes.dart';
import 'package:auth/src/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:auth/src/features/settings/presentation/view/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  static const name = 'home';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => const SettingsView()));
          // context.goPushNamed(SettingsView.name);
        },
        child: const Icon(Icons.settings),
      ),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is Success) {
            context.go(AppRoutes.signinRoute);
          }
          if (state is Error) {
            var snackBar = SnackBar(content: Text(state.errorMessage));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
        child: SafeArea(
          minimum: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Dashboard'),
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
        ),
      ),
    );
  }
}
