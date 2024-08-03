import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../core/constants/colors.dart';

class DocumnetContainer extends StatelessWidget {
  final String link;
  const DocumnetContainer({super.key, required this.link});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0.w,
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7.0),
        color: ConstantsColor.fillTextFiled,
      ),
      child: Row(
        children: [
          Container(
            width: 100.0,
            height: 100.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                fit: BoxFit.contain,
                image: NetworkImage(link),
              ),
            ),
          ),
          const SizedBox(width: 10.0),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  link,
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 10.0),
              ],
            ),
          )
        ],
      ),
    );
  }
}
