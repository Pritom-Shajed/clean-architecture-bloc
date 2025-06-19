import 'package:auth/src/core/shared/page_wrapper/page_wrapper.dart';
import 'package:auth/src/core/utils/toasts/app_toasts.dart';
import 'package:auth/src/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:auth/src/features/auth/presentation/view/components/parent/sign_up_body.dart';
import 'package:auth/src/features/home/presentation/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignupPage extends StatefulWidget {
  static const name = 'signup';
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _passController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state.status == AuthStatus.success) {
            context.go(HomePage.name);
          }
          if (state.status == AuthStatus.error) {
            AppToasts.longToast(
              state.errorMessage ?? 'An error occurred',
            );
          }
        },
        child: PageWrapper(
          child: SignupBody(
            formKey: _formKey,
            nameController: _nameController,
            emailController: _emailController,
            passController: _passController,
          ),
        ),
      ),
    );
  }
}
