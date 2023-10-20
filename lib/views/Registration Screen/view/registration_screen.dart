import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:session_20/blocs/authentication_cubit/authentication_cubit.dart';
import 'package:session_20/models/register_model.dart';
import '../../../core/components/custom_text_field.dart';
import '../../Authentication Screen/view/authentication_screen.dart';
import '../component/gender_selection_widget.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff3abdd7),
        title: const Text('Registration Form'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: BlocConsumer<AuthenticationCubit, AuthenticationState>(
        listener: (context, state) {
          if (state is UserRegisterSuccessState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Register Successful')),
            );
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) =>
                      const AuthenticationScreen()),
              (route) => false,
            );
          } else if (state is UserRegisterErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.registerErrorMessage)),
            );
          }
        },
        builder: (context, state) {
          var cubit = AuthenticationCubit.get(context);
          return Form(
            key: cubit.registerFormKey,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/app_logo.png",
                          width: 350,
                          height: 200,
                        ),
                      ],
                    ),
                    CustomTextField(
                      prefixIcon: const Icon(Icons.person),
                      labelText: "Enter your name",
                      controller: cubit.registerNameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Name is required';
                        }
                        return null;
                      },
                    ),
                    CustomTextField(
                      prefixIcon: const Icon(Icons.mail),
                      labelText: "Enter your email",
                      controller: cubit.registerEmailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email is required';
                        }
                        if (!RegExp(r'^[\w-.]+@([\w-]+.)+[\w-]{2,4}$')
                            .hasMatch(value)) {
                          return "Please Enter a valid email";
                        }
                        return null;
                      },
                    ),
                    CustomTextField(
                      prefixIcon: const Icon(Icons.phone),
                      labelText: "Enter your phone",
                      controller: cubit.registerPhoneController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Phone is required';
                        }
                        if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                          return 'Phone must contain only numeric values (0-9)';
                        }
                        if (value.startsWith('-')) {
                          return 'Phone cannot be a negative value';
                        }
                        return null;
                      },
                      isNumeric: true,
                    ),
                    CustomTextField(
                      prefixIcon: const Icon(Icons.lock),
                      obscureText: !cubit.isVisible,
                      suffixIcon: IconButton(
                        icon: Icon(cubit.isVisible
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          cubit.togglePasswordVisibility();
                        },
                      ),
                      labelText: "Enter your password",
                      controller: cubit.registerPasswordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password is required';
                        }
                        return null;
                      },
                    ),
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
                      labelText: "Confirm your Password",
                      obscureText: !cubit.isVisible,
                      controller: cubit.registerConfirmationPasswordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password is required';
                        }
                        return null;
                      },
                    ),
                    GenderSelectionWidget(
                      selectedGender: cubit.selectedGender,
                      onGenderChanged: (gender) {
                        cubit.setSelectedGender(gender);
                      },
                    ),
                    Center(
                      child: SizedBox(
                        width: 350,
                        height: 50,
                        child: state is UserLoginLoadingState
                            ? const CircularProgressIndicator()
                            : ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xff3abdd7)),
                                onPressed: () {
                                  if (cubit.registerFormKey.currentState!
                                      .validate()) {
                                    RegisterRequestModel registerRequestModel =
                                        RegisterRequestModel(
                                      cubit.registerEmailController.text,
                                      cubit.registerPasswordController.text,
                                      cubit.registerNameController.text,
                                      cubit.registerPhoneController.text,
                                      cubit
                                          .registerConfirmationPasswordController
                                          .text,
                                      cubit.selectedGender.toString(),
                                    );
                                    cubit.userRegister(registerRequestModel);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const AuthenticationScreen(),
                                      ),
                                    );
                                  }
                                },
                                child: const Text('Register'),
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}