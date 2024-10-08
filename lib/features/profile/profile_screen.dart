import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/functions/loading_ui.dart';
import '../../core/services/get_it/single_tone.dart';
import '../../core/utils/navigation.dart';
import '../../core/widgets/custom_padding.dart';
import '../auth/login/login_screen.dart';
import 'change_password_screeen.dart';
import 'controller/cubit/profile_cubit.dart';
import 'earn_time_screen.dart';
import 'edit_profile.dart';
import 'history_screen.dart';
import 'language_screen.dart';
import 'my_cash.dart';
import 'my_document.dart';
import 'widget/list_tile_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.edit_profile),
      ),
      body: SingleChildScrollView(
        child: CustomPadding(
          child: BlocProvider<ProfileCubit>(
            create: (context) => sl<ProfileCubit>()..userHaveOrderInProcess(),
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

                return Column(
                  children: [
                    ListTileWidget(
                      title: AppLocalizations.of(context)!.edit_profile,
                      icon: Icons.person,
                      to: EditProfileScreen(
                        profileCubit: cubit,
                      ),
                    ),
                    const Divider(
                      height: 0.1,
                    ),
                    ListTileWidget(
                      title: AppLocalizations.of(context)!.my_document,
                      icon: Icons.edit_document,
                      to: MyDocumentScreen(profileCubit: cubit),
                    ),
                    const Divider(
                      height: 0.1,
                    ),
                    ListTileWidget(
                      title: AppLocalizations.of(context)!.history,
                      icon: Icons.history,
                      to: HistoryScreen(profileCubit: cubit),
                    ),
                    const Divider(
                      height: 0.1,
                    ),
                    ListTileWidget(
                      title: AppLocalizations.of(context)!.my_cash_balance,
                      icon: Icons.wallet_rounded,
                      to: MyCashBalanceScreen(profileCubit: cubit),
                    ),
                    const Divider(
                      height: 0.1,
                    ),
                    ListTileWidget(
                      title: AppLocalizations.of(context)!.earning_history,
                      icon: Icons.grading_sharp,
                      to: EarnTimeScreen(profileCubit: cubit),
                    ),
                    const Divider(
                      height: 0.1,
                    ),
                    ListTileWidget(
                      title: AppLocalizations.of(context)!.change_password,
                      icon: Icons.password,
                      to: ChangePasswordScreeen(profileCubit: cubit),
                    ),
                    const Divider(
                      height: 0.1,
                    ),
                    // ListTileWidget(
                    //   title: AppLocalizations.of(context)!.faqs,
                    //   icon: Icons.question_mark_rounded,
                    // ),
                    const Divider(
                      height: 0.1,
                    ),
                    ListTileWidget(
                      title: AppLocalizations.of(context)!.language,
                      icon: Icons.language_rounded,
                      to: const LanguageScreen(),
                    ),
                    const Divider(
                      height: 0.1,
                    ),
                    if (cubit.userHaveOrder == false) ...[
                      ListTileWidget(
                        title: AppLocalizations.of(context)!.sign_out,
                        icon: Icons.login_sharp,
                        onTap: () {
                          cubit.logout(context);
                        },
                      ),
                      ListTileWidget(
                        title: AppLocalizations.of(context)!.delete_account,
                        icon: Icons.highlight_remove_rounded,
                        onTap: () {
                          cubit.deleteAccount(context);
                        },
                      ),
                    ],
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
