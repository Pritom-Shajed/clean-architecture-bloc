import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:template/src/app.dart';
import 'package:template/src/core/initializer/initializer.dart';
import 'package:template/src/core/utils/colors/app_colors.dart';

const isProduction = false;
void main() {
  Initializer.init(() => runApp(const MyApp()));
}

void configEasyLoading(BuildContext context) {
  EasyLoading.instance
    ..loadingStyle = EasyLoadingStyle.custom
    ..backgroundColor = Colors.transparent
    ..boxShadow = const <BoxShadow>[]
    ..indicatorColor = AppColors.primaryColor
    ..progressColor = AppColors.primaryColor
    ..textColor = Colors.white
    ..textStyle = const TextStyle(
      fontSize: 16.0,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    )
    ..dismissOnTap = false
    ..userInteractions = false
    ..maskType = EasyLoadingMaskType.custom
    ..maskColor = Colors.black.withValues(alpha: 0.8)
    ..indicatorWidget = const SizedBox(
      height: 70.0,
      width: 70.0,
      child: SpinKitThreeBounce(color: AppColors.primaryColor, size: 30.0),
    )
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle;
}
