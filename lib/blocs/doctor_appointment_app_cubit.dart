import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/appointment_model.dart';

part 'doctor_appointment_app_state.dart';

class DoctorAppointmentAppCubit extends Cubit<DoctorAppointmentAppState> {
  DoctorAppointmentAppCubit() : super(DoctorAppointmentAppInitial());

  static DoctorAppointmentAppCubit get(context) => BlocProvider.of(context);

  final List<AppointmentModel> appointments = [
    AppointmentModel(doctorName: "lulian Ruja", time: "10:50"),
    AppointmentModel(doctorName: "Victoria Olari", time: "13:00"),
    AppointmentModel(doctorName: "Diana Stefan", time: "15:20"),
    AppointmentModel(doctorName: "Gheorge Popa", time: "16:10"),
    AppointmentModel(
      doctorName: "Alexandru Sandu",
      time: "16:40",
      trailingIcon: Icons.close,
      trailingIconColor: Colors.red,
    ),
    AppointmentModel(
      doctorName: "Dumitru Simona",
      time: "8:00",
      trailingIcon: Icons.done_all,
      trailingIconColor: const Color(0xff18a7d1),
    ),
  ];

  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
}
