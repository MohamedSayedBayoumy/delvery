// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../core/constants/colors.dart';
import '../../core/functions/loading_ui.dart';
import '../../core/services/get_it/single_tone.dart';
import '../../core/utils/enums.dart';
import '../../core/utils/initial_values.dart';
import '../../core/widgets/custom_padding.dart';
import 'controller/cubit/order_cubit.dart';
import 'widgets/card/card_ui_widget.dart';
import 'widgets/empty_case_widget.dart';
import 'widgets/offline_case_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<OrderCubit>()..getUserStatus(context),
      child: BlocConsumer<OrderCubit, OrderState>(
        listener: (context, state) {
          if (state is LoadingOrderCase) {
            loadingAlert(context);
          } else if (state is FailureChangeUserStatus) {
            final snackBar = SnackBar(
              backgroundColor: Colors.red,
              content: Text(state.message),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          } else {}
        },
        builder: (context, state) {
          final cubit = OrderCubit.get(context);

          return Scaffold(
            appBar: state is LoadingOrderCase
                ? AppBar()
                : AppBar(
                    title: InitialValues.userStatus == "1"
                        ? Text(
                            AppLocalizations.of(context)!.online,
                            style: const TextStyle(color: Colors.green),
                          )
                        : Text(
                            AppLocalizations.of(context)!.offline,
                            style: const TextStyle(color: Colors.red),
                          ),
                    actions: [
                      Switch(
                        // This bool value toggles the switch.
                        value: cubit.isOnlineUserStatus,
                        activeColor: ConstantsColor.greenColor,
                        onChanged: (bool value) {
                          cubit.changeUserStatus(context);
                        },
                      ),
                    ],
                  ),
            body: SizedBox(
              width: 100.w,
              height: 100.h,
              child: SingleChildScrollView(
                child: CustomPadding(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (state is LoadingOrderCase) ...[
                        const Center(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: CircularProgressIndicator(
                              color: Colors.green,
                              strokeCap: StrokeCap.round,
                              strokeWidth: 1.0,
                            ),
                          ),
                        ),
                      ] else if (InitialValues.userStatus == "2") ...[
                        const OfflineCaseWidget(),
                      ] else if (InitialValues.userStatus == "1") ...[
                        // Online case
                        if (cubit.orderModel!.orderData!.data!.isEmpty) ...[
                          // user`s order empty case
                          const EmptyCaseWidget()
                        ] else ...[
                          // user`s order
                          ...cubit.orderModel!.orderData!.data!.map(
                            (e) => OrderCardWidget(
                              e: e,
                              isOrderDelevering:
                                  cubit.isOrderDelevering(e.itemNumber),
                              orderById: cubit.orderById,
                              onPressedDeleverd: () {
                                cubit.changeOrderStatus(
                                  context,
                                  id: e.id!,
                                  newStatusOrder: OrderProcess.orderDelivered,
                                );
                              },
                              onPressedReturn: () {
                                cubit.changeOrderStatus(
                                  context,
                                  id: e.id!,
                                  newStatusOrder: OrderProcess.orderReturn,
                                );
                              },
                              onPressedOpenMap: () {
                                cubit.openMap();
                              },
                              onPressedDeleveryOrder: () {
                                if (cubit.orderById == null) {
                                  cubit.changeOrderStatus(
                                    context,
                                    id: e.id!,
                                    newStatusOrder:
                                        OrderProcess.orderOutOfDelivery,
                                  );
                                }
                              },
                            ),
                          )
                        ],
                      ] else
                        ...[],
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
