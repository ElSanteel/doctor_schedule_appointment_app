import 'package:flutter/material.dart';
import 'package:session_20/components/custom_circle_avatar.dart';
import 'package:session_20/components/custom_container.dart';
import 'package:session_20/components/custom_elevated_button.dart';
import 'package:session_20/components/custom_list_tile_for_my_account_and_patient_account.dart';
import 'package:session_20/components/custom_text.dart';

class PatientAccountScreen extends StatelessWidget {
  const PatientAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        CustomContainer(
          text: "Patient Account",
          icon: Icons.menu,
        ),
        Row(
          children: [
            CustomCircleAvatar(imagePath: "assets/images/hurt_person.png"),
            Column(
              children: [
                CustomText(
                    textContent: "Dumitru Simona", isBold: true, fontSize: 10),
                CustomElevatedButton(
                  elevatedButtonName: "Medial History",
                  elevatedButtonColor: Color(0xff3abdd7),
                )
              ],
            )
          ],
        ),
        const SizedBox(
          height: 50,
        ),
        CustomListTileMyAccountAndPatientAccount(
            icon: Icons.alarm, title: "08 00- 09 30", titleColor: Colors.grey),
        CustomListTileMyAccountAndPatientAccount(
            icon: Icons.phone_iphone,
            title: "07534677277",
            titleColor: Color(0xff3ac0e3)),
        CustomListTileMyAccountAndPatientAccount(
            icon: Icons.location_pin,
            title: "48 Traian Streat, Building 51,\nApartment 02, Brasov",
            titleColor: Colors.grey),
        CustomListTileMyAccountAndPatientAccount(
          icon: Icons.file_copy_outlined,
          title:
              "Medical tests are performed to\nverify the state of health...",
          titleColor: const Color(0xff3ac0e3),
        ),
        SizedBox(
          height: 100,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomElevatedButton(
                elevatedButtonName: "START\nPROCEDURES",
                elevatedButtonColor: Color(0xff3abdd7)),
            CustomElevatedButton(
                elevatedButtonName: "EDIT",
                elevatedButtonColor: Color(0xffcecece)),
          ],
        ),
        SizedBox(
          height: 25,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomElevatedButton(
                elevatedButtonName: "BACK",
                elevatedButtonColor: Color(0xff3abdd7)),
            CustomElevatedButton(
                elevatedButtonName: "PATIENT\nMISSING",
                elevatedButtonColor: Color(0xff3abdd7)),
          ],
        )
      ]),
    );
  }
}
