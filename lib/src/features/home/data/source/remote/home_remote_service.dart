import 'package:auth/src/core/network/api_client.dart';

abstract class HomeRmoteService {}

class HomeRmoteServiceImpl extends HomeRmoteService {
  final ApiClient _apiClient;
  HomeRmoteServiceImpl(this._apiClient);
}
