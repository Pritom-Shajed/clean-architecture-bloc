import 'package:auth/core/usecase/usecase.dart';
import 'package:auth/domain/repository/auth/auth.dart';

class IsLoggedInUseCase implements UseCase<bool, dynamic> {
  final AuthRepository _authRepository;

  IsLoggedInUseCase(this._authRepository);

  @override
  Future<bool> call({dynamic param}) async {
    return _authRepository.isLoggedIn();
  }
}
