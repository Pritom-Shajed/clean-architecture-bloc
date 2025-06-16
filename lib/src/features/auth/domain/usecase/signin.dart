import 'package:auth/src/core/base/usecase/usecase.dart';
import 'package:auth/src/core/configs/type_defs.dart';
import 'package:auth/src/features/auth/data/models/signin.dart';
import 'package:auth/src/features/auth/domain/repository/auth.dart';

class SigninUseCase extends UseCaseWithParams<JSON, SigninParams> {
  final AuthRepository _authRepository;

  SigninUseCase(this._authRepository);

  @override
  ResultFuture<JSON> call(SigninParams params) async {
    return _authRepository.signin(params: params);
  }
}
