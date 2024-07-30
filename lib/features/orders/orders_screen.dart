import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../core/constants/colors.dart';
import '../../core/functions/loading_ui.dart';
import '../../core/services/get_it/single_tone.dart';
import '../../core/utils/initial_values.dart';
import '../../core/utils/navigation.dart';
import '../auth/register/set_location.dart';
import 'controller/cubit/order_cubit.dart';
import 'widgets/empty_case_widget.dart';
import 'widgets/offline_case_widget.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<OrderCubit>()..getUserStatus(),
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
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Moahamed"),
                        InkWell(
                          onTap: () {
                            NavigationHelper.navigateTo(
                              context,
                              const SelectLocationScreen(),
                            );
                          },
                          child: const Row(
                            children: [
                              Text("Egypt"),
                              Icon(Icons.arrow_drop_down_sharp),
                            ],
                          ),
                        )
                      ],
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (state is LoadingOrderCase)
                      ...[]
                    else if (InitialValues.userStatus == "2") ...[
                      const OfflineCaseWidget(),
                    ] else if (InitialValues.userStatus == "1") ...[
                      const EmptyCaseWidget(),
                    ] else
                      ...[],
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
