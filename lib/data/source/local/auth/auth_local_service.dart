import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthLocalService {
  Future<bool> isLoggedIn();
  Future<Either> logout();
}

class AuthLocalServiceImpl extends AuthLocalService {
  final SharedPreferences _sharedPreferences;

  AuthLocalServiceImpl(this._sharedPreferences);

  @override
  Future<bool> isLoggedIn() async {
    var token = _sharedPreferences.getString('token');
    return token == null ? false : true;
  }

  @override
  Future<Either> logout() async {
    _sharedPreferences.clear();
    return const Right(true);
  }
}
