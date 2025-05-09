import 'package:auth/src/core/router/router.dart';
import 'package:auth/src/features/auth/data/models/signin.dart';
import 'package:auth/src/features/auth/domain/usecase/signin.dart';
import 'package:auth/src/features/auth/domain/usecase/signout.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SigninUseCase _signinUseCase;
  final SignoutUseCase _logoutUseCase;
  bool passwordVisible = false;

  AuthBloc(this._signinUseCase, this._logoutUseCase) : super(const AuthState.initial()) {
    on<Login>(_handleLogin);
    on<Logout>(_handleLogout);
    on<PassObscure>(_handlePassObscure);
  }

  Future<void> _handleLogin(Login event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());
    try {
      final Either result = await _signinUseCase.call(params: event.params);
      result.fold(
        (error) {
          emit(AuthState.error(errorMessage: error));
          emit(const AuthState.initial());
        },
        (data) {
          emit(const AuthState.success(message: 'Successfully logged in'));
        },
      );
    } catch (e) {
      emit(AuthState.error(errorMessage: e.toString()));
    }
  }

  Future<void> _handleLogout(Logout event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());
    try {
      await _logoutUseCase.call();
      goRouter.refresh();
      emit(const AuthState.success(message: 'Successfully logged out'));
    } catch (e) {
      emit(AuthState.error(errorMessage: e.toString()));
    }
  }

  void _handlePassObscure(PassObscure event, Emitter<AuthState> emit) {
    passwordVisible = !passwordVisible;
    emit(const AuthState.passVisibilityTrigger());
  }
}
