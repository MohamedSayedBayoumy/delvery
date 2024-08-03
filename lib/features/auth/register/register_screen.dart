import 'dart:developer';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../core/functions/loading_ui.dart';
import '../../../core/services/get_it/single_tone.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_padding.dart';
import '../../../core/widgets/custom_text_filed.dart';
import '../controller/cubit/auth_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.create_account),
      ),
      body: CustomPadding(
        child: SingleChildScrollView(
          child: SafeArea(
            child: CustomPadding(
              child: BlocProvider<AuthCubit>(
                create: (context) => sl<AuthCubit>(),
                child: BlocConsumer<AuthCubit, AuthState>(
                  listener: (context, state) {
                    if (state is SuccessAuth) {
                      Navigator.pop(context);
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
                        Text(AppLocalizations.of(context)!.first_name),
                        const SizedBox(height: 10.0),
                        CustomTextField(
                          labelText: AppLocalizations.of(context)!.first_name,
                          hinText: AppLocalizations.of(context)!.first_name,
                          controller: cubit.fullNameController,
                        ),
                        const SizedBox(height: 15.0),
                        Text(AppLocalizations.of(context)!.email),
                        const SizedBox(height: 10.0),
                        CustomTextField(
                          labelText: AppLocalizations.of(context)!.enter_email,
                          hinText: AppLocalizations.of(context)!.enter_email,
                          controller: cubit.emailController,
                        ),
                        const SizedBox(height: 15.0),
                        Text(AppLocalizations.of(context)!.contact_number),
                        const SizedBox(height: 10.0),
                        Row(
                          children: [
                            CountryCodePicker(
                              onChanged: (c) {
                                cubit.countryCode = c.dialCode!;
                                log("#### ${c.dialCode}");
                              },
                              initialSelection: 'EG',
                              favorite: const ['EG'],
                              showCountryOnly: false,
                              showOnlyCountryWhenClosed: false,
                              alignLeft: false,
                            ),
                            Expanded(
                              child: CustomTextField(
                                labelText: "000 000 000",
                                hinText: "000 000 000",
                                controller: cubit.phoneController,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15.0),
                        Text(AppLocalizations.of(context)!.password),
                        const SizedBox(height: 10.0),
                        CustomTextField(
                          labelText:
                              AppLocalizations.of(context)!.enter_password,
                          hinText: AppLocalizations.of(context)!.enter_password,
                          controller: cubit.passwordController,
                          obscureText: cubit.showPassword,
                          maxLines: 1,
                          suffixWidget: IconButton(
                            onPressed: () {
                              cubit.toggleShowPassword();
                            },
                            icon: Icon(cubit.showPassword == true
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined),
                          ),
                        ),
                        const SizedBox(height: 15.0),
                        Text(AppLocalizations.of(context)!.confirm_password),
                        const SizedBox(height: 10.0),
                        CustomTextField(
                          labelText: AppLocalizations.of(context)!
                              .enter_confirm_password,
                          hinText: AppLocalizations.of(context)!
                              .enter_confirm_password,
                          controller: cubit.confirmController,
                          obscureText: cubit.showPassword,
                          maxLines: 1,
                          suffixWidget: IconButton(
                            onPressed: () {
                              cubit.toggleShowPassword();
                            },
                            icon: Icon(cubit.showPassword == true
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined),
                          ),
                        ),
                        const SizedBox(height: 40.0),
                        CustomButton(
                          buttonText:
                              AppLocalizations.of(context)!.create_account,
                          onPressed: () {
                            cubit.register(context);
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  cubit.resetValues();
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  AppLocalizations.of(context)!
                                      .already_have_account,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
