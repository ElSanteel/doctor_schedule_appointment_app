import 'package:flutter/cupertino.dart';

class AppointmentModel {
  final String doctorName;
  final String time;
  final IconData? trailingIcon;
  final Color? trailingIconColor;

  AppointmentModel({
    required this.doctorName,
    required this.time,
    this.trailingIcon,
    this.trailingIconColor,
  });
}
