import 'package:flutter/material.dart';

class PageWrapper extends StatelessWidget {
  final Widget child;
  const PageWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8), child: child),
    );
  }
}
