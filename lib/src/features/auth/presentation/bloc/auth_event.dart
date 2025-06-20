part of 'auth_bloc.dart';


@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.login({required SigninParams params}) = _Login;
  const factory AuthEvent.logout() = _Logout;
  const factory AuthEvent.togglePassVisibility() = _PassObscure;
}

