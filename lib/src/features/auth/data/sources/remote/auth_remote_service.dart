import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:template/src/core/base/network/api_client.dart';
import 'package:template/src/core/base/network/endpoints/api_endpoints.dart';
import 'package:template/src/core/base/network/enum/method.dart';
import 'package:template/src/core/base/network/failure/failure.dart';
import 'package:template/src/core/base/network/model/api_response.dart';
import 'package:template/src/core/base/network/model/auth_store.dart';
import 'package:template/src/core/configs/type_defs.dart';
import 'package:template/src/core/injector/injector.dart';
import 'package:template/src/core/utils/logger/logger_helper.dart';
import 'package:template/src/features/auth/data/models/request/signin_params.dart';
import 'package:template/src/features/auth/data/models/request/signup_params.dart';

abstract class AuthRemoteService {
  ResultFuture<JSON> signin({required SigninParams params});
  ResultFuture<ApiResponse> signup({required SignupParams params});
  ResultFuture<String> signout();
}

class AuthRemoteServiceImpl implements AuthRemoteService {
  final ApiClient _apiClient;

  AuthRemoteServiceImpl(this._apiClient);

  @override
  ResultFuture<JSON> signin({required SigninParams params}) async {
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
  ResultFuture<ApiResponse> signup({required SignupParams params}) async {
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
  ResultFuture<String> signout() async {
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
