import 'package:auth/common/widgets/button/basic_app_button.dart';
import 'package:auth/presentation/auth/bloc/auth_bloc.dart';
import 'package:auth/presentation/auth/pages/signin_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/home';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is Success) {
            context.go(SigninPage.routeName);
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
