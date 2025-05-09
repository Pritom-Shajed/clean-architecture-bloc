import 'package:auth/src/core/router/app_routes.dart';
import 'package:auth/src/core/shared/button/basic_app_button.dart';
import 'package:auth/src/core/shared/text_field/basic_text_field.dart';
import 'package:auth/src/core/utils/toasts/app_toasts.dart';
import 'package:auth/src/features/auth/data/models/signin.dart';
import 'package:auth/src/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
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

  final _formKey = GlobalKey<FormState>();

  onDispose() {
    _emailCon.dispose();
    _passwordCon.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is Success) {
            context.go(AppRoutes.homeRoute);
          }
          if (state is Error) {
            AppToasts.longToast(
              state.errorMessage,
            );
          }
        },
        child: SafeArea(
          minimum: const EdgeInsets.only(top: 100, right: 16, left: 16),
          child: Form(
            key: _formKey,
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
                  hintText: 'Email',
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.email(),
                  ]),
                ),
                const SizedBox(
                  height: 20,
                ),
                BasicTextField(
                  controller: _passwordCon,
                  hintText: 'Password',
                  isObscureText: !context.watch<AuthBloc>().passwordVisible,
                  validator: FormBuilderValidators.required(),
                  suffixIcon: InkWell(
                    onTap: () => context.read<AuthBloc>().add(const PassObscure()),
                    child: Icon(context.watch<AuthBloc>().passwordVisible ? Icons.visibility : Icons.visibility_off),
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                BasicAppButton(
                    isLoading: context.watch<AuthBloc>().state is Loading,
                    title: 'Login',
                    onPressed: () {
                      if ((_formKey.currentState?.validate() ?? false)) {
                        context.read<AuthBloc>().add(Login(
                            params: SigninParams(email: _emailCon.text.trim(), password: _passwordCon.text.trim())));
                      }
                    }),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
