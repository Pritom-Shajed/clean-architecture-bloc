import 'package:flutter/material.dart';

class BasicTextField extends StatelessWidget {
  const BasicTextField(
      {super.key,
      this.controller,
      this.isObscureText = false,
      this.hintText,
      this.validator,
      this.suffixIcon,
      this.autovalidateMode});

  final TextEditingController? controller;
  final bool isObscureText;
  final String? hintText;
  final Widget? suffixIcon;
  final FormFieldValidator<String>? validator;
  final AutovalidateMode? autovalidateMode;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isObscureText,
      validator: validator,
      autovalidateMode: autovalidateMode,
      decoration: InputDecoration(hintText: hintText, suffixIcon: suffixIcon),
    );
  }
}
