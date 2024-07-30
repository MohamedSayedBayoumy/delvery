import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class OfflineCaseWidget extends StatelessWidget {
  const OfflineCaseWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(Icons.no_meals_rounded, size: 50.w),
        const SizedBox(height: 10.0),
        const Text(
          "Now You are Offline , let's Start",
          style: TextStyle(color: Colors.red),
        ),
      ],
    );
  }
}
