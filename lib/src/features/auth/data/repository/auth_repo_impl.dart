import 'package:auth/src/core/base/network/model/api_response.dart';
import 'package:auth/src/core/configs/type_defs.dart';
import 'package:auth/src/features/auth/data/models/request/signin_params.dart';
import 'package:auth/src/features/auth/data/models/request/signup_params.dart';
import 'package:auth/src/features/auth/data/sources/remote/auth_remote_service.dart';
import 'package:auth/src/features/auth/domain/repository/auth_repo.dart';
import 'package:dartz/dartz.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthRemoteService _authRemoteService;

  AuthRepoImpl(this._authRemoteService);

  @override
  ResultFuture<JSON> signin({required SigninParams params}) async {
    final response = await _authRemoteService.signin(params: params);
    return response.fold(
      (error) => Left(error),
      (success) => Right(success),
    );
  }

  @override
  ResultFuture<ApiResponse> signup({required SignupParams params}) async {
    final response = await _authRemoteService.signup(params: params);
    return response.fold(
      (error) => Left(error),
      (success) => Right(success),
    );
  }

  @override
  ResultFuture<String> signout() async {
    final response = await _authRemoteService.signout();
    return response.fold(
      (error) => Left(error),
      (success) => Right(success),
    );
  }
}
