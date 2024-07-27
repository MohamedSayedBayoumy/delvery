import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../core/utils/navigation.dart';
import '../../core/widgets/custom_button.dart';
import '../../core/widgets/custom_padding.dart';
import '../../core/widgets/custom_text_filed.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create New Account"),
      ),
      body: CustomPadding(
        child: SingleChildScrollView(
          child: SafeArea(
            child: CustomPadding(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/LOGO SAFRI.jpg", width: 30.w),
                    ],
                  ),
                  const Text("First Name"),
                  const SizedBox(height: 10.0),
                  CustomTextField(
                    labelText: "Enter Your Full Name",
                    hinText: "Enter Your Full Name",
                    controller: TextEditingController(),
                  ),
                  const SizedBox(height: 15.0),
                  const Text("Last Name"),
                  const SizedBox(height: 10.0),
                  CustomTextField(
                    labelText: "Enter Your Last Name",
                    hinText: "Enter Your Last Name",
                    controller: TextEditingController(),
                  ),
                  const SizedBox(height: 15.0),
                  const Text("Email"),
                  const SizedBox(height: 10.0),
                  CustomTextField(
                    labelText: "Enter Your Email",
                    hinText: "Enter Your Email",
                    controller: TextEditingController(),
                  ),
                  const SizedBox(height: 15.0),
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
                          controller: TextEditingController(),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15.0),
                  const Text("Password"),
                  const SizedBox(height: 10.0),
                  CustomTextField(
                    labelText: "Enter Your Password",
                    hinText: "Enter Your Password",
                    controller: TextEditingController(),
                    suffixWidget: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.visibility_outlined),
                    ),
                  ),
                  const SizedBox(height: 15.0),
                  const Text("Confirm Password"),
                  const SizedBox(height: 10.0),
                  CustomTextField(
                    labelText: "Enter Your Password",
                    hinText: "Enter Your Password",
                    controller: TextEditingController(),
                    suffixWidget: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.visibility_outlined),
                    ),
                  ),
                  const SizedBox(height: 40.0),
                  const CustomButton(
                    buttonText: "Create New Account",
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
                        child: const Text("Already Have an Account ? Login"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
