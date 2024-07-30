import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mts/features/profile/controller/cubit/profile_cubit.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../core/widgets/custom_button.dart';
import '../../core/widgets/custom_padding.dart';
import '../../core/widgets/custom_text_filed.dart';

class EditProfileScreen extends StatelessWidget {
  final ProfileCubit profileCubit;
  const EditProfileScreen({super.key, required this.profileCubit});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Profile"),
      ),
      body: BlocConsumer<ProfileCubit, ProfileState>(
        bloc: profileCubit,
        listener: (context, state) {
          // TODO: implement listener
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
                            const CircleAvatar(
                              radius: 50.0,
                            ),
                            const SizedBox(width: 30.0),
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                "Change Picture",
                                style: TextStyle(color: Colors.green),
                              ),
                            )
                          ],
                        ),
                        const Text("First Name"),
                        const SizedBox(height: 10.0),
                        CustomTextField(
                          labelText: "Enter Your First Name",
                          hinText: "Enter Your First Name",
                          controller:
                              TextEditingController(text: "Mohamed Sayed"),
                        ),
                        const SizedBox(height: 25.0),
                        const Text("Last Name"),
                        const SizedBox(height: 10.0),
                        CustomTextField(
                          labelText: "Enter Your Last Name",
                          hinText: "Enter Your Last Name",
                          controller: TextEditingController(text: "Bayoumy"),
                        ),
                        const SizedBox(height: 25.0),
                        const Text("Email"),
                        const SizedBox(height: 10.0),
                        CustomTextField(
                          labelText: "Enter Your Email",
                          hinText: "Enter Your Email",
                          controller: TextEditingController(
                              text: "Mandobobo1@gmail.com"),
                        ),
                        const SizedBox(height: 25.0),
                        const Text("Contact Number"),
                        const SizedBox(height: 10.0),
                        Row(
                          children: [
                            const CountryCodePicker(
                              onChanged: print,
                              initialSelection: 'EG',
                              favorite: ['EG'],
                              showCountryOnly: false,
                              showOnlyCountryWhenClosed: false,
                              alignLeft: false,
                            ),
                            Expanded(
                              child: CustomTextField(
                                labelText: "000 000 000",
                                hinText: "000 000 000",
                                controller:
                                    TextEditingController(text: "1114205280"),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              CustomButton(
                height: 8.h,
                buttonText: "Change Information",
                raduis: 0.0,
              ),
            ],
          );
        },
      ),
    );
  }
}
