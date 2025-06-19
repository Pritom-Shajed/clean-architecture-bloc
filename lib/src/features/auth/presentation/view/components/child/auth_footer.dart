import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:template/src/core/utils/colors/app_colors.dart';
import 'package:template/src/core/utils/extensions/extensions.dart';
import 'package:template/src/features/auth/presentation/view/signin_page.dart';
import 'package:template/src/features/auth/presentation/view/signup_page.dart';
import 'package:template/src/localization/app_locale.dart';

class AuthFooter extends StatelessWidget {
  final bool isFromSignIn;
  const AuthFooter({super.key, this.isFromSignIn = true});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(children: [
        TextSpan(
            text: isFromSignIn ? '${t.dontHaveAccount}?' : '${t.alreadyHaveAccount}?', style: context.text.labelSmall),
        TextSpan(
            text: ' ${isFromSignIn ? t.signUp : t.signIn}',
            style: context.text.labelSmall?.copyWith(color: AppColors.blue),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                if (isFromSignIn) {
                  context.pushNamed(SignupPage.name);
                } else {
                  context.pushNamed(SigninPage.name);
                }
              })
      ]),
    );
  }
}
