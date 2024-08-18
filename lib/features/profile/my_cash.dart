import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../core/constants/colors.dart';
import '../../core/functions/loading_ui.dart';
import '../../core/widgets/custom_padding.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'controller/cubit/profile_cubit.dart';

class MyCashBalanceScreen extends StatelessWidget {
  final ProfileCubit profileCubit;

  const MyCashBalanceScreen({super.key, required this.profileCubit});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.my_cash_balance),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: CustomPadding(
          child: BlocConsumer<ProfileCubit, ProfileState>(
            bloc: profileCubit..getTotalBalance(context),
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
                  Container(
                    width: 100.0.w,
                    padding: const EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7.0),
                      color: ConstantsColor.fillTextFiled.withOpacity(.5),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.total_balance,
                          style: const TextStyle(color: Colors.black54),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: state is ProfileLoading
                              ? const Text(
                                  "",
                                  style: TextStyle(color: Colors.green),
                                )
                              : Text(
                                  profileCubit
                                      .totalBalanceModel!.data!.totalPrice
                                      .toString(),
                                  style: const TextStyle(color: Colors.green),
                                ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
