import 'package:auth/core/usecase/usecase.dart';
import 'package:auth/domain/repository/auth/auth.dart';
import 'package:dartz/dartz.dart';

class LogoutUseCase implements UseCase<Either, dynamic> {
  final AuthRepository _authRepository;

  LogoutUseCase(this._authRepository);

  @override
  Future<Either> call({param}) async {
    return await _authRepository.logout();
  }
}
