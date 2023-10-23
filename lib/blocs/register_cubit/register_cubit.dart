import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../models/Register Model/register_request_model.dart';
import '../../services/dio/api_end_points.dart';
import '../../services/dio/dio_helper.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  static RegisterCubit get(context) => BlocProvider.of(context);

  var registerFormKey = GlobalKey<FormState>();
  TextEditingController registerNameController = TextEditingController();
  TextEditingController registerEmailController = TextEditingController();
  TextEditingController registerPhoneController = TextEditingController();
  TextEditingController registerPasswordController = TextEditingController();
  TextEditingController registerConfirmationPasswordController =
      TextEditingController();

  bool isVisible = true;

  void registerTogglePasswordVisibility() {
    isVisible = !isVisible;
    emit(RegisterPasswordVisibilityChangedState(isVisible));
  }

  int selectedGender = 0;

  void setSelectedGenderChanged(gender) {
    selectedGender = gender;
    emit(GenderState());
  }

  void userRegister(RegisterRequestModel registerRequestModel) {
    emit(UserRegisterLoadingState());
    print(registerRequestModel.toJson());
    DioHelper.postData(
            url: postUserRegister, data: registerRequestModel.toJson())
        .then((value) {
      if (value.statusCode == 200 || value.statusCode == 201) {
        emit(UserRegisterSuccessState());
      } else {
        var jsonData = jsonDecode(value.data);
        print(value.data);
        emit(UserRegisterErrorState(jsonData['data'].toString()));
      }
    }).catchError((onError) {
      emit(UserRegisterErrorState(onError.toString()));
    });
  }
}
