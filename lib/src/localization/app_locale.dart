import 'package:flutter/material.dart' show BuildContext, Locale;
import 'package:flutter_localizations/flutter_localizations.dart'
    show GlobalCupertinoLocalizations, GlobalMaterialLocalizations, GlobalWidgetsLocalizations;
import 'package:template/src/localization/app_localizations.dart';

late AppLocalizations t;

const localizationsDelegates = [
  AppLocalizations.delegate,
  GlobalMaterialLocalizations.delegate,
  GlobalWidgetsLocalizations.delegate,
  GlobalCupertinoLocalizations.delegate,
];

String onGenerateTitle(BuildContext context) => AppLocalizations.of(context)!.appName;

const enLocale = Locale('en');
const bnLocale = Locale('bn');
