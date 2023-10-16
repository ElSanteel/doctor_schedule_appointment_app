import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

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

  String name = '';
  String email = '';
  String phone = '';
  String gender = '';
  String password = '';
  String userType = '';
  String phoneError = '';
  String passwordError = '';
  Map<String, String> errors = {
    'phone': '',
    'password': '',
  };

  void changeNameValue(value) {
    name = value;
  }

  void changeEmailValue(value) {
    email = value;
  }

  bool isValidNumericPhone(String value) {
    return value.isNotEmpty && value.contains(RegExp(r'^[0-9]*$'));
  }

  void validatePhone(String value) {
    if (value.isEmpty) {
      phoneError = 'The phone field is required.';
    } else if (!isNumeric(value)) {
      phoneError = 'Phone must contain only numeric values.';
    } else if (isNegative(value)) {
      phoneError = 'Phone cannot be negative.';
    } else {
      phoneError = ''; // No error
    }
  }

  bool isNumeric(String value) {
    return value.contains(RegExp(r'^[0-9]+$'));
  }

  bool isNegative(String value) {
    return value.startsWith('-');
  }

  void changePhoneValue(value) {
    phone = value;
    emit(PhoneState());
  }

  void changeGenderValue(value) {
    gender = value;
    emit(GenderState());
  }

  void changePasswordValue(value) {
    password = value;
    emit(PasswordState());
  }

  void changeInvalidPasswordValue(value) {
    password = 'The password field is required.';
    emit(EmptyPasswordFieldState());
  }

  void displayError() {
    errors['phone'] = phoneError;
    errors['password'] = passwordError;
    emit(DisplayErrorState());
  }

  void clearError() {
    errors = {
      'phone': '',
      'password': '',
    };
    emit(ClearErrorState());
  }

  void login() {
    emit(AccountAuthenticated("Mohamed"));
  }

  void logout() {
    emit(DoctorAppointmentAppUnauthenticated());
  }
}
