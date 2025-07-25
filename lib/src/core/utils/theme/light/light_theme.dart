import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_transitions/go_transitions.dart';
import 'package:template/src/core/utils/colors/app_colors.dart';

const lightUiConfig = SystemUiOverlayStyle(
  statusBarColor: Colors.transparent,
  statusBarBrightness: Brightness.light,
  statusBarIconBrightness: Brightness.dark,
  systemNavigationBarColor: Colors.white,
  systemNavigationBarIconBrightness: Brightness.dark,
);

const lightPrimaryColor = AppColors.primaryColor;
const _headLineTextColor = AppColors.secondaryColor;
const _iconColorSecondary = AppColors.secondaryColor;
const _backgroundColor = Color(0xFFe2eeff);
const _bodyTextColor = Colors.black;
const _borderColor = Color(0xFFE5E5E5);
const _unselectedColor = Color.fromARGB(255, 55, 56, 58);
const _titleTextColor = Colors.black;
const _primaryLightColor = AppColors.primaryColor;
final _cardBackgroundColor = Colors.white;
const _scaffoldBackgroundColor = Color(0xFFF3F5FB);
const _bottomSheetBackgroundColor = Colors.white;
const _appBarBackgroundColor = Colors.white;
const _floatingActionButtonColor = AppColors.primaryColor;
final _shadowColor = AppColors.shadowColor;

const _pageTransitionTheme = PageTransitionsTheme(
  builders: {
    TargetPlatform.android: GoTransitions.fade,
    TargetPlatform.iOS: GoTransitions.fade,
    TargetPlatform.macOS: GoTransitions.fade,
  },
);

final lightTheme = ThemeData(
  useMaterial3: true,
  cardTheme: _cardTheme,
  textTheme: _textTheme,
  // fontFamily: fontFamily,
  radioTheme: _radioTheme,
  shadowColor: _shadowColor,
  appBarTheme: _appBarTheme,
  tabBarTheme: _tabBarTheme,
  dialogTheme: _dialogTheme,
  switchTheme: _switchTheme,
  tooltipTheme: _tooltipTheme,
  brightness: Brightness.light,
  listTileTheme: _listTileTheme,
  snackBarTheme: _snackBarTheme,
  primaryColor: lightPrimaryColor,
  cardColor: _cardBackgroundColor,
  dividerTheme: _dividerTheme,
  unselectedWidgetColor: _unselectedColor,
  bottomNavigationBarTheme: _bottomNavBar,
  textSelectionTheme: _textSelectionTheme,
  secondaryHeaderColor: _primaryLightColor,
  outlinedButtonTheme: _outlinedButtonTheme,
  elevatedButtonTheme: _elevatedButtonTheme,
  progressIndicatorTheme: _progressIndicatorTheme,
  inputDecorationTheme: _lightInputDecorationTheme,
  scaffoldBackgroundColor: _scaffoldBackgroundColor,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  floatingActionButtonTheme: _floatingActionButtonTheme,
  iconTheme: const IconThemeData(color: _iconColorSecondary),
  chipTheme: _chipTheme,
  primaryIconTheme: const IconThemeData(color: lightPrimaryColor),
  pageTransitionsTheme: _pageTransitionTheme,
  bottomSheetTheme: _bottomSheetTheme,
);

final _bottomSheetTheme = BottomSheetThemeData(
  backgroundColor: _bottomSheetBackgroundColor,
  modalBackgroundColor: _bottomSheetBackgroundColor,
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
);

final _chipTheme = ChipThemeData(
  backgroundColor: Colors.white,
  labelStyle: _textTheme.bodyMedium!.copyWith(color: AppColors.primaryColor, fontWeight: FontWeight.w600),
  padding: const EdgeInsets.symmetric(horizontal: 5),
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
  side: BorderSide.none,
  labelPadding: const EdgeInsets.symmetric(horizontal: 5),
  elevation: 5.0,
  shadowColor: AppColors.primaryColor.withValues(alpha: 0.5),
);

final _dividerTheme = DividerThemeData(color: _unselectedColor.withValues(alpha: 0.4), thickness: 0.4);

final _switchTheme = SwitchThemeData(
  thumbColor: WidgetStateProperty.all(lightPrimaryColor),
  trackColor: WidgetStateProperty.all(lightPrimaryColor.withValues(alpha: 0.5)),
);

final _lightInputDecorationTheme = InputDecorationTheme(
  contentPadding: const EdgeInsets.all(16),
  hintStyle: _textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w400),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    gapPadding: 10,
    borderSide: const BorderSide(color: _borderColor, width: 1.0),
    // borderSide: BorderSide.none,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    gapPadding: 10,
    borderSide: const BorderSide(color: _borderColor, width: 1.0),
    // borderSide: BorderSide.none,
  ),
  disabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    gapPadding: 10,
    borderSide: const BorderSide(color: _borderColor, width: 1.0),
    // borderSide: BorderSide.none,
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    gapPadding: 10,
    borderSide: const BorderSide(color: Colors.black, width: 1),
    // borderSide: BorderSide.none,
  ),
  floatingLabelStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: lightPrimaryColor),
  errorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    gapPadding: 10,
    borderSide: const BorderSide(color: Colors.red, width: 1),
    // borderSide: BorderSide.none,
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    gapPadding: 10,
    borderSide: const BorderSide(color: Colors.red, width: 1),
    // borderSide: BorderSide.none,
  ),
  // filled: true,
  fillColor: _backgroundColor.withValues(alpha: 0.5),
  suffixIconColor: _iconColorSecondary,
  prefixIconColor: _iconColorSecondary,
  errorMaxLines: 3,
  floatingLabelBehavior: FloatingLabelBehavior.never,
);

