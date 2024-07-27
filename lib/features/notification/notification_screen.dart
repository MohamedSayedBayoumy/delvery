import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Notification"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Icon(Icons.no_meals_rounded, size: 50.w),
              const Text("No Data Available !"),
            ],
          ),
        ),
      ),
    );
  }
}
