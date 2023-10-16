part of 'doctor_appointment_app_cubit.dart';

@immutable
abstract class DoctorAppointmentAppState {}

class DoctorAppointmentAppInitial extends DoctorAppointmentAppState {}

class NameState extends DoctorAppointmentAppState {}

class EmailState extends DoctorAppointmentAppState {}

class PhoneState extends DoctorAppointmentAppState {}

class InvalidPhoneState extends DoctorAppointmentAppState {}

class GenderState extends DoctorAppointmentAppState {}

class PasswordState extends DoctorAppointmentAppState {}

class EmptyPasswordFieldState extends DoctorAppointmentAppState {}

class DisplayErrorState extends DoctorAppointmentAppState {}

class ClearErrorState extends DoctorAppointmentAppState {}

class AuthenticationState {
  final Map<String, String> errors;

  AuthenticationState(this.errors);

  AuthenticationState copyWith({
    Map<String, String>? errors,
  }) {
    return AuthenticationState(
      errors ?? this.errors,
    );
  }
}

class AccountAuthenticated extends DoctorAppointmentAppState {
  final String username;

  AccountAuthenticated(this.username);
}

class DoctorAppointmentAppUnauthenticated extends DoctorAppointmentAppState {}

class DoctorAppointmentAppLoading extends DoctorAppointmentAppState {}
