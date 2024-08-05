import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../core/functions/loading_ui.dart';
import '../../core/functions/take_image_dialog.dart';
import '../../core/widgets/custom_button.dart';
import '../../core/widgets/custom_padding.dart';
import '../../core/widgets/custom_text_filed.dart';
import 'controller/cubit/profile_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EditProfileScreen extends StatelessWidget {
  final ProfileCubit profileCubit;
  const EditProfileScreen({super.key, required this.profileCubit});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.edit_profile),
      ),
      body: BlocConsumer<ProfileCubit, ProfileState>(
        bloc: profileCubit..getUserData(context, getDocument: false),
        listener: (context, state) {
          if (state is ProfileLoading) {
            loadingAlert(context);
          } else if (state is FailureProfileCase) {
            final snackBar = SnackBar(
              backgroundColor: Colors.red,
              content: Text(state.message),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          } else {}
        },
        builder: (context, state) {
          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: CustomPadding(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 50.0,
                              backgroundImage: profileCubit.userImage
                                      .toString()
                                      .isEmpty
                                  ? null
                                  : profileCubit.userImage
                                          .toString()
                                          .startsWith("http")
                                      ? NetworkImage(profileCubit.userImage)
                                      : FileImage(File(profileCubit.userImage)),
                            ),
                            const SizedBox(width: 30.0),
                            TextButton(
                              onPressed: () {
                                openBottomSheet(
                                  context,
                                  onChangedCamera: (camera) {
                                    profileCubit.setImage(camera);
                                  },
                                  onChangedImage: (image) {
                                    profileCubit.setImage(image);
                                  },
                                );
                              },
                              child: Text(
                                AppLocalizations.of(context)!.change_picture,
                                style: const TextStyle(color: Colors.green),
                              ),
                            )
                          ],
                        ),
                        Text(AppLocalizations.of(context)!.first_name),
                        const SizedBox(height: 10.0),
                        CustomTextField(
                          labelText:
                              AppLocalizations.of(context)!.enter_full_name,
                          hinText:
                              AppLocalizations.of(context)!.enter_full_name,
                          controller: profileCubit.nameController,
                        ),
                        const SizedBox(height: 25.0),
                        Text(AppLocalizations.of(context)!.email),
                        const SizedBox(height: 10.0),
                        CustomTextField(
                          labelText: AppLocalizations.of(context)!.enter_email,
                          hinText: "Enter Your Email",
                          controller: profileCubit.emailController,
                        ),
                        const SizedBox(height: 25.0),
                        Text(AppLocalizations.of(context)!.contact_number),
                        const SizedBox(height: 10.0),
                        CustomTextField(
                          enabled: false,
                          controller: profileCubit.phoneController,
                        ),
                        // Row(
                        //   children: [
                        //     CountryCodePicker(
                        //       onChanged: (code) {
                        //         profileCubit.countryCode = code.dialCode!;
                        //       },
                        //       initialSelection: profileCubit.countryCode,
                        //       favorite: const ['EG'],
                        //       showCountryOnly: false,
                        //       showOnlyCountryWhenClosed: false,
                        //       alignLeft: false,
                        //     ),
                        //     Expanded(
                        //       child: CustomTextField(
                        //         labelText: "000 000 000",
                        //         hinText: "000 000 000",
                        //         controller: profileCubit.phoneController,
                        //       ),
                        //     ),
                        //   ],
                        // ),
                      ],
                    ),
                  ),
                ),
              ),
              CustomButton(
                height: 8.h,
                buttonText: AppLocalizations.of(context)!.change_information,
                raduis: 0.0,
              ),
            ],
          );
        },
      ),
    );
  }
}
