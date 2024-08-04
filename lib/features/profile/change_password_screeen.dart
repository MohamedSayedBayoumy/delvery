import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../core/widgets/custom_button.dart';
import '../../core/widgets/custom_padding.dart';
import '../../core/widgets/custom_text_filed.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ChangePasswordScreeen extends StatelessWidget {
  const ChangePasswordScreeen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.change_password),
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
                    Text(AppLocalizations.of(context)!.old_password),
                    const SizedBox(height: 10.0),
                    CustomTextField(
                      labelText: AppLocalizations.of(context)!.enter_password,
                      hinText: AppLocalizations.of(context)!.enter_password,
                      controller: TextEditingController(),
                    ),
                    const SizedBox(height: 25.0),
                    Text(AppLocalizations.of(context)!.new_password),
                    const SizedBox(height: 10.0),
                    CustomTextField(
                      labelText: AppLocalizations.of(context)!.enter_password,
                      hinText: AppLocalizations.of(context)!.enter_password,
                      controller: TextEditingController(),
                    ),
                    const SizedBox(height: 25.0),
                    Text(AppLocalizations.of(context)!.confirm_password),
                    const SizedBox(height: 10.0),
                    CustomTextField(
                      labelText: AppLocalizations.of(context)!.change_password,
                      hinText: AppLocalizations.of(context)!.change_password,
                      controller: TextEditingController(),
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
                height: 7.h,
                buttonText:
                    AppLocalizations.of(context)!.change_password_button,
              ),
            )
          ],
        ),
      ),
    );
  }
}
