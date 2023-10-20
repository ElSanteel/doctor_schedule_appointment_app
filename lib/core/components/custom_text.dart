import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  String textContent;
  double? fontSize;
  Color? fontColor;
  bool isBold;

  CustomText({
    super.key,
    required this.textContent,
    this.fontSize,
    this.fontColor,
    this.isBold = false,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      textContent,
      style: TextStyle(
        fontSize: fontSize,
        color: fontColor,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }
}
