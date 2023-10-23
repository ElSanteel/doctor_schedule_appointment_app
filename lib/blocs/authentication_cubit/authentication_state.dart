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

class UserRegisterLoadingState extends AuthenticationState {}

class UserRegisterSuccessState extends AuthenticationState {}

class UserRegisterErrorState extends AuthenticationState {
  String registerErrorMessage;

  UserRegisterErrorState(this.registerErrorMessage);
}

class GenderState extends AuthenticationState {}

class PasswordVisibilityChanged extends AuthenticationState {
  final bool isVisible;

  PasswordVisibilityChanged(this.isVisible);
}
