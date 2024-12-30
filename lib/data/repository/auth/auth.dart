import 'package:auth/data/models/auth/signin_req_params.dart';
import 'package:auth/data/models/user/user.dart';
import 'package:auth/data/source/remote/auth/auth_api_service.dart';
import 'package:auth/data/source/local/auth/auth_local_service.dart';
import 'package:auth/domain/repository/auth/auth.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthApiService _authApiService;
  final AuthLocalService _authLocalService;
  final SharedPreferences _sharedPreferences;

  AuthRepositoryImpl(
      this._authApiService, this._authLocalService, this._sharedPreferences);

  @override
  Future<bool> isLoggedIn() async {
    return await _authLocalService.isLoggedIn();
  }

  @override
  Future<Either> logout() async {
    return await _authLocalService.logout();
  }

  @override
  Future<Either> signin(SigninReqParams signinReq) async {
    Either result = await _authApiService.signin(signinReq);
    return result.fold((error) {
      return Left(error);
    }, (data) async {
      Response response = data;
      _sharedPreferences.setString('token', response.data['token']);
      return Right(response);
    });
  }
}
