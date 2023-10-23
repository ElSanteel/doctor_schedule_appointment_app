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

class LoginPasswordVisibilityChangedState extends AuthenticationState {
  final bool isVisible;

  LoginPasswordVisibilityChangedState(this.isVisible);
}
