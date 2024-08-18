import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../model/model/profile_model/history_model.dart';

class HistoryCardWidget extends StatelessWidget {
  final DataDetails? dataDetails;
  final Color statusColor;
  const HistoryCardWidget(
      {super.key, this.dataDetails, required this.statusColor});

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
          border: Border.all(
            color: statusColor,
          ),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            rowWidget(
              context,
              title: "${AppLocalizations.of(context)!.order_on} : ",
              value: "#${dataDetails!.itemNumber}",
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 5.0,
              ),
              child: rowWidget(
                context,
                title: "${AppLocalizations.of(context)!.address} : ",
                value: "${dataDetails!.userAddress![0].title}",
              ),
            ),
            const SizedBox(height: 7.0),
            rowWidget(
              context,
              title: "${AppLocalizations.of(context)!.order_time} : ",
              value: "${dataDetails!.createdAt}",
            ),
            const SizedBox(height: 10.0),
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
          style: const TextStyle(color: Colors.amber),
        ),
        Expanded(
          child: Text(
            value!,
            style: const TextStyle(color: Colors.amber),
          ),
        ),
      ],
    );
  }
}
