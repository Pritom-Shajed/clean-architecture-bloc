import 'package:hive_ce/hive.dart';
import 'package:template/src/core/shared/asset_helper/assets.dart';

import '../../repositories/hive_box.dart';

part 'theme_model.ext.dart';
part 'theme_model.g.dart';

@HiveType(typeId: HiveTypes.themeProfile)
enum ThemeProfile {
  @HiveField(0)
  system,
  @HiveField(1)
  light,
  @HiveField(2)
  dark,
}
