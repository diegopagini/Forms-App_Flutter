import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? label;
  final String? hint;
  final String? errorMessage;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final bool obscureText;

  const CustomTextFormField(
      {super.key,
      this.label,
      this.hint,
      this.errorMessage,
      this.onChanged,
      this.validator,
      this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final border = OutlineInputBorder(borderRadius: BorderRadius.circular(40));

    return TextFormField(
      onChanged: onChanged,
      validator: validator,
      obscureText: obscureText,
      decoration: InputDecoration(
        enabledBorder: border,
        errorBorder:
            border.copyWith(borderSide: BorderSide(color: Colors.red.shade800)),
        errorText: errorMessage,
        focusedErrorBorder:
            border.copyWith(borderSide: BorderSide(color: Colors.red.shade800)),
        focusColor: colors.primary,
        focusedBorder:
            border.copyWith(borderSide: BorderSide(color: colors.primary)),
        hintText: hint,
        isDense: true,
        label: label != null ? Text(label!) : null,
      ),
    );
  }
}
