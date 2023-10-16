import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:session_20/blocs/doctor_appointment_app_cubit.dart';

import '../../../components/custom_text_field.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registration Form'),
      ),
      body: BlocConsumer<DoctorAppointmentAppCubit, DoctorAppointmentAppState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = DoctorAppointmentAppCubit.get(context);
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextField(
                  label: 'Name',
                  error: '',
                  onChanged: cubit.changeNameValue,
                ),
                CustomTextField(
                    label: 'Email',
                    error: '',
                    onChanged: cubit.changeEmailValue),
                CustomTextField(
                  label: 'Phone',
                  error: cubit.phoneError,
                  onChanged: (value) {
                    cubit.validatePhone(value);
                  },
                  isNumeric: true,
                ),
                CustomTextField(
                  label: 'Gender',
                  error: '',
                  onChanged: (value) {
                    cubit.changeGenderValue(value);
                  },
                ),
                CustomTextField(
                  label: 'Password',
                  error: cubit.passwordError,
                  onChanged: (value) {
                    cubit.changePasswordValue(value);
                  },
                ),
                ElevatedButton(
                  onPressed: () async {
                    cubit.clearError();
                    cubit.validatePhone(cubit.phone);
                    cubit.changePasswordValue(cubit.password);

                    if (cubit.phoneError.isNotEmpty ||
                        cubit.passwordError.isNotEmpty) {
                      cubit.displayError();
                    } else {
                      if (cubit.userType.isNotEmpty) {
                        if (cubit.userType == 'Admin') {
                          // Handle admin login
                        } else if (cubit.userType == 'Manager') {
                          // Handle manager login
                        } else if (cubit.userType == 'Employee') {
                          // Handle employee login
                        }
                      }
                    }
                  },
                  child: const Text('Register'),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
