import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:session_20/blocs/profile_cubit/profile_cubit.dart';
import '../../../core/components/custom_circle_avatar.dart';
import '../../../core/components/custom_container.dart';
import '../../../core/components/custom_elevated_button.dart';
import '../../../core/components/custom_list_tile_for_my_account_and_patient_account.dart';
import '../../../core/components/custom_text.dart';
import '../../../core/utils/size_config.dart';

class MyAccountScreen extends StatelessWidget {
  const MyAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      body: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = ProfileCubit.get(context);
          if (state is GetUserProfileLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is GetUserProfileSuccessState) {
            return Column(
              children: [
                CustomContainer(
                    text: "My Account", icon: const Icon(Icons.menu)),
                const SizedBox(height: 25),
                CustomCircleAvatar(imagePath: "assets/images/woman.png"),
                const SizedBox(height: 20),
                CustomText(
                  textContent: "${cubit.userProfileModel!.data?[0].name}",
                  isBold: true,
                  fontSize: 18,
                  fontColor: Colors.grey,
                ),
                CustomText(
                    textContent: "HCP Name",
                    fontSize: 18,
                    fontColor: Colors.grey,
                    isBold: false),
                const SizedBox(height: 25),
                CustomListTileMyAccountAndPatientAccount(
                  icon: Icons.phone_iphone,
                  title: "${cubit.userProfileModel!.data?[0].phone}",
                  titleColor: Colors.grey,
                ),
                CustomListTileMyAccountAndPatientAccount(
                    icon: Icons.alternate_email,
                    title: "${cubit.userProfileModel!.data?[0].email}",
                    titleColor: Colors.grey),
                CustomListTileMyAccountAndPatientAccount(
                    icon: Icons.work_outlined,
                    title: "49 Nerva Traian Streat, Bucharest",
                    titleColor: Colors.grey),
                const SizedBox(height: 100),
                CustomElevatedButton(
                    elevatedButtonName: "BACK",
                    elevatedButtonColor: const Color(0xff3abdd7))
              ],
            );
          } else if (state is GetUserProfileErrorState) {
            return Center(
              child: Text(state.profileErrorMessage),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
