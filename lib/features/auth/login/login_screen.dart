import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../core/functions/loading_ui.dart';
import '../../../core/services/get_it/single_tone.dart';
import '../../../core/utils/navigation.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_padding.dart';
import '../../../core/widgets/custom_text_filed.dart';
import '../controller/cubit/auth_cubit.dart';
import '../register/register_screen.dart';
import '../register/upload_document.dart';

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
                listener: (context, state) {
                  if (state is SuccessAuth) {
                    NavigationHelper.navigateRemoveUntilTo(
                      context,
                      const UploadDocumentScreen(),
                    );
                  } else if (state is FailureAuth) {
                    final snackBar = SnackBar(
                      backgroundColor: Colors.red,
                      content: Text(state.message),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  } else if (state is LoadingAuth) {
                    loadingAlert(context);
                  } else {}
                },
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
                        controller: cubit.emailController,
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
                        maxLines: 1,
                        controller: cubit.passwordController,
                        onChange: (v) {
                          return v;
                        },
                        obscureText: cubit.showPassword,
                        suffixWidget: IconButton(
                          onPressed: () {
                            cubit.toggleShowPassword();
                          },
                          icon: Icon(cubit.showPassword == true
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      Row(
                        children: [
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
                      CustomButton(
                        onPressed: () {
                          cubit.login(context);
                        },
                        buttonText: "Login",
                      ),
                      const SizedBox(height: 12.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              cubit.resetValues();
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
