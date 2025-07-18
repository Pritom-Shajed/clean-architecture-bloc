import 'package:flutter/material.dart' show Size, TextDirection, TextPainter, TextSpan, TextStyle;
import 'package:template/src/core/injector/injector.dart';

import 'get_platform.dart';

double barSize = 60.0;
double topBarSize = 0.0;
double bottomBarSize = 80.0;
double bottomViewPadding = 0.0;
const double defaultPadding = 16.0;

double get topBodyPadding => sl<PT>().isDesktop ? topBarSize + barSize : topBarSize + 30.0;

double get bottomBodyPadding => sl<PT>().isDesktop || bottomViewPadding == 0
    ? bottomBarSize + bottomViewPadding + 37
    : bottomBarSize + bottomViewPadding + 7;

Size textSize(String text, TextStyle style, {int maxLines = 1}) {
  final TextPainter textPainter = TextPainter(
    text: TextSpan(text: text, style: style),
    textDirection: TextDirection.ltr,
    maxLines: maxLines,
  )..layout(minWidth: 0, maxWidth: double.infinity);
  return textPainter.size;
}
