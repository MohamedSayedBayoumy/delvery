import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../core/constants/colors.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_padding.dart';

class SelectLocationScreen extends StatelessWidget {
  const SelectLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> ares = ['Rajkot'];
    String area = ares[0];
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Location"),
        centerTitle: true,
      ),
      body: CustomPadding(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Select Delivery Zone"),
            const SizedBox(height: 10.0),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                color: ConstantsColor.fillTextFiled,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: DropdownButton<String>(
                value: area,
                isExpanded: true,
                underline: const SizedBox(),
                style: const TextStyle(color: Colors.black54),
                items: ares.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (_) {},
              ),
            ),
            const Spacer(),
            CustomButton(
              height: 7.h,
              buttonText: "Set This Location",
            ),
            const SizedBox(height: 10.0)
          ],
        ),
      ),
    );
  }
}
