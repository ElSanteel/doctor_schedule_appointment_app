import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:session_20/views/Appointment%20Screen/view/appointments_screen.dart';
import 'package:session_20/views/Registration%20Screen/view/registration_screen.dart';
import '../../../blocs/authentication_cubit/authentication_cubit.dart';
import '../../../core/components/custom_text_field.dart';
import '../../../models/Login Model/login_request_model.dart';
import '../component/custom_button.dart';

class AuthenticationScreen extends StatelessWidget {
  const AuthenticationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff3abdd7),
        title: const Text('Authentication Screen'),
      ),
      body: BlocConsumer<AuthenticationCubit, AuthenticationState>(
        listener: (context, state) {
          if (state is UserLoginSuccessState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Login Successful')),
            );
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) =>
                      const AppointmentsScreen()),
              (route) => false,
            );
          } else if (state is UserLoginErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.loginErrorMessage)),
            );
          }
        },
        builder: (context, state) {
          var cubit = AuthenticationCubit.get(context);

          return Form(
            key: cubit.loginFormKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset("assets/images/app_logo.png"),
                  CustomTextField(
                    prefixIcon: const Icon(Icons.mail),
                    labelText: "Enter your Email",
                    controller: cubit.loginEmailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return ' Email is required';
                      }
                      if (!RegExp(r'^[\w-.]+@([\w-]+.)+[\w-]{2,4}$')
                          .hasMatch(value)) {
                        return "Please Enter a valid email";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(cubit.isVisible
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () {
                        cubit.loginTogglePasswordVisibility();
                      },
                    ),
                    labelText: "Enter your Password",
                    obscureText: !cubit.isVisible,
                    controller: cubit.loginPasswordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password is required';
                      }
                      return null;
                    },
                  ),
                  Center(
                    child: state is UserLoginLoadingState
                        ? const CircularProgressIndicator()
                        : CustomButton(
                            label: 'Login',
                            onPressed: () {
                              if (cubit.loginFormKey.currentState!.validate()) {
                                LoginRequestModel loginRequestModel =
                                    LoginRequestModel(
                                        cubit.loginEmailController.text,
                                        cubit.loginPasswordController.text);
                                cubit.userLogin(loginRequestModel);
                              }
                            },
                          ),
                  ),
                  const SizedBox(height: 25),
                  CustomButton(
                    label: 'Register',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RegisterScreen()),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
