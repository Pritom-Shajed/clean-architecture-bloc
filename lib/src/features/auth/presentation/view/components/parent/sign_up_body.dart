import 'package:auth/src/core/shared/button/basic_app_button.dart';
import 'package:auth/src/core/shared/text_field/basic_text_field.dart';
import 'package:auth/src/core/utils/extensions/extensions.dart';
import 'package:auth/src/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:auth/src/features/auth/presentation/view/components/child/auth_footer.dart';
import 'package:auth/src/localization/app_locale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class SignupBody extends StatelessWidget {
  const SignupBody(
      {super.key,
      required this.nameController,
      required this.emailController,
      required this.passController,
      this.formKey});

  final TextEditingController nameController, emailController, passController;
  final GlobalKey<FormState>? formKey;

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<AuthBloc>();
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              t.signUp,
              style: context.text.titleMedium,
            ),
            50.sizedBox,
            BasicTextField(
              controller: nameController,
              hintText: 'User name',
              validator: FormBuilderValidators.required(errorText: t.emptyField),
            ),
            20.sizedBox,
            BasicTextField(
              controller: emailController,
              hintText: 'Email',
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(errorText: t.emptyField),
                FormBuilderValidators.email(errorText: t.invalidMail),
              ]),
            ),
            20.sizedBox,
            BasicTextField(
              controller: passController,
              hintText: 'Password',
              isObscureText: !bloc.state.isPasswordVisible,
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(errorText: t.emptyField),
                FormBuilderValidators.minLength(6, errorText: t.invalidPass),
              ]),
              suffixIcon: InkWell(
                onTap: () => bloc.add(const AuthEvent.togglePassVisibility()),
                child: Icon(bloc.state.isPasswordVisible ? Icons.visibility : Icons.visibility_off),
              ),
            ),
            60.sizedBox,
            BasicAppButton(
                isLoading: bloc.state.status == AuthStatus.loading,
                title: t.signUp,
                onPressed: () {
                  if (!(formKey?.currentState?.validate() ?? false)) return;
                }),
            30.sizedBox,
            const AuthFooter(
              isFromSignIn: false,
            ),
            20.sizedBox,
          ],
        ),
      ),
    );
  }
}