const _textSelectionTheme = TextSelectionThemeData(
  cursorColor: lightPrimaryColor,
  selectionColor: lightPrimaryColor,
  selectionHandleColor: lightPrimaryColor,
);

final _snackBarTheme = SnackBarThemeData(
  actionTextColor: _textTheme.labelSmall!.color,
  contentTextStyle: _textTheme.labelSmall,
  backgroundColor: Colors.transparent,
  behavior: SnackBarBehavior.floating,
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
  elevation: 0.0,
);

final _tabBarTheme = TabBarThemeData(
  labelColor: lightPrimaryColor,
  unselectedLabelColor: _unselectedColor,
  indicatorSize: TabBarIndicatorSize.label,
  indicator: BoxDecoration(borderRadius: BorderRadius.circular(30)),
  indicatorColor: _floatingActionButtonColor,
);

final _cardTheme = CardThemeData(
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  shadowColor: _shadowColor,
  color: _cardBackgroundColor,
  elevation: 0,
);

final _radioTheme = RadioThemeData(
  fillColor: WidgetStateProperty.all(lightPrimaryColor),
  overlayColor: WidgetStateProperty.all(_primaryLightColor),
);

final _listTileTheme = ListTileThemeData(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)));

final _dialogTheme = DialogThemeData(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)));

final _tooltipTheme = TooltipThemeData(
  padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(15),
    color: _floatingActionButtonColor.withValues(alpha: 0.8),
  ),
  textStyle: _textTheme.titleSmall!.copyWith(color: Colors.white),
);
final _appBarTheme = AppBarTheme(
  iconTheme: const IconThemeData(color: _iconColorSecondary),
  color: _appBarBackgroundColor,
  elevation: 0.0,
  titleTextStyle: _textTheme.titleLarge,
);

const _floatingActionButtonTheme = FloatingActionButtonThemeData(
  backgroundColor: _floatingActionButtonColor,
  foregroundColor: Colors.white,
  elevation: 0,
);

const _progressIndicatorTheme = ProgressIndicatorThemeData(
  refreshBackgroundColor: _primaryLightColor,
  circularTrackColor: _primaryLightColor,
  linearTrackColor: _primaryLightColor,
  color: lightPrimaryColor,
);

final _elevatedButtonTheme = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    backgroundColor: lightPrimaryColor,
    textStyle: _textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w700),
    foregroundColor: Colors.white,
    padding: const EdgeInsets.all(18),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  ),
);

final _outlinedButtonTheme = OutlinedButtonThemeData(
  style: OutlinedButton.styleFrom(
    side: BorderSide.none,
    foregroundColor: lightPrimaryColor,
    textStyle: _textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w700),
    backgroundColor: _backgroundColor,
    padding: const EdgeInsets.all(18),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(45)),
  ),
);

const _textTheme = TextTheme(
  titleSmall: TextStyle(fontWeight: FontWeight.w700, color: _titleTextColor),
  titleMedium: TextStyle(fontWeight: FontWeight.w700, color: _titleTextColor),
  titleLarge: TextStyle(fontWeight: FontWeight.w700, fontSize: 20.0, color: _titleTextColor),
  labelSmall: TextStyle(color: _bodyTextColor, fontWeight: FontWeight.w700, letterSpacing: 0.7),
  labelMedium: TextStyle(color: _bodyTextColor, fontWeight: FontWeight.w700),
  labelLarge: TextStyle(color: _bodyTextColor, fontWeight: FontWeight.w700),
  bodySmall: TextStyle(color: _bodyTextColor),
  bodyMedium: TextStyle(color: _bodyTextColor),
  bodyLarge: TextStyle(color: _bodyTextColor, fontSize: 16, fontWeight: FontWeight.w700),
  headlineLarge: TextStyle(fontWeight: FontWeight.w900, color: _headLineTextColor),
  headlineMedium: TextStyle(fontWeight: FontWeight.w900, color: _headLineTextColor),
  headlineSmall: TextStyle(fontWeight: FontWeight.w900, color: _headLineTextColor),
);

const _bottomNavBar = BottomNavigationBarThemeData(
  unselectedItemColor: _unselectedColor,
  type: BottomNavigationBarType.fixed,
  selectedItemColor: lightPrimaryColor,
  showUnselectedLabels: true,
  elevation: 30,
  selectedLabelStyle: TextStyle(fontWeight: FontWeight.w700, color: lightPrimaryColor, fontSize: 10),
  unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w600, color: _unselectedColor, fontSize: 10),
);

const lightGradiants = [
  [Color(0xAA6A81A4), Color(0xFF6A81A4)],
  [Color(0xAAF0756B), Color(0xFFF0756B)],
  [Color(0xAAF4B183), Color(0xFFF4B183)],
  [Color(0xAA1B3A68), Color(0xFF1B3A68)],
  [Color(0xAAAACFB8), Color(0xFFAACFB8)],
];
