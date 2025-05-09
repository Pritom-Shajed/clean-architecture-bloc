part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.login({required SigninParams params}) = Login;
  const factory AuthEvent.logout() = Logout;
  const factory AuthEvent.passObscure() = PassObscure;
}
