import 'package:flutter/material.dart';
import '../../core/widgets/custom_padding.dart';
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
      body: const SingleChildScrollView(
        child: CustomPadding(
          child: Column(
            children: [
              ProfileCardWidget(),
              SizedBox(height: 10.0),
              ListTileWidget(
                title: "My Documents",
                icon: Icons.edit_document,
              ),
              Divider(
                height: 0.1,
              ),
              ListTileWidget(
                title: "History",
                icon: Icons.history,
              ),
              Divider(
                height: 0.1,
              ),
              ListTileWidget(
                title: "My Cash Balance",
                icon: Icons.wallet_rounded,
              ),
              Divider(
                height: 0.1,
              ),
              ListTileWidget(
                title: "Earning History",
                icon: Icons.grading_sharp,
              ),
              Divider(
                height: 0.1,
              ),
              ListTileWidget(
                title: "Change Password",
                icon: Icons.password,
              ),
              Divider(
                height: 0.1,
              ),
              ListTileWidget(
                title: "FAQs",
                icon: Icons.question_mark_rounded,
              ),
              Divider(
                height: 0.1,
              ),
              ListTileWidget(
                title: "Language",
                icon: Icons.language_rounded,
              ),
              Divider(
                height: 0.1,
              ),
              ListTileWidget(
                title: "Sing Out",
                icon: Icons.login_sharp,
              ),
              Divider(
                height: 0.1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
