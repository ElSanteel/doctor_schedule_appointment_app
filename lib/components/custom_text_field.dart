import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String error;
  final bool isNumeric;
  final ValueChanged<String> onChanged;

  const CustomTextField({
    super.key,
    required this.label,
    required this.error,
    required this.onChanged,
    this.isNumeric = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        TextField(
          onChanged: onChanged,
          keyboardType: isNumeric ? TextInputType.number : TextInputType.text,
        ),
        _buildErrorMessage(error),
      ],
    );
  }

  Widget _buildErrorMessage(String error) {
    if (error.isNotEmpty) {
      return Text(
        error,
        style: const TextStyle(color: Colors.red),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
