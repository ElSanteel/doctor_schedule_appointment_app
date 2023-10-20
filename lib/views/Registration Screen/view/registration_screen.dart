import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:session_20/blocs/authentication_cubit/authentication_cubit.dart';
import '../../../core/components/custom_text_field.dart';
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
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = AuthenticationCubit.get(context);
          return Form(
            key: cubit.formKey,
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
                      controller: cubit.nameController,
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
                      controller: cubit.emailController,
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
                      controller: cubit.phoneController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Phone is required';
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
                      controller: cubit.passwordController,
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
                      controller: cubit.passwordController,
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
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff3abdd7)),
                          onPressed: () {
                            if (cubit.formKey.currentState!.validate()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Registration Successful')),
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
