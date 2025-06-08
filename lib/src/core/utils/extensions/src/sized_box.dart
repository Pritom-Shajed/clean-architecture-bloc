part of '../extensions.dart';

extension SizedBoxDoubleExt on double {
  /// Creates a [SizedBox] with the given width and height.
  SizedBox get sizedBox => SizedBox(width: this, height: this);
}

extension SizedBoxIntExt on int {
  /// Creates a [SizedBox] with the given width and height.
  SizedBox get sizedBox => SizedBox(width: roundToDouble(), height: roundToDouble());
}
