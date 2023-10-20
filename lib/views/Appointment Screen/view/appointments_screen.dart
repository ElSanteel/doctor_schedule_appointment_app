import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:session_20/core/utils/size_config.dart';
import 'package:session_20/services/Shared%20Preference/shared_preference_helper.dart';
import 'package:session_20/views/Authentication%20Screen/view/authentication_screen.dart';

import '../../../blocs/authentication_cubit/authentication_cubit.dart';
import '../../../core/components/custom_container.dart';
import '../../../core/components/custom_text.dart';
import '../../../tokens.dart';
import '../components/custom_list_tile.dart';

class AppointmentsScreen extends StatelessWidget {
  const AppointmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      body: BlocConsumer<AuthenticationCubit, AuthenticationState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = AuthenticationCubit.get(context);

          return Column(children: [
            CustomContainer(
              icon: IconButton(
                onPressed: () {
                  SharedPreferenceHelper.removeData(key: userTokenKey);
                  SharedPreferenceHelper.removeData(key: userNameTokenKey);

                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const AuthenticationScreen()),
                      (route) => false);
                },
                icon: const Icon(Icons.logout),
              ),
              text: "Appointments",
            ),
            const SizedBox(height: 25),
            CustomText(
              textContent: "Wednesday, 22 May 2019",
              fontSize: 25,
              isBold: true,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: cubit.appointments.length,
                itemBuilder: (context, index) {
                  return CustomListTile(
                    doctorName: cubit.appointments[index].doctorName,
                    time: cubit.appointments[index].time,
                    trailingIcon: cubit.appointments[index].trailingIcon,
                    trailingIconColor:
                        cubit.appointments[index].trailingIconColor,
                  );
                },
              ),
            ),
          ]);
        },
      ),
    );
  }
}
