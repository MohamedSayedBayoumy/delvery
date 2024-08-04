import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(AppLocalizations.of(context)!.notification),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Icon(Icons.no_meals_rounded, size: 50.w),
              Text(AppLocalizations.of(context)!.no_data_available),
            ],
          ),
        ),
      ),
    );
  }
}
