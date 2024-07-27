import 'package:flutter/widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ConstantsSize {
  static const borderRadius = 100.0;

  static dynamic iconSize = 7.w;

  static dynamic logoSize = 9.w;

  static int maxLines(context) =>
      MediaQuery.sizeOf(context).height > 700 ? 5 : 2;
}
