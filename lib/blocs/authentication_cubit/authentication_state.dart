part of 'authentication_cubit.dart';

@immutable
abstract class AuthenticationState {}

class AuthenticationInitial extends AuthenticationState {}

class UserLoginLoadingState extends AuthenticationState {}

class UserLoginSuccessState extends AuthenticationState {}

class UserLoginErrorState extends AuthenticationState {
  final String loginErrorMessage;

  UserLoginErrorState(this.loginErrorMessage);
}

class RegisterLoadingState extends AuthenticationState {}

class RegisterSuccessState extends AuthenticationState {}

class UserRegisterErrorState extends AuthenticationState {
  String registerErrorMessage;

  UserRegisterErrorState(this.registerErrorMessage);
}

class AuthenticationGenderChanged extends AuthenticationState {
  final Gender selectedGender;

  AuthenticationGenderChanged(this.selectedGender);

  List<Object> get props {
    return [selectedGender];
  }
}

class PasswordVisibilityChanged extends AuthenticationState {
  final bool isVisible;

  PasswordVisibilityChanged(this.isVisible);
}
