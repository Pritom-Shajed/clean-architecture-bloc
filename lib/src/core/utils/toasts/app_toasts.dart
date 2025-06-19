import 'package:auth/src/core/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppToasts {
  AppToasts._();

  static void longToast(String message, {ToastGravity? gravity, Color? color}) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: gravity ?? ToastGravity.BOTTOM,
      backgroundColor: color ?? AppColors.toastBg,
      textColor: AppColors.white,
      fontSize: 12,
    );
  }

  static void shortToast(String message, {ToastGravity? gravity, Color? color}) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: gravity ?? ToastGravity.BOTTOM,
      backgroundColor: color ?? AppColors.toastBg,
      textColor: AppColors.white,
      fontSize: 12,
    );
  }
}
