import '../../../../../core/base/network/api_client.dart';

abstract class HomeRemoteService {}

class HomeRemoteServiceImpl implements HomeRemoteService {
  final ApiClient _apiClient;

  HomeRemoteServiceImpl(this._apiClient);
}
