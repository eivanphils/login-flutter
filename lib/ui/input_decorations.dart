import 'package:flutter/material.dart';
import 'package:login_flutter/theme/app_theme.dart';

class InputDecorations {
  static InputDecoration authInputDecoration({
    required String hintText,
    required String label,
    IconData? prefixIcon
  }) {
    return InputDecoration(
        hintText: hintText,
        label: Text(label),
        prefixIcon: prefixIcon != null
          ? Icon(prefixIcon, color: AppTheme.primaryColor,)
          : null);
  }
}
