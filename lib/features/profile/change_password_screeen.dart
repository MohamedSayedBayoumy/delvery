import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../core/functions/loading_ui.dart';
import '../../core/utils/navigation.dart';
import '../../core/widgets/custom_button.dart';
import '../../core/widgets/custom_padding.dart';
import '../../core/widgets/custom_text_filed.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../auth/login/login_screen.dart';
import 'controller/cubit/profile_cubit.dart';

class ChangePasswordScreeen extends StatelessWidget {
  final ProfileCubit profileCubit;
  const ChangePasswordScreeen({super.key, required this.profileCubit});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.change_password),
        centerTitle: true,
      ),
      body: CustomPadding(
        child: BlocConsumer<ProfileCubit, ProfileState>(
          bloc: profileCubit..getUserData(context, getDocument: false),
          listener: (context, state) {
            if (state is ChangePasswordLoading) {
              loadingAlert(context);
            } else if (state is FailureProfileCase) {
              final snackBar = SnackBar(
                backgroundColor: Colors.red,
                content: Text(state.message),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            } else if (state is SuccessLogout) {
              final snackBar = SnackBar(
                backgroundColor: Colors.green,
                content: Text(state.message),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
              NavigationHelper.navigateRemoveUntilTo(
                context,
                const LoginScreen(),
              );
            } else {}
          },
          builder: (context, state) {
            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(AppLocalizations.of(context)!.old_password),
                        const SizedBox(height: 10.0),
                        CustomTextField(
                          labelText:
                              AppLocalizations.of(context)!.enter_password,
                          hinText: AppLocalizations.of(context)!.enter_password,
                          controller: profileCubit.passwordController,
                        ),
                        const SizedBox(height: 25.0),
                        Text(AppLocalizations.of(context)!.new_password),
                        const SizedBox(height: 10.0),
                        CustomTextField(
                          labelText:
                              AppLocalizations.of(context)!.enter_password,
                          hinText: AppLocalizations.of(context)!.enter_password,
                          controller: profileCubit.newPasswordController,
                        ),
                        const SizedBox(height: 25.0),
                        Text(AppLocalizations.of(context)!.confirm_password),
                        const SizedBox(height: 10.0),
                        CustomTextField(
                          labelText:
                              AppLocalizations.of(context)!.change_password,
                          hinText:
                              AppLocalizations.of(context)!.change_password,
                          controller: profileCubit.confirmNewPasswordController,
                        ),
                        const SizedBox(height: 25.0),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Row(
                    children: [
                      Text(AppLocalizations.of(context)!.forgot_old_password),
                      const Spacer(),
                      const Icon(Icons.arrow_forward_rounded)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: CustomButton(
                    onPressed: () {
                      profileCubit.changePassword(context);
                    },
                    height: 7.h,
                    buttonText:
                        AppLocalizations.of(context)!.change_password_button,
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
