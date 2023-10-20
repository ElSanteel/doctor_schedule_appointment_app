import 'package:flutter/material.dart';
import 'package:session_20/services/Shared%20Preference/shared_preference_helper.dart';
import 'package:session_20/services/dio/dio_helper.dart';
import 'package:session_20/src/app_root.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferenceHelper.init();
  DioHelper.init();
  runApp(const AppRoot());
}
