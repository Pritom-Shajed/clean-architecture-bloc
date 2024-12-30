import 'package:auth/data/models/auth/signin_req_params.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either> signin(SigninReqParams signinReq);
  Future<bool> isLoggedIn();
  Future<Either> logout();
}
