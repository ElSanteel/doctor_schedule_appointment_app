import 'package:flutter/material.dart';

import '../core/size_config.dart';

class CustomElevatedButton extends StatelessWidget {
  String elevatedButtonName;
  Color elevatedButtonColor;
  CustomElevatedButton(
      {required this.elevatedButtonName,
      required this.elevatedButtonColor,
      super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig.screenWidth! * 0.4,
      height: SizeConfig.screenHeight! * 0.05,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            backgroundColor: elevatedButtonColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            textStyle:
                const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
        child: Text(elevatedButtonName,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 15,
            )),
      ),
    );
  }
}
