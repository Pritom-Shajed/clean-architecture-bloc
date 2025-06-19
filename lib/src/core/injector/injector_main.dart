part of 'injector.dart';

final sl = GetIt.instance;

Future<void> initialize() async {
  // App Initializations
  sl.registerSingleton<PT>(PlatformInfo.getCurrentPlatformType());
  sl.registerSingleton<AppDir>(AppDir());
  sl.registerSingleton<AppSettings>(AppSettings());

  // API Client
  sl.registerSingleton<ApiClient>(ApiClient());

  // Modules
  _authInit();
  _settingsInit();
  _homeInit();
}

void _authInit() {
  // Service
  sl.registerSingleton<AuthRemoteService>(AuthRemoteServiceImpl(sl()));

  // Repositorie
  sl.registerSingleton<AuthRepo>(AuthRepoImpl(sl()));

  // Usecases
  sl.registerSingleton<SignoutUseCase>(SignoutUseCase(sl()));

  sl.registerSingleton<SigninUseCase>(SigninUseCase(sl()));

  // Bloc
  sl.registerFactory<AuthBloc>(() => AuthBloc(sl(), sl()));
}

void _settingsInit() {
  // Blocs
  sl.registerFactory<LocaleBloc>(() => LocaleBloc(sl()));
  sl.registerFactory<PerformanceOverlayBloc>(() => PerformanceOverlayBloc(sl()));
  sl.registerFactory<ThemeBloc>(() => ThemeBloc(sl()));
  sl.registerFactory<UrlConfigBloc>(() => UrlConfigBloc(sl()));
  sl.registerFactory<SettingsBloc>(() => SettingsBloc(sl()));
}

void _homeInit() {
  // Bloc
  sl.registerFactory<HomeBloc>(() => HomeBloc());
}
