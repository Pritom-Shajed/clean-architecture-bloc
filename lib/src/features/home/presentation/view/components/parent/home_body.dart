import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:template/src/core/shared/button/basic_app_button.dart';
import 'package:template/src/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:template/src/features/home/presentation/bloc/home_bloc.dart';

import '../../../../../../localization/app_locale.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(t.dashboard),
              const SizedBox(
                height: 16,
              ),
              BasicAppButton(
                  title: t.signout,
                  onPressed: () {
                    context.read<AuthBloc>().add(const AuthEvent.logout());
                  })
            ],
          ),
        );
      },
    );
  }
}
