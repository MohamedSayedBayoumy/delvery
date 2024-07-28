import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/constants/colors.dart';

class ContainerUploadWidget extends StatelessWidget {
  final String title;
  const ContainerUploadWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        color: ConstantsColor.fillTextFiled,
        borderRadius: BorderRadius.circular(12.0),
      ),
      width: 100.w,
      height: 6.0.h,
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.white),
          ),
          const Spacer(),
          const Icon(
            Icons.camera_alt_outlined,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
