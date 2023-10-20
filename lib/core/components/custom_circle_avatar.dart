import 'package:flutter/material.dart';

class CustomCircleAvatar extends StatelessWidget {
  String imagePath;
  CustomCircleAvatar({required this.imagePath, super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 55,
      backgroundColor: const Color(0xffefeae5),
      child: CircleAvatar(
        radius: 50,
        backgroundColor: const Color(0xfff7f8f8),
        child: Image.asset(
          imagePath,
        ),
      ),
    );
  }
}
