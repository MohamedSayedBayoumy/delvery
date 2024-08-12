import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mts/core/widgets/custom_padding.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../core/constants/colors.dart';
import '../../core/functions/loading_ui.dart';
import '../../core/services/get_it/single_tone.dart';
import '../../core/utils/initial_values.dart';
import 'controller/cubit/order_cubit.dart';
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
                    title: const Text("Moahamed"),
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
                            (e) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              child: Container(
                                width: 100.w,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 5.0,
                                  vertical: 5.0,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "#${e.itemNumber}",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 5.0,
                                      ),
                                      child: Row(
                                        children: [
                                          Text(
                                            "${AppLocalizations.of(context)!.address} : ",
                                          ),
                                          Expanded(
                                            child: Text(
                                              "${e.userAddress!.first.title}",
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 7.0),
                                    Row(
                                      children: [
                                        Text(
                                          "${AppLocalizations.of(context)!.total_price} : ",
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w900,
                                          ),
                                        ),
                                        Text(
                                          "${e.totalPrice}",
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w900,
                                          ),
                                        ),
                                        const SizedBox(width: 10.0),
                                        // Expanded(
                                        //   child: Container(
                                        //     width: 100.w,
                                        //     height: 10.h,
                                        //     color: Colors.black,
                                        //     child: Column(
                                        //       children: [
                                        //         Row(
                                        //           children: [
                                        //             Text(
                                        //                 "${AppLocalizations.of(context)!.total_price} : "),
                                        //             Text(
                                        //                 "${e.products.first}"),
                                        //           ],
                                        //         ),
                                        //         Row(),
                                        //       ],
                                        //     ),
                                        //   ),
                                        // )
                                      ],
                                    ),
                                    const SizedBox(height: 8.0),
                                    Text(
                                      "${e.createdAt}",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
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
