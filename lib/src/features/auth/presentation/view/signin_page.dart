import 'package:auth/src/core/router/app_routes.dart';
import 'package:auth/src/core/shared/page_wrapper/page_wrapper.dart';
import 'package:auth/src/core/utils/toasts/app_toasts.dart';
import 'package:auth/src/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:auth/src/features/auth/presentation/view/components/parent/sign_in_body.dart';
import 'package:auth/src/localization/app_locale.dart';
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
  final TextEditingController _emailController = TextEditingController(text: 'john@mail.com');

  final TextEditingController _passConroller = TextEditingController(text: 'changeme');

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passConroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state.status == AuthStatus.success) {
            context.go(AppRoutes.homeRoute);
          }
          if (state.status == AuthStatus.error) {
            AppToasts.longToast(
              state.errorMessage ?? t.errorOccured,
            );
          }
        },
        child: PageWrapper(
          child: SigninBody(
            formKey: _formKey,
            emailController: _emailController,
            passController: _passConroller,
          ),
        ),
      ),
    );
  }
}
