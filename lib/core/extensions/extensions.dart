import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

extension GoRouteExtension on BuildContext {
  goPush<T>(String route) =>
      kIsWeb ? GoRouter.of(this).go(route) : GoRouter.of(this).push(route);
}
