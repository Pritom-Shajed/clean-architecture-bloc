import 'package:auth/src/core/base/network/model/api_response.dart';
import 'package:auth/src/core/configs/type_defs.dart';
import 'package:auth/src/features/auth/data/models/request/signin_params.dart';
import 'package:auth/src/features/auth/data/models/request/signup_params.dart';

abstract class AuthRepo {
  ResultFuture<JSON> signin({required SigninParams params});
  ResultFuture<ApiResponse> signup({required SignupParams params});
  ResultFuture<String> signout();
}
