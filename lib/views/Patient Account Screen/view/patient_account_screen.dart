import 'package:flutter/material.dart';

import '../../../core/components/custom_circle_avatar.dart';
import '../../../core/components/custom_container.dart';
import '../../../core/components/custom_elevated_button.dart';
import '../../../core/components/custom_list_tile_for_my_account_and_patient_account.dart';
import '../../../core/components/custom_text.dart';
import '../../../core/utils/size_config.dart';

class PatientAccountScreen extends StatelessWidget {
  const PatientAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      body: Column(children: [
        CustomContainer(
          text: "Patient Account",
          icon: Icons.menu,
        ),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomCircleAvatar(imagePath: "assets/images/hurt_person.png"),
            Column(
              children: [
                CustomText(
                    textContent: "Dumitru Simona", isBold: true, fontSize: 30),
                const SizedBox(height: 15),
                CustomElevatedButton(
                  elevatedButtonName: "Medial History",
                  elevatedButtonColor: const Color(0xff3abdd7),
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
            titleColor: const Color(0xff3ac0e3)),
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
        const SizedBox(
          height: 100,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomElevatedButton(
                elevatedButtonName: "START\nPROCEDURES",
                elevatedButtonColor: const Color(0xff3abdd7)),
            CustomElevatedButton(
                elevatedButtonName: "EDIT",
                elevatedButtonColor: const Color(0xffcecece)),
          ],
        ),
        const SizedBox(
          height: 25,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomElevatedButton(
                elevatedButtonName: "BACK",
                elevatedButtonColor: const Color(0xff3abdd7)),
            CustomElevatedButton(
                elevatedButtonName: "PATIENT\nMISSING",
                elevatedButtonColor: const Color(0xff3abdd7)),
          ],
        )
      ]),
    );
  }
}
