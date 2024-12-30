import 'package:auth/data/models/auth/signin_req_params.dart';
import 'package:auth/domain/usecases/auth/is_logged_in.dart';
import 'package:auth/domain/usecases/auth/logout.dart';
import 'package:auth/domain/usecases/auth/signin.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SigninUseCase _signinUseCase;
  final IsLoggedInUseCase _isLoggedInUseCase;
  final LogoutUseCase _logoutUseCase;
  bool passwordVisible = false;
  AuthBloc(this._signinUseCase, this._logoutUseCase, this._isLoggedInUseCase)
      : super(Initial()) {
    on<Login>((event, emit) async {
      emit(Loading());
      try {
        Either result = await _signinUseCase.call(param: event.params);
        result.fold(
          (error) {
            emit(Error(errorMessage: error));
            emit(Initial());
          },
          (data) {
            emit(Success(message: 'Successfully logged in'));
          },
        );
      } catch (e) {
        emit(Error(errorMessage: e.toString()));
      }
    });

    on<Logout>((event, emit) async {
      emit(Loading());
      try {
        await _logoutUseCase.call();
        emit(Success(message: 'Successfully logged out'));
      } catch (e) {
        emit(Error(errorMessage: e.toString()));
      }
    });

    on<IsLoggedIn>((event, emit) async {
      emit(Loading());
      try {
        final isLoggedIn = await _isLoggedInUseCase.call();
        emit(isLoggedIn
            ? Success(message: 'Logged in')
            : Error(errorMessage: 'Not logged in'));
      } catch (e) {
        emit(Error(errorMessage: e.toString()));
      }
    });

    on<PassObscure>((event, emit) async {
      passwordVisible = !passwordVisible;
      emit(PassVisibilityTrigger());
    });
  }
}
