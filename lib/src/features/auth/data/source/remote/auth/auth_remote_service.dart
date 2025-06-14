import 'dart:convert';

import 'package:auth/src/core/network/api_client.dart';
import 'package:auth/src/core/network/endpoints/api_endpoints.dart';
import 'package:auth/src/core/network/enum/method.dart';
import 'package:auth/src/core/network/failure/failure.dart';
import 'package:auth/src/core/network/model/api_response.dart';
import 'package:auth/src/core/network/model/auth_store.dart';
import 'package:auth/src/core/utils/logger/logger_helper.dart';
import 'package:auth/src/features/auth/data/models/forgetpass.dart';
import 'package:auth/src/features/auth/data/models/signin.dart';
import 'package:auth/src/features/auth/data/models/signup.dart';
import 'package:auth/src/injector.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRemoteService {
  Future<Either<Failure, Map<String, dynamic>>> signin({required SigninParams params});
  Future<Either<Failure, ApiResponse>> signup({required SignupParams params});
  Future<Either<Failure, String>> forgetPassword({required ForgetPasswordParams params});
  Future<Either<Failure, String>> signout();
}

class AuthRemoteServiceImpl implements AuthRemoteService {
  final ApiClient _apiClient;

  AuthRemoteServiceImpl(this._apiClient);

  @override
  Future<Either<Failure, Map<String, dynamic>>> signin({required SigninParams params}) async {
    final response = await _apiClient.request(
      ApiClientMethod.post,
      ApiEndpoints.signin,
      data: params.toJson(),
      isAuthRequired: false,
    );

    return response.fold((error) {
      return Left(error);
    }, (response) async {
      /// DEFAULT API RESPONSE (CURRENT THE FREE API DOES NOT RETURN IN EXPECTED FORMAT)
      // final apiResponse = ApiResponse.fromRawJson(response);
      // if (!apiResponse.success) throw apiResponse.message;
      // _apiClient.authStore = AuthStore(
      //   accessToken: apiResponse.data['tokens']['access_token'],
      //   refreshToken: apiResponse.data['tokens']['refresh_token'],
      // );
      // await _apiClient.authStore?.saveData();
      // return Right(apiResponse);

      // SO USING MANUAL PARSING FOR NOW
      final Map<String, dynamic> apiResponse = json.decode(response);

      _apiClient.authStore = AuthStore(
        accessToken: apiResponse['access_token'],
        refreshToken: apiResponse['refresh_token'],
      );

      await _apiClient.authStore?.saveData();
      return Right(apiResponse);
    });
  }

  @override
  Future<Either<Failure, ApiResponse>> signup({required SignupParams params}) async {
    final response = await _apiClient.request(
      ApiClientMethod.post,
      ApiEndpoints.signup,
      data: {
        'name': params.name,
        'email': params.email,
        'password': params.password,
      },
      isAuthRequired: false,
    );

    return response.fold(
      (error) => Left(error),
      (response) async {
        final apiResponse = ApiResponse.fromRawJson(response);
        if (!apiResponse.success) throw apiResponse.message;
        sl<ApiClient>().authStore = AuthStore(
          accessToken: apiResponse.data['tokens']['access-token'],
          refreshToken: apiResponse.data['tokens']['refresh-token'],
        );
        await sl<ApiClient>().authStore?.saveData();
        return Right(apiResponse);
      },
    );
  }

  @override
  Future<Either<Failure, String>> forgetPassword({required ForgetPasswordParams params}) async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      log.i('Password reset email sent');
      return const Right('Password reset email sent');
    } catch (e) {
      return Left(Failure.local('Unexpected error: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, String>> signout() async {
    try {
      await _apiClient.authStore?.deleteData();
      _apiClient.authStore = null;
      log.i('Signout successful');
      return const Right('Signout successful');
    } catch (e) {
      log.e('Signout error: $e');
      return Left(Failure.local('Signout failed: ${e.toString()}'));
    }
  }
}
