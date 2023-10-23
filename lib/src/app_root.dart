import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:session_20/blocs/profile_cubit/profile_cubit.dart';
import 'package:session_20/blocs/register_cubit/register_cubit.dart';
import 'package:session_20/views/Account%20Screen/view/my_account_screen.dart';
import 'package:session_20/views/Splash%20Screen/view/splash_screen.dart';

import '../blocs/authentication_cubit/authentication_cubit.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => AuthenticationCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => RegisterCubit(),
        )
        // BlocProvider(
        //     create: (BuildContext context) =>
        //         ProfileCubit()..getUserProfileData())
      ],
      child: const MaterialApp(
          debugShowCheckedModeBanner: false, home: SplashScreen()
          // home: MyAccountScreen(),
          ),
    );
  }
}
