import 'package:auth/src/core/base/network/api_client.dart';
import 'package:auth/src/core/base/network/connectivity_checker/bloc/connectivity_bloc.dart';
import 'package:auth/src/core/configs/get_platform.dart';
import 'package:auth/src/features/auth/data/repository/auth_repo_impl.dart';
import 'package:auth/src/features/auth/data/sources/remote/auth_remote_service.dart';
import 'package:auth/src/features/auth/domain/repository/auth_repo.dart';
import 'package:auth/src/features/auth/domain/usecase/signin_usecase.dart';
import 'package:auth/src/features/auth/domain/usecase/signout_usecase.dart';
import 'package:auth/src/features/home/presentation/bloc/home_bloc.dart';
import 'package:auth/src/features/settings/data/models/settings_model.dart';
import 'package:auth/src/features/settings/data/repositories/hive_repository_impl.dart';
import 'package:auth/src/features/settings/presentation/bloc/locale/locale_bloc.dart';
import 'package:auth/src/features/settings/presentation/bloc/performance_overlay/bloc/performance_overlay_bloc.dart';
import 'package:auth/src/features/settings/presentation/bloc/settings/bloc/settings_bloc.dart';
import 'package:auth/src/features/settings/presentation/bloc/theme/bloc/theme_bloc.dart';
import 'package:auth/src/features/settings/presentation/bloc/url_config/bloc/url_config_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/presentation/bloc/auth_bloc.dart';

part 'injector_main.dart';