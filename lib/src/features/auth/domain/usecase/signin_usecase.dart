import 'package:template/src/core/base/usecase/usecase.dart';
import 'package:template/src/core/configs/type_defs.dart';
import 'package:template/src/features/auth/data/models/request/signin_params.dart';
import 'package:template/src/features/auth/domain/repository/auth_repo.dart';

class SigninUseCase extends UseCaseWithParams<JSON, SigninParams> {
  final AuthRepo _repo;

  SigninUseCase(this._repo);

  @override
  ResultFuture<JSON> call(SigninParams params) async => await _repo.signin(params: params);
}
