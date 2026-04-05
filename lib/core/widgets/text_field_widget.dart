import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String hint;
  final IconData prefix;
  final bool obscureText;

  const TextFieldWidget({
    super.key,
    required this.hint,
    required this.prefix,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: Icon(prefix),
      ),
    );
  }
}