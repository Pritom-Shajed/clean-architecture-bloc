part of 'auth_bloc.dart';

sealed class AuthEvent {}

class Login extends AuthEvent {
  final SigninReqParams params;

  Login({required this.params});
}

class Logout extends AuthEvent {}

class IsLoggedIn extends AuthEvent {}

class PassObscure extends AuthEvent {}
