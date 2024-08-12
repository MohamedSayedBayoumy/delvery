import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OrderReturnButtonAndOrderDeleverWidget extends StatelessWidget {
  const OrderReturnButtonAndOrderDeleverWidget({
    super.key,
    required this.onPressedReturn,
    required this.onPressedDeleverd,
  });

  final void Function()? onPressedReturn;
  final void Function()? onPressedDeleverd;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
    );
  }
}
