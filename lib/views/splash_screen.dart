import 'dart:async';

import 'package:flutter/material.dart';
import 'package:session_20/views/Appointment%20Screen/view/appointments_screen.dart';
import 'package:session_20/views/Authentication%20Screen/view/authentication_screen.dart';

import '../core/utils/size_config.dart';
import '../services/Shared Preference/shared_preference_helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () => route());
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      body: SizedBox(
        width: SizeConfig.screenWidth,
        height: SizeConfig.screenHeight,
        child: Image.asset(
          "assets/images/app_logo.png",
        ),
      ),
    );
  }

  dynamic route() {
    if (SharedPreferenceHelper.getData(key: "Email") == null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const AuthenticationScreen()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const AppointmentsScreen()),
      );
    }
  }
}
