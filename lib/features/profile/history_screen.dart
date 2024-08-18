import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../core/functions/loading_ui.dart';
import '../../core/widgets/custom_padding.dart';

import 'controller/cubit/profile_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'widget/history_card_widget.dart';

class HistoryScreen extends StatelessWidget {
  final ProfileCubit profileCubit;

  const HistoryScreen({super.key, required this.profileCubit});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.history),
          centerTitle: true,
        ),
        body: BlocConsumer<ProfileCubit, ProfileState>(
          bloc: profileCubit..getHistory(context, status: 4),
          listener: (context, state) {
            if (state is HistoryLoading) {
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
            return CustomPadding(
              child: Column(
                children: [
                  TabBar(
                    indicatorColor: profileCubit.currentColor,
                    labelStyle: TextStyle(color: profileCubit.currentColor),
                    indicatorWeight: 8.0,
                    unselectedLabelColor: Colors.black,
                    indicatorPadding:
                        const EdgeInsets.symmetric(horizontal: 40.0),
                    onTap: (i) {
                      profileCubit.changeTab(i, context);
                    },
                    tabs: [
                      Tab(
                        text: AppLocalizations.of(context)!.completed,
                      ),
                      Tab(
                        text: AppLocalizations.of(context)!.cancel_delivery,
                      ),
                    ],
                  ),
                  if (state is SuccessGetHistoryData) ...[
                    Expanded(
                      child: SizedBox(
                        width: 100.w,
                        height: 100.h,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: profileCubit.historyModel?.historyDataModel
                                  ?.dataDetails?.length ??
                              0,
                          itemBuilder: (context, index) => HistoryCardWidget(
                            dataDetails: profileCubit.historyModel
                                ?.historyDataModel?.dataDetails![index],
                            statusColor: profileCubit.currentColor,
                          ),
                        ),
                      ),
                    ),
                  ]
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
