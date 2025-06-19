import 'package:flutter/material.dart';
import 'package:template/src/core/utils/colors/app_colors.dart';
import 'package:template/src/core/utils/extensions/extensions.dart';

class BasicAppButton extends StatelessWidget {
  final bool isLoading;
  final VoidCallback? onPressed;
  final String title;
  final double? height;
  final double? width;
  const BasicAppButton({this.onPressed, this.isLoading = false, this.title = '', this.height, this.width, super.key});

  @override
  Widget build(BuildContext context) {
    return isLoading ? _loading(context) : _initial(context);
  }

  Widget _loading(BuildContext context) {
    return ElevatedButton(
        onPressed: null,
        style: ElevatedButton.styleFrom(
          disabledBackgroundColor: AppColors.grey,
          minimumSize: Size(width ?? context.width, height ?? 60),
        ),
        child: const CircularProgressIndicator(
          color: AppColors.white,
        ));
  }

  Widget _initial(BuildContext context) {
    return Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), boxShadow: [
          BoxShadow(
            color: context.theme.primaryColor.withValues(alpha: 0.8),
            offset: const Offset(0, 5),
            blurRadius: 17,
          )
        ]),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            minimumSize: Size(width ?? context.width, height ?? 60),
          ),
          child: Text(title, style: context.text.bodyMedium?.copyWith(color: AppColors.white)),
        ));
  }
}
