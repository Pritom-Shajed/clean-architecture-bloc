import 'package:auth/src/localization/app_localizations.dart';
import 'package:flutter/material.dart' show BuildContext, Locale;
import 'package:flutter_localizations/flutter_localizations.dart'
    show
        GlobalCupertinoLocalizations,
        GlobalMaterialLocalizations,
        GlobalWidgetsLocalizations;

late AppLocalizations t;

const localizationsDelegates = [
  AppLocalizations.delegate,
  GlobalMaterialLocalizations.delegate,
  GlobalWidgetsLocalizations.delegate,
  GlobalCupertinoLocalizations.delegate,
];

String onGenerateTitle(BuildContext context) =>
    AppLocalizations.of(context)!.appName;

const enLocale = Locale('en');
const bnLocale = Locale('bn');