import 'package:flutter/material.dart';
import 'package:session_20/services/shared_prefrence_helper.dart';
import 'package:session_20/src/app_root.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferenceHelper.init();
  runApp(const AppRoot());
}
