import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  String doctorName;
  String time;
  IconData? trailingIcon;
  Color? trailingIconColor;
  double? trailingIconSize;

  CustomListTile(
      {required this.doctorName,
      required this.time,
      this.trailingIcon,
      this.trailingIconColor,
      this.trailingIconSize,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(18),
      child: ListTile(
        title: Text(
          doctorName,
          style: const TextStyle(color: Colors.grey, fontSize: 20),
        ),
        subtitle: Row(
          children: [
            const Icon(
              Icons.alarm,
              color: Colors.grey,
              size: 27,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              time,
              style: const TextStyle(fontSize: 17),
            ),
          ],
        ),
        trailing: Icon(
          trailingIcon,
          color: trailingIconColor,
          size: 50,
        ),
      ),
    );
  }
}
