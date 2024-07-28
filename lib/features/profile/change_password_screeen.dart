import 'package:flutter/material.dart';
import 'package:mts/core/widgets/custom_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../core/widgets/custom_padding.dart';
import '../../core/widgets/custom_text_filed.dart';

class ChangePasswordScreeen extends StatelessWidget {
  const ChangePasswordScreeen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Change Password"),
        centerTitle: true,
      ),
      body: CustomPadding(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Old Password"),
                    const SizedBox(height: 10.0),
                    CustomTextField(
                      labelText: "Enter Your Password",
                      hinText: "Enter Your Password",
                      controller: TextEditingController(),
                    ),
                    const SizedBox(height: 25.0),
                    const Text("New Password"),
                    const SizedBox(height: 10.0),
                    CustomTextField(
                      labelText: "Enter Your Password",
                      hinText: "Enter Your Password",
                      controller: TextEditingController(),
                    ),
                    const SizedBox(height: 25.0),
                    const Text("Confirm Password"),
                    const SizedBox(height: 10.0),
                    CustomTextField(
                      labelText: "Change Password",
                      hinText: "Change Password",
                      controller: TextEditingController(),
                    ),
                    const SizedBox(height: 25.0),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: const Row(
                children: [
                  Text("I don't remember my old password ! Please Help"),
                  Spacer(),
                  Icon(Icons.arrow_forward_rounded)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: CustomButton(
                height: 7.h,
                buttonText: "Change Password",
              ),
            )
          ],
        ),
      ),
    );
  }
}
