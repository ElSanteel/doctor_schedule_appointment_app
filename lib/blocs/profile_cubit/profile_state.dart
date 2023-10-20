part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class GetUserProfileLoadingState extends ProfileState {}

class GetUserProfileSuccessState extends ProfileState {}

class GetUserProfileErrorState extends ProfileState {
  final String profileErrorMessage;

  GetUserProfileErrorState(this.profileErrorMessage);
}
