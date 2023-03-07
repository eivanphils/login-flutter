import 'package:flutter/material.dart';

import 'package:login_flutter/theme/app_theme.dart';
import 'package:login_flutter/ui/input_decorations.dart';

class CustomInputField extends StatelessWidget {
  final IconData? prefixIcon;
  final TextInputType? keyboardType;
  final int? maxLength;
  final int? maxLine;
  final String? initialValue;
  final bool obscureText;
  final String labelText;
  final String hintText;
  final void Function(String?) onChange;
  final dynamic validator;

  const CustomInputField({
    Key? key,
    this.prefixIcon,
    this.keyboardType,
    this.maxLength,
    this.maxLine,
    this.initialValue,
    this.obscureText = false,
    required this.labelText,
    required this.hintText,
    required this.onChange,
    required this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      maxLines: maxLine,
      obscureText: obscureText,
      autocorrect: false,
      cursorColor: AppTheme.primaryColor,
      keyboardType: keyboardType ?? TextInputType.text,
      maxLength: maxLength,
      decoration: InputDecorations.authInputDecoration(
          hintText: hintText, label: labelText, prefixIcon: prefixIcon),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: onChange,
      validator: validator,
    );
  }
}
