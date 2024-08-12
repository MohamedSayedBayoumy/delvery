import 'package:flutter/material.dart';

import '../../../../model/model/order_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PriceWidget extends StatelessWidget {
  const PriceWidget({
    super.key,
    required this.e,
  });

  final OrderDetails e;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Row(
            children: [
              Text(
                "${AppLocalizations.of(context)!.total_price} : ",
                style: const TextStyle(),
              ),
              Text(
                "${e.totalPrice}",
                style: const TextStyle(),
              ),
            ],
          ),
        ),
        // Expanded(
        //   flex: 2,
        //   child: SizedBox(
        //     width: 100.w,
        //     height: 10.h,
        //     child: Column(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: [
        //         Row(
        //           children: [
        //             Text("${AppLocalizations.of(context)!.bef_dis} : "),
        //             Text(
        //               e.products!
        //                   .map((e) =>
        //                       double.parse(e.selectedSizePriceBeforeDiscount!))
        //                   .reduce((a, b) => a + b)
        //                   .toString(),
        //             ),
        //           ],
        //         ),
        //         Row(
        //           children: [
        //             Text("${AppLocalizations.of(context)!.aft_dis} : "),
        //             Text(
        //               e.products!
        //                   .map((e) =>
        //                       double.parse(e.selectedSizePriceAfterDiscount!))
        //                   .reduce((a, b) => a + b)
        //                   .toString(),
        //             ),
        //           ],
        //         ),
        //       ],
        //     ),
        //   ),
        // )
      ],
    );
  }
}
