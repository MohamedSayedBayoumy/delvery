import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../core/constants/colors.dart';

class DocumnetContainer extends StatelessWidget {
  const DocumnetContainer({super.key});

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
              color: Colors.amber,
            ),
          ),
          const SizedBox(width: 10.0),
          const Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "htttps://",
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 10.0),
                Row(
                  children: [
                    Icon(
                      Icons.document_scanner_rounded,
                      color: Colors.black54,
                      size: 20.0,
                    ),
                    SizedBox(width: 10.0),
                    Text(
                      "https://",
                      style: TextStyle(color: Colors.black54, fontSize: 15.0),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
