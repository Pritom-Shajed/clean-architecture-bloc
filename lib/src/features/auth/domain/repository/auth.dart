import 'package:auth/src/core/network/failure/failure.dart';
import 'package:auth/src/core/network/model/api_response.dart';
import 'package:auth/src/features/auth/data/models/forgetpass.dart';
import 'package:auth/src/features/auth/data/models/signin.dart';
import 'package:auth/src/features/auth/data/models/signup.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Failure, Map<String, dynamic>>> signin({required SigninParams params});
  Future<Either<Failure, ApiResponse>> signup({required SignupParams params});
  Future<Either<Failure, String>> forgetPassword({required ForgetPasswordParams params});
  Future<Either<Failure, String>> signout();
}
