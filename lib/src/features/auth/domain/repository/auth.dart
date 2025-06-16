import 'package:auth/src/core/configs/type_defs.dart';
import 'package:auth/src/core/base/network/model/api_response.dart';
import 'package:auth/src/features/auth/data/models/forgetpass.dart';
import 'package:auth/src/features/auth/data/models/signin.dart';
import 'package:auth/src/features/auth/data/models/signup.dart';

abstract class AuthRepository {
  ResultFuture<JSON> signin({required SigninParams params});
  ResultFuture<ApiResponse> signup({required SignupParams params});
  ResultFuture<String> forgetPassword({required ForgetPasswordParams params});
  ResultFuture<String> signout();
}
