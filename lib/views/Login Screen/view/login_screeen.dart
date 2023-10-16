import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:session_20/blocs/doctor_appointment_app_cubit.dart';
import 'package:session_20/components/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Screen'),
      ),
      body: BlocConsumer<DoctorAppointmentAppCubit, DoctorAppointmentAppState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = DoctorAppointmentAppCubit.get(context);
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextField(
                  label: 'Phone',
                  error: cubit.phoneError,
                  onChanged: (value) {
                    cubit.validatePhone(value);
                  },
                  isNumeric: true,
                ),
                CustomTextField(
                  label: 'Password',
                  error: cubit.passwordError,
                  onChanged: (value) {
                    cubit.changePasswordValue(value);
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    cubit.clearError();
                    cubit.validatePhone(cubit.phone);
                    cubit.changePasswordValue(cubit.password);

                    if (cubit.phoneError.isNotEmpty ||
                        cubit.passwordError.isNotEmpty) {
                      cubit.displayError();
                    } else {
                      if (cubit.userType.isNotEmpty) {
                        if (cubit.userType == 'Admin') {
                        } else if (cubit.userType == 'Manager') {
                        } else if (cubit.userType == 'Employee') {}
                      }
                    }
                  },
                  child: const Text('Login'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
