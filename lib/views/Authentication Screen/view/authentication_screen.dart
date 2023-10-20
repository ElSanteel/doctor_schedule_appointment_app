import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:session_20/models/login_model.dart';
import 'package:session_20/views/Appointment%20Screen/view/appointments_screen.dart';
import 'package:session_20/views/Registration%20Screen/view/registration_screen.dart';

import '../../../blocs/authentication_cubit/authentication_cubit.dart';
import '../../../core/components/custom_text_field.dart';
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
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        const AppointmentsScreen()));
          } else if (state is UserLoginErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.loginErrorMessage)),
            );
          }
        },
        builder: (context, state) {
          var cubit = AuthenticationCubit.get(context);

          return Form(
            key: cubit.formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset("assets/images/app_logo.png"),
                  CustomTextField(
                    prefixIcon: const Icon(Icons.mail),
                    labelText: "Enter your Email",
                    controller: cubit.emailController,
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
                        cubit.togglePasswordVisibility();
                      },
                    ),
                    labelText: "Enter your Password",
                    obscureText: !cubit.isVisible,
                    controller: cubit.passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password is required';
                      }
                      return null;
                    },
                  ),
                  state is UserLoginLoadingState
                      ? const CircularProgressIndicator()
                      : CustomButton(
                          label: 'Login',
                          onPressed: () {
                            LoginRequestModel loginRequestModel =
                                LoginRequestModel(cubit.emailController.text,
                                    cubit.passwordController.text);
                            cubit.userLogin(loginRequestModel);
                          },
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
