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

  AuthBloc(this._signinUseCase, this._logoutUseCase) : super(const AuthState()) {
    on<_Login>((event, emit) async {
      emit(state.copyWith(status: AuthStatus.loading));
      try {
        final Either result = await _signinUseCase.call(params: event.params);
        result.fold(
          (error) {
            emit(state.copyWith(
              status: AuthStatus.error,
              errorMessage: error,
            ));
          },
          (data) {
            emit(state.copyWith(
              status: AuthStatus.success,
              message: 'Successfully logged in',
            ));
          },
        );
      } catch (e) {
        emit(state.copyWith(
          status: AuthStatus.error,
          errorMessage: e.toString(),
        ));
      }
    });

    on<_Logout>((event, emit) async {
      emit(state.copyWith(status: AuthStatus.loading));
      try {
        await _logoutUseCase.call();
        goRouter.refresh();
        emit(state.copyWith(
          status: AuthStatus.success,
          message: 'Successfully logged out',
        ));
      } catch (e) {
        emit(state.copyWith(
          status: AuthStatus.error,
          errorMessage: e.toString(),
        ));
      }
    });

    on<_PassObscure>((event, emit) {
      emit(state.copyWith(passwordVisible: !state.passwordVisible));
    });
  }
}
