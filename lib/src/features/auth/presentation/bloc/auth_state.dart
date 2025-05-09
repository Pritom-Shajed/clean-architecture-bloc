part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = Initial;
  const factory AuthState.loading() = Loading;
  const factory AuthState.success({required String message}) = Success;
  const factory AuthState.error({required String errorMessage}) = Error;
  const factory AuthState.passVisibilityTrigger() = PassVisibilityTrigger;
}
