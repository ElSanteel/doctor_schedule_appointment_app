import 'package:flutter/material.dart';
import 'package:session_20/components/custom_container.dart';
import 'package:session_20/components/custom_list_tile.dart';
import 'package:session_20/components/custom_text.dart';
import 'package:session_20/core/size_config.dart';

class AppointmentsScreen extends StatelessWidget {
  AppointmentsScreen({super.key});

  final List<Map<String, dynamic>> appointments = [
    {"doctorName": "lulian Ruja", "time": "10:50"},
    {"doctorName": "Victoria Olari", "time": "13:00"},
    {"doctorName": "Diana Stefan", "time": "15:20"},
    {"doctorName": "Gheorge Popa", "time": "16:10"},
    {
      "doctorName": "Alexandru Sandu",
      "time": "16:40",
      "trailingIcon": Icons.close,
      "trailingIconColor": Colors.red
    },
    {
      "doctorName": "Dumitru Simona",
      "time": "8:00",
      "trailingIcon": Icons.done_all,
      "trailingIconColor": Color(0xff18a7d1)
    },
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      body: Column(children: [
        CustomContainer(
          text: "Appointments",
          icon: Icons.menu,
        ),
        const SizedBox(height: 25),
        CustomText(
          textContent: "Wednesday, 22 May 2019",
          fontSize: 25,
          isBold: true,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: appointments.length,
            itemBuilder: (context, index) {
              return CustomListTile(
                doctorName: appointments[index]['doctorName'] ?? "",
                time: appointments[index]['time'] ?? "",
                trailingIcon: appointments[index]['trailingIcon'],
                trailingIconColor: appointments[index]['trailingIconColor'],
              );
            },
          ),
        ),
      ]),
    );
  }
}
