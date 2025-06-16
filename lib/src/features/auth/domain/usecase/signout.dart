import 'package:auth/src/core/base/usecase/usecase.dart';
import 'package:auth/src/core/configs/type_defs.dart';
import 'package:auth/src/features/auth/domain/repository/auth.dart';

class SignoutUseCase extends UseCaseWithoutParams<String> {
  final AuthRepository _authRepository;

  SignoutUseCase(this._authRepository);

  @override
  ResultFuture<String> call() async {
    return await _authRepository.signout();
  }
}
