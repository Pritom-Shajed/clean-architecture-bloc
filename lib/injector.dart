import 'package:auth/core/network/dio_client.dart';
import 'package:auth/data/repository/auth/auth.dart';
import 'package:auth/data/source/remote/auth/auth_api_service.dart';
import 'package:auth/data/source/local/auth/auth_local_service.dart';
import 'package:auth/domain/repository/auth/auth.dart';
import 'package:auth/domain/usecases/auth/is_logged_in.dart';
import 'package:auth/domain/usecases/auth/logout.dart';
import 'package:auth/domain/usecases/auth/signin.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'presentation/auth/bloc/auth_bloc.dart';

final sl = GetIt.instance;

Future<void> initialize() async {
  // Local
  sl.registerSingleton<SharedPreferences>(
    await SharedPreferences.getInstance(),
  );

  // API Client
  sl.registerSingleton<DioClient>(DioClient());

  // Services
  sl.registerSingleton<AuthApiService>(AuthApiServiceImpl(sl()));

  sl.registerSingleton<AuthLocalService>(AuthLocalServiceImpl(sl()));

  // Repositories
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl(sl(), sl(), sl()));

  // Usecases

  sl.registerSingleton<IsLoggedInUseCase>(IsLoggedInUseCase(sl()));

  sl.registerSingleton<LogoutUseCase>(LogoutUseCase(sl()));

  sl.registerSingleton<SigninUseCase>(SigninUseCase(sl()));

  // Blocs
  sl.registerFactory<AuthBloc>(() => AuthBloc(sl(), sl(), sl()));
}
