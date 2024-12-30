import 'dart:async';
import 'package:auth/common/widgets/error/app_error_view.dart';
import 'package:auth/core/logger/logger.dart';
import 'package:auth/injector.dart' as dep;
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class Initializer {
  Initializer._();

  static void init(VoidCallback runApp) {
    ErrorWidget.builder = (errorDetails) {
      return AppErrorView(
        message: errorDetails.exceptionAsString(),
      );
    };

    runZonedGuarded(() async {
      WidgetsFlutterBinding.ensureInitialized();
      FlutterError.onError = (details) {
        FlutterError.dumpErrorToConsole(details);
        logger.e(details.stack.toString()); //Error log
      };

      await _initServices();

      runApp();
    }, (error, stack) {
      logger.e('runZonedGuarded: ${error.toString()}'); //Error log
    });
  }

  static Future<void> _initServices() async {
    try {
      _initScreenPreference();

      await _dependencyInjection();
    } catch (err) {
      rethrow;
    }
  }

  static Future<void> _dependencyInjection() async {
    await dep.initialize();
  }

  static void _initScreenPreference() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
}
