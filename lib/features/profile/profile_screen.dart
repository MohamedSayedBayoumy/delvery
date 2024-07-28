import 'package:flutter/material.dart';
import 'package:mts/core/utils/navigation.dart';
import 'package:mts/features/login/login_screen.dart';
import 'package:mts/features/profile/change_password_screeen.dart';
import 'package:mts/features/profile/language_screen.dart';
import 'package:mts/features/profile/my_cash.dart';
import 'package:mts/features/profile/my_document.dart';
import '../../core/widgets/custom_padding.dart';
import 'history_screen.dart';
import 'widget/list_tile_widget.dart';
import 'widget/profile_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Profile"),
      ),
      body: SingleChildScrollView(
        child: CustomPadding(
          child: Column(
            children: [
              const ProfileCardWidget(),
              const SizedBox(height: 10.0),
              const ListTileWidget(
                title: "My Documents",
                icon: Icons.edit_document,
                to: MyDocumentScreen(),
              ),
              const Divider(
                height: 0.1,
              ),
              const ListTileWidget(
                title: "History",
                icon: Icons.history,
                to: HistoryScreen(),
              ),
              const Divider(
                height: 0.1,
              ),
              const ListTileWidget(
                title: "My Cash Balance",
                icon: Icons.wallet_rounded,
                to: MyCashBalanceScreen(),
              ),
              const Divider(
                height: 0.1,
              ),
              const ListTileWidget(
                title: "Earning History",
                icon: Icons.grading_sharp,
              ),
              const Divider(
                height: 0.1,
              ),
              const ListTileWidget(
                title: "Change Password",
                icon: Icons.password,
                to: ChangePasswordScreeen(),
              ),
              const Divider(
                height: 0.1,
              ),
              const ListTileWidget(
                title: "FAQs",
                icon: Icons.question_mark_rounded,
              ),
              const Divider(
                height: 0.1,
              ),
              const ListTileWidget(
                title: "Language",
                icon: Icons.language_rounded,
                to: LanguageScreen(),
              ),
              const Divider(
                height: 0.1,
              ),
              ListTileWidget(
                title: "Sing Out",
                icon: Icons.login_sharp,
                onTap: () {
                  NavigationHelper.navigateRemoveUntilTo(
                    context,
                    const LoginScreen(),
                  );
                },
              ),
              const Divider(
                height: 0.1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
