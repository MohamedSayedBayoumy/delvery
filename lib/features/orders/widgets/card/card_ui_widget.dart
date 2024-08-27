import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/utils/enums.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../model/model/order_details.dart';
import '../../../../model/model/order_model.dart';

import 'order_return_button_and_order_delever_widget.dart';
import 'price_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OrderCardWidget extends StatelessWidget {
  const OrderCardWidget({
    super.key,
    required this.e,
    required this.onPressedDeleverd,
    required this.onPressedReturn,
    required this.onPressedDeleveryOrder,
    required this.onPressedOpenMap,
    required this.isOrderDelevering,
    required this.orderById,
  });

  final OrderDetails e;
  final void Function()? onPressedDeleverd;
  final void Function()? onPressedReturn;
  final void Function()? onPressedDeleveryOrder;
  final void Function()? onPressedOpenMap;
  final bool isOrderDelevering;
  final OrderById? orderById;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
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
            rowWidget(
              context,
              title: "${AppLocalizations.of(context)!.order_on} : ",
              value: "#${e.itemNumber}",
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 5.0,
              ),
              child: rowWidget(
                context,
                title: "${AppLocalizations.of(context)!.address} : ",
                value: "${e.userAddress!.first.title}",
              ),
            ),
            const SizedBox(height: 7.0),
            PriceWidget(e: e),
            const SizedBox(height: 8.0),
            rowWidget(
              context,
              title: "${AppLocalizations.of(context)!.order_time} : ",
              value: "${e.createdAt}",
            ),
            const SizedBox(height: 10.0),
            if (isOrderDelevering == true) ...[
              OrderReturnButtonAndOrderDeleverWidget(
                onPressedReturn: onPressedReturn,
                onPressedDeleverd: onPressedDeleverd,
              ),
            ],
            Row(
              children: [
                if (orderById != null) ...[
                  if (e.itemNumber == orderById!.data.itemNumber) ...[
                    //   Expanded(
                    //     flex: 5,
                    //     child: CustomButton(
                    //       onPressed: onPressedDeleveryOrder,
                    //       buttonText: AppLocalizations.of(context)!.delivery,
                    //       buttonColor: Colors.blue,
                    //       borderColor: Colors.blue,
                    //       raduis: 7.0,
                    //     ),
                    //   ),
                  ]
                ] else ...[
                  Expanded(
                    flex: 5,
                    child: CustomButton(
                      onPressed: onPressedDeleveryOrder,
                      buttonText: AppLocalizations.of(context)!.delivery,
                      buttonColor: Colors.blue,
                      borderColor: Colors.blue,
                      raduis: 7.0,
                    ),
                  ),
                ],
                if (isOrderDelevering == true) ...[
                  const SizedBox(width: 5.0),
                  Expanded(
                    child: CustomButton(
                      width: 7.0,
                      onPressed: onPressedOpenMap,
                      icon: Icon(
                        Icons.location_on_rounded,
                        color: Colors.red.shade600,
                      ),
                      typeIcon: IconType.iconData,
                      buttonColor: Colors.white,
                      borderColor: Colors.black,
                      raduis: 7.0,
                    ),
                  ),
                ],
              ],
            ),
            const SizedBox(height: 1.0),
          ],
        ),
      ),
    );
  }

  Row rowWidget(BuildContext context, {String? title, String? value}) {
    return Row(
      children: [
        Text(
          title!,
          style: const TextStyle(),
        ),
        Expanded(
          child: Text(
            value!,
            style: const TextStyle(),
          ),
        ),
      ],
    );
  }
}
