import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class EmptyCaseWidget extends StatelessWidget {
  const EmptyCaseWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(Icons.no_meals_rounded, size: 50.w),
        const Text("No New Job Available !"),
        const SizedBox(height: 10.0),
        const Text("You haven't any new job available right now."),
      ],
    );
  }
}
