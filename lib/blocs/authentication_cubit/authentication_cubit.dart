import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:session_20/services/Shared%20Preference/shared_preference_helper.dart';
import 'package:session_20/services/dio/dio_helper.dart';
import 'package:session_20/tokens.dart';

import '../../enum/gender_enum.dart';
import '../../models/appointment_model.dart';
import '../../models/login_model.dart';
import '../../models/register_model.dart';
import '../../services/dio/api_end_points.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(AuthenticationInitial());
  static AuthenticationCubit get(context) => BlocProvider.of(context);

  void userLogin(LoginRequestModel loginRequestModel) {
    emit(UserLoginLoadingState());
    DioHelper.postData(url: postUserLogin, data: loginRequestModel.toJson())
        .then((value) => (value) {
              if (value.statueCode == 200 || value.statusCode == 201) {
                var jsonData = jsonDecode(value.data);
                LoginResponseModel loginResponseModel =
                    LoginResponseModel.fromJson(jsonData);
                SharedPreferenceHelper.saveData(
                    key: userTokenKey, value: loginResponseModel.data!.token!);
                SharedPreferenceHelper.saveData(
                    key: userNameTokenKey,
                    value: loginResponseModel.data!.username!);
                emit(UserLoginSuccessState());
              } else {
                print(value.data);
                emit(UserLoginErrorState(value.data.toString()));
              }
            })
        .catchError((onError) {
      emit(UserLoginErrorState(onError.toString()));
    });
  }

  void userRegister(RegisterRequestModel registerRequestModel) {
    emit(UserLoginLoadingState());
    DioHelper.postData(url: postUserLogin, data: registerRequestModel.toJson())
        .then((value) => (value) {
              if (value.statueCode == 200 || value.statusCode == 201) {
                var jsonData = jsonDecode(value.data);
                RegisterResponseModel registerResponseModel =
                    RegisterResponseModel.fromJson(jsonData);
                emit(UserLoginSuccessState());
              } else {
                print(value.data);
                emit(UserLoginErrorState(value.data.toString()));
              }
            })
        .catchError((onError) {
      emit(UserLoginErrorState(onError.toString()));
    });
  }

  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isVisible = true;

  Gender selectedGender = Gender.male;

  void setSelectedGender(Gender gender) {
    selectedGender = gender;
    emit(AuthenticationGenderChanged(selectedGender));
  }

  // Function to toggle password visibility
  void togglePasswordVisibility() {
    isVisible = !isVisible;
    emit(PasswordVisibilityChanged(isVisible));
  }

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
}
