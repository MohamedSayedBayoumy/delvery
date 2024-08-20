import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mts/core/constants/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../core/functions/loading_ui.dart';
import '../../../core/services/get_it/single_tone.dart';
import '../../../core/utils/navigation.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_padding.dart';
import '../../../core/widgets/custom_text_filed.dart';
import '../../profile/language_screen.dart';
import '../controller/cubit/auth_cubit.dart';
import '../register/register_screen.dart';
import '../register/upload_document.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              NavigationHelper.navigateTo(
                                context,
                                const LanguageScreen(),
                              );
                            },
                            child: Text(
                              AppLocalizations.of(context)!.language,
                              style: const TextStyle(
                                color: ConstantsColor.greenColor,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/LOGO SAFRI.jpg", width: 30.w),
                        ],
                      ),
                      Text(AppLocalizations.of(context)!.email),
                      const SizedBox(height: 10.0),
                      CustomTextField(
                        labelText: AppLocalizations.of(context)!.enter_email,
                        hinText: AppLocalizations.of(context)!.email,
                        controller: cubit.emailController,
                        onChange: (v) {
                          return v;
                        },
                      ),
                      const SizedBox(height: 25.0),
                      Text(AppLocalizations.of(context)!.password),
                      const SizedBox(height: 10.0),
                      CustomTextField(
                        labelText: AppLocalizations.of(context)!.enter_password,
                        hinText: AppLocalizations.of(context)!.enter_password,
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
                      // const SizedBox(height: 10.0),
                      // Row(
                      //   children: [
                      //     const Spacer(),
                      //     TextButton(
                      //       onPressed: () {},
                      //       child: Text(
                      //         AppLocalizations.of(context)!.forgot_password,
                      //         style: const TextStyle(color: Colors.black),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      const SizedBox(height: 25.0),
                      CustomButton(
                        onPressed: () {
                          cubit.login(context);
                        },
                        buttonText: AppLocalizations.of(context)!.login,
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
                                Text(AppLocalizations.of(context)!.no_account),
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
