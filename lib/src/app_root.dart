import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/doctor_appointment_app_cubit.dart';
import '../views/Authentication Screen/view/authentication_screen.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (BuildContext context) => DoctorAppointmentAppCubit())
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AuthenticationScreen(),
      ),
    );
  }
}
