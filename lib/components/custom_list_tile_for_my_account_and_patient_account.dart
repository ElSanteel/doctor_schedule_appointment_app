import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomListTileMyAccountAndPatientAccount extends StatelessWidget {
  IconData icon;
  String title;
  Color titleColor;
  CustomListTileMyAccountAndPatientAccount(
      {required this.icon,
      required this.title,
      required this.titleColor,
      super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        size: 40,
        color: const Color(0xff8f8f8f),
      ),
      title: CustomText(
        textContent: title,
        fontSize: 20,
        fontColor: titleColor,
        isBold: true,
      ),
    );
  }
}
