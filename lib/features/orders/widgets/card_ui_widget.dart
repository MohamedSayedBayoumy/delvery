import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../core/utils/enums.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../model/model/order_details.dart';
import '../../../model/model/order_model.dart';
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
            const SizedBox(height: 10.0),
            if (isOrderDelevering == true) ...[
              Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      onPressed: onPressedReturn,
                      buttonText: AppLocalizations.of(context)!.order_return,
                      buttonColor: Colors.red,
                      borderColor: Colors.red,
                      raduis: 7.0,
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  Expanded(
                    child: CustomButton(
                      onPressed: onPressedDeleverd,
                      buttonText: AppLocalizations.of(context)!.order_delever,
                      buttonColor: Colors.green,
                      borderColor: Colors.green,
                      raduis: 7.0,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5.0),
            ],
            Row(
              children: [
                ...[
                  if (orderById != null) ...[
                    if (e.itemNumber == orderById!.data.itemNumber) ...[
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
}
