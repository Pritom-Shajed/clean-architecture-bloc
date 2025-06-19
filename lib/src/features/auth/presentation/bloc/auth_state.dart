part of 'auth_bloc.dart';

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState({
    @Default(false) bool isPasswordVisible,
    @Default(AuthStatus.initial) AuthStatus status,
    String? message,
    String? errorMessage,
  }) = _AuthState;
}

enum AuthStatus { initial, loading, success, error }
