import 'package:flutter/material.dart';
import 'package:session_20/screens/appointments.dart';
import 'package:session_20/screens/my_account.dart';
import 'package:session_20/screens/patient_account.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyAccountScreen(),
    );
  }
}
