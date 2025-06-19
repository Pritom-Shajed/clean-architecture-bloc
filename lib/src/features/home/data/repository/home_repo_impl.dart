import 'package:template/src/features/home/data/sources/local/home_local_service.dart';
import 'package:template/src/features/home/data/sources/remote/home_remote_service.dart';
import 'package:template/src/features/home/domain/repository/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeRemoteService _remoteService;
  final HomeLocalService _localService;

  HomeRepoImpl(this._remoteService, this._localService);
}
