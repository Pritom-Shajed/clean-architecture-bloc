import 'package:flutter/material.dart';

class BasicTextField extends StatelessWidget {
  const BasicTextField(
      {super.key, this.controller, this.isObscureText = false, this.hintText, this.suffixIcon, this.validator});

  final TextEditingController? controller;
  final bool isObscureText;
  final String? hintText;
  final Widget? suffixIcon;
  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isObscureText,
      validator: validator,
      decoration: InputDecoration(hintText: hintText, suffixIcon: suffixIcon),
    );
  }
}
