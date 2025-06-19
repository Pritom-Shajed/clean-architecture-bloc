import 'package:template/src/core/base/usecase/usecase.dart';
import 'package:template/src/core/configs/type_defs.dart';
import 'package:template/src/features/auth/domain/repository/auth_repo.dart';

class SignoutUseCase extends UseCaseWithoutParams<String> {
  final AuthRepo _repo;

  SignoutUseCase(this._repo);

  @override
  ResultFuture<String> call() async => await _repo.signout();
}
