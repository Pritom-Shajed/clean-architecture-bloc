import 'package:auth/core/constants/api_urls.dart';
import 'package:auth/core/network/dio_client.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../models/auth/signin_req_params.dart';

abstract class AuthApiService {
  Future<Either> signin(SigninReqParams signinReq);
}

class AuthApiServiceImpl extends AuthApiService {
  final DioClient _dioClient;

  AuthApiServiceImpl(this._dioClient);

  @override
  Future<Either> signin(SigninReqParams signinReq) async {
    try {
      var response =
          await _dioClient.post(ApiUrls.login, data: signinReq.toMap());

      return Right(response);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }
}
