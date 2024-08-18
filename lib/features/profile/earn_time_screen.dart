import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../core/functions/loading_ui.dart';
import '../../core/widgets/custom_padding.dart';
import 'controller/cubit/profile_cubit.dart';

class EarnTimeScreen extends StatelessWidget {
  final ProfileCubit profileCubit;

  const EarnTimeScreen({super.key, required this.profileCubit});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.history),
        centerTitle: true,
      ),
      body: CustomPadding(
        child: BlocConsumer<ProfileCubit, ProfileState>(
          bloc: profileCubit..getEarnHistoryTime(context),
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
            if (state is ProfileLoading) {
              return const Center();
            } else {
              return SizedBox(
                width: 100.w,
                height: 100.h,
                child: ListView.builder(
                  itemCount: profileCubit.earnTimeModel!.data?.length ?? 0,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Container(
                      width: 100.w,
                      height: 6.h,
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                child: Text(
                                    "${profileCubit.earnTimeModel!.data![index].iId!.day.toString()}/${profileCubit.earnTimeModel!.data![index].iId!.month.toString()}/${profileCubit.earnTimeModel!.data![index].iId!.year.toString()}"),
                              ),
                              Text(
                                  "${profileCubit.earnTimeModel!.data![index].totalAmount}}"),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
