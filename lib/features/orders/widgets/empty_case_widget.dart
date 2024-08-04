import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EmptyCaseWidget extends StatelessWidget {
  const EmptyCaseWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(Icons.no_meals_rounded, size: 50.w),
        Text(AppLocalizations.of(context)!.notification),
        const SizedBox(height: 10.0),
        Text("You haven't any new job available right now."),
      ],
    );
  }
}
