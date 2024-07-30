import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/functions/loading_ui.dart';
import '../../core/services/get_it/single_tone.dart';
import '../../core/utils/navigation.dart';
import '../../core/widgets/custom_padding.dart';
import '../auth/login/login_screen.dart';
import 'change_password_screeen.dart';
import 'controller/cubit/profile_cubit.dart';
import 'history_screen.dart';
import 'language_screen.dart';
import 'my_cash.dart';
import 'my_document.dart';
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
              BlocProvider<ProfileCubit>(
                create: (context) => sl<ProfileCubit>(),
                child: BlocConsumer<ProfileCubit, ProfileState>(
                  listener: (context, state) {
                    if (state is ProfileLoading) {
                      loadingAlert(context);
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
                    } else if (state is FailureProfileCase) {
                      final snackBar = SnackBar(
                        backgroundColor: Colors.red,
                        content: Text(state.message),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    } else {}
                  },
                  builder: (context, state) {
                    final cubit = ProfileCubit.get(context);

                    return ListTileWidget(
                      title: "Sing Out",
                      icon: Icons.login_sharp,
                      onTap: () {
                        cubit.logout();
                      },
                    );
                  },
                ),
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
