import 'package:auth/src/core/configs/constants.dart';
import 'package:auth/src/core/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';

class AnimatedNumText extends StatelessWidget {
  final double value;
  final bool isDecimal;
  final String? sideText;
  final TextStyle? style;
  final MainAxisAlignment? mainAxisAlignment;
  const AnimatedNumText(
      {super.key, required this.value, this.isDecimal = false, this.sideText, this.style, this.mainAxisAlignment});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      curve: Curves.easeOut,
      duration: kAnimationDuration(0.3),
      tween: Tween<double>(begin: 0, end: value.toDouble()),
      builder: (_, double x, __) {
        return Row(
          mainAxisAlignment: mainAxisAlignment ?? mainStart,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '${isDecimal ? x.toPrecise : x.round()}',
              style: style ?? context.text.labelSmall,
            ),
            if (sideText != null)
              Text(
                ' $sideText',
                style: style ?? context.text.labelSmall,
              ),
          ],
        );
      },
    );
  }
}
