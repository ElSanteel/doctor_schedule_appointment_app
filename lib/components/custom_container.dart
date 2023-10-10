import 'package:flutter/material.dart';

import '../core/size_config.dart';

class CustomContainer extends StatelessWidget {
  String text;
  IconData icon;
  CustomContainer({required this.text, required this.icon, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth! * 1,
      decoration: const BoxDecoration(
        color: Color(0xff18a7d1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(13.0),
        child: Row(children: [
          Image.asset("assets/images/logo.png"),
          const SizedBox(
            width: 15,
          ),
          Text(
            text,
            style: const TextStyle(fontSize: 25, color: Colors.white),
          ),
          const Spacer(),
          IconButton(
            icon: Icon(
              icon,
              size: 50,
              color: Colors.white,
            ),
            onPressed: () {},
          )
        ]),
      ),
    );
  }
}
