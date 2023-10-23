part of 'register_cubit.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class UserRegisterLoadingState extends RegisterState {}

class UserRegisterSuccessState extends RegisterState {}

class UserRegisterErrorState extends RegisterState {
  String registerErrorMessage;

  UserRegisterErrorState(this.registerErrorMessage);
}

class GenderState extends RegisterState {}

class RegisterPasswordVisibilityChangedState extends RegisterState {
  final bool isVisible;

  RegisterPasswordVisibilityChangedState(this.isVisible);
}
