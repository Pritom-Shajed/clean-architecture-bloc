import 'package:auth/core/usecase/usecase.dart';
import 'package:auth/data/models/auth/signin_req_params.dart';
import 'package:auth/domain/repository/auth/auth.dart';
import 'package:dartz/dartz.dart';

class SigninUseCase implements UseCase<Either, SigninReqParams> {
  final AuthRepository _authRepository;

  SigninUseCase(this._authRepository);

  @override
  Future<Either> call({SigninReqParams? param}) async {
    return _authRepository.signin(param!);
  }
}
