import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final bool isNumeric;
  final TextEditingController controller;
  final dynamic validator;
  final Widget? suffixIcon;
  final Widget? prefixIcon;

  final String labelText;
  final bool obscureText;

  const CustomTextField(
      {super.key,
      required this.controller,
      required this.validator,
      this.isNumeric = false,
      required this.labelText,
      this.obscureText = false,
      this.suffixIcon,
      this.prefixIcon});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: controller,
          keyboardType: isNumeric ? TextInputType.number : TextInputType.text,
          decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              prefixIcon: prefixIcon,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              labelText: labelText,
              suffixIcon: suffixIcon),
          validator: validator,
          obscureText: obscureText,
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}
