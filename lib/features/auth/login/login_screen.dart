import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mts/core/services/get_it/single_tone.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../core/utils/navigation.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_padding.dart';
import '../../../core/widgets/custom_text_filed.dart';
import '../controller/cubit/auth_cubit.dart';
import '../register/register_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: CustomPadding(
            child: BlocProvider<AuthCubit>(
              create: (context) => sl<AuthCubit>(),
              child: BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {},
                builder: (context, state) {
                  final cubit = AuthCubit.get(context);

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/LOGO SAFRI.jpg", width: 30.w),
                        ],
                      ),
                      const Text("Email"),
                      const SizedBox(height: 10.0),
                      CustomTextField(
                        labelText: "Enter Your Email ID",
                        hinText: "Enter Your Email ID",
                        controller: TextEditingController(),
                        onChange: (v) {
                          return v;
                        },
                      ),
                      const SizedBox(height: 25.0),
                      const Text("Password"),
                      const SizedBox(height: 10.0),
                      CustomTextField(
                        labelText: "Enter Your Password",
                        hinText: "Enter Your Password",
                        controller: TextEditingController(),
                        onChange: (v) {
                          return v;
                        },
                        suffixWidget: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.visibility_outlined),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      Row(
                        children: [
                          Checkbox(
                            checkColor: Colors.green,
                            fillColor:
                                WidgetStateProperty.resolveWith(cubit.getColor),
                            value: cubit.isChecked,
                            onChanged: (bool? value) {
                              cubit.isChecked = value!;
                            },
                          ),
                          const Text("Remember Me"),
                          const Spacer(),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              "Forgot Password ?",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10.0),
                      const CustomButton(
                        buttonText: "Login",
                      ),
                      const SizedBox(height: 12.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              NavigationHelper.navigateTo(
                                context,
                                const RegisterScreen(),
                              );
                            },
                            child:
                                const Text("Don't have an account ? Register"),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
