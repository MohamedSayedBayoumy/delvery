import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomPadding extends StatelessWidget {
  final double? start;
  final double? end;
  final double? top;
  final Widget child;
  const CustomPadding({
    super.key,
    this.start,
    this.end,
    this.top,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
        start: start ?? 4.w,
        end: end ?? 4.w,
        top: top ?? 0.0.h,
      ),
      child: child,
    );
  }
}
