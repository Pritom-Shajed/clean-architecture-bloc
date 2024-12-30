import 'package:auth/domain/usecases/auth/is_logged_in.dart';
import 'package:auth/presentation/auth/pages/signin_page.dart';
import 'package:auth/presentation/auth/pages/signup_page.dart';
import 'package:auth/presentation/home/pages/home_page.dart';
import 'package:auth/injector.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> _rootNavKey = GlobalKey<NavigatorState>();

Future<String?> authRedirect(BuildContext context, GoRouterState state) async {
  var isLoggedIn = await sl<IsLoggedInUseCase>().call();
  if (state.path == SigninPage.routeName ||
      state.path == SignupPage.routeName) {
    if (isLoggedIn) {
      return HomePage.routeName;
    }
  } else {
    if (!isLoggedIn) {
      return SigninPage.routeName;
    }
  }
  return null;
}

GoRouter router = GoRouter(
  navigatorKey: _rootNavKey,
  routes: [
    GoRoute(
      path: SigninPage.routeName,
      redirect: authRedirect,
      pageBuilder: (context, state) => const NoTransitionPage(
        child: SigninPage(),
      ),
    ),
    GoRoute(
      path: SignupPage.routeName,
      redirect: authRedirect,
      pageBuilder: (context, state) => const NoTransitionPage(
        child: SignupPage(),
      ),
    ),
    GoRoute(
      path: HomePage.routeName,
      redirect: authRedirect,
      pageBuilder: (context, state) => const NoTransitionPage(
        child: HomePage(),
      ),
    ),
  ],
);
