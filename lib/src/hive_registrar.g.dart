// Generated by Hive CE
// Do not modify
// Check in to version control

import 'package:hive_ce/hive.dart';
import 'package:auth/src/core/network/model/auth_store.dart';
import 'package:auth/src/features/settings/data/models/locale/locale_model.dart';
import 'package:auth/src/features/settings/data/models/settings_model.dart';
import 'package:auth/src/features/settings/data/models/theme/theme_model.dart';

extension HiveRegistrar on HiveInterface {
  void registerAdapters() {
    registerAdapter(AppSettingsAdapter());
    registerAdapter(AuthStoreAdapter());
    registerAdapter(LocaleProfileAdapter());
    registerAdapter(ThemeProfileAdapter());
  }
}
