import 'package:auth/src/core/router/app_routes.dart';
import 'package:auth/src/core/shared/button/basic_app_button.dart';
import 'package:auth/src/core/shared/text_field/basic_text_field.dart';
import 'package:auth/src/core/utils/toasts/app_toasts.dart';
import 'package:auth/src/features/auth/data/models/signin.dart';
import 'package:auth/src/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SigninPage extends StatefulWidget {
  static const name = 'signin';
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final TextEditingController _emailCon = TextEditingController(text: 'john@mail.com');

  final TextEditingController _passwordCon = TextEditingController(text: 'changeme');

  @override
  void dispose() {
    super.dispose();
    _emailCon.dispose();
    _passwordCon.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<AuthBloc>();

    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state.status == AuthStatus.success) {
            context.go(AppRoutes.homeRoute);
          }
          if (state.status == AuthStatus.error) {
            AppToasts.longToast(
              state.errorMessage ?? 'An error occurred',
            );
          }
        },
        child: SafeArea(
          minimum: const EdgeInsets.only(top: 100, right: 16, left: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Sign In',
                style: TextStyle(color: Color(0xff2A4ECA), fontWeight: FontWeight.bold, fontSize: 32),
              ),
              const SizedBox(
                height: 50,
              ),
              BasicTextField(
                controller: _emailCon,
                hintText: 'User Id',
              ),
              const SizedBox(
                height: 20,
              ),
              BasicTextField(
                controller: _passwordCon,
                hintText: 'Password',
                isObscureText: !bloc.state.passwordVisible,
                suffixIcon: InkWell(
                  onTap: () => bloc.add(const AuthEvent.togglePassVisibility()),
                  child: Icon(bloc.state.passwordVisible ? Icons.visibility : Icons.visibility_off),
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              BasicAppButton(
                  isLoading: bloc.state.status == AuthStatus.loading,
                  title: 'Login',
                  onPressed: () {
                    bloc.add(
                      AuthEvent.login(
                          params: SigninParams(email: _emailCon.text.trim(), password: _passwordCon.text.trim())),
                    );
                  }),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
