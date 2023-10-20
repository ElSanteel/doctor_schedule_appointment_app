import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../models/user_profile_model.dart';
import '../../services/Shared Preference/shared_preference_helper.dart';
import '../../services/dio/api_end_points.dart';
import '../../services/dio/dio_helper.dart';
import '../../tokens.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());
  static ProfileCubit get(context) => BlocProvider.of(context);

  UserProfileModel? userProfileModel;
  void getUserProfileData() {
    DioHelper.getData(
            url: getUserProfileAPI,
            token: SharedPreferenceHelper.getData(key: userTokenKey))
        .then((value) => (value) {
              emit(GetUserProfileLoadingState());
              if (value.statusCode == 200 || value.statusCode == 201) {
                var jsonData = jsonDecode(value.data);
                userProfileModel = UserProfileModel.fromJson(jsonData);
                emit(GetUserProfileSuccessState());
              } else {
                emit(GetUserProfileErrorState("User Not Found"));
              }
            })
        .catchError((onError) {
      emit(GetUserProfileErrorState(onError.toString()));
    });
  }
}
