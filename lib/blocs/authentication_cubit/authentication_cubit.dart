import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:session_20/services/Shared%20Preference/shared_preference_helper.dart';
import 'package:session_20/services/dio/dio_helper.dart';
import 'package:session_20/tokens.dart';

import '../../models/Login Model/login_request_model.dart';
import '../../models/Login Model/login_response_model.dart';
import '../../models/appointment_model.dart';
import '../../services/dio/api_end_points.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(AuthenticationInitial());
  static AuthenticationCubit get(context) => BlocProvider.of(context);

  var loginFormKey = GlobalKey<FormState>();

  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();

  bool isVisible = true;

  void loginTogglePasswordVisibility() {
    isVisible = !isVisible;
    emit(LoginPasswordVisibilityChangedState(isVisible));
  }

  void userLogin(LoginRequestModel loginRequestModel) {
    emit(UserLoginLoadingState());
    print("Loading");
    DioHelper.postData(url: postUserLogin, data: loginRequestModel.toJson())
        .then((value) {
      if (value.statusCode == 200 || value.statusCode == 201) {
        var jsonData = jsonDecode(value.data);
        LoginResponseModel loginResponseModel =
            LoginResponseModel.fromJson(jsonData);
        SharedPreferenceHelper.saveData(
            key: userTokenKey, value: loginResponseModel.data!.token!);
        SharedPreferenceHelper.saveData(
            key: userNameTokenKey, value: loginResponseModel.data!.username!);
        print(loginResponseModel.data!.token!);
        emit(UserLoginSuccessState());
      } else {
        var jsonData = jsonDecode(value.data);
        print(jsonData);
        emit(UserLoginErrorState(jsonData['data'].toString()));
      }
    }).catchError((onError) {
      emit(UserLoginErrorState(onError.toString()));
    });
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
